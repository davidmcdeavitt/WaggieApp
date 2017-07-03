require "active_record"

options = {
  adapter: 'postgresql',
  database: 'waggie_db'
}

ActiveRecord::Base.establish_connection(options)
