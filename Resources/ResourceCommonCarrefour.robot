Documentation       Acesso ao Site Carrefour com login valido (Dojo Carrefour).

*** Settings ***
Library     SeleniumLibrary

*** Variables ***
${BROWSER}      Chrome
${DELAY}        10 seconds
${EMAIL}     anadson_silva@carrefour.com
${PASSWORD}     xxxxxxxx
${LOGIN URL}        https://preprod.carrefour.com.br/login
${AcessoLogin}      Entrar na minha conta
${TituloPagina}     Carrinho

*** Keywords ***
Open Browser To Login valid
    Open Browser    ${LOGIN URL}    ${BROWSER}
    Maximize Browser Window
    Set Selenium Timeout    ${DELAY}
    Element Should Contain     //*[contains(text(),"Entrar na minha conta")]        ${AcessoLogin}
    Input Text    //*[@id="j_username"]    ${EMAIL}
    Input Text    //*[@id="j_password"]    ${PASSWORD}
    Click Button    //*[@id="loginForm"]/div[4]/button
    Sleep       10s
    Page Should Contain Element     //h3[contains(text(),"Carrinho")]       ${TituloPagina}
    Sleep       6s

Fechar Navegador
    Close Browser
