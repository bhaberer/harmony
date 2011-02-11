class UserMailer < ActionMailer::Base
  default :from => "harmony.application@gmail.com"
 
  def invite(email, user, account) 
    @user = user
    @account_name = account.name
    mail(:to => email, :subject => "[Harmony] New Harmony Request.")      
  end

  def join(user, account)
    @to_user = user.name
    mail(:to => user.email, :subject => "[Harmony] A user has joined your Harmony.")
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

  def completed_todo(to_user, from_user, todo)
    @to_name = to_user.name || to_user.email
    @from_name = from_user.name || "Your Friend"
    @task = todo.task
    mail(:to => [to_user.email, from_user.email], :subject => "[Harmony] To-Do Item Complete.")
  end

  def new_list(to_user, from_user, account)
    @to_name = to_user.name || to_user.email
    @from_name = from_user.name || "Your Friend"
    @url = account_url(account)
    mail(:to => to_user.email, :subject => "[Harmony] New List Created!")
  end

end
