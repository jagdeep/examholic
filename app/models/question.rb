class Question < ActiveRecord::Base
  has_and_belongs_to_many :papers
  belongs_to :account
  belongs_to :topic

  validates :account_id, :presence => true
  validates :title, :presence => true
  validates :answer, :presence => true
  validates :marks, :presence => true
  validates :option1, :presence => true
  validates :option2, :presence => true
  validates :option3, :presence => true
  validates :option4, :presence => true
end
