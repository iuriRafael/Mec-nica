

class Funcionario < ActiveRecord::Base
    self.table_name = "funcionario"
  
    validates :Nome, presence: true, uniqueness: true
    validates :Enderenco, presence: true
    validates :Especialidade, presence: true
  
    
end