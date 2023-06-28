class AumentandoTelefone < ActiveRecord::Migration[7.0]
  def change
    change_column :clientes, :telefone, :string, limit: 50
  end
end
