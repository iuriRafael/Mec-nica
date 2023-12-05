require './config/environment'
require 'sinatra'
require_relative '../models/cadastro_funcionario.rb'


class FuncionariosController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/funcionarios' do
    @funcionarios = Funcionario.all 
    erb :'funcionarios', locals: { funcionarios: @funcionarios }
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

  get '/equipe' do
    @equipes = Equipes.all
  erb :'equipe', locals: { equipes: @equipes }
end

get '/cadastro_equipe' do
  @funcionarios = Funcionario.all
  erb :'cadastro_equipe', locals: { funcionarios: @funcionarios }
  end

  post '/cadastro_equipe' do
    nome = params['Nome']
    funcionario_id = params['FuncionarioId']
    Equipes.create(Nome: nome, ID_Funcionario: funcionario_id)

    redirect '/equipe'
  end

  


end