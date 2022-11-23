# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

puts "cleaning db ..."

Celebrity.destroy_all


celebrity = Celebrity.create!(
    first_name: 'George',
    last_name: 'Clooney',
    age: 61,
    category: 'actor',
    bio: 'silver fox living in Lake Como',
    url: 'https://upload.wikimedia.org/wikipedia/commons/8/8d/George_Clooney_2016.jpg'
)


celebrity = Celebrity.create!(
  first_name: 'Tom',
  last_name: 'Cruise',
  age: 60,
  category: 'actor',
  bio: 'i love scientology',
  url: 'https://i.pinimg.com/474x/c9/7c/54/c97c54d09e728cc4e68ae6f630d43984.jpg'
)

celebrity = Celebrity.create!(
  first_name: 'Adele',
  last_name: 'Adkins',
  age: 34,
  category: 'singer',
  bio: "never mind I'll find someone like you",
  url: 'https://i.pinimg.com/564x/94/38/ea/9438ea4f3fe17769cfb091ee27db06c7.jpg'
)

celebrity = Celebrity.create!(
  first_name: 'Lewis',
  last_name: 'Hamilton',
  age: 37,
  category: 'sports',
  bio: "I hate Max Verstappen",
  url: 'https://i.pinimg.com/564x/de/df/eb/dedfeb167aaada691f67aa894911bc47.jpg'
)

celebrity = Celebrity.create!(
  first_name: 'King Charles',
  last_name: 'Camilla',
  age: 145,
  category: 'royalty',
  bio: "God Save the King!",
  url: 'https://i.pinimg.com/474x/01/4f/a7/014fa78ae4699bf4d436d131a066b88a.jpg'
)

celebrity = Celebrity.create!(
  first_name: 'Salt',
  last_name: 'Bae',
  age: 39,
  category: 'C-Lister',
  bio: "Salt-Bae",
  url: 'https://i.pinimg.com/474x/3d/03/fd/3d03fdfdaa49adb7f3ec3b3eb31a4af2.jpg'
)

celebrity = Celebrity.create!(
  first_name: 'Jamie',
  last_name: 'Oliver',
  age: 47,
  category: 'chef',
  bio: "don't eat chicken nuggets - they're delicious!",
  url: 'https://i.pinimg.com/474x/64/0e/0b/640e0b592e7271e9eb33316b53499f25.jpg'
)

puts "done!"
