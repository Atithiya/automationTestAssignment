*** Settings ***
Documentation     Test Suite for Sign Up Functionality
Library     SeleniumLibrary

*** Variables ***
${URL}      http://127.0.0.1:5500/Tests/index.html
${nameField}                id=name-input
${surnameField}             id=surname-input
${industryDropdown}         id=industry-dropdown
${emailField}               id=email-input
${passwordField}            id=password-input
${confirmPasswordField}     id=confirmpassword-input
${showPasswordChecbox}      id=showpassword-checkbox
${signUpButton}             id=signup-button
${signInLink}               id=signin-link


*** Test Cases ***
TC-01 Verify the default page of sign up.
    Open Browser    ${URL}      Chrome
    Page Should Contain Element    ${nameField}
    Page Should Contain Element    ${surnameField}
    Page Should Contain Element    ${industryDropdown}
    Page Should Contain Element    ${emailField}
    Page Should Contain Element    ${passwordField}
    Page Should Contain Element    ${confirmPasswordField}
    Page Should Contain Element    ${showPasswordChecbox}
    Page Should Contain Element    ${signUpButton}
    Page Should Contain Element    ${signInLink}
    Sleep    10s
    Close Browser

*** Keywords ***

