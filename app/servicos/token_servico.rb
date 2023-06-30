class TokenServico
  def self.segredo
    "desafio-mais-que-21-avancado-rails"
  end

  def self.cripto
    @cripto ||= DesafioDeRailsAvancado::Criptografia.new(TokenServico.segredo)
    @cripto
  end

  def self.encode(administrador, expiracao = nil)
    expiracao = Time.zone.now + 1.hours if expiracao.blank?
    payload = { id: administrador.id, nome: administrador.nome, email: administrador.email, tempo: expiracao }.to_json
    TokenServico.cripto.criptografar(payload)
  rescue
    nil
  end

  def self.decode(token)
    json = TokenServico.cripto.descriptografar(token)
    adm_hash = JSON.parse(json)
    tempo = Time.parse(adm_hash["tempo"])
    return nil if tempo < Time.zone.now
    Administrador.find(adm_hash["id"])
  rescue
    nil
  end

end