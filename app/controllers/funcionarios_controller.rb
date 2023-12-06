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

  post '/funcionarios/:id/excluir' do
    funcionario = Funcionario.find_by(id: params['id'])
  
    if funcionario
      equipes_relacionadas = Equipes.exists?(ID_Funcionario: funcionario.ID_Funcionario)
  
      if equipes_relacionadas.empty?
        funcionario.destroy
        redirect '/funcionarios'
      end
    end
    redirect '/funcionarios'
  end

  post '/equipe/:id/excluir' do
    equipe = Equipes.find_by(id: params['id'])
  
    if equipe
    
      funcionarios_relacionados = Ordem_Servico.where(ID_Equipe: equipe.id)
  
      if funcionarios_relacionados.empty?
        equipe.destroy
      end
    end
  
    redirect '/equipe'
  end
  
end