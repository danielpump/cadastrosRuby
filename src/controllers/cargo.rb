require File.expand_path('dominio/cargo')
require File.expand_path('controllers/basico')

class CargoController
  
  include BasicoController
  
  def index    
    cargos = carregar_todas "cargos"
    cargos    
  end
  
  def buscar(codigo)
    cargo = Cargo.new "1", "Teste"
    cargo
  end
  
  def nova_entidade
    Cargo.new "", ""
  end

end