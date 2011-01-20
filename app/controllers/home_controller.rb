class HomeController < ApplicationController

  def index
    current_user.profile = Profile.new unless current_user.profile.present?
    @accounts = current_user.accounts.inject([]) {|x,y| x << y if y.users.count == 2; x}
    @invites = Invite.find_all_by_email(current_user.email)
  end

end
