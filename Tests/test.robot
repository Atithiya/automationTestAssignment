*** Settings ***
Documentation     Test Suite for Sign Up Functionality
Library         SeleniumLibrary

*** Variables ***

${URL}              http://www.xxx.com


${NameInput}        Atithiya
${SurnameInput}     Inthorn
${SelectIndustry}   Technology
${EmailInput}       atithiya@email.com
${PasswordInput}    Mika@1234
${ConfirmPassword}  Mika@1234


*** Test Cases ***
TC-01 Verify the default page of sign up.
    [Documentation]     Clicks on "Sign up" button and verifies elements on the sign-up page

    # Open the browser and navigate to the sign-up page
    Open Browser        ${URL}      Chrome

    # Click on the "Sign up" button
    Click Button        xpath=//button[contains(text(),'Sign up')]

    # Verify the sign up page should contain these elements.
    Element Should Be Visible    xpath=//input[@placeholder='Name']
    Element Should Be Visible    xpath=//input[@placeholder='Surname']
    Element Should Be Visible    xpath=//select[@id='industryDropdown']
    Element Should Be Visible    xpath=//input[@placeholder='Email']
    Element Should Be Visible    xpath=//input[@placeholder='Password']
    Element Should Be Visible    xpath=//input[@placeholder='Confirm password']
    Element Should Be Visible    xpath=//input[@type='checkbox' and @id='showPasswordCheckbox']
    Element Should Be Visible    xpath=//button[contains(text(),'Sign up')]
    Element Should Be Visible    xpath=//a[contains(text(),'Sign in')]

    Close Browser

TC-02 Verify sign-up with only English characters and a length not exceeding 50 characters.
    [Documentation]    Verify sign-up with only English characters and a length not exceeding 50 characters.

    # Enter a valid name in the "Name" field
    Input Text         xpath=//input[@placeholder='Name']    ${NameInput}

    # 1. Verify that the placeholder is removed and the name is entered successfully
    Element Should Not Be Visible    xpath=//input[@placeholder='Name']
    Element Should Contain    xpath=//input[@value='Atithiya']    ${NameInput}

    # 2. Verify that the system supports entering data in English and not exceeding 50 characters
    Element Text Should Be    xpath=//input[@value='Atithiya']    ${NameInput}

    # Additional steps: Enter other required information for sign up
    Input Text         xpath=//input[@placeholder='Surname']    ${SurnameInput}
    Select From List By Label    xpath=//select[@id='industryDropdown']     ${SelectIndustry}
    Input Text         xpath=//input[@placeholder='Email']    ${EmailInput}
    Input Text         xpath=//input[@placeholder='Password']    ${PasswordInput}
    Input Text         xpath=//input[@placeholder='Confirm password']    ${ConfirmPassword}

    # Click on the "Sign up" button
    Click Sign up button

    # (Assuming there's a successful login message or redirect to a logged-in page)
    Page should successful Sign up
    Close Browser


TS-03 Verify sign-up for cases involving non-English characters, such as Thai, special characters, numbers, and data exceeding a length of 50 characters.
    [Documentation]     Verify sign-up for cases involving non-English characters, such as Thai, special characters, numbers, and data exceeding a length of 50 characters.

    # Enter a valid name in the "Name" field
    Input Text         xpath=//input[@id='Name']       อาทิติยา

    # 1. Verify that the placeholder is removed and the name is entered successfully
    Element Should Not Be Visible    xpath=//input[@placeholder='Name']
    Element Should Contain    xpath=//input[@value='อาทิติยา']    อาทิติยา

    # 2. Verify that the system supports entering data in English and not exceeding 50 characters
    Element Text Should Be    xpath=//input[@value='อาทิติยา']    อาทิติยา

    # Additional steps: Enter other required information for sign up
    Input Text         xpath=//input[@placeholder='Surname']    ${SurnameInput}
    Select From List By Label    xpath=//select[@id='industryDropdown']     ${SelectIndustry}
    Input Text         xpath=//input[@placeholder='Email']    ${EmailInput}
    Input Text         xpath=//input[@placeholder='Password']    ${PasswordInput}
    Input Text         xpath=//input[@placeholder='Confirm password']    ${ConfirmPassword}

    # Click on the "Sign up" button
    Click Sign up button

    # (Assuming there's a successful login message or redirect to a logged-in page)
    Page should successful Sign up
    Close Browser




*** Keywords ***
Page should successful Sign up
    Page Should Contain Element    xpath=//div[contains(text(),'Successful Sign up!')]

Click Sign up button
    Click Button       xpath=//button[contains(text(),'Sign up')]






