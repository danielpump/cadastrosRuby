require File.expand_path('dominio/basico')
class Cargo < Basico
  
  attr_reader :descricao
  
  def initialize(codigo, descricao)
    super(codigo)
    @descricao = descricao
  end
  
  
  
end