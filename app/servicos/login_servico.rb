class LoginServico
  def self.login(email, senha)
    adm = Administrador.where(email: email).first
    raise LoginError.new("Email não localizado") if adm.blank?
    raise LoginError.new("Senha não confere") if adm.senha != CriptoSenhaServico.encrypt(senha)
    
    [adm, TokenServico.encode(adm)]
  end
end