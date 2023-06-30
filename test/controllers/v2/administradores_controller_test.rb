require 'test_helper'

class V2::AdministradoresControllerTest < ActionDispatch::IntegrationTest
  test "deve retornar o administrador e o token ao efetuar o login" do
    post "/v2/administradores/login", params: { email: "danilo@teste.com", senha: "FDesas24R2a!ils%" }

    assert_response :success
    
    response_body = JSON.parse(response.body)
    assert_not_nil response_body["adm"], "O objeto administrador não deve ser nulo"
    assert_not_nil response_body["token"], "O token JWT não deve ser nulo"
    assert_equal "danilo@teste.com", response_body["adm"]["email"], "O email do administrador deve ser 'danilo@teste.com'"
  end

  test "deve retornar erro 401 quando não passar parametros" do
    post "/v2/administradores/login", params: { }
    assert_response :unauthorized
    response_body = JSON.parse(response.body)
    assert_equal "Email não localizado", response_body["erro"], "A mensagem de erro deve ser 'Email não localizado'"
  end

  test "deve retornar erro 401 para login inválido" do
    post "/v2/administradores/login", params: { email: "usuario@invalido.com", senha: "senha_invalida" }
    assert_response :unauthorized
    response_body = JSON.parse(response.body)
    assert_equal "Email não localizado", response_body["erro"], "A mensagem de erro deve ser 'Email não localizado'"
  end

  test "deve retornar erro 401 para não passagem de senha" do
    post "/v2/administradores/login", params: { email: "danilo@teste.com" }
    assert_response 401
    response_body = JSON.parse(response.body)
    assert_equal "Senha não confere", response_body["erro"], "A mensagem de erro deve ser 'Senha não confere'"
  end

  test "deve retornar erro 401 para senha inválida" do
    post "/v2/administradores/login", params: { email: "danilo@teste.com", senha: "12345" }
    assert_response 401
    response_body = JSON.parse(response.body)
    assert_equal "Senha não confere", response_body["erro"], "A mensagem de erro deve ser 'Senha não confere'"
  end
end
