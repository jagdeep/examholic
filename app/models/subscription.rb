class Subscription < ActiveRecord::Base
  belongs_to :account
  belongs_to :student
  belongs_to :batch

  validates :account_id, :presence => true
  validates :student_id, :presence => true
  validates :batch_id, :presence => true
end
