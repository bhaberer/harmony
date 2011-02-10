Given /^I have a todo named "([^"]*)"$/ do |name|
  Given %{I have a "me" todo named "#{name}"}
end

Given /^We have a todo named "([^"]*)"$/ do |name|
  Given %{I have a "we" todo named "#{name}"}
end

Given /^Either of us has a todo named "([^"]*)"$/ do |name|
  Given %{I have a "either" todo named "#{name}"}
end

Given /^I have a "([^"]*)" todo named "([^"]*)"$/ do |type, name|
  account = User.first.accounts.first
  user = User.first
  todo = Factory.create(:todo, :task => name, :account => account, :todo_type => type)
  todo.add_unfinished_users(user, account.friend(user))
end

Then /^The Todo "([^"]*)" should be finished\.$/ do |name|
  todo = Todo.find_by_task(name)
  assert todo && todo.done?
end

Then /^The Todo "([^"]*)" should not be finished\.$/ do |name|
  todo = Todo.find_by_task(name)
  assert todo && !todo.done?
end

Then /^I should not be an outstanding user on the "([^"]*)" todo$/ do |name|
  assert !Todo.find_by_task(name).users.include?(User.first)
end
