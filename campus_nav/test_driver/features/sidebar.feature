Feature: Sidebar
  User should be able to see the sidebar menu  when swipping right
    
Scenario: User checks sidebar menu via swipe
    Given I am in homepage
    When I swipe right 1 time
    Then I should see menu
