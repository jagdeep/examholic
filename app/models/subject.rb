class Subject < ActiveRecord::Base
  has_and_belongs_to_many :streams
  has_and_belongs_to_many :teachers
  has_many :topics

  validates :name, :presence => true
end
