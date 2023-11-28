require 'sinatra'
require 'active_record'

require_relative './config/environment'
require_relative 'app/models/user'

require_relative 'app/controllers/user_controller'

set :views, "#{settings.root}/app/views"

use ApplicationController
