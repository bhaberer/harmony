class ApplicationController < ActionController::Base
  before_filter :authenticate_user!
  protect_from_forgery

  private

  def get_account
    @account = Account.find(params[:account_id])
  end

  def auth_check
    redirect_to :home unless @account.users.include? current_user
  end
end
