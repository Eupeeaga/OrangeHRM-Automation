*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${URL}    https://opensource-demo.orangehrmlive.com/web/index.php/auth/login
${BROWSER}    chrome
${ADMIN_USER}    Admin
${ADMIN_PASS}    admin123

*** Keywords ***
Abrir o navegador e acessar o sistema
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Set Selenium Speed    0.5s

Fazer login como Admin
    Wait Until Element Is Visible    xpath=//input[@placeholder='Username']    10s
    Input Text    xpath=//input[@placeholder='Username']    ${ADMIN_USER}
    Input Text    xpath=//input[@placeholder='Password']    ${ADMIN_PASS}
    Click Button    xpath=//button[@type='submit']
    Wait Until Page Contains Element    xpath=//span[text()='Admin']

Ir para aba Admin
    Click Element    xpath=//span[text()='Admin']
    Wait Until Page Contains Element    xpath=//h6[text()='Admin']


# -----------------------------
# CRIAR USUÁRIO
# -----------------------------
Adicionar usuário
    Click Button    xpath=//button[contains(.,' Add ')]
    Wait Until Page Contains Element    xpath=//h6[text()='Add User']
    # Selecionar campo User Role
    Click Element    xpath=//label[text()='User Role']/../following-sibling::div//i
    Click Element    xpath=//span[text()='ESS']
    # Preencher campo Employee Name
    Input Text    xpath=//input[@placeholder='Type for hints...']    Não Alterar   #Caso o teste quebre esse nome tem que está igual o do admin e tem alguém alterando direto.
    Wait Until Keyword Succeeds    10s    1s    Press Keys    xpath=//input[@placeholder='Type for hints...']    ARROW_DOWN
    Press Keys      xpath=//input[@placeholder='Type for hints...']    ENTER
    # Selecionar campo Status
    Click Element    xpath=//label[text()='Status']/../following-sibling::div//i
    Click Element    xpath=//span[text()='Enabled']
    # Preencher campo Username
    Input Text    xpath=//label[text()='Username']/../following-sibling::div/input    phteste123
    # Preencher campos Password e Confirm Password
    Input Text    xpath=//label[text()='Password']/../following-sibling::div/input    Test@1234
    Input Text    xpath=//label[text()='Confirm Password']/../following-sibling::div/input    Test@1234
    # Salvar novo usuário
    Click Button    xpath=//button[.=' Save ']
    Wait Until Page Contains    Successfully Saved
    Sleep   5s

# -----------------------------
# EDITAR USUÁRIO (com setup)
# -----------------------------
Prepar para edição de usuário
    [Documentation]    Garante que o usuário a ser editado já existe.
    Ir para aba Admin
    ${existe} =    Run Keyword And Return Status    Element Should Be Present    xpath=//div[text()='phteste123']
    Run Keyword If    not ${existe}    Adicionar usuário


Editar usuário
    Input Text    xpath=//label[text()='Username']/../following-sibling::div/input    phteste123
    Click Button    xpath=//button[.=' Search ']
    Wait Until Page Contains Element    xpath=//div[text()='phteste123']
    Click Element    xpath=//div[text()='phteste123']/ancestor::div[@role='row']//button[2]
    Wait Until Page Contains Element    xpath=//h6[text()='Edit User']
    Click Element    xpath=//label[text()='User Role']/../following-sibling::div//i
    Click Element    xpath=//div[@role='listbox']//span[text()='Admin']
    Click Button    xpath=//button[.=' Save ']
    Wait Until Page Contains    Successfully Updated
    Sleep   5s

# -----------------------------
# EXCLUIR USUÁRIO (com setup)
# -----------------------------
Preparar para exclusão de usuário
    [Documentation]    Garante que o usuário a ser excluído já existe.
    Ir para aba Admin
    ${existe} =    Run Keyword And Return Status    Element Should Be Present    xpath=//div[text()='phteste123_edit']
    Run Keyword If    not ${existe}    Editar usuário


Remover usuário
    Input Text    xpath=//label[text()='Username']/../following-sibling::div/input    phteste123
    Click Button    xpath=//button[.=' Search ']
    Wait Until Page Contains Element    xpath=//div[text()='phteste123']
    Click Element    xpath=//div[text()='phteste123']/ancestor::div[@role='row']//button[1]
    Click Button    xpath=//button[.=' Yes, Delete ']
    Wait Until Page Contains    Successfully Deleted

# ------------------------------
# FECHAR NAVEGADOR  
# ------------------------------
Fechar navegador
    Close Browser
    [Teardown]    Close All Browsers