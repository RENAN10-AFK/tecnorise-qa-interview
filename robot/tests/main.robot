*** Settings ***

Library           SeleniumLibrary
Resource          ../resources/main.resource

*** Test Cases ***
Abrir Página Inicial
    Abrir o Website

Adicionar Produto
    [Documentation]    Testa a funcionalidade de adicionar um produto
    Click Button    xpath://button[contains(text(),'Adicionar Produto')]
    Input Text    xpath://input[@placeholder='Digite o nome do produto']    ${PRODUCT_NAME}
    Input Text    xpath://input[@placeholder='0.00']    ${PRODUCT_PRICE}
    Input Text    xpath://textarea[@placeholder='Descreva o produto']    ${PRODUCT_DESCRIPTION}
    Click Button    xpath://button[contains(text(),'Salvar')]
    Page Should Contain    ${PRODUCT_NAME}

Editar Produto
    [Documentation]    Testa a funcionalidade de editar um produto
    Click Button    xpath://button[contains(text(),'Editar')]
    Input Text    xpath://input[@placeholder='Digite o nome do produto']    ${PRODUCT_NAME}
    Click Button    xpath://button[contains(text(),'Salvar')]
    Page Should Contain    ${PRODUCT_NAME}

Excluir Produto
    [Documentation]    Testa a funcionalidade de excluir um produto
    Click Button    xpath://button[contains(text(),'Excluir')]
    Page Should Not Contain    ${PRODUCT_NAME}

Testar Campo de Preço com Número Negativo
    [Documentation]    Verifica se o campo de preço aceita número negativo e impede o salvamento
    Click Button    xpath://button[contains(text(),'Adicionar Produto')]
    Input Text    xpath://input[@placeholder='Digite o nome do produto']    ${PRODUCT_NAME}
    Input Text    xpath://input[@placeholder='0.00']    -10.50
    Input Text    xpath://textarea[@placeholder='Descreva o produto']    ${PRODUCT_DESCRIPTION}
    Click Button    xpath://button[contains(text(),'Salvar')]
    Page Should Contain    Preço deve ser positivo
    Input Text    xpath://input[@placeholder='0.00']    ${PRODUCT_PRICE}
    Click Button    xpath://button[contains(text(),'Salvar')]
    Page Should Contain    ${PRODUCT_NAME}

Testar Campo de Preço com Valor Muito Alto
    [Documentation]    Verifica se o sistema aceita valores altos no campo de preço e documenta o comportamento inadequado
    Click Button    xpath://button[contains(text(),'Adicionar Produto')]
    Input Text    xpath://input[@placeholder='Digite o nome do produto']    ${PRODUCT_NAME}
    Input Text    xpath://input[@placeholder='0.00']    9999999999.99
    Input Text    xpath://textarea[@placeholder='Descreva o produto']    ${PRODUCT_DESCRIPTION}
    Click Button    xpath://button[contains(text(),'Salvar')]
    Page Should Contain    ${PRODUCT_NAME}
    [Teardown]    Log    O sistema aceitou um valor muito alto no campo de preço, o que não é recomendado.

Testar Descrição Muito Longa
    [Documentation]    Verifica se uma descrição muito longa é exibida corretamente no card do produto e documenta o comportamento inadequado
    Click Button    xpath://button[contains(text(),'Adicionar Produto')]
    Input Text    xpath://input[@placeholder='Digite o nome do produto']    ${PRODUCT_NAME}
    Input Text    xpath://input[@placeholder='0.00']    ${PRODUCT_PRICE}
    Input Text    xpath://textarea[@placeholder='Descreva o produto']    ${LONG_DESCRIPTION}
    Click Button    xpath://button[contains(text(),'Salvar')]
    Page Should Contain    ${PRODUCT_NAME}
    ${description_div}=    Get WebElement    xpath://li[div/strong[text()='${PRODUCT_NAME}']]//div
    ${description_div_size}=    Get Element Size    ${description_div}
    ${card_element}=    Get WebElement    xpath://li[div/strong[text()='${PRODUCT_NAME}']]
    ${card_size}=    Get Element Size    ${card_element}
    Run Keyword If    ${description_div_size}[0] > ${card_size}[0]    Log    O texto da descrição ultrapassa o background do card, o que não é visualmente adequado.

Testar Descrição Muito Longa com Palavras Separadas
    [Documentation]    Verifica se uma descrição muito longa com palavras separadas é exibida corretamente no card do produto
    Click Button    xpath://button[contains(text(),'Adicionar Produto')]
    Input Text    xpath://input[@placeholder='Digite o nome do produto']    ${PRODUCT_NAME_SEPARATED}
    Input Text    xpath://input[@placeholder='0.00']    ${PRODUCT_PRICE}
    Input Text    xpath://textarea[@placeholder='Descreva o produto']    ${PRODUCT_DESCRIPTION_SEPARATED}
    Click Button    xpath://button[contains(text(),'Salvar')]
    Page Should Contain    ${PRODUCT_NAME_SEPARATED}
    ${description_div}=    Get WebElement    xpath://li[div/strong[text()='${PRODUCT_NAME_SEPARATED}']]//div
    ${description_div_size}=    Get Element Size    ${description_div}
    ${card_element}=    Get WebElement    xpath://li[div/strong[text()='${PRODUCT_NAME_SEPARATED}']]
    ${card_size}=    Get Element Size    ${card_element}
    Run Keyword If    ${description_div_size}[0] <= ${card_size}[0]    Log    O texto da descrição está corretamente ajustado ao card.

Testar Exclusão sem Confirmação
    [Documentation]    Verifica se ações destrutivas, como exclusão, são realizadas sem confirmação e documenta o comportamento inadequado
    Click Button    xpath://button[contains(text(),'Adicionar Produto')]
    Input Text    xpath://input[@placeholder='Digite o nome do produto']    Alterar Produto
    Input Text    xpath://input[@placeholder='0.00']    ${PRODUCT_PRICE}
    Input Text    xpath://textarea[@placeholder='Descreva o produto']    ${PRODUCT_DESCRIPTION}
    Click Button    xpath://button[contains(text(),'Salvar')]
    Click Button    xpath://li[div/strong[text()='Alterar Produto']]//button[contains(text(),'Excluir')]
    Page Should Not Contain    Alterar Produto
    [Teardown]    Log    O sistema permitiu a exclusão sem confirmação, o que não é recomendado.



