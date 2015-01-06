#Essa é a forma padrõa, ou seja não modular do Sinatra iniciar as aplicações, ele basicamente tem uma classe que executa
#o método run! do controller principal dele

#Por padrão o Sinatra roda na porta 4567
#URL padrão de acesso http://localhost:4567/
require 'sinatra'
require File.expand_path('controllers/controller')

#Mapa com os controllers existente para auxiliar no roteamento das requisições.
controllers = {}

controllers["cargos"] = CargoController


#Por padrão o sinatra define as rotas atraves do métodos na classe de acesso a WEB
#A principio o menu será acessado apenas com requisições GET a partir da raiz do projeto.
#O Sinatra utiliza o padrão REST para as requisições
get '/' do
  #Faz com que seja realizada a leitura do arquivo a partir do diretorio atual
  #O metodo join join da classe File, coloca o FileSeparator de acordo com o SO correto.
  File.read(File.join('..','resources','page','index.rhtml'))
end

get '/favicon.ico' do  
  
end

get '/topo' do  
  File.read(File.join('..','resources','page','topo.rhtml'))
end

#Toda chamada em que a action for /entidade, será invocado o método index do respectivo controller e o método index irá retornar a listagem
#de entidades, para que a pagina index.rhtml da respectiva entidade possa ser invocada.
#A principio as entidades Controllers não são exatamente controllers já que quem gerencia as chamadas é a classe principal que executa o Sinatra.
get '/:pagina' do     
  @entidades = controllers[params[:pagina]].new.index
  erb File.read(File.join('..','resources','page',params[:pagina],'index.rhtml'))
end

#Existe precedencia de rotas, deixar a mais dinamica para o fim
get '/:pagina/criar' do
  puts "Criar"
  @entidade = controllers[params[:pagina]].new.nova_entidade
  @read_only = false
  erb File.read(File.join('..','resources','page',params[:pagina],'formulario.rhtml'))
end 

get '/:pagina/editar/:codigo' do
  puts "Editar"
  @entidade = controllers[params[:pagina]].new.buscar params[:codigo]
  @read_only = false
  erb File.read(File.join('..','resources','page',params[:pagina],'formulario.rhtml'))
end 

get '/:pagina/:codigo' do
  puts "buscar"
  @entidade = controllers[params[:pagina]].new.buscar params[:codigo]
  @read_only = true
  erb File.read(File.join('..','resources','page',params[:pagina],'formulario.rhtml'))
end

post '/:pagina' do
  puts "Novo"
  @entidades = controllers[params[:pagina]].new.index
  erb File.read(File.join('..','resources','page',params[:pagina],'index.rhtml'))
end

  

