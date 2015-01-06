#GEM utilizada para habilitar o Singleton Pattern em uma classe
#Ela basicamente converte o método new para private e cria o método instance que deve ser utilizado
#Link que explica tudo que a gem faz https://practicingruby.com/articles/ruby-and-the-singleton-pattern-dont-get-along
require 'singleton'

class BasicoDAO

include Singleton

def carregar_todos(entidade)
  cargo = Cargo.new "1", "Teste"
  cargos = []
  cargos << cargo
end
  
end