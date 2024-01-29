*** Settings ***
Documentation     Test Suite for Sign Up Functionality
Library           SeleniumLibrary

# Open browser before each test case in the test suite
Test Setup        Open URL

# Close browser at the end of each test case
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
${email_input}              Atithiya@gmail.com
${password_input}           Jenken@123
${confirmpassword_input}    Jenken@123


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



TC-02 Verify sign up with only English characters and a length not exceeding 50 characters.
    Input name in the name field
    Input surname in the surname field
    Select industry dropdown
    Input email in the email field
    Input password in the password field
    Input confirm password in confirm password field
    Click on sign up button
    Page should contain successful sign up


TC-03 Verify sign up for cases involving non-English characters, such as Thai, special characters, numbers, and data exceeding a length of 50 characters.
 # "Name" field: อาทิติยา
 #"Name" field: Atithiya!
 #"Name" field: Atithiya@1
 #"Name" field: Atithiya123
 #"Name" field: 1234
 #"Name" field: @#$%
 #"Name" field: EleanorFitzgeraldJonathanAlexanderBartholomewMontas

    Input name in the name field    อาทิติยา
    Enter data in other fields to verify the name field
    Click on sign up button
    Page should contain unsuccessful sign up


    Input name in the name field    Atithiya!
    Enter data in other fields to verify the name field
    Click on sign up button
    Page should contain unsuccessful sign up

    Input name in the name field    Atithiya@1
    Enter data in other fields to verify the name field
    Click on sign up button
    Page should contain unsuccessful sign up

    Input name in the name field    Atithiya123
    Enter data in other fields to verify the name field
    Click on sign up button
    Page should contain unsuccessful sign up

    Input name in the name field    Atithiya123
    Enter data in other fields to verify the name field
    Click on sign up button
    Page should contain unsuccessful sign up

    Input name in the name field    1234
    Enter data in other fields to verify the name field
    Click on sign up button
    Page should contain unsuccessful sign up

    Input name in the name field    @#$%
    Enter data in other fields to verify the name field
    Click on sign up button
    Page should contain unsuccessful sign up

    Input name in the name field    EleanorFitzgeraldJonathanAlexanderBartholomewMontas
    Enter data in other fields to verify the name field
    Click on sign up button
    Page should contain unsuccessful sign up

TC-04 Verify sign up with an empty name
    Input surname in the surname field
    Select industry dropdown
    Input email in the email field
    Input password in the password field
    Input confirm password in confirm password field
    Click on sign up button
    Page should contain unsuccessful sign up

TC-05 Verify sign up with only English characters and a length not exceeding 50 characters in surname field
    Input name in the name field
    Input surname in the surname field
    Select industry dropdown
    Input email in the email field
    Input password in the password field
    Input confirm password in confirm password field
    Click on sign up button
    Page should contain successful sign up

TC-06 Verify sign up for cases involving non-English characters, such as Thai, special characters, numbers, and data exceeding a length of 50 characters in surname field
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
    Page should contain unsuccessful sign up

    Input surname in the surname field      Inthorn!
    Enter data in other fields to verify the surname field
    Click on sign up button
    Page should contain unsuccessful sign up

    Input surname in the surname field      Inthorn@1
    Enter data in other fields to verify the surname field
    Click on sign up button
    Page should contain unsuccessful sign up

    Input surname in the surname field      Inthorn123
    Enter data in other fields to verify the surname field
    Click on sign up button
    Page should contain unsuccessful sign up

    Input surname in the surname field      1234
    Enter data in other fields to verify the surname field
    Click on sign up button
    Page should contain unsuccessful sign up

    Input surname in the surname field      @#$%
    Enter data in other fields to verify the surname field
    Click on sign up button
    Page should contain unsuccessful sign up

    Input surname in the surname field      WetheringtonFitzgeraldHarringtonOSullivanVanderbilt
    Enter data in other fields to verify the surname field
    Click on sign up button
    Page should contain unsuccessful sign up

TC-07 Verify sign up with an empty surname
    Enter data in other fields to verify the surname field
    Click on sign up button
    Page should contain unsuccessful sign up

TC-08 Verify sign up by choosing an option from the dropdown
    Select industry dropdown
    Enter data in other fields to verify the industry dropdown
    Click on sign up button
    Page should contain successful sign up

TC-09 Verify sign up by not choosing an option from the dropdown
    Enter data in other fields to verify the industry dropdown
    Click on sign up button
    Page should contain unsuccessful sign up

TC-10 Verify sign up by entering a valid email address using only English characters or a combination of English and special characters with email format
    Input email in the email field
    Enter data in other fields to verify the email field
    Click on sign up button
    Page should contain successful sign up

TC-11 Verify sign up by not entering data in English containing other languages, special characters, or numbers with email format
 #"Email" field : อาทิติยา@gmail.com
 #"Email" field : อาทิติยา12@gmail.com
 #"Email" field : อาทิติยา!@gmail.com
 #"Email" field : #$!@gmail.com
 #"Email" field : 123@gmail.com
 #"Email" field : 123!@gmail.com

    Input email in the email field      อาทิติยา@gmail.com
    Enter data in other fields to verify the email field
    Click on sign up button
    Page should contain unsuccessful sign up

    Input email in the email field      อาทิติยา12@gmail.com
    Enter data in other fields to verify the email field
    Click on sign up button
    Page should contain unsuccessful sign up

    Input email in the email field      อาทิติยา!@gmail.com
    Enter data in other fields to verify the email field
    Click on sign up button
    Page should contain unsuccessful sign up

    Input email in the email field      -#$!@gmail.com
    Enter data in other fields to verify the email field
    Click on sign up button
    Page should contain unsuccessful sign up

    Input email in the email field      123@gmail.com
    Enter data in other fields to verify the email field
    Click on sign up button
    Page should contain unsuccessful sign up

    Input email in the email field      123!@gmail.com
    Enter data in other fields to verify the email field
    Click on sign up button
    Page should contain unsuccessful sign up

TC-12 Verify sign up by entering a data in English with an incorrect email format
 #"Email" field : Atithiya@@gmail.com
 #"Email" field : Atithiya@gmailcom
 #"Email" field : Atithiya@gmai

    Input email in the email field      Atithiya@@gmail.com
    Enter data in other fields to verify the email field
    Click on sign up button
    Page should contain unsuccessful sign up

    Input email in the email field      Atithiya@gmailcom
    Enter data in other fields to verify the email field
    Click on sign up button
    Page should contain unsuccessful sign up

    Input email in the email field      Atithiya@gmai
    Enter data in other fields to verify the email field
    Click on sign up button
    Page should contain unsuccessful sign up

TC-13 Verify sign-up by entering an already used email in the email field
    Input email in the email field      Atithiya@gmail.com
    Enter data in other fields to verify the email field
    Page Should Contain Element    css=div.alert-areadyusedemail-message
    Click on sign up button
    Page should contain unsuccessful sign up

TC-14 Verify sign-up by entering an empty email field in the email field
    Enter data in other fields to verify the email field
    Click on sign up button
    Page should contain unsuccessful sign up

TC-15 Verify by entering the data in English characters, numbers and special characters, with a minimum length of 6 characters in the password field
    Input password in the password field
    Enter data in other fields to verify the password field
    Click on sign up button
    Page should contain successful sign up

TC-16 Verify by entering the data in English and numbers or special character, numbers and English characters or special characters with a minimum length of 6 characters in the password field
 #"Password" field : Jenken@
 #"Password" field : Jenken12
 #"Password" field : 123@#%
    Input password in the password field    Jenken@
    Enter data in other fields to verify the password field
    Click on sign up button
    Page Should Contain Element   css=div.alert-password-message
    Page should contain unsuccessful sign up

    Input password in the password field    Jenken12
    Enter data in other fields to verify the password field
    Click on sign up button
    Page Should Contain Element   css=div.alert-password-message
    Page should contain unsuccessful sign up

    Input password in the password field    123@#%
    Enter data in other fields to verify the password field
    Click on sign up button
    Page Should Contain Element   css=div.alert-password-message
    Page should contain unsuccessful sign up

TC-17 Verify by entering the data in only English, or only numbers, or only special characters, or numbers and special characters with a minimum length of 6 characters in the password field
 #"Password" field : Jenken
 #"Password" field : 123456
 #"Password" field : Jenken
 #"Password" field : 12345@

    Input password in the password field    Jenken
    Enter data in other fields to verify the password field
    Click on sign up button
    Page Should Contain Element   css=div.alert-password-message
    Page should contain unsuccessful sign up

    Input password in the password field    123456
    Enter data in other fields to verify the password field
    Click on sign up button
    Page Should Contain Element   css=div.alert-password-message
    Page should contain unsuccessful sign up

    Input password in the password field    Jenken
    Enter data in other fields to verify the password field
    Click on sign up button
    Page Should Contain Element   css=div.alert-password-message
    Page should contain unsuccessful sign up

    Input password in the password field    12345@
    Enter data in other fields to verify the password field
    Click on sign up button
    Page Should Contain Element   css=div.alert-password-message
    Page should contain unsuccessful sign up


TC-18 Verify by entering the data in English characters, numbers and special characters, less than length of 6 characters in the password field
    Input password in the password field    Jen@1
    Enter data in other fields to verify the password field
    Click on sign up button
    Page Should Contain Element   css=div.alert-password-message
    Page should contain unsuccessful sign up

TC-19 Verify by entering the data with only English characters, only numbers, only special characters, or a combination of numbers and special characters, with a length of less than 6 characters in the password field
 #"Password" field : Jenke
 #"Password" field : 12345
 #"Password" field : @##!!
 #"Password" field : 12345

    Input password in the password field    Jen@1
    Enter data in other fields to verify the password field
    Click on sign up button
    Page Should Contain Element   css=div.alert-password-message
    Page should contain unsuccessful sign up

    Input password in the password field    12345
    Enter data in other fields to verify the password field
    Click on sign up button
    Page Should Contain Element   css=div.alert-password-message
    Page should contain unsuccessful sign up

    Input password in the password field    @##!!
    Enter data in other fields to verify the password field
    Click on sign up button
    Page Should Contain Element   css=div.alert-password-message
    Page should contain unsuccessful sign up

    Input password in the password field    12345
    Enter data in other fields to verify the password field
    Click on sign up button
    Page Should Contain Element   css=div.alert-password-message
    Page should contain unsuccessful sign up


TC-20 Verify sign up by entering an empty password field in the password field
    Enter data in other fields to verify the password field
    Click on sign up button
    Page Should Contain Element   css=div.alert-password-message
    Page should contain unsuccessful sign up

TC-21 Verify entering the confirm password field correctly matches the password field
    Input confirm password in confirm password field
    Enter data in other fields to verify the confirm assword field
    Click on sign up button
    Page should contain successful sign up


TC-22 Verify entering the confirm password field does not correctly match the password field
    Input confirm password in confirm password field    Jenken@12
    Enter data in other fields to verify the confirm assword field
    Click on sign up button
    Page Should Contain Element    css=div.alert-confirmpassword-message
    Page should contain unsuccessful sign up

TC-23 Verify sign-up by entering an empty confirm password field
    Enter data in other fields to verify the confirm assword field
    Click on sign up button
    Page Should Contain Element    css=div.alert-confirmpassword-message
    Page should contain unsuccessful sign up

TC-24 Verify the selection of the show password toggle
    Enter data in other fields to verify the show password checkbox

    # Activate show password
    Select on show password checkbox

TC-25 Verify the deselection of the show password toggle
    Enter data in other fields to verify the show password checkbox

    # Select on show password checkbox
    Select on show password checkbox

    # Select on show password checkbox again
    Select on show password checkbox

TC-26 Verify the functionality of clicking on the sign up button after entering all fields
    Enter data in all fields
    Click on sign up button
    Page should contain successful sign up

TC-27 Verify the functionality of clicking on the sign up button by entering invalid data in all fields
 #"Name" field: อาทิติยา
 #"Surname" field: อินทร
 #"Email" field : อาทิติยา@gmail.com
 #"Password" field : Jenken@
 #"Confirm password" : Jenken@12

    Input name in the name field                        อาทิติยา
    Input surname in the surname field                  อินทร
    Input email in the email field                      อาทิติยา@gmail.com
    Input password in the password field                Jenken@
    Input confirm password in confirm password field    Jenken@12
    Click on sign up button
    Page should contain unsuccessful sign up


TC-28 Verify the functionality of clicking on the sign up button without entering data in any fields
    Click on sign up button
    Page should contain unsuccessful sign up


TC-29 Verify the functionality of clicking on the sign in link
    Click Element    ${sign_in_link}  
    Page Should Contain Element    css=div.signin-container

TC-30 Verify the functionality of clicking on the sign in link with incorrect or invalid link
    Click Element    ${sign_in_link}

    # Verify that signin-container is not visible (indicating an invalid or incorrect link)
    Element Should Not Be Visible    css=div.signin-container

*** Keywords ***
Open URL
    Open Browser    ${url}      Chrome

# Successful sign up
Page should contain successful sign up
    Page Should Contain Element    id=successful-signup

# Unsuccessful sign up
Page should contain unsuccessful sign up
    Page Should Contain Element    id=unsuccessful-signup

# Sign up steps
Input name in the name field

    # Arguments: ${name_input} (default value: Aithiya)
    [Arguments]      ${name_input}=Aithiya
    Input Text       ${name_field}                ${name_input}

Input surname in the surname field
    # Arguments: ${surname_input} (default value: Inthorn)
    [Arguments]      ${surname_input}=Inthorn
    Input Text       ${surname_field}             ${surname_input}

Select industry dropdown
    Select From List By Label                     ${industry_dropdown}       ${select_industry}

Input email in the email field
    # Arguments: ${email_input} (default value: atithiya@email.com)
    [Arguments]      ${email_input}=atithiya@email.com
    Input Text       ${email_field}               ${email_input}

Input password in the password field
    # Arguments: ${password_input} (default value: Mika@1234)
    [Arguments]      ${password_input}=Mika@1234
    Input Text       ${password_field}            ${password_input}

Input confirm password in confirm password field
    # Arguments: ${confirmpassword_input} (default value: Mika@1234)
    [Arguments]      ${confirmpassword_input}=Mika@1234
    Input Text       ${confirm_password_field}    ${confirmpassword_input}

Select on show password checkbox
    Click Element    ${show_password_checkbox}

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

# Password field
Enter data in other fields to verify the password field
    Input name in the name field
    Input surname in the surname field
    Select industry dropdown
    Input email in the email field
    Input confirm password in confirm password field

# Confirm password field
Enter data in other fields to verify the confirm assword field
    Input name in the name field
    Input surname in the surname field
    Select industry dropdown
    Input email in the email field
    Input password in the password field

# Show password field
Enter data in other fields to verify the show password checkbox
    Input name in the name field
    Input surname in the surname field
    Select industry dropdown
    Input email in the email field
    Input password in the password field
    Input confirm password in confirm password field

Enter data in all fields
    Input name in the name field
    Input surname in the surname field
    Select industry dropdown
    Input email in the email field
    Input password in the password field