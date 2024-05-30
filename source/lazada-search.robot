*** Settings ***
Library    Selenium2Library
Library    BuiltIn
Library    String

*** Variables ***
${lazada_URL}     https://www.lazada.co.th
${input_search}   //*[contains(@class, 'search-box__input--O34g')]
${btn_search}     //*[contains(@class, 'search-box__search--2fC5')]
${search_key}     Bandai MG Astray Red Frame
${expect_topic_search}   //*[contains(@class, 'JrAyI')]
${screenshot_dir}    ./images

*** Keywords ***
Go to Lazada URL
    Open Browser    ${lazada_URL}    chrome

Input Search Key
    Input Text    ${input_search}    ${search_key}
    Click Element    ${btn_search}

Verify Search Result
    Element Text Should Be    ${expect_topic_search}    ${search_key}

Pause 5 Sec
    Sleep    10s

Pause 2 Sec
    Sleep    2s

Capture Screenshot
    ${screenshot_path}=    Set Variable    ${screenshot_dir}/${TEST_NAME}.png
    Capture Page Screenshot    ${screenshot_path}

Custom Teardown
    [Teardown]
    Run Keyword And Ignore Error    Capture Screenshot
    Run Keyword And Ignore Error    Pause 5 Sec
    Log    Test Completed, browser will remain open for inspection.

*** Test Cases ***
Lazada Check
    Go to Lazada URL
    Pause 2 Sec
    Input Search Key
    Pause 2 Sec
    Verify Search Result
    Custom Teardown
