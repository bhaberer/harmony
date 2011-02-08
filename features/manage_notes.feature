Feature: Manage notes
  In order to [goal]
  [stakeholder]
  wants [behaviour]

  Scenario: Users should be able to add notes to an account.
     Given I am a new, authenticated user
       And I am part of an account "Testing Notes" with another user
       And I am on the account page for "Testing Notes"
      When I follow "New Note" 
       And fill in "note_content" with "only a test"
       And press "Create Note"
      Then I should be on the account page for "Testing Notes"
       And I should see "only a test"

  Scenario: Users should be able to delete notes. 
     Given I am a new, authenticated user
       And I am part of an account "Testing Notes" with another user
       And I am on the account page for "Testing Notes"
      When I follow "New Note"
       And fill in "note_content" with "only a test"
       And I press "Create Note"
       And I press "X"
      Then I should be on the account page for "Testing Notes"
       And I should not see "still just a test"
  
 
