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
  name:           "Barrett Stutzman",
  password:       "qwerty",
  email:          "barrett.stutzman@gmail.com",
  bio:            "Sup?",
  img_url:        "/images/users/Barrett-Stutzman.JPG",
  city:           "Dallas",
  state_province: "Texas",
  country:        "USA" 
)

#Create some events

#past events

5.times do |i|
  Event.create(
    title:        "Event#{i}",
    location:     "Loc#{i}",
    guest_number: i,
    attire:       ["formal", "casual"][i%2],
    event_date:   Date.new(2013,i%12+1,i%30+1),
    start_time:   Time.at(628232400+i*10000),
    end_time:     Time.at(628232400+i*10000),
    food_bio:     "Description #{i}",
    category_id:  Category.all[i%Category.count].id,
    user_id:      User.all[i%User.count].id,
    img_url:      "/images/events/#{i+1}.jpg"
    )
end

#future events

(5..10).each do |i|
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
      score: i,
      comment: "Review comment #{i}"
      )

  end
end

#Create some Commits

Commit.create(user_id: 1, event_id: 6)
Commit.create(user_id: 1, event_id: 9)
Commit.create(user_id: 2, event_id: 7)
Commit.create(user_id: 2, event_id: 9)



