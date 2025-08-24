*** Settings ***
Resource    ../resources/user_globalVariable.robot

*** Test Cases ***
Adicionar Usuário
    Abrir o navegador e acessar o sistema
    Fazer login como Admin
    Ir para aba Admin
    Adicionar usuário
    Fechar navegador

Editar Usuário
    Abrir o navegador e acessar o sistema
    Fazer login como Admin
    Ir para aba Admin
    Editar usuário
    Fechar navegador

Remover Usuário
    Abrir o navegador e acessar o sistema
    Fazer login como Admin
    Ir para aba Admin
    Remover usuário
    Fechar navegador
