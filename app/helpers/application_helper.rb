module ApplicationHelper
  def is_current? account_id
    current_account and (account_id == current_account.id)
  end

  def nice_time time
    time.strftime("%b %d, %Y at %I:%M%p") unless time.nil?
  end
end
