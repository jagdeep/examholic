class ExamSession < ActiveRecord::Base
  has_many :exam_sessions
  belongs_to :exam
  belongs_to :student
  belongs_to :account

  validates :account_id,    :presence => true
  validates :exam_id,       :presence => true
  validates :student_id,    :presence => true
end
