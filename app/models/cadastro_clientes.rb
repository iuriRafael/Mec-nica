
class Cliente < ActiveRecord::Base
    self.table_name = "cliente"
  
    validates :Nome, presence: true, uniqueness: true
    validates :Numero, presence: true
    validates :Email, presence: true
    validates :Endereco, presence: true
    validates :CPF, presence: true
  
    
end