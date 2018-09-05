*** Settings ***
Test Setup        Common.Open test browser
Test Teardown     Common.Close test browser
Resource          ../Resources/Common.robot

*** Variables ***
${BROWSER}        Chrome
${KEY}            Riock71:920818b6-4a6f-47b0-849c-703f6e626a8e
${username}       omar.fraige@mailinator.com
${password}       Cemex2018

*** Test Cases ***
Example of connecting to Sauce via Robot Framework
    [Tags]    Web
    Capture Page Screenshot
    Page should contain element    xpath=//div[@class="login"]
    Input Text    xpath=//input[contains(@id,"username")]    ${username}
    Input Text    xpath=//input[contains(@id,"password")]    ${password}
    Click Element    xpath=//button[contains(@id,"submit")]
    Wait Until Element Is Enabled    id=cmx-dashboard-container
    Capture Page Screenshot
