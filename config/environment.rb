require 'active_record'

ActiveRecord::Base.establish_connection(
  adapter: 'mysql2',
  host: 'localhost',
  username: 'root',
  password: '', # Senha do seu banco, se aplicável
  database: 'Mecanico',
  port: 3306
)

Dir["./app/models/*.rb"].each { |file| require file }
