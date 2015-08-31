class AccountTeacher < ActiveRecord::Base
  belongs_to :account
  belongs_to :teacher
  belongs_to :admin_account, ->{ where('account_teachers.admin = ?', true) }, :class_name => 'Account', :foreign_key => :account_id

  validates :account_id, :presence => true
  validates :teacher_id, :presence => true
end
