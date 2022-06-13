**Settings***

Documentation       Ações da funcionalidade de busca de restaurantes

*Variables*
${DIV_BOX_RESTAURANT}       css=div[class="place-info-box"][style="opacity: 1;"]
${INFO_BOX}                 css=.place-info-box


***Keywords***
Go To Restaurant
    Click           text=Estou com fome!

    ### checkpoint garantindo que estou na página correta###
    Get Text        h1 strong   contains    Ta na hora de matar a fome!

Choose Restaurant
    [Arguments]     ${super_var}

    Click       text=${super_var["restaurant"]}    force=true 

    Wait For Elements State     css=#detail     visible     ${DEFAULT_TIMEOUT} 
    Get Text                    css=#detail     contains    ${super_var["desc"]} 

Search By    
    [Arguments]     ${value}
    Click           css=.search-link
    Fill Text       css=input[formcontrolname="searchControl"]      ${value}


Restaurant Should Be Visible
    [Arguments]     ${name}
    ## validação
    Wait For Elements State        ${DIV_BOX_RESTAURANT}     visible         ${DEFAULT_TIMEOUT} 
    Get Text                       ${INFO_BOX}       contains        ${name}  
Restaurant Count Should Be
    [Arguments]     ${qtd}
    #Wait For Elements State         ${DIV_BOX_RESTAURANT}     visible     5
    Get Element Count               ${INFO_BOX}               equal       ${qtd}
    
    
