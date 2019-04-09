# destroy existing records

Message.all.destroy_all
User.all.destroy_all
Channel.all.destroy_all


#create channel
puts 'seeding channels'

Channel.create(name: "general")
Channel.create(name: "london")
Channel.create(name: "react")

puts 'channels seeded'


#create users
puts 'seeding users'

user1 = User.create(email: "user1@gmail.com", password: 'secret')
user2 = User.create(email: "user2@gmail.com", password: 'secret')
user3 = User.create(email: "user3@gmail.com", password: 'secret')

puts 'users seeded'


#create messages
puts 'seeding messages'

10.times do

  Message.create(
    user: User.all.sample,
    channel: Channel.all.sample,
    content: 'Lorem ipsum, Lorem ipsum, Lorem ipsum'
    )

end

puts 'messages seeded'
