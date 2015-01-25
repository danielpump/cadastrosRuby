class Basico
  
  attr_accessor :codigo, :id
  
  def initialize(codigo = "")
    @id = nil
    @codigo = codigo
  end
  
  def esta_no_contexto_de_persistencia?
    not @id.nil?
  end
    
end