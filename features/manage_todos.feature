Feature: Manage todos
  In order to [goal]
  [stakeholder]
  wants [behaviour]

  Scenario: Users should be able to add todos to an account.
     Given I am a new, authenticated user
       And I am part of an account "Testing Todos" with another user
       And I am on the account page for "Testing Todos"
      When I follow "I have something you need to do."
       And fill in "todo_task" with "Write some tests"
       And press "Create Todo"
      Then I should be on the account page for "Testing Todos"
       And I should see "Write some tests"
 
 
