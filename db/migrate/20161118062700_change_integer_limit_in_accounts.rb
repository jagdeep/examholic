class ChangeIntegerLimitInAccounts < ActiveRecord::Migration
  def change
    change_column :accounts, :phone, :integer, limit: 8
  end
end
