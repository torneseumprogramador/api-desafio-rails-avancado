class CreateAdministradors < ActiveRecord::Migration[7.0]
  def change
    create_table :administradors do |t|
      t.string :nome, limit: 150
      t.string :email, limit: 200
      t.string :senha, limit: 255

      t.timestamps
    end
  end
end
