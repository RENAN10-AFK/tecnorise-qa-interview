*** Settings ***

Library           SeleniumLibrary
Resource          ../resources/main.resource

*** Test Cases ***
Abrir Página Inicial
    Abrir o Website

Adicionar Produto
    [Documentation]    Testa a funcionalidade de adicionar um produto
    Click Button    xpath://button[contains(text(),'Adicionar Produto')]
    Input Text    xpath://input[@placeholder='Digite o nome do produto']    Produto Teste
    Input Text    xpath://input[@placeholder='0.00']    10.50
    Input Text    xpath://textarea[@placeholder='Descreva o produto']    Produto de teste
    Click Button    xpath://button[contains(text(),'Salvar')]
    Page Should Contain    Produto Teste

Editar Produto
    [Documentation]    Testa a funcionalidade de editar um produto
    Click Button    xpath://button[contains(text(),'Editar')]
    Input Text    xpath://input[@placeholder='Digite o nome do produto']    Produto Editado
    Click Button    xpath://button[contains(text(),'Salvar')]
    Page Should Contain    Produto Editado

Excluir Produto
    [Documentation]    Testa a funcionalidade de excluir um produto
    Click Button    xpath://button[contains(text(),'Excluir')]
    Page Should Not Contain    Produto Teste

Testar Campo de Preço com Número Negativo
    [Documentation]    Verifica se o campo de preço aceita número negativo e impede o salvamento
    Click Button    xpath://button[contains(text(),'Adicionar Produto')]
    Input Text    xpath://input[@placeholder='Digite o nome do produto']    Produto Teste
    Input Text    xpath://input[@placeholder='0.00']    -10.50
    Input Text    xpath://textarea[@placeholder='Descreva o produto']    Produto de teste
    Click Button    xpath://button[contains(text(),'Salvar')]
    Page Should Contain    Preço deve ser positivo
    Input Text    xpath://input[@placeholder='0.00']    10.50
    Click Button    xpath://button[contains(text(),'Salvar')]
    Page Should Contain    Produto Teste

Testar Campo de Preço com Valor Muito Alto
    [Documentation]    Verifica se o campo de preço aceita valores muito altos
    Click Button    xpath://button[contains(text(),'Adicionar Produto')]
    Input Text    xpath://input[@placeholder='Digite o nome do produto']    Produto Teste
    Input Text    xpath://input[@placeholder='0.00']    9999999999.99
    Input Text    xpath://textarea[@placeholder='Descreva o produto']    Produto de teste
    Click Button    xpath://button[contains(text(),'Salvar')]
    Page Should Contain    Produto Teste

Testar Descrição Muito Longa
    [Documentation]    Verifica se uma descrição muito longa é exibida corretamente no card do produto
    Click Button    xpath://button[contains(text(),'Adicionar Produto')]
    Input Text    xpath://input[@placeholder='Digite o nome do produto']    Produto Teste
    Input Text    xpath://input[@placeholder='0.00']    10.50
    Input Text    xpath://textarea[@placeholder='Descreva o produto']    ${LONG_DESCRIPTION}
    Click Button    xpath://button[contains(text(),'Salvar')]
    Page Should Contain    Produto Teste

Testar Exclusão sem Confirmação
    [Documentation]    Verifica se ações destrutivas possuem confirmação antes de serem executadas
    Click Button    xpath://button[contains(text(),'Adicionar Produto')]
    Input Text    xpath://input[@placeholder='Digite o nome do produto']    Deletar Produto
    Input Text    xpath://input[@placeholder='0.00']    10.50
    Input Text    xpath://textarea[@placeholder='Descreva o produto']    Produto de teste
    Click Button    xpath://button[contains(text(),'Salvar')]
    Click Button    xpath://li[div/strong[text()='Deletar Produto']]//button[contains(text(),'Excluir')]
    Page Should Not Contain    Deletar Produto



