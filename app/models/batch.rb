class Batch < ActiveRecord::Base
  has_and_belongs_to_many :exams
  has_and_belongs_to_many :papers
  has_many :subscriptions
  has_many :students, :through => :subscriptions
  belongs_to :account

  validates :name, :presence => true
  validates :account_id, :presence => true
end
