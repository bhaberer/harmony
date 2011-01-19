class HomeController < ApplicationController

  def index
    if current_user.accounts.blank?
      redirect_to new_account_path
    elsif current_user.accounts.length == 1
      redirect_to current_user.accounts.first
    else 
      @accounts = current_user.accounts
    end
  end

end
