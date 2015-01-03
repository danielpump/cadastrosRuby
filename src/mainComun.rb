#Essa é a forma padrõa, ou seja não modular do Sinatra iniciar as aplicações, ele basicamente tem uma classe que executa
#o método run! do controller principal dele

#Por padrão o Sinatra roda na porta 4567
#URL padrão de acesso http://localhost:4567/
require 'sinatra'
require File.expand_path('controllers/controller')

#Por padrão o sinatra define as rotas atraves do métodos na classe de acesso a WEB
#A principio o menu será acessado apenas com requisições GET a partir da raiz do projeto.
#O Sinatra utiliza o padrão REST para as requisições
get '/' do
  #Faz com que seja realizada a leitura do arquivo a partir do diretorio atual
  #O metodo join join da classe File, coloca o FileSeparator de acordo com o SO correto.
  File.read(File.join('..','resources','page','index.rhtml'))
end

get '/topo' do  
  File.read(File.join('..','resources','page','topo.rhtml'))
end

get '/:pagina' do     
  @entidades = CargoController.new.index
  erb File.read(File.join('..','resources','page',params[:pagina],'index.rhtml'))
end

