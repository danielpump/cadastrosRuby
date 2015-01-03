#Por padrão o Sinatra roda na porta 4567
#URL padrão de acesso http://localhost:4567/
require 'sinatra'


get '/' do
  #Faz com que seja realizada a leitura do arquivo a partir do diretorio atual
  #O metodo join join da classe File, coloca o FileSeparator de acordo com o SO correto. 
  File.read(File.join('..','resources','page','menu.html'))
end

