class Exam < ActiveRecord::Base
  has_and_belongs_to_many :batches
  has_and_belongs_to_many :segments
  has_many :exam_sessions
  has_many :papers
  belongs_to :account
  belongs_to :batch

  validates :name, :presence => true
  validates :account_id, :presence => true
  validates :batch_id, :presence => true
  validates :duration, :presence => true
  validates :start_time, :presence => true
  validates :end_time, :presence => true
end
