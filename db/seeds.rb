# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# CELEBRITIES

puts "cleaning db ..."

Celebrity.destroy_all


celebrity = Celebrity.create!(
    first_name: 'George',
    last_name: 'Clooney',
    age: 61,
    category: 'actor',
    bio: 'George Timothy Clooney (born May 6, 1961) is an American actor and filmmaker. He is the recipient of numerous accolades, including a British Academy Film Award, four Golden Globe Awards, four Screen Actors Guild Awards, and two Academy Awards, one for his acting and the other as a producer. In 2018, he was the recipient of the AFI Life Achievement Award.',
    url: 'https://slack-imgs.com/?c=1&o1=ro&url=https%3A%2F%2Fi.pinimg.com%2F736x%2F33%2Fa2%2F37%2F33a2378a93f763adcd17eb4a9460bb17--beard-ideas-modern-man.jpg'
)


celebrity = Celebrity.create!(
  first_name: 'Tom',
  last_name: 'Cruise',
  age: 60,
  category: 'actor',
  bio: "Thomas Cruise Mapother IV (born July 3, 1962), known professionally as Tom Cruise, is an American actor and producer. One of the world's highest-paid actors, he has received various accolades, including an Honorary Palme d'Or and three Golden Globe Awards, in addition to nominations for three Academy Awards. His films have grossed over $4 billion in North America and over $11.1 billion worldwide, making him one of the highest-grossing box-office stars of all time.",
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
  bio: "Sir Lewis Carl Davidson Hamilton MBE HonFREng (born 7 January 1985) is a British racing driver currently competing in Formula One for Mercedes. In Formula One, Hamilton has won a joint-record seven World Drivers' Championship titles (tied with Michael Schumacher), and holds the records for the most wins (103), pole positions (103), and podium finishes (191), among others.",
  url: 'https://i.pinimg.com/564x/de/df/eb/dedfeb167aaada691f67aa894911bc47.jpg'
)

celebrity = Celebrity.create!(
  first_name: 'King Charles III',
  last_name: 'and Camilla',
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

celebrity = Celebrity.create!(
  first_name: 'Bob',
  last_name: 'Marley',
  age: 76,
  category: 'singer',
  bio: "We're Jammin'",
  url: 'https://i.guim.co.uk/img/static/sys-images/Guardian/Pix/pictures/2015/2/5/1423140827327/Bob-Marley-in-1979-before-009.jpg?width=620&quality=45&dpr=2&s=none'
)

celebrity = Celebrity.create!(
  first_name: 'Bonnie',
  last_name: 'Tyler',
  age: 71,
  category: 'singer',
  bio: 'Are you holding out for a hero?',
  url: 'https://upload.wikimedia.org/wikipedia/commons/f/f1/Bonnie_Tyler_ESC_-_United_Kingdom_01_crop.JPG'
)

# USERS

date1 = DateTime.new(2022,12,24,12,30)
date2 = DateTime.new(2022,12,28,12,30)
date3 = DateTime.new(2023,1,3,12,30)
date4 = DateTime.new(2023,1,5,12,30)

user = User.create!( first_name: 'User1', last_name: 'User1', email: 'user1@gmail.com', password: '1234567890')
user = User.create!( first_name: 'User2', last_name: 'User2', email: 'user2@gmail.com', password: '1234567890')

booking = Booking.create!(start_date: date1, end_date: date2, location: 'London' , celebrity_id:Celebrity.first.id, user_id: User.first.id)
booking = Booking.create!(start_date: date3, end_date: date4, location: 'London' , celebrity_id:Celebrity.last.id, user_id: User.last.id)

puts "done!"
