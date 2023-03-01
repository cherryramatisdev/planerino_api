# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

user = User.create(name: 'test', email: 'test@test', password: 'test', password_confirmation: 'test')

year = Year.create(name: '2023', user:)

12.times do
  Month.create(name: Faker::Date.between(from: '2022-01-01', to: '2023-01-01').strftime('%B'), year:)
end

payer = Payer.create(name: Faker::Name.name)

Debit.create(title: Faker::Name.name, price: Faker::Number.decimal(l_digits: 2, r_digits: 2), paid: false, payer:,
             month: Month.last)
