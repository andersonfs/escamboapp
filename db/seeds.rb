# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts '===>Cadastrando as categorias<==='
categories = ['Animais e acessórios',
              'Esportes',
              'Para a sua casa',
              'Eletrônicos e celulares',
              'Música e hobbies',
              'Bebês e crianças',
              'Moda e beleza',
              'Veículos e barcos',
              'Imóveis',
              'Empregos e negócios']
categories.each do |description|
  Category.find_or_create_by(description: description)
end
puts '===>Categorias cadastradas com sucesso<==='

puts "Cadastrando o Administrador Padrão..."
Admin.create!(name: "Administrador Padrão", email: "admin@admin.com",
              password: "123456",
              password_confirmation: "123456",
              role: 0)
puts "Administrador cadastrado com sucesso!"

puts "Cadastrando o Membro Padrão..."
member = Member.new(email: "andersonfs@gmail.com",
               password: "123456",
               password_confirmation: "123456")
member.build_profile_member
member.profile_member.first_name = "Anderson Firmino"
member.profile_member.second_name = "da Silva"
member.save!

puts "Membro cadastrado com sucesso!"