module ApplicationHelper
  def is_current? account_id
    current_account and (account_id == current_account.id)
  end
end
