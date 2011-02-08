Given /^I have a todo named "([^"]*)"$/ do |name|
  Factory.create(:todo, :task => name, :users => [User.first]) 
end

Then /^I should not be an outstanding user on the "([^"]*)" todo$/ do |arg1|
  assert !Todo.find_by_task(name).users.include?(User.first)
end
