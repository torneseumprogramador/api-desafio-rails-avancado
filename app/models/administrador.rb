class Administrador < ApplicationRecord
  validates :nome, :email, :senha, presence: true
  validates :email, uniqueness: true

  before_validation do
    if self.senha.present? && !self.senha.match?(/\A\$2a\$12\$.{53}\z/)
      # Verifica se a senha tem pelo menos 8 caracteres, uma letra minúscula, uma letra maiúscula,
      # um número e um caractere especial
      if self.senha.length < 8 || !self.senha.match?(/[a-z]/) ||
             !self.senha.match?(/[A-Z]/) || !self.senha.match?(/[0-9]/) ||
             !self.senha.match?(/\W/)
        self.errors.add(:senha, "deve ter pelo menos 8 caracteres, uma letra minúscula, uma letra maiúscula, um número e um caractere especial")
      end
    end
  end

  before_save do
    if self.senha.present? && !self.senha.match?(/\A\$2a\$12\$.{53}\z/)
      self.senha = CriptoSenhaServico.encrypt(self.senha)
    end
  end
end
