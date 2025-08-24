
# OrangeHRM Automation Project (Robot Framework)

## Descrição
Este projeto contém automações de testes para o sistema [OrangeHRM Demo](https://opensource-demo.orangehrmlive.com/) utilizando **Robot Framework** e **SeleniumLibrary**. Os fluxos automatizados incluem adicionar, editar e remover um usuário na aba Admin.

## Estrutura do Projeto

```
OrangeHRM-Automation/
├── resources/
│   └── user_globalVariable.robot   # Ações reutilizáveis (login, CRUD de usuário, etc.)
├── tests/
│   └── test_user_flow.robot        # Casos de teste organizados
├── README.md                      # Documentação do projeto
├── requirements.txt               # Dependências do projeto
```

- `tests/test_user_flow.robot`: Script principal de automação com os fluxos de criar, editar e remover usuário.
- `resources/user_globalVariable.robot`: Variáveis globais e todos os keywords utilizados nos testes.
- `requirements.txt`: Dependências do projeto.

## Pré-requisitos
- Python 3.x instalado
- Google Chrome instalado
- ChromeDriver compatível com a versão do Chrome (ou use o WebDriver Manager)

## Instalação
1. Crie um ambiente virtual (opcional, mas recomendado):
   ```powershell
   python -m venv venv
   .\venv\Scripts\Activate
   ```
2. Instale as dependências:
   ```powershell
   pip install -r requirements.txt
   ```
   Caso não exista o arquivo `requirements.txt`, instale manualmente:
   ```powershell
   pip install robotframework robotframework-seleniumlibrary webdriver-manager
   ```

## Execução dos Testes

Execute o comando abaixo na raiz do projeto para rodar todos os testes:
```powershell
robot tests
```

## Observações
- Os testes abrem o navegador Chrome, fazem login como Admin, adicionam, editam e removem um usuário na aba Admin.
- O script pode ser customizado para outros navegadores alterando a variável `${BROWSER}` em `resources/user_globalVariable.robot`.
- Resultados dos testes são gerados em arquivos HTML (`log.html`, `report.html`).

## Dicas
- Caso o ChromeDriver não seja encontrado, baixe a versão correta em https://chromedriver.chromium.org/downloads e adicione ao PATH.
- Para rodar em outros navegadores, instale o driver correspondente e altere a variável `${BROWSER}` em `resources/user_globalVariable.robot`.




