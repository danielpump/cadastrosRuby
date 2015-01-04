require File.expand_path('dominio/cargo')

class CargoController
  
  def index
    cargo = Cargo.new "1", "Teste"
    cargos = []
    cargos << cargo
    cargos
  end
  
  def buscar(codigo)
    cargo = Cargo.new "1", "Teste"
    cargo
  end

end