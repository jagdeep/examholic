class ExamSession < ActiveRecord::Base
  has_many :paper_sessions
  belongs_to :exam
  belongs_to :student
  belongs_to :account

  validates :account_id,    :presence => true
  validates :exam_id,       :presence => true
  validates :student_id,    :presence => true

  def end_session
    @p_session = PaperSession.select(:score, :max_marks).where(exam_session_id: id)
    percentage = (@p_session.sum(:score)/@p_session.sum(:max_marks)) * 100
    
    update_attributes(finished_at: Time.zone.now, score: paper_sessions.sum(:score), max_marks: paper_sessions.sum(:max_marks), percentage: percentage)
  end
end
