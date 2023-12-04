
class Peca < ActiveRecord::Base
    self.table_name = "peca"
  
    validates :Nome, presence: true, uniqueness: true
    validates :Tipo, presence: true, uniqueness: true
    validates :Fabricante, presence: true, uniqueness: true
    validates :Preco, presence: true, uniqueness: true
    validates :Quantidade_estoque, presence: true, uniqueness: true
    validates :Fornecedor, presence: true, uniqueness: true

end