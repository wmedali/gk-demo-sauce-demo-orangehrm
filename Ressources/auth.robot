*** Settings ***
Library     SeleniumLibrary


*** Keywords ***
Authentification
    [Arguments]    ${username}    ${password}
    Maximize Browser Window
    Clear Element Text    css:[placeholder="Username"]
    Input Text    css:[placeholder="Username"]    ${username}
    Clear Element Text    css:[id="password"]
    Input Password    css:[id="password"]    ${password}
    Click Element    css:[data-test="login-button"]
