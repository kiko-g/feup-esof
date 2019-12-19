Feature: Navigation to Room
  User should be able to see the map and the room marker when clicking on the go icon for a conference
    
Scenario: User clicks the go icon
    Given I am in homepage
    When I click the go icon
    Then I should see the map and the rrom marker
