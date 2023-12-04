

require './config/environment'
require 'sinatra'


class OrdemServicoController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/ordem_servico' do
    erb :'ordem_servico'
  end


end
