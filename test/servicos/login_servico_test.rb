require "test_helper"

class LoginServicoTest < ActiveSupport::TestCase
  test "Precisa validar o administrador cadastrado no banco de dados pelo seed" do
    # Arrange & Act
    adm, token = LoginServico.login("danilo@teste.com", "FDesas24R2a!ils%")

    # Assert
    assert_not_nil adm, "O objeto administrador não deve ser nulo"
    assert_equal "danilo@teste.com", adm.email, "O email do administrador deve ser 'danilo@teste.com'"

    assert_not_nil token, "O token JWT não deve ser nulo"

    assert_not_nil adm.id, "O administrador precisa ter o ID"
  end


  test "Comparando token" do
    # Arrange
    adm, token = LoginServico.login("danilo@teste.com", "FDesas24R2a!ils%")

    # Act
    adm_novo = TokenServico.decode(token)

    # Assert
    assert_equal adm_novo.id, adm.id, "O administrador depois do decode de token precisa ser igual"
  end
end
