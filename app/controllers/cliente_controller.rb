require './config/environment'
require 'sinatra'
require_relative '../models/cadastro_clientes.rb'

class ClienteController < Sinatra::Base

    configure do
      set :public_folder, 'public'
      set :views, 'app/views'
    end

    get '/clientes' do
        @clientes = Cliente.all
        erb :'cliente', locals: { clientes: @clientes }
    end

    get '/cadastro_cliente' do
        erb :'cadastro_cliente'
    end

    post '/cadastro_cliente' do
        nome = params['Nome']
        numero = params['Numero']
        email = params['Email']
        endereco = params['Endereco']
        CPF = params['Cpf']

        Cliente.create(Nome: nome, Numero: numero, Email: email, Endereco: endereco, CPF: CPF)

        redirect '/clientes'
        
    end
end