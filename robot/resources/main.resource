*** Settings ***
Library           SeleniumLibrary

*** Variables ***
${URL}            http://localhost:5173/
${BROWSER}        chrome
${LONG_DESCRIPTION}    Este é um texto muito longo que será usado para testar a exibição de descrições no card do produto. Ele deve ser suficientemente grande para ultrapassar os limites visuais do card.
${PRODUCT_NAME}        Produto Teste
${PRODUCT_PRICE}       10.50
${PRODUCT_DESCRIPTION}    Produto de teste
${PRODUCT_NAME_SEPARATED}    Produto Teste Separado
${PRODUCT_DESCRIPTION_SEPARATED}    Este é um texto muito longo com palavras separadas que deve se ajustar corretamente ao card sem ultrapassá-lo.

*** Keywords ***
Abrir o Website
    Open Browser    ${URL}    ${BROWSER}
