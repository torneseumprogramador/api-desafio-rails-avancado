class CriptoSenhaServico
  def self.salt
    # salt = BCrypt::Engine.generate_salt
    salt = "$2a$12$UsjG0b1tWuBox5UnKE641u"
    salt
  end

  def self.encrypt(password)
    hashed_password = BCrypt::Engine.hash_secret(password, CriptoSenhaServico.salt)
  
    hashed_password
  end
end