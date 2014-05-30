# Homepage (Root path)

helpers do
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
end

get '/' do
  genre = params[:category]
  @events = Event.future_events
  @category = Category.new
  if genre && !genre.empty?
    @category = Category.where(genre: genre).first
    @events = @events.where(category_id: @category.id)
  end

  if session[:user_id]
    erb :index
  else
    erb :'auth/login'
  end
end

get '/signup' do
  erb :'auth/signup'
end

post '/signup' do

  @user = User.new(
    name:     params[:name],
    password: params[:password],
    email:    params[:email],
    bio:      params[:bio],
  )

  if @user.save

    img_url = "/images/users/#{@user.id}.jpg"

    File.open('public' + img_url, "w") do |f|
      f.write(params[:img][:tempfile].read)
    end

    @user.img_url = img_url
    @user.save

    session[:user_id] = @user.id
    redirect '/'
  else
     erb :'auth/signup'
  end
end

get '/login' do
  @user = User.new
  erb :'auth/login'
end

post '/login' do

  @user = User.find_by(email: params[:email], password: params[:password])

  if @user
    session[:user_id] = @user.id
    redirect '/'
  else
    erb :'auth/login'
  end
end

get '/logout' do
  session[:user_id] = nil
  erb :'auth/login'
end

get '/events/new' do
  erb :'events/new'
end

post '/events' do

  @category = Category.create(
    genre:        params[:category])
  @event = Event.new(
    title:        params[:title],
    location:     params[:location],
    guest_number: params[:guest_number],
    attire:       params[:attire],
    event_date:   params[:event_date],
    start_time:   params[:start_time],
    end_time:     params[:end_time],
    food_bio:     params[:food_bio],
    category_id:  @category.id,
    user_id:      session[:user_id])

  if @event.save

    img_url = "/images/events/#{@event.id}.jpg"

    File.open('public' + img_url, "w") do |f|
      f.write(params[:img][:tempfile].read)
    end

    @event.img_url = img_url
    @event.save

    redirect '/'
  else
     erb :'events/new'
  end
end

post '/events/attend/:event_id' do
  Commit.create(user_id:  session[:user_id],
                event_id: params[:event_id]
                )
  redirect '/'
end

post '/events/reviews/:event_id' do
  @review = Review.new(
    score:      params[:score],
    comment:    params[:comment],
    user_id:    session[:user_id],
    event_id:   params[:event_id]
    )

  if @review.save

  else
    puts "Please enter a valid review!"
  end
end

get '/events/:id/:name' do

  @event = Event.find(params[:id].first)

  erb :'events/show'

end

get '/users/:id/:name' do

  @user = User.find(params[:id].first)

  erb :'users/show'

end

get '/nav' do
  erb :grid
end

