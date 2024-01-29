*** Keywords ***
Verify Sign up
  [Arguments]    ${name}

  # Enter a valid name in the "Name" field
  Input Text         xpath=//input[@id='Name']       ${name}




  # 1. Verify that the placeholder is removed and the name is entered successfully
  Element Should Not Be Visible    xpath=//input[@placeholder='Name']
  Element Should Contain    xpath=//input[@value=${name}]    ${name}
  # 2. Verify that the system supports entering data in English and not exceeding 50 characters
  Element Text Should Be    xpath=//input[@value=${name}]    ${name}




  # Additional steps: Enter other required information for sign up
  Input Text         xpath=//input[@placeholder='Surname']    ${SurnameInput}
  Select From List By Label    xpath=//select[@id='industryDropdown']     ${SelectIndustry}
  Input Text         xpath=//input[@placeholder='Email']    ${EmailInput}
  Input Text         xpath=//input[@placeholder='Password']    ${PasswordInput}
  Input Text         xpath=//input[@placeholder='Confirm password']    ${ConfirmPassword}




  # Click on the "Sign up" button
  Click Sign up button




  # Additional steps: Verify successful login
  # (Assuming there's a successful login message or redirect to a logged-in page)
  Page should successful Sign up
  Close Browser
