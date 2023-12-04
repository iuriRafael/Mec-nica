require './config/environment'
require 'sinatra'
require_relative  '../models/cadastro_veiculo.rb'


class VeiculoController < Sinatra::Base

    configure do
        set :public_folder, 'public'
        set :views, 'app/views'
      end

    get '/veiculos' do
      @veiculos = Veiculos.all
        erb :'veiculo', locals: { veiculos: @veiculos }
    end

    get '/cadastro_veiculo' do
        erb :'cadastro_veiculo'
      end

    post '/cadastro_veiculo' do
        nome = params['Nome']
        cor = params['Cor']
        placa = params['Placa']
        modelo = params['Modelo']
        quilometragem = params['Quilometragem']
        Veiculos.create(Nome: nome, Cor: cor, Placa: placa, Modelo: modelo, Quilometragem: quilometragem)

        redirect '/veiculos'

    end

end
