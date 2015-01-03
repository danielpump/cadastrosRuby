#URL padrão de acesso http://localhost:4567/
require 'sinatra/base'
require File.expand_path('controllers/controller')

class Main < Sinatra::Base

  get '/' do
    File.read(File.join('..','resources','page','index.rhtml'))
  end

  #Só inicia o servidor do Sinatra se o arquivo executado for exatametne este 
  run! if __FILE__ == $0

end
