#GEM utilizada para habilitar o Singleton Pattern em uma classe
#Ela basicamente converte o método new para private e cria o método instance que deve ser utilizado
#Link que explica tudo que a gem faz https://practicingruby.com/articles/ruby-and-the-singleton-pattern-dont-get-along
require 'singleton'
require 'yaml'

class BasicoDAO

  include Singleton
  def initialize
  end

  def criar(entidade)
    entidade.id = gerar_identificador(entidade)
    gravar_entidade(entidade)
  end

  def atualizar(entidade)
    gravar_entidade(entidade)
  end
  
  def apagar(entidade)
    apagar_entidade(entidade)
  end


  def carregar_todos(classe_da_entidade)
    entidades = []
    Dir.glob(carregar_pasta_da_entidade_com_extensao_dbr(classe_da_entidade)) do |arquivo_da_entidade|
      File.open(arquivo_da_entidade,"r") do |arquivo|
        entidade = YAML.load arquivo
        entidades << entidade
      end
    end
    entidades.reverse
  end

  def buscar_por_todos(classe_da_entidade)
    entidades = carregar_todos classe_da_entidade
    entidades_filtradas = []
    entidades.each do |entidade|
      passou_no_filtro = yield entidade if block_given?
      if(passou_no_filtro == true)
      entidades_filtradas << entidade
      end
    end
    entidades_filtradas
  end

  def buscar_pelo_primeiro(classe_da_entidade)
    entidades = carregar_todos classe_da_entidade
    entidade_encontrada = nil
    entidades.each do |entidade|
      passou_no_filtro = yield entidade if block_given?
      if(passou_no_filtro == true)
        entidade_encontrada = entidade
      break
      end
    end
    entidade_encontrada
  end
  
  
  

  def carregar_pasta_da_entidade(classe_da_entidade)
    caminho_do_arquivo = File.join(:banco_de_dados.to_s,classe_da_entidade.to_s)
    FileUtils.mkdir_p caminho_do_arquivo
    caminho_do_arquivo
  end

  def carregar_pasta_da_entidade_com_extensao_dbr(classe_da_entidade)
    caminho_do_arquivo_com_extensao = carregar_pasta_da_entidade_com_extensao(classe_da_entidade,"dbr")
    caminho_do_arquivo_com_extensao
  end

  def carregar_pasta_da_entidade_com_extensao_idt(entidade)
    caminho_do_arquivo_com_extensao = carregar_pasta_da_entidade_com_extensao(entidade,"idt")
    caminho_do_arquivo_com_extensao
  end

  def carregar_pasta_da_entidade_com_extensao(classe_da_entidade, extensao)
    caminho_do_arquivo_com_extensao = File.join(carregar_pasta_da_entidade(classe_da_entidade),"*.#{extensao}")
    caminho_do_arquivo_com_extensao
  end

  def carregar_arquivo_da_entidade(entidade)
    File.join(carregar_pasta_da_entidade(entidade.class),"#{entidade.id.to_s}.dbr")
  end

  def gravar_entidade(entidade)
    File.open(carregar_arquivo_da_entidade(entidade), "w") do |arquivo|
      entidade_yaml = YAML.dump entidade
      arquivo.puts entidade_yaml
    end
  end
  
  def apagar_entidade(entidade)
    FileUtils.rm carregar_arquivo_da_entidade(entidade)
  end

  def gerar_identificador(entidade)
    caminho_do_arquivo = File.join(carregar_pasta_da_entidade(entidade.class),"identificador.idt")
    identificacao = 0#Inicializa a variavel
    File.open(caminho_do_arquivo, "r") do |arquivo|
      identificacao_atual = arquivo.gets
      if(identificacao_atual)
      identificacao = identificacao_atual.to_i + 1
      else
      identificacao = 1
      end
    end
    File.open(caminho_do_arquivo, "w") do |arquivo|
      arquivo.puts identificacao
    end
    identificacao
  end

end

