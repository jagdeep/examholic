class AnswersController < ApplicationController
  before_action :authenticate_student!
  before_action :find_paper_session
  layout 'answers'

  def new    
    if @paper_session
      @question = @paper_session.next_question
      if @question.blank?
        @paper_session.end_session
        redirect_to exam_papers_path(@paper_session.exam_id), notice: 'Paper has finished.'
       #@paper_session.score
      end
    else
      redirect_to exams_path, alert: 'Error! Unable to find paper.'
    end
  end

  def create
    @answer = Answer.where(paper_session_id: @paper_session.id, question_id: params[:question_id])
    .find_by(student_id: current_student.id)
    unless @answer
      @answer = Answer.new
      @answer.account_id = @paper_session.account_id
      @answer.student_id = current_student.id
      @answer.paper_session_id = @paper_session.id
      @answer.question_id = params[:question_id]
      @answer.score = 0
      @answer.answer = params[:answer]
      if @answer.answer == params[:correct_answer]
        @answer.correct = 1
        @answer.score = @answer.score + @paper_session.right
      else
        @answer.correct = 0 
        @answer.score = @answer.score + @paper_session.wrong
      end
      @answer.save
      
    end
    redirect_to new_paper_session_answer_path(@paper_session)
  end

  private

  def find_paper_session
    @paper_session = PaperSession.where(student_id: current_student.id, finished_at: nil).find_by(id: params[:paper_session_id])
  end
end
