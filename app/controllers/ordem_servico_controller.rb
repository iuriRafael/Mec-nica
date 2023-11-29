

require './config/environment'
require 'sinatra'
require_relative '../models/ordem_servico.rb'

class OrdemServicoController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/ordem_servico' do
    erb :'ordem_servico'
  end


end
