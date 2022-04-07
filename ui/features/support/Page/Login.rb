class Login
  include Capybara::DSL
  # attr_accessor :email, :nome, :sobrenome, :senha, :endereco, :cidade, :estado, :cep, :pais, :fone

  def initialize
    @email = FFaker::Internet.email
    @nome = FFaker::Name.first_name
    @sobrenome = FFaker::Name.last_name
    @senha = "12345"
    @endereco = FFaker::AddressUS.street_address
    @cidade = FFaker::AddressUS.city
    @estado = FFaker::AddressUS.state
    # @cep = FFaker::AddressUS.zip_code
    @cep = "90274"
    @pais = FFaker::AddressUS.country
    @fone = FFaker::PhoneNumber.short_phone_number
  end

  def cadastro
    find("#email_create").set @email
    find("#SubmitCreate").click
    find("#id_gender1").click
    find("#customer_firstname").set @nome
    find("#customer_lastname").set @sobrenome
    find("#passwd").set @senha
    find("#address1").set @endereco
    find("#city").set @cidade
    find("#uniform-id_state").click
    find("#id_state > option[value='1']").select_option
    find("#postcode").set @cep
    find("#phone_mobile").set @fone
  end

  def captura_cred
    @@email = page.execute_script("return document.getElementById('email').value")
    @@passwd = page.execute_script("return document.getElementById('passwd').value")
  end

  def login_cadastrado
    find("#email").set @@email
    find("#passwd").set @@passwd
    find("#SubmitLogin").click
  end

  def login_erro(email, senha)
    find("#email").set email
    find("#passwd").set senha
    find("#SubmitLogin").click
  end
end
