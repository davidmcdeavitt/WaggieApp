require 'sinatra'
require 'sinatra/reloader'
require 'pry'
require 'pg'

require_relative 'db_config'
require_relative 'models/user'

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
  redirect '/login'
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
    erb :login
  end
end
# delete '/session' do
#   session[:user_id] = nil
#   redirect '/login'
# end
get '/dashboard' do
  redirect '/' if !logged_in?
  erb :layout
end
