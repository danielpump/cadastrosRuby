#GEM utilizada para habilitar o Singleton Pattern em uma classe
#Ela basicamente converte o método new para private e cria o método instance que deve ser utilizado
#Link que explica tudo que a gem faz https://practicingruby.com/articles/ruby-and-the-singleton-pattern-dont-get-along
require 'singleton'
require 'mongo'

class BasicoDAO

include Mongo
include Singleton

def initialize
  client = MongoClient.new
  @banco_de_dados = client.db("cadastrosRuby")
  
end

@entidades = {}

def carregar_todos(classeDaEntidade)
  puts classeDaEntidade
  puts @banco_de_dados.collection_names
    
end

def criar(entidade)
  puts "Salvando"
  p entidade  
end

def atualizar(entidade)
  puts "Atualizando"
  p entidade  
end
  
end

BasicoDAO.instance.carregar_todos("teste")
