Feature: Drawer
  Tests that verify the correct functioning of the app drawer in the main screen.

  Scenario: Selecting the first drawer option
    Given I open the drawer
    When I tap the "Map Button" widget
    Then I expect the "Screen title" to be "Campus Nav Map"