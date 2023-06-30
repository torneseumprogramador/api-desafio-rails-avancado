require "test_helper"

class TokenServicoTest < ActiveSupport::TestCase
  test "Verificar token sem tempo de expiração" do
    # Arrange
    token = TokenServico.encode(Administrador.first)

    # Act
    adm = TokenServico.decode(token)

    # Assert
    assert_not_nil token, "O token JWT não deve ser nulo"
    assert_not_nil adm, "Adm não pode ser nil"
  end

  test "Verificar token com tempo de expiração" do
    # Arrange
    token = TokenServico.encode(Administrador.first, (Time.zone.now + 10.minutes))

    # Act
    adm = TokenServico.decode(token)

    # Assert
    assert_not_nil token, "O token JWT não deve ser nulo"
    assert_not_nil adm, "Adm não pode ser nil"
  end

  test "Verificar token com tempo de expirado" do
    # Arrange
    token = TokenServico.encode(Administrador.first, (Time.zone.now - 10.minutes))
    
    # Act
    adm = TokenServico.decode(token)

    # Assert
    assert_not_nil token, "Token não pode ser nil"
    assert_nil adm, "Tem que ser nil"
  end
end
