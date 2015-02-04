class Stream < ActiveRecord::Base
  has_and_belongs_to_many :accounts
  has_and_belongs_to_many :teachers
  has_and_belongs_to_many :subjects

  validates :name, :presence => true
end
