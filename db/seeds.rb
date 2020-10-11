# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create(
    email: 'jan.padrta.82@gmail.com',
    password: 'Abcd1234',
    password_confirmation: 'Abcd1234',
    name: 'Jan Padrta',
    phone: '',
    admin: true,
    manager: false,
    driver: false
)