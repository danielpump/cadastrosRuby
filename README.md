CadastrosRuby
=============

Cração de projeto utilizando o minimo possivel das APIs em Ruby. 
Trabalhando dessa forma para entender como a linguagem funciona e o poder nativo que ela oferece. 
A principio o framework Sinatra é utilizado apenas para exibir o conteudo HTML de forma mais simples.

Acesso
============================
Para acessar o sistema está sendo utilizada a URL padrão do Sinatra: 
http://localhost(Ou IP do servidor):4567/

Requisitos
============================

O sistema é bascamente um cadastro simples de Cargo, Departamentos e Usuarios.
Onde o usuario pode estar em vários departamentos(N x N), mas deve possuir apenas um cargo(1 x N), isso permite que sejam testados vários 
conceitos de tecnologia.
O sistema tambem conta com uma tela de login feita manualmente, isso permite que os conceitos de filtros, sessões e requisições possam 
ser testados.
No fim serão feitos alguns relátorios com as informações obtidas, a interface deve contar com um menu simples e o sistema deve utilizar alguma
tecnologia .js como o JQuery para manipulação de seus componentes e requisições Ajax. 

Tecnologias
===========================
Sinatra
JQuery
MongoDB

Observações
===========================
A primeira versão do sistema será feita de forma não modularizada com o sistema de roteamento.
Como idéia inicial será seguido o padrão de nomencleatura dos arquivos RHTML para realizar o roteamento dos controllers.