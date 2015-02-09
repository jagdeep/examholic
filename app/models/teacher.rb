class Teacher < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable

  has_and_belongs_to_many :streams
  has_and_belongs_to_many :subjects
  has_and_belongs_to_many :accounts
  has_many :batches, :through => :accounts
  has_many :owned_accounts, :class_name => "Account", :foreign_key => :owner_id

  validates :name, :presence => true
  validates :phone, :presence => true
end
