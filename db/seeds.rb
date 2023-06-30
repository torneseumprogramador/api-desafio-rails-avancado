# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

20.times do
  Cliente.create!(
    nome: Faker::Name.name_with_middle,
    telefone: Faker::PhoneNumber.cell_phone,
    observacao: Faker::Lorem.paragraph
  )
end


Administrador.create!(nome: "Danilo", email: "danilo@teste.com", senha: "FDesas24R2a!ils%")
