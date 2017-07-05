require 'sinatra'
require 'sinatra/reloader'
require 'pry'
require 'pg'
require 'petfinder'
require_relative 'db_config'
require_relative 'models/user'
require_relative 'petfinder'


petfinder = Petfinder::Client.new(ENV['PETFINDER_API'], ENV['PETFINDER_SECRET'])

def run_sql(sql)
  conn = PG.connect(dbname: 'waggie_db')
  result = conn.exec(sql)
  conn.close
  result
end

helpers do

  def logged_in?
    if current_user
      true
    else
      false
    end
  end

  def current_user
    User.find_by(id: session[:user_id])
  end
end

enable :sessions



get '/' do
  erb :index
end

post '/go_login' do
  redirect '/login'
end

post '/create_new_form' do
  redirect '/new_user'
end

get '/new_user' do
  erb :new_user
end

post '/new_user' do
  user = User.new
  user.email = params[:email]
  user.password = params[:password]
  if user.save
    redirect '/login'
  else
    erb :new_user
  end
end

get '/login' do
  erb :login
end


post '/session' do
  user = User.find_by(email:params[:email])
  if user && user.authenticate(params[:password])
    session[:user_id] = user.id
    redirect '/dashboard'
  else
    redirect '/'
  end
end

delete '/session' do
  session[:user_id] = nil
  redirect '/'
end

get '/dashboard' do
  redirect '/' if !logged_in?
  erb :dashboard
end

get '/search' do
  @type = params[:type]
  @zip_code = params[:zip_code]
  @results = petfinder.find_pets(@type,@zip_code)

  erb :new_animal


# page 2
  # petfinder.find_pets('dog', 77057, count: 25, offset: 25)

# page 3
  # petfinder.find_pets('dog', 77057, count: 25, offset: 50)

# page 4
  # petfinder.find_pets('dog', 77057, count: 25, offset: 75)
end
