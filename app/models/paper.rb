class Paper < ActiveRecord::Base
  has_and_belongs_to_many :batches
  has_and_belongs_to_many :segments
  has_and_belongs_to_many :questions
  has_many :topics, through: :questions
  belongs_to :account
  belongs_to :exam

  validates :account_id, :presence => true
  validates :exam_id, :presence => true
  validates :name, :presence => true
  validates :duration, :presence => true
  validates :status, :presence => true

  def to_s
    name
  end
end
