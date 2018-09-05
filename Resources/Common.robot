*** Settings ***
Library           Selenium2Library
Library           SauceLabs.py
Library           String

*** Variables ***
@{_tmp}           browserName: %{browserName},    platform: %{platform},    version: %{version},    name: %{name}
${BROWSER}        %{ROBOT_BROWSER}
${KEY}            %{SAUCE_USERNAME}:%{SAUCE_ACCESS_KEY}
${REMOTE_URL}     http://${KEY}@ondemand.saucelabs.com:80/wd/hub
${PAGE_TITLE}     QA Cemex GO
${CAPABILITIES}    name:QA Cemex GO Demo,platform:Windows 10,OS:Windows 10,browserName:chrome,version:68,extendedDebugging:true

*** Keywords ***
Open test browser
    @{_tmp}=    Split String    ${CAPABILITIES}    ,
    Open browser    https://qa.cemexgo.com/login    browser=${BROWSER}    remote_url=${REMOTE_URL}    desired_capabilities=${CAPABILITIES}

Close test browser
    Run keyword if    '${REMOTE_URL}' != ''    Report Sauce status    ${TEST_NAME}    ${TEST_STATUS}
    Close all browsers
