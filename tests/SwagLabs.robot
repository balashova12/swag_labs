*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${browser}  chrome
${url}  https://balashova12.github.io/swag_labs/swag_labs.html
*** Test Cases ***
Testing Web Page
    Open browser    ${url}  ${browser}
    Maximize browser window

    Input Text    id:username    standard_user
    Input Text    id:password    secret_sauce
    Sleep    1s
    Click button    id:login-button

    Wait Until Element Is Visible    id:product-page
    Sleep    1s

    Wait Until Element Is Visible    xpath=//div[@id='products-grid']/div[1]//button
    Click Button    xpath=//div[@id='products-grid']/div[1]//button
    Sleep    1s
    Click Button    xpath=//div[@id='products-grid']/div[2]//button
    Sleep    1s
    Click Button    xpath=//div[@id='products-grid']/div[3]//button
    Sleep    1s
    Click Button    xpath=//div[@id='products-grid']/div[4]//button
    Sleep    1s

    Click Element   css:.cart-icon
    Sleep    1s

    Wait Until Element Is Visible    id:checkout-page
    Wait Until Element Is Visible    xpath=//div[@id='cart-items']/div[1]//button[contains(text(),'Remove')]
    Sleep    1s
    Click Button    xpath=//div[@id='cart-items']/div[1]//button[contains(text(),'Remove')]
    Sleep    1s

    Input Text      id:first-name    Aleksandra
    Input Text      id:last-name     Balashova
    Input Text      id:postal-code   12345
    Sleep    1s

    Scroll Element Into View    xpath=//button[contains(text(),'Complete Purchase')]
    Sleep    1s
    Click Button    xpath=//button[contains(text(),'Complete Purchase')]
    Sleep    1s

    Wait Until Element Is Visible    id:confirmation-page
    Sleep    3s

    Close Browser
