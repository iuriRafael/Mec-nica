require 'sinatra'
require 'active_record'

require_relative './config/environment'
require_relative 'app/models/user'

require_relative 'app/controllers/user_controller'
require_relative 'app/controllers/ordem_servico_controller'
require_relative 'app/controllers/funcionarios_controller'
require_relative 'app/controllers/cliente_controller'
require_relative 'app/controllers/peca_controller'
require_relative 'app/controllers/veiculo_controller'
require_relative 'app/controllers/ordem_servico_controller'


set :views, "#{settings.root}/app/views"

use ApplicationController
use OrdemServicoController
use FuncionariosController
use ClienteController
use PecaController
use VeiculoController
use OrdemServicoController

