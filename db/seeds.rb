# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password')
User.create!(name: "Алина", email: 'client0@mail.ru', password: 'Password1', password_confirmation: 'Password1')
User.create!(name: "Никита", email: 'client2@mail.ru', password: 'Password1', password_confirmation: 'Password1')
User.create!(name: "Фатя", email: 'client3mail.ru', password: 'Password1', password_confirmation: 'Password1')
User.create!(name: "Катя", email: 'master1@mail.ru', password: 'Password1', password_confirmation: 'Password1', role: "master")
User.create!(name: "Андрей", email: 'master2@mail.ru', password: 'Password1', password_confirmation: 'Password1', role: "master")
User.create!(name: "Светлана", email: 'master3@mail.ru', password: 'Password1', password_confirmation: 'Password1', role: "master")
User.create!(name: "Арина", email: 'master4@mail.ru', password: 'Password1', password_confirmation: 'Password1', role: "master")
Category.create!(name: "для нее")
Category.create!(name: "для него")
Category.create!(name: "для снятия стресса")
Category.create!(name: "для релакса")
Category.create!(name: "для релакса")

