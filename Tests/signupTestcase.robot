*** Settings ***
Documentation     Test Suite for Sign Up Functionality
Library           SeleniumLibrary

# Open browser automatically
Test Setup        Open URL

# Close browser automatically
Test Teardown     Close Browser

*** Variables ***
# Input / fields variables

# I ran on my local computer
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
#   Page should contain successful sign up


TC-03 Verify sign-up for cases involving non-English characters, such as Thai, special characters, numbers, and data exceeding a length of 50 characters.
#   "Name" field: อาทิติยา
    #"Name" field: Atithiya!
    #"Name" field: Atithiya@1
    #"Name" field: Atithiya123
    #"Name" field: 1234
    #"Name" field: @#$%
    #"Name" field: EleanorFitzgeraldJonathanAlexanderBartholomewMontas

    Input name in the name field    อาทิติยา
    Enter data in other fields to verify the name field
    Click on sign up button
#    Page should contain unsuccessful sign up


    Input name in the name field    Atithiya!
    Enter data in other fields to verify the name field
    Click on sign up button
#    Page should contain unsuccessful sign up

    Input name in the name field    Atithiya@1
    Enter data in other fields to verify the name field
    Click on sign up button
#    Page should contain unsuccessful sign up

    Input name in the name field    Atithiya123
    Enter data in other fields to verify the name field
    Click on sign up button
#    Page should contain unsuccessful sign up

    Input name in the name field    Atithiya123
    Enter data in other fields to verify the name field
    Click on sign up button
#    Page should contain unsuccessful sign up

    Input name in the name field    1234
    Enter data in other fields to verify the name field
    Click on sign up button
#    Page should contain unsuccessful sign up

    Input name in the name field    @#$%
    Enter data in other fields to verify the name field
    Click on sign up button
#    Page should contain unsuccessful sign up

    Input name in the name field    EleanorFitzgeraldJonathanAlexanderBartholomewMontas
    Enter data in other fields to verify the name field
    Click on sign up button
#    Page should contain unsuccessful sign up

TC-04 Verify sign up with an empty name
    Input surname in the surname field
    Select industry dropdown
    Input email in the email field
    Input password in the password field
    Input confirm password in confirm password field
    Click on sign up button
#    Page should contain unsuccessful sign up

TC-05 Verify sign-up with only English characters and a length not exceeding 50 characters in surname field
    Input name in the name field
    Input surname in the surname field
    Select industry dropdown
    Input email in the email field
    Input password in the password field
    Input confirm password in confirm password field
    Click on sign up button
#    Page should contain successful sign up

TC-06 Verify sign-up for cases involving non-English characters, such as Thai, special characters, numbers, and data exceeding a length of 50 characters in surname field
#"Surname" field: อินทร
 #"Surname" field: Inthorn!
 #"Surname" field: Inthorn@1
 #"Surname" field: Inthorn123
 #"Surname" field: 1234
 #"Surname" field: @#$%
 #"Surname" field: WetheringtonFitzgeraldHarringtonOSullivanVanderbilt

    Input surname in the surname field      อินทร
    Enter data in other fields to verify the surname field
    Click on sign up button
#   Page should contain unsuccessful sign up

    Input surname in the surname field      Inthorn!
    Enter data in other fields to verify the surname field
    Click on sign up button
#   Page should contain unsuccessful sign up

    Input surname in the surname field      Inthorn@1
    Enter data in other fields to verify the surname field
    Click on sign up button
#   Page should contain unsuccessful sign up

    Input surname in the surname field      Inthorn123
    Enter data in other fields to verify the surname field
    Click on sign up button
#   Page should contain unsuccessful sign up

    Input surname in the surname field      1234
    Enter data in other fields to verify the surname field
    Click on sign up button
#   Page should contain unsuccessful sign up

    Input surname in the surname field      @#$%
    Enter data in other fields to verify the surname field
    Click on sign up button
#   Page should contain unsuccessful sign up

    Input surname in the surname field      WetheringtonFitzgeraldHarringtonOSullivanVanderbilt
    Enter data in other fields to verify the surname field
    Click on sign up button
#   Page should contain unsuccessful sign up

TC-07 Verify sign up with an empty surname
    Enter data in other fields to verify the surname field
    Click on sign up button
#   Page should contain unsuccessful sign up

TC-08 Verify sign up by choosing an option from the dropdown
    Select industry dropdown
    Enter data in other fields to verify the industry dropdown
    Click on sign up button
#   Page should contain successful sign up

TC-09 Verify sign up by not choosing an option from the dropdown
    Enter data in other fields to verify the industry dropdown
    Click on sign up button
#   Page should contain unsuccessful sign up

TC-10 Verify sign-up by entering a valid email address using only English characters or a combination of English and special characters with email format
    Input email in the email field
    Enter data in other fields to verify the email field
    Click on sign up button
#   Page should contain successful sign up

TC-11 Verify sign-up by not entering data in English containing other languages, special characters, or numbers with email format
 #"Email" field : อาทิติยา@gmail.com
 #"Email" field : อาทิติยา12@gmail.com
 #"Email" field : อาทิติยา!@gmail.com
 #"Email" field : #$!@gmail.com
 #"Email" field : 123@gmail.com
 #"Email" field : 123!@gmail.com

    Input email in the email field      อาทิติยา@gmail.com
    Enter data in other fields to verify the email field
    Click on sign up button
#   Page should contain unsuccessful sign up

    Input email in the email field      อาทิติยา12@gmail.com
    Enter data in other fields to verify the email field
    Click on sign up button
#   Page should contain unsuccessful sign up

    Input email in the email field      อาทิติยา!@gmail.com
    Enter data in other fields to verify the email field
    Click on sign up button
#   Page should contain unsuccessful sign up

    Input email in the email field      -#$!@gmail.com
    Enter data in other fields to verify the email field
    Click on sign up button
#   Page should contain unsuccessful sign up

    Input email in the email field      123@gmail.com
    Enter data in other fields to verify the email field
    Click on sign up button
#   Page should contain unsuccessful sign up

    Input email in the email field      123!@gmail.com
    Enter data in other fields to verify the email field
    Click on sign up button
#   Page should contain unsuccessful sign up
    Sleep    10s




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

# Name field
Enter data in other fields to verify the name field
    Input surname in the surname field
    Select industry dropdown
    Input email in the email field
    Input password in the password field
    Input confirm password in confirm password field


# Surname field
Enter data in other fields to verify the surname field
    Input name in the name field     
    Select industry dropdown
    Input email in the email field
    Input password in the password field
    Input confirm password in confirm password field


# Industry dropdown
Enter data in other fields to verify the industry dropdown
    Input name in the name field
    Input surname in the surname field
    Input email in the email field
    Input password in the password field
    Input confirm password in confirm password field

# Email field
Enter data in other fields to verify the email field
    Input name in the name field
    Input surname in the surname field
    Select industry dropdown
    Input password in the password field
    Input confirm password in confirm password field    