#create some categories

Category.create(genre: "Mexican")
Category.create(genre: "French")
Category.create(genre: "Thai")
Category.create(genre: "Chinese")
Category.create(genre: "Sushi")

#create some users

User.create(
  name:     "Jamie Woodbury",
  password: "password",
  email:    "Jamie.Woodbury@gmail.com",
  bio:      "Word."
)

User.create(
  name:     "Barrett Stutzman",
  password: "qwerty",
  email:    "barrett.stutzman@gmail.com",
  bio:      "Sup?"
)

#Create some events

5.times do |i|
  Event.create(
    title:        "Event#{i}",
    location:     "Loc#{i}",
    guest_number: i,
    attire:       ["formal", "casual"][i%2],
    event_date:   Date.new(2014,i%12+1,i%30+1),
    start_time:   Time.at(628232400+i*10000),
    end_time:     Time.at(628232400+i*10000),
    food_bio:     "Description #{i}",
    category_id:  Category.all[i%Category.count].id,
    user_id:      User.all[i%User.count].id
    )
end


