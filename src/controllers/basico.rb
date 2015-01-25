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
    entidade_encontrada = dao.buscar_pelo_primeiro(entidade) do |entidade|
      entidade.codigo == codigo
    end
    if(entidade_encontrada.nil?)
      raise "Entidade não encontrada!"
    end
      
    entidade_encontrada
  end
  
  def apagar(entidade)
    dao = BasicoDAO.instance 
    entidade_para_apagar = nil
    if(not entidade.esta_no_contexto_de_persistencia?)
      entidade_para_apagar = buscar_por(entidade.codigo)
    else
      entidade_para_apagar = entidade
    end    
    dao.apagar(entidade_para_apagar)
  end

end