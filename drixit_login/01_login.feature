@Drixit @login
Feature: Login to the Drixit site
  In order to access my user account
  As a portal user
  I want to login/logout to the Drixit site

  @login_success
  Scenario: successfully login
    Given portal user enters to the Drixit site
     When portal user logs in to the Drixit site with valid credentials
     Then portal user successfully logged in to the Drixit site

  @login_fail
  Scenario: login fail
    Given anonymous user enters to the Drixit site
     When anonymous user logs in to the Drixit site with invalid credentials
     Then anonymous user was unable to log in to the Drixit site

  @login_reset_password
  Scenario: reset password
    Given portal user enters to the Drixit site
     When portal user attempts to reset my password through the Drixit site
     Then portal user successfully triggered the reset password process through the Drixit site