class UserMailer < ActionMailer::Base
  default :from => "harmony.application@gmail.com"
 
  def invite(email, user) 
    @user = user  
    mail(:to => email, :subject => "[Harmony] New Harmony Request.")      
  end


end
