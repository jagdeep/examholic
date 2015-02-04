class Batch < ActiveRecord::Base
  has_many :subscriptions
  has_many :students, :through => :subscriptions
  belongs_to :account

  validates :name, :presence => true
  validates :account_id, :presence => true
end
