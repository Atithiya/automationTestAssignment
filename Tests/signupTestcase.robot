*** Settings ***
Documentation     Test Suite for Sign Up Functionality
Library           SeleniumLibrary

# Open browser automaticly
Test Setup        Open URL

# Close browser automaticly
Test Teardown     Close Browser

*** Variables ***
# Input / fields variables
${url}                      http://127.0.0.1:5500/Tests/index.html
${name_field}               id=name-input
${surname_field}            id=surname-input
${industry_dropdown}        id=industry-dropdown
${email_field}              id=email-input
${password_field}           id=password-input
${confirm_password_field}   id=confirmpassword-input
${show_password_checkbox}   id=showpassword-checkbox
${sign_up_button}           id=signup-button
${sign_in_link}             id=signin-link

# Input text
${name_input}               Atithiya
${surname_input}            Inthorn
${select_industry}          Technology
${email_input}              atithiya@email.com
${password_input}           Mika@1234
${confirmpassword_input}    Mika@1234


*** Test Cases ***
TC-01 Verify the default page of sign up.

    Page Should Contain Element    ${name_field}
    Page Should Contain Element    ${surname_field}
    Page Should Contain Element    ${industry_dropdown}
    Page Should Contain Element    ${email_field}
    Page Should Contain Element    ${password_field}
    Page Should Contain Element    ${confirm_password_field}
    Page Should Contain Element    ${show_password_checkbox}
    Page Should Contain Element    ${sign_up_button}
    Page Should Contain Element    ${sign_in_link}



TC-02 Verify sign-up with only English characters and a length not exceeding 50 characters.
    Input name in the name field
    Input surname in the surname field
    Select industry dropdown
    Input email in the email field
    Input password in the password field
    Input confirm password in confirm password field
    Click on sign up button
#   Successful signup


TC-03 Verify sign-up for cases involving non-English characters, such as Thai, special characters, numbers, and data exceeding a length of 50 characters.
#   "Name" field: อาทิติยา
    #"Name" field: Atithiya!
    #"Name" field: Atithiya@1
    #"Name" field: Atithiya123
    #"Name" field: 1234
    #"Name" field: @#$%
    #"Name" field: EleanorFitzgeraldJonathanAlexanderBartholomewMontas

    Input name in the name field    อาทิติยา
    Enter other data for verify name field
    Click on sign up button


    Input name in the name field    Atithiya!
    Enter other data for verify name field
    Click on sign up button

    Input name in the name field    Atithiya@1
    Enter other data for verify name field
    Click on sign up button

    Input name in the name field    Atithiya123
    Enter other data for verify name field
    Click on sign up button

    Input name in the name field    Atithiya123
    Enter other data for verify name field
    Click on sign up button

    Input name in the name field    1234
    Enter other data for verify name field
    Click on sign up button

    Input name in the name field    @#$%
    Enter other data for verify name field
    Click on sign up button

    Input name in the name field    EleanorFitzgeraldJonathanAlexanderBartholomewMontas
    Enter other data for verify name field
    Click on sign up button


*** Keywords ***
Open URL
    Open Browser    ${url}      Chrome

Page should contain successful sign up
    Page Should Contain Element    id=successful-signup

Page should contain unsuccessful sign up
    Page Should Contain Element    id=unsuccessful-signup

# Sign up steps
Input name in the name field
    [Arguments]     ${name_input}=Aithiya
    Input Text      ${name_field}           ${name_input}

Input surname in the surname field
    [Arguments]      ${surname_input}=Inthorn
    Input Text       ${surname_field}       ${surname_input}

Select industry dropdown
    Select From List By Label       ${industry_dropdown}       ${select_industry}

Input email in the email field
    [Arguments]     ${email_input}=atithiya@email.com
    Input Text      ${email_field}        ${email_input}

Input password in the password field
    [Arguments]     ${password_input}=Mika@1234
    Input Text      ${password_field}      ${password_input}

Input confirm password in confirm password field
    [Arguments]     ${confirmpassword_input}=Mika@1234
    Input Text      ${confirm_password_field}     ${confirmpassword_input}

Click on sign up button
    Click Element    ${sign_up_button}

Click on sign in link
    Click Element    ${sign_in_link}

Enter other data for verify name field
    Input surname in the surname field
    Select industry dropdown
    Input email in the email field
    Input password in the password field
    Input confirm password in confirm password field
