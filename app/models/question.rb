class Question < ActiveRecord::Base
  has_and_belongs_to_many :papers
  belongs_to :account
  belongs_to :topic

  validates :account_id, :presence => true
  validates :title, :presence => true
  validates :answer, :presence => true
  validates :topic_id, :presence => true
end
