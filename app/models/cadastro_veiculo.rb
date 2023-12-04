
class Veiculos < ActiveRecord::Base

    self.table_name = "veiculos"
  
    validates :Nome, presence: true, uniqueness: true
    validates :Cor, presence: true
    validates :Placa, presence: true
    validates :Modelo, presence: true
    validates :Quilometragem, presence: true


end