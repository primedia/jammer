Feature: My bootstrapped app kinda works
  In order to get going on coding my awesome app
  I want to have aruba and cucumber setup
  So I don't have to do it myself

  Scenario: App just runs
    When I get help for "jammer"
    Then the exit status should be 0
    And the banner should be present
    And the banner should document that this app takes options
    And the following options should be documented:
      |--version|

  Scenario: App creates new Jam packages
    When I run `jammer new test` interactively
    And I type "test description"
    And I type "test.url"
    Then the exit status should be 0
    And a directory named "test" should exist
    And the following files should exist:
      | test/package.json |
      | test/test.js      |
      | test/README.md    |

  Scenario: App doesn't overwrite directories
    Given a directory named "test"
    When I run `jammer new test`
    Then the exit status should be 1

  Scenario: App overwrites directories when forced
    Given a directory named "test"
    When I run `jammer --force new test` interactively
    And I type ""
    And I type ""
    Then a directory named "test" should exist
    And the following files should exist:
      | test/package.json |
