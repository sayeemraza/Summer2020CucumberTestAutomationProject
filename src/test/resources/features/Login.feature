@login
Feature: As user I want to be able to login under different roles
# this is a comment
#Background - test pre-condition
#  will be executed before every scenario in the particular feature file
  Background: common steps
    Given user is on the login page

  Scenario: Login as a sales manger
    When user logs in
    Then user should see dashboard page

  @parametrized_test @smoke_test
  Scenario: Parametrized login
    When user logs in as a "store manager"
    Then user should see dashboard page

  @parametrized_test @smoke_test
  Scenario: Parametrized login
    When user logs in as a "sales manager"
    Then user should see dashboard page

  @s_o
  Scenario Outline: Parametrized login as <role>
    When user logs in as a "<role>"
    Then user should see dashboard page

    Examples:
      | role          |
      | sales manager |
      | store manager |

#    role - variable. You can name parameters as you want.
#   1st row always reserved for parameters
# auto-formatting on mac:     command + option + L
# auto-formatting on windows: control + alt + L
#"driver" - is a parameter. "" allows to do test parametrization which helps to re-use test steps

  @negative_login
  Scenario: Invalid password
    When user logs in with "storemanager85" username and "wrong" password
    Then user verifies that "Invalid user name or password." message is displayed
