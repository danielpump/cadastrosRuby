require File.expand_path('persistencia/basico')


module BasicoController

  def carregar_todas(entidades)
    dao = BasicoDAO.instance
    
    dao.carregar_todos entidades
    
  end

end