Feature: Manage users
  In order to [goal]
  [stakeholder]
  wants [behaviour]
  
  Scenario: Users can not access the site without logging in.
      When I am on the home page
      Then I should be on the new user session page

  Scenario: Logged in Users get sent to the home page.
     Given I am a new, authenticated user
      When I am on the home page
      Then I should be on the home page
  
  
