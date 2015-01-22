require File.expand_path('persistencia/basico')


module BasicoController

  def carregar_todas(entidades)
    dao = BasicoDAO.instance
    
    dao.carregar_todos entidades    
  end
  
  def salvar(entidade)
    dao = BasicoDAO.instance
    if(entidade.id)
      dao.atualizar entidade
    else
      dao.criar entidade      
    end
  end
  
  def buscar_por(codigo)
    dao = BasicoDAO.instance    
    dao.buscar_pelo_primeiro(entidade) do |entidade|
      entidade.codigo == codigo
    end
  end

end