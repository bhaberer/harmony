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
 
  Scenario: Users should be able to make a todo for themselves
     Given I am a new, authenticated user
       And I am part of an account "Testing Todos" with another user
       And I am on the account page for "Testing Todos"
      When I follow "I have something you need to do."
       And I fill in "todo_task" with "Write some tests"
       And I choose "type_me" 
       And I press "Create Todo"
      Then I should be on the account page for "Testing Todos"
       And I should see "Write some tests"
       And I should see "Done"

  Scenario: Users should be able to make a todo for their partner
     Given I am a new, authenticated user
       And I am part of an account "Testing Todos" with another user
       And I am on the account page for "Testing Todos"
      When I follow "I have something you need to do."
       And I fill in "todo_task" with "Write some tests"
       And I choose "type_you"
       And I press "Create Todo"
      Then I should be on the account page for "Testing Todos"
       And I should see "Write some tests"
       And I should not see "Done"

  Scenario: Users should be able to make a todo for either harmony member
     Given I am a new, authenticated user
       And I am part of an account "Testing Todos" with another user
       And I am on the account page for "Testing Todos"
      When I follow "I have something you need to do."
       And I fill in "todo_task" with "Write some tests"
       And I choose "type_either"
       And I press "Create Todo"
      Then I should be on the account page for "Testing Todos"
       And I should see "Write some tests"
       And I should see "Done"

  Scenario: Users should be able to make a todo for both harmony members
     Given I am a new, authenticated user
       And I am part of an account "Testing Todos" with another user
       And I am on the account page for "Testing Todos"
      When I follow "I have something you need to do."
       And I fill in "todo_task" with "Write some tests"
       And I choose "type_we"
       And I press "Create Todo"
      Then I should be on the account page for "Testing Todos"
       And I should see "Write some tests"
       And I should see "Done"

  Scenario: When users check off a todo item it completes.
     Given I am a new, authenticated user
       And I am part of an account "Testing Todos" with another user
       And I have a todo named "Testing Stuff"
       And I am on the account page for "Testing Todos"
      When I follow "Done"
      Then I should be on the account page for "Testing Todos" 
       And I should not see "Done"
       And I should not be an outstanding user on the "Testing Stuff" todo

  Scenario: When users check off a joint item it doesn't complete till both do it
     Given I am a new, authenticated user
       And I am part of an account "Testing Todos" with another user
       And We have a todo named "Testing Stuff" 
       And I am on the account page for "Testing Todos"
      When I follow "Done"
      Then I should be on the account page for "Testing Todos"
       And I should not see "Done"
       And I should not be an outstanding user on the "Testing Stuff" todo
       And The Todo "Testing Stuff" should not be finished.

  Scenario: When users check off a either item it completes, even if the other user hasn't checked off.
     Given I am a new, authenticated user
       And I am part of an account "Testing Todos" with another user
       And Either of us has a todo named "Testing Stuff"
       And I am on the account page for "Testing Todos"
      When I follow "Done"
      Then I should be on the account page for "Testing Todos"
       And I should not see "Done"
       And I should not be an outstanding user on the "Testing Stuff" todo
       And The Todo "Testing Stuff" should be finished.



