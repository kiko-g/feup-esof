Feature: Drawer
  Tests that verify the correct functioning of the app drawer in the main screen.

  Scenario: Selecting the drawer
    Given I restart the app
    When I tap the "Drawer" widget
    Then I open the drawer

  Scenario: Selecting the first drawer option
    Given I open the drawer
    When I tap the "Home Page Button" widget
    Then I expect the "Screen title" to be "Campus NAV"

  Scenario: Selecting the second drawer option
    Given I open the drawer
    When I tap the "Map Button" widget
    Then I expect the "Screen title" to be "Campus NAV Map"

  Scenario: Selecting the third drawer option
    Given I open the drawer
    When I tap the "Profile Button" widget
    Then I expect the "Screen title" to be "Campus NAV Profile"

  Scenario: Selecting the forth drawer option
    Given I open the drawer
    When I tap the "Favorites Button" widget
    Then I expect the "Screen title" to be "Campus NAV Favorites"

  Scenario: Selecting the fifth drawer option
    Given I open the drawer
    When I tap the "Settings Button" widget
    Then I expect the "Screen title" to be "Campus NAV Settings"

  Scenario: Selecting the sixth drawer option
    Given I open the drawer
    When I tap the "Help Button" widget
    Then I expect the "Screen title" to be "Campus NAV Help"