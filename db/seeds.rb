#create some categories

Category.create(genre: "Mexican")
Category.create(genre: "French")
Category.create(genre: "Thai")
Category.create(genre: "Chinese")
Category.create(genre: "Sushi")

#create some users

User.create(
  name:           "Jamie Woodbury",
  password:       "password",
  email:          "Jamie.Woodbury@gmail.com",
  bio:            "Word.",
  img_url:        "/images/users/Jamie-Woodbury.JPG",
  city:           "Vancouver",
  state_province: "British Columbia",
  country:        "Canada"
)

User.create(
  name:           "Andre Soesilo",
  password:       "qwerty",
  email:          "asoesilo84@gmail.com",
  bio:            "Sup?",
  img_url:        "/images/users/Andre-Soesilo.JPG",
  city:           "Burnaby",
  state_province: "BC",
  country:        "CAN" 
)

User.create(
  name:           "Barrett Stutzman",
  password:       "qwerty",
  email:          "barrett.stutzman@gmail.com",
  bio:            "Sup?",
  img_url:        "/images/users/Barrett-Stutzman.JPG",
  city:           "Dallas",
  state_province: "Texas",
  country:        "USA" 
)

5.times do |i|
  User.create(
    name:           Faker::Name.name,
    password:       "qwerty",
    email:          "test#{i}@gmail.com",
    bio:            Faker::Lorem.sentence,
    img_url:        "/images/users/#{i}.JPG",
    city:           Faker::Address.city,
    state_province: Faker::Address.state,
    country:        "USA"
  )
end

#Create some events

#past events

hoods=["Kits", "The Drive", "Gastown", "North Van", "Downtown", "Yaletown", "Main", "West Van", "Eastside"]

5.times do |i|
  Event.create(
    title:        Faker::Lorem.sentence,
    location:     hoods[i%hoods.length],
    guest_number: rand(10),
    attire:       ["formal", "casual"][i%2],
    event_date:   Date.new(2013,i%12+1,i%30+1),
    start_time:   Time.at(628232400+i*10000),
    end_time:     Time.at(628232400+i*10000),
    food_bio:     Faker::Lorem.sentence,
    category_id:  Category.all[i%Category.count].id,
    user_id:      User.all[i%User.count].id,
    img_url:      "/images/events/#{i+1}.jpg"
    )
end

#future events

(5..10).each do |i|
  Event.create(
    title:        Faker::Lorem.sentence,
    location:     hoods[i%hoods.length],
    guest_number: rand(10),
    attire:       ["formal", "casual"][i%2],
    event_date:   Date.new(2014,i%12+1,i%30+1),
    start_time:   Time.at(628232400+i*10000),
    end_time:     Time.at(628232400+i*10000),
    food_bio:     Faker::Lorem.sentence,
    category_id:  Category.all[i%Category.count].id,
    user_id:      User.all[i%User.count].id,
    img_url:      "/images/events/#{(i+1)%5}.jpg"
    )
end

#Create some reviews

Event.all.each do |event|
  5.times do |i|

    review = Review.create(
      event_id: event.id,
      user_id: User.all[i%User.count].id,
      score: rand(5),
      comment: Faker::Lorem.sentence
      )

  end
end

#Create some Commits

Commit.create(user_id: 1, event_id: 4)
Commit.create(user_id: 2, event_id: 3)
Commit.create(user_id: 3, event_id: 5)
Commit.create(user_id: 4, event_id: 6)

Commit.create(user_id: 5, event_id: 2)
Commit.create(user_id: 6, event_id: 1)
Commit.create(user_id: 7, event_id: 9)
Commit.create(user_id: 8, event_id: 3)

Commit.create(user_id: 9, event_id: 4)
Commit.create(user_id: 8, event_id: 3)
Commit.create(user_id: 7, event_id: 5)
Commit.create(user_id: 6, event_id: 6)

Commit.create(user_id: 5, event_id: 2)
Commit.create(user_id: 4, event_id: 1)
Commit.create(user_id: 3, event_id: 9)
Commit.create(user_id: 2, event_id: 3)
