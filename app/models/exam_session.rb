class ExamSession < ActiveRecord::Base
  has_many :paper_sessions
  belongs_to :exam
  belongs_to :student
  belongs_to :account

  validates :account_id,    :presence => true
  validates :exam_id,       :presence => true
  validates :student_id,    :presence => true

  def end_session
    update_attributes(finished_at: Time.zone.now, score: paper_sessions.sum(:score))
  end
end
