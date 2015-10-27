class PaperSession < ActiveRecord::Base
  belongs_to :account
  belongs_to :student
  belongs_to :paper
  belongs_to :exam_session
  has_many :questions, :through => :paper
  has_many :answers

  validates :account_id, :presence => true
  validates :student_id, :presence => true
  validates :paper_id,   :presence => true
  validates :exam_id,   :presence => true

  before_create do
    es = ExamSession.where(exam_id: exam_id).find_or_initialize_by(student_id: student_id)
    es.exam_id = exam_id
    es.account_id = account_id
    es.student_id = student_id
    es.save!

    self.exam_session_id = es.id
  end
  after_create do
    Student.where(id: student_id).first.update_attribute(:current_paper_id, paper_id)
  end

  def finished?
    finished_at.present?
  end

  def new_question
    ques_ids = answers.pluck(:question_id)
    if ques_ids.present?
      return questions.where("id not in (?)", ques_ids).first
    else
      return questions.first
    end
  end
end
