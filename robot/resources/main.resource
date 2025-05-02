*** Settings ***
Library           SeleniumLibrary

*** Variables ***
${URL}            http://localhost:5173/
${BROWSER}        chrome
${LONG_DESCRIPTION}    Este é um texto muito longo que será usado para testar a exibição de descrições no card do produto. Ele deve ser suficientemente grande para ultrapassar os limites visuais do card.

*** Keywords ***
Abrir o Website
    Open Browser    ${URL}    ${BROWSER}
