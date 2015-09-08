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

  def new_question
    ques_ids = answers.pluck(:question_id)
    if ques_ids.present?
      return questions.where("id not in (?)", ques_ids).first
    else
      return questions.first
    end
  end
end
