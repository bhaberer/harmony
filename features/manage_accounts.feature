Feature: Manage accounts
  In order to [goal]
  [stakeholder]
  wants [behaviour]
  
  Scenario: Users can create an account. 
     Given I am a new, authenticated user
      When I go to the home page
       And I follow "Create a new harmony"
       And I fill in "name" with "Account Name"
       And I fill in "email" with "foo@weirdo513.org"
       And I press "Create Harmony"
      Then there should be a new harmony named "Account Name"

  Scenario: Account creation creates an invitation.
     Given I am a new, authenticated user
      When I go to the home page
       And I follow "Create a new harmony"
       And I fill in "name" with "Account Name"
       And I fill in "email" with "foo@weirdo513.org"
       And I press "Create Harmony"
      Then there should be an invitation for "foo@weirdo513.org"

  Scenario: Users cannot access an account that has not been joined by the other person.
     Given I am a new, authenticated user
       And I have created an account with the name "Testing"
      When I go to the account page for "Testing"
      Then I should be on the home page

  Scenario: Users see account names on their home page.
     Given I am a new, authenticated user
       And I have created an account with the name "Testing"
      When I go to the home page
      Then there should be a new harmony named "Testing"
       And I should see "Testing"
 
  Scenario: Users should be able to see a listing of their accounts
     Given I am a new, authenticated user
       And I have created an account with the name "Testing"
       And I have created an account with the name "More Tests"
      When I go to the accounts page
      Then I should see "Testing"
       And I should see "More Tests"

  Scenario: Users should be able to join accounts once invited.
     Given I am a new, authenticated user
       And I have been invited to "Testing" by "brian@weirdo513.org"
      When I go to the accounts page
       And I follow "Join this Harmony"
      Then I should be on the account page for "Testing"



