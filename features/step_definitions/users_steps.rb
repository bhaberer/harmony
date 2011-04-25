Given /^I have one "([^\"]*)" named "([^\"]*)" with password "([^\"]*)"$/ do |user, email, password|
  u = Factory.create(:user, :email => email, 
                     :password => password, :password_confirmation => password)
end

Given /^I am a new, authenticated user$/ do
  email = 'harmony.application+tester@gmail.com'
  password = 'secretpass'

  Given %{I have one "user" named "#{email}" with password "#{password}"}
  And %{I go to the new user session page}
  And %{I fill in "user_email" with "#{email}"}
  And %{I fill in "user_password" with "#{password}"}
  And %{I press "Sign in"}
end


