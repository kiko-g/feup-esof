Feature: Sidebar
  User should be able to see the sidebar menu when swiping right
    
Scenario: User checks sidebar menu via swipe
    Given I am in homepage
    When I swipe right once
    Then I should see a side bar menu
