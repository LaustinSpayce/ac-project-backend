# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

months = %w[
  January
  February
  March
  April
  May
  June
  July
  August
  September
  October
  November
  December
]

months.each do |month|
  Month.create(name: month)
end

Bug.create(
  name: 'agrias butterfly',
  image: 'https://i.imgur.com/zpCLFPW.png',
  sell: 3000,
  where: 'Flying near flowers',
  weather: 'Any except rain',
  rarity: 'Uncommon',
  start_time: '8:00AM',
  end_time: '5:00 PM',
  internal_id: 620
)
