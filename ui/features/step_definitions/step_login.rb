Dado("que acesso o menu Sign in na pagina inicial") do
  visit "/"
  find(".login").click
end

Quando("efetuo cadastro inserindo email com meus dados pessoais") do
  Login.new.cadastro
  Login.new.captura_cred
  find("#submitAccount").click
end

Quando("com cadastro realizado insiro meu email com senha") do
  Login.new.login_cadastrado
end

Então("valido que fui direcionado para minha conta") do
  assert_selector(".info-account", visible: true, text: "Welcome to your account. Here you can manage all of your personal information and orders.", exact_text: true) == true
end

Quando("seleciono Sign in inserindo {string} com {string}") do |email, senha|
  Login.new.login_erro(email, senha)
end

Então("valido que fui direcionado para {string}") do |destino|
  assert_selector(".alert.alert-danger", visible: true, text: destino)
end
