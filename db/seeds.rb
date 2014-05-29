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
  bio:      "Word.",
  img_url:  "public/images/users/Jamie-Woodbury.JPG"
)

User.create(
  name:     "Barrett Stutzman",
  password: "qwerty",
  email:    "barrett.stutzman@gmail.com",
  bio:      "Sup?",
  img_url:  "/images/users/Barrett-Stutzman.JPG"
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
    user_id:      User.all[i%User.count].id,
    img_url:      "/images/events/img#{i+1}.jpg"
    )
end

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



