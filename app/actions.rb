# Homepage (Root path)

helpers do
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
end

get '/' do
  if session[:user_id]
    erb :'auth/login'
  else
    erb :/
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
    bio:      params[:bio]
  )

  if @user.save
    session[:user_id] = @user.id
    redirect '/'
  else
     erb :'auth/signup'
  end
end

get '/login' do
  erb :'auth/login'
end

post '/login' do
  @new_user = User.new(
    name:     params[:name],
    password: params[:password],
    email:    params[:email],
    bio:      params[:bio]
  )
  @existing_user = User.where(name: @new_user.name).first

  if @existing_user && (@existing_user.password == @new_user.password)
    
    session[:user_id] = @existing_user.id
    redirect '/'
  else
    erb :'/login/login' 
  end
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