**Settings***

Documentation       Arquivo base do projeto (tudo começa aqui) 

Library     Browser
Library     OperatingSystem

Resource    actions/search.robot
Resource    actions/cart.robot
Resource    actions/order.robot

***Variables***
${DEFAULT_TIMEOUT}      10

*Keywords*
Start Session

    New Browser     browser=chromium    headless=false
    New Page        https://parodifood.herokuapp.com/ 
    ### checkpoint ###
    Get Text        xpath=//span[contains(.,'Nunca foi tão engraçado pedir comida')]    contains        Nunca foi tão engraçado pedir comida   

### Helpers ###
Get jSON
    [Arguments]     ${file_name}

    ${file}            Get File        ${EXECDIR}/resources/fixtures/${file_name} 
    ${super_var}       Evaluate        json.loads($file)       json

    [return]    ${super_var}