class CreateClientes < ActiveRecord::Migration[7.0]
  def change
    create_table :clientes do |t|
      t.string :nome, limit: 100
      t.string :telefone, limit: 15
      t.text :observacao

      t.timestamps
    end
  end
end
