class Topic < ActiveRecord::Base
  has_and_belongs_to_many :papers
  has_many :questions
  belongs_to :subject

  validates :name, :presence => true
  validates :subject_id, :presence => true

  def to_s
    name
  end
end
