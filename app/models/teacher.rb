class Teacher < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable

  has_and_belongs_to_many :streams
  has_and_belongs_to_many :subjects
  has_and_belongs_to_many :accounts

  validates :name, :presence => true
  validates :phone, :presence => true
  validates :qualification, :presence => true
end
