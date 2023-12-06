

class Ordem_Servico < ActiveRecord::Base
    self.table_name = "ordem_Servico"
  
    validates :Data_Inicio, presence: true
    validates :Data_Final, presence: true
  
    belongs_to :veiculo, class_name: 'Veiculos', foreign_key: 'Id_Veiculo'
    belongs_to :peca, class_name: 'Peca', foreign_key: 'Id_peca'
    belongs_to :cliente, class_name: 'Cliente', foreign_key: 'Id_Cliente'
    belongs_to :equipe, class_name: 'Equipes', foreign_key: 'Id_equipe'
  end