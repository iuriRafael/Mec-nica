require './config/environment'
require 'sinatra'
require_relative  '../models/cadastro_peca.rb'


class PecaController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end
    
  get '/pecas' do
    @pecas = Peca.all
    erb :'peca', locals: { pecas: @pecas }
  end

  get '/cadastro_pecas' do
    erb :'cadastro_peca'
  end

  post '/cadastro_pecas' do
    nome = params['Nome']
    tipo = params['Tipo']
    fabricante = params['Fabricante']
    preco = params['Preco']
    quantidade = params['Quantidade_estoque']
    fornecedor = params['Fornecedor']
    Peca.create(Nome: nome, Tipo: tipo, Fabricante: fabricante, Preco: preco, Quantidade_estoque: quantidade, Fornecedor: fornecedor)

    redirect '/pecas'
  end

  post '/pecas/:id/excluir' do
    peca = Peca.find_by(id: params['id'])
  
    if peca
  
      ordens_relacionadas = Ordem_Servico.where(Id_Peca: peca.id)
      
      if ordens_relacionadas.empty?
        peca.destroy
      end
    end
    
    redirect '/pecas'
  end

end    