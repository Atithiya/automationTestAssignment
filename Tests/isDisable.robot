*** Settings ***
Library     SeleniumLibrary

*** Variables ***
${URL}      http://127.0.0.1:5500/Tests/assess.html
${BBBAssessButtonXPath}    xpath=//td[@class='table-user' and contains(text(),'BBB')]/following-sibling::td[@class='table-class' and contains(text(),'abc')]/following-sibling::td[@class='table-button']//button[@class='table-assess']

*** Test Cases ***
Verify Assess Button is Disabled for NAME = “BBB” and CLASS = “abc”
    Open Browser    ${URL}      Chrome
    Checking “Assess” button that NAME = “BBB” and CLASS = “abc” is disabled
    Close Browser

*** Keywords ***
Checking “Assess” button that NAME = “BBB” and CLASS = “abc” is disabled
    ${isDisabled}=    Run Keyword And Return Status    Element Should Be Disabled    ${BBBAssessButtonXPath}
    Log    Is Assess Button Disabled? ${isDisabled}

# Run Keyword And Return Status to check whether the element specified by ${BBBAssessButtonXPath} is disabled. If the element is disabled, ${isDisabled} will be set to True; otherwise, it will be set to False.