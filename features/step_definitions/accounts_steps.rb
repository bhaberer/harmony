Given /^I have created an account with the name "([^"]*)"$/ do |name|
  user = User.first
  a = Factory.create(:account, :name => name, :users => [user]) 
end

Then /^there should be an invitation for "([^"]*)"$/ do |email|
  assert Invite.find_by_email(email).present?
end

Then /^there should be a new harmony named "([^"]*)"$/ do |name|
  assert Account.find_by_name(name).present?
end
