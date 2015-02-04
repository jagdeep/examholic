class PaperSession < ActiveRecord::Base
  belongs_to :account
  belongs_to :student
  belongs_to :paper
  belongs_to :exam_session

  validates :account_id, :presence => true
  validates :student_id, :presence => true
  validates :paper_id,   :presence => true
end
