Given /^I have created an account with the name "([^"]*)"$/ do |name|
  user = User.first
  a = Factory.create(:account, :name => name, :users => [user]) 
end

Given /^I have been invited to "([^"]*)"$/ do |account|
  account = Factory.create(:account, :name => name)
  account.invites << Invite.new(:email => User.first.email)
end

Given /^I am part of a harmony named "([^"]*)" with "([^"]*)"$/ do |name, email|
  account = Factory.create(:account, :name => name)
  account.users << User.first
  account.users << Factory.create(:user, :email => email)
end

Given /^I have been invited to an account "([^"]*)" by "([^"]*)"$/ do |name, email|
  account = Factory.create(:account, :name => name)
  account.users << Factory.create(:user, :email => email)
  account.invites << Invite.new(:email => User.first.email)
end

Given /^I am part of an account "([^"]*)" with another user$/ do |name|
  account = Factory.create(:account, :name => name)
  account.users << User.first
  account.users << Factory.create(:user, :email => "harmony.application+tester2@gmail.com")
end

Then /^The "([^"]*)" account should be deleted\.$/ do |name|
  assert Account.find_by_name(name).nil?
end

Then /^there should be an invitation for "([^"]*)"$/ do |email|
  assert Invite.find_by_email(email).present?
end

Then /^there should be a new harmony named "([^"]*)"$/ do |name|
  assert Account.find_by_name(name).present?
end
