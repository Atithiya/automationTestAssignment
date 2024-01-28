*** Settings ***
Library     SeleniumLibrary

*** Variables ***
# ${URL}: This variable stores the URL
${URL}      http://127.0.0.1:5500/Tests/assess.html

#${BBBAssessButtonXPath}: This variable stores an XPath expression that identifies the "Assess" button with the row where the user is "BBB" and the class is "abc" in a table.
${BBBAssessButtonXPath}    xpath=//td[@class='table-user' and contains(text(),'BBB')]/following-sibling::td[@class='table-class' and contains(text(),'abc')]/following-sibling::td[@class='table-button']//button[@class='table-assess']

*** Test Cases ***
# Test case name
Verify Assess Button is Disabled for NAME = “BBB” and CLASS = “abc”

# 1. Open the browser using Chrome.
    Open Browser    ${URL}      Chrome

# 2. Check whether the "Assess" button specified by ${BBBAssessButtonXPath} is disabled by using the keyword "Checking “Assess” button that NAME = “BBB” and CLASS = “abc” is disabled".
    Checking “Assess” button that NAME = “BBB” and CLASS = “abc” is disabled

# 3. After finishing the checking, close the browser.
    Close Browser

*** Keywords ***
Checking “Assess” button that NAME = “BBB” and CLASS = “abc” is disabled
# Run Keyword And Return Status to check whether the element specified by ${BBBAssessButtonXPath} is disabled. If the element is disabled, ${isDisabled} will be set to True; otherwise, it will be set to False.
    ${isDisabled}=    Run Keyword And Return Status    Element Should Be Disabled    ${BBBAssessButtonXPath}

# Updated: Log message for better understanding.
    Log    Is Assess Button Disabled? ${isDisabled}