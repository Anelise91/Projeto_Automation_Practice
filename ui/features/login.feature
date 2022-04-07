#language:pt
#encode: UTF-8

@acesso
Funcionalidade: Testar realização de cadastro no site Automation Practice e tentativas de login.

Contexto: Acessar o site e ir para a pagina de cadastro e login
    Dado que acesso o menu Sign in na pagina inicial 
    
@cadastro
Cenario: Fazer cadastro no site
    Quando efetuo cadastro inserindo email com meus dados pessoais
    Então valido que fui direcionado para minha conta

@login_sucesso
Cenario: Login com sucesso
    Quando com cadastro realizado insiro meu email com senha
    Então valido que fui direcionado para minha conta

@login_erro
Esquema do Cenario: Tentativas de login com falha
    Quando seleciono Sign in inserindo <email> com <senha>
    Então valido que fui direcionado para <destino>

    Exemplos:           
        |email               |senha       |destino                     | 
        |"meuemail&gmail.com"|""          |"Invalid email address."    |
        |""                  |""          |"An email address required."|
  