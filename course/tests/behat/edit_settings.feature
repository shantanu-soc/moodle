@core @core_course
Feature: Edit course settings
  In order to set the course according to my teaching needs
  As a teacher
  I need to edit the course settings

  @javascript
  Scenario: Edit course settings
    Given the following "users" exists:
      | username | firstname | lastname | email |
      | teacher1 | Teacher | 1 | teacher1@asd.com |
    And the following "courses" exists:
      | fullname | shortname | summary | format |
      | Course 1 | C1 | <p>Course summary</p> | topics |
    And the following "course enrolments" exists:
      | user | course | role |
      | teacher1 | C1 | editingteacher |
    And I log in as "teacher1"
    And I follow "Course 1"
    When I click on "Edit settings" "link" in the "Administration" "block"
    And I set the following fields to these values:
      | Course full name | Edited course fullname |
      | Course short name | Edited course shortname |
      | Course summary | Edited course summary |
    And I press "Save changes"
    And I follow "Edited course fullname"
    Then I should not see "Course 1"
    And I should not see "C1"
    And I should see "Edited course fullname"
    And I should see "Edited course shortname"
    And I click on "Edit settings" "link" in the "Administration" "block"
    And the field "Course full name" matches value "Edited course fullname"
    And the field "Course short name" matches value "Edited course shortname"
    And the field "Course summary" matches value "Edited course summary"
    And I am on homepage
    And I should see "Edited course fullname"
