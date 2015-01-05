#Essa é a forma padrõa, ou seja não modular do Sinatra iniciar as aplicações, ele basicamente tem uma classe que executa
#o método run! do controller principal dele

#Por padrão o Sinatra roda na porta 4567
#URL padrão de acesso http://localhost:4567/
require 'sinatra/base'
require File.expand_path('controllers/controller')

class MainMeu < Sinatra::Base

  

  run!
  
end

