class Student < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable

  has_many :subscriptions
  has_many :batches, :through => :subscriptions
  has_many :answers
  has_many :paper_sessions
  has_many :papers, :through => :paper_sessions
  has_many :exam_sessions
  has_many :exams, :through => :exam_sessions

  validates :name, :presence => true
  validates :phone, :presence => true
  validates :address, :presence => true
end
