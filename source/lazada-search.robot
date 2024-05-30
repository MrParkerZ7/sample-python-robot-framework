*** Settings ***
Library    Selenium2Library
Library    BuiltIn
Library    String

*** Variables ***
${lazada_URL}     https://www.lazada.co.th
${input_search}   //*[contains(@class, 'search-box__input--O34g')]
${btn_search}   //*[contains(@class, 'search-box__search--2fC5')]
${search_key}    Bandai MG Astray Red Frame
${expect_topic_search}   //*[contains(@class, 'JrAyI')]

*** Keywords ***
Go to Lazada URL
    Open Browser    ${lazada_URL}    chrome

Input Username and Password
    Input Text    ${input_search}    ${search_key}
    Click Element    ${btn_search}

Verify My Lazada
    Element Text Should Be    ${expect_topic_search}    ${search_key}

Pause 5 Sec
    Sleep    10s

Pause 2 Sec
    Sleep    2s


*** Test Cases ***
Lazada Check
    Go to Lazada URL
    Pause 2 Sec
    Input Username and Password
    Pause 2 Sec
    Verify My Lazada
    Pause 5 Sec


*** Keywords ***
Custom Teardown
    Run Keyword And Ignore Error    Pause After Test
    Log    Test Completed, browser will remain open for inspection.