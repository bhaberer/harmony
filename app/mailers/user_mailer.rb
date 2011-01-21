class UserMailer < ActionMailer::Base
  default :from => "harmony.application@gmail.com"
 
  def invite(email, user) 
    @user = user  
    mail(:to => email, :subject => "[Harmony] New Harmony Request.")      
  end

  def new_note(to_user, from_user, account)
    @to_name = to_user.name || to_user.email
    @from_name = from_user.name || "Your Friend"
    @url = account_url(account)
    mail(:to => to_user.email, :subject => "[Harmony] New Note Posted!")
  end

  def new_todo(to_user, from_user, account)
    @to_name = to_user.name || to_user.email
    @from_name = from_user.name || "Your Friend"
    @url = account_url(account)
    mail(:to => to_user.email, :subject => "[Harmony] New To-Do Item Posted!")
  end

  def new_list(to_user, from_user, account)
    @to_name = to_user.name || to_user.email
    @from_name = from_user.name || "Your Friend"
    @url = account_url(account)
    mail(:to => to_user.email, :subject => "[Harmony] New List Created!")
  end

end
