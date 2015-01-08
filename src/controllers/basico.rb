require File.expand_path('persistencia/basico')


module BasicoController

  def carregar_todas(entidades)
    dao = BasicoDAO.instance
    
    dao.carregar_todos entidades    
  end
  
  def salvar(entidade)
    dao = BasicoDAO.instance
    if(entidade.id)
      dao.criar entidade
    else
      dao.atualizar entidade
    end
  end

end