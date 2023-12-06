require './config/environment'
require 'sinatra'
require_relative '../models/user.rb'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
    redirect '/login' # Renderiza o arquivo login.erb localizado em app/views
  end

  get '/login' do
    erb :'login' # Renderiza o arquivo login.erb localizado em app/views
  end

  post '/login' do
    email = params['email']
    senha = params['senha']

    adm = Adm.authenticate(email, senha)

    if adm
      session[:adm_id] = adm.id
      session[:login_message] = 'Login realizado com sucesso!' # Mensagem de sucesso na sessão
      redirect '/home'
    else
      session[:login_message] = 'Credenciais inválidas. Tente novamente.' # Mensagem de erro na sessão
      erb :'login'
    end
  end

 

end
