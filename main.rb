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
get '/' do
redirect '/login'
end
