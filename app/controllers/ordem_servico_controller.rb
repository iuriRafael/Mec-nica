

require './config/environment'
require 'sinatra'
require_relative '../models/cadastro_servico.rb'

require 'date'


class OrdemServicoController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/home' do
    @ordem_servico = Ordem_Servico.all
    erb :'home', locals: { ordem_servico: @ordem_servico }
  end

  get '/ordem_servico' do
    @veiculos = Veiculos.all
    @pecas = Peca.all
    @clientes = Cliente.all
    @equipes = Equipes.all
  
    erb :'ordem_servico', locals: { veiculos: @veiculos, pecas: @pecas, clientes: @clientes, equipes: @equipes }
  end

  post '/ordem_servico' do
    data_inicio = Date.parse(params['Data_Inicio'])
    data_final = Date.parse(params['Data_Final'])

    veiculo_id = params['Id_Veiculo']
    peca_id = params['Id_peca']
    cliente_id = params['Id_Cliente']
    equipe_id = params['Id_equipe']
    valor = params['Valor']

    Ordem_Servico.create(Data_Inicio: data_inicio, Data_Final: data_final, Id_Veiculo: veiculo_id, Id_peca: peca_id, Id_Cliente: cliente_id, Id_equipe: equipe_id, Valor: valor)

    redirect '/home'
  end

  post '/ordem_servico/concluir' do
    id = params['id']
    ordem_Servico = Ordem_Servico.find(id)
    ordem_Servico.destroy
    redirect '/home'
  end


end
