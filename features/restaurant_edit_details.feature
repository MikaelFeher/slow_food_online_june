Feature: As a system user
  In order to keep information about my restaurant up to date
  I would like to be able to edit my restaurant's details

  Background:
    Given I am logged in as a user of the system
    And the following restaurant exists
    | id | name    | address     | zip_code |
    | 1  | Mikey's | Main Street | 12345    |

  Scenario: Viewing the restaurant edit details page
    Given I am on the "edit" page for "Mikey's"
    Then I should see all the fields
    And I should see a "Update info" button
