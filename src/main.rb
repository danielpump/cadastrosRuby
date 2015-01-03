#Por padrão o Sinatra roda na porta 4567
#URL padrão de acesso http://localhost:4567/
require 'sinatra'

#Por padrão o sinatra define as rotas atraves do métodos na classe de acesso a WEB
#A principio o menu será acessado apenas com requisições GET a partir da raiz do projeto.
#O Sinatra utiliza o padrão REST para as requisições
get '/' do
  #Faz com que seja realizada a leitura do arquivo a partir do diretorio atual
  #O metodo join join da classe File, coloca o FileSeparator de acordo com o SO correto.
  puts "index" 
  File.read(File.join('..','resources','page','index.html'))
end

get '/topo' do  
  File.read(File.join('..','resources','page','topo.html'))
end

get '/:pagina' do  
  puts params[:pagina]
  File.read(File.join('..','resources','page',params[:pagina],'index.html'))
end

