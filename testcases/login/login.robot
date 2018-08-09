*** Settings ***
Resource     ../../resources/imports.robot
Resource     ../../keywords/common/common_keyword.robot
Variables    ../../resources/testdata/${env}/login_data.yaml
Documentation     A test suite for test sending request.

*** Test Cases ***
TestCase_1 Login: Valid Login - reuturn 200 success
    Given Prepare Data To Login With '${login_data}'
    When Send Request To Login
    Then Status Code Should Be '200'

TestCase_1 Login: Valid Login - reuturn 400 success
    Given Prepare Data To Login With '${login_data}'
    And Set Parameter 'email' is '${EMPTY}'
    When Send Request To Login
    Then Status Code Should Be '400'