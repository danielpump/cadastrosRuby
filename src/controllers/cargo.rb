require File.expand_path('dominio/cargo')
require File.expand_path('controllers/basico')

class CargoController
  
  include BasicoController
  
  def index    
    cargos = carregar_todas entidade
    cargos    
  end
  
  def nova_entidade
    Cargo.new "", ""
  end
  
  def entidade
    Cargo
  end

end

