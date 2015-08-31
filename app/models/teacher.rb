class Teacher < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable

  has_and_belongs_to_many :streams
  has_and_belongs_to_many :subjects
  has_many :account_teachers
  has_many :accounts, :through => :account_teachers
  has_many :batches, :through => :accounts

  validates :name, :presence => true
  validates :phone, :presence => true, :numericality => true, :uniqueness => true
end
