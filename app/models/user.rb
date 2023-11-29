require 'bcrypt'

require File.expand_path('../models/user', __dir__)

class Adm < ActiveRecord::Base
  self.table_name = "adm"
    validates :email, presence: true, uniqueness: true
    validates :senha, presence: true
  
    def self.authenticate(email, senha)
      adm = find_by(email: email)
      return adm if adm && adm.senha == senha
  
      nil
    end
  end
