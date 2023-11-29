require './config/environment'
require 'sinatra'
require_relative '../models/cadastro_funcionario.rb'

class FuncionariosController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/funcionarios' do
    erb :'funcionarios'
  end

  get '/cadastro_funcionario' do
    erb :'cadastro_funcionario'
  end

  post '/cadastro_funcionario' do
    nome = params['Nome']
    endereco = params['Endereco']
    especialidade = params['Especialidade']
    Funcionario.create(Nome: nome, Enderenco: endereco, Especialidade: especialidade)

    redirect '/funcionarios'
  end

end