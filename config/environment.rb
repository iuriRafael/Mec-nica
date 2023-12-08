require 'active_record'

ActiveRecord::Base.establish_connection(
  adapter: 'mysql2',
  host: 'viaduct.proxy.rlwy.net',
  username: 'root',
  database: 'railway',
  port: 57779
  password: 'F61cgdEe-F54eccaFabgEGh24H-6dh15'
)

Dir["./app/models/*.rb"].each { |file| require file }
