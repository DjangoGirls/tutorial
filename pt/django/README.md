# O que é Django?

Django é um framework gratuito e de código aberto para a criação de aplicações web, escrito em Python. É um framework web, ou seja, é um conjunto de componentes que ajuda a desenvolver sites de forma mais rápida e mais fácil.

Veja, quando você está construindo um site, você sempre precisa um conjunto similar de componentes: uma maneira de lidar com a autenticação do usuário (inscrever-se, realizar login, realizar logout), painel de gerenciamento para o seu site, formulários, upload de arquivos, etc.

Felizmente para você, há muito tempo, outras pessoas notaram várias semelhanças nos problemas enfrentados pelos desenvolvedores web quando estão criando um novo site, então eles uniram-se e criaram os frameworks (Django é um deles) que lhe dão componentes prontos, que você pode usar.

Frameworks existem para salvá-lo de ter que reinventar a roda e ajudam a aliviar a sobrecarga quando você está construindo um novo site.

## Por que você precisa de um framework?

Para entender o que Django é na verdade, precisamos olhar mais de perto os servidores. A primeira coisa é que o servidor precisa saber o que você quer para servi-lo uma página da Web.

Imagine uma caixa de correio (porta) que é monitorada por cartas recebidas (requisição). Isso é feito por um servidor web. O servidor web lê a carta e envia uma resposta com uma página web. Mas, quando você quer enviar alguma coisa você precisa ter um conteúdo. E o Django é aquilo que vai lhe ajudar a criar esse conteúdo.

## O que acontece quando alguém solicita um site do seu servidor?

Quando chega uma requisição para o servidor web ela é passada para o Django que tenta descobrir do que ela se trata. Primeiro ele pega um endereço web e tenta descobrir o que fazer. Essa parte é feita pelo **urlresolver** do Django. (Note que o endereço de um site se chama URL - Uniform Resource Locator, em português Localizador de Recursos Uniforme, dessa forma o nome *urlresolver*, ou resolvedor de urls, faz sentido). Isso não é muito inteligente - leva à uma lista de padrões e tenta corresponder a URL. O Django verifica padrões de cima para baixo e se algo é correspondido, passa a solicitação para a função associada (que é chamada *view*).

Imagine um carteiro com uma carta. Ela está andando pela rua e verifica cada número de casa com a que está na carta. Se ele corresponder, ela coloca a carta lá. É assim que funciona o urlresolver!

Todas as coisas interessantes são feitas dentro da *view*: podemos dar uma olhada no banco de dados para procurar algumas informações. Talvez o usuário queira mudar algo nos dados? Como uma carta dizendo: "Por favor mude a descrição do meu emprego." - a *view* checa se você tem permissão para fazer isso e então atualiza a descrição do emprego pra você, enviando em seguida uma mensagem: "Feito!". Então a *view* gera uma resposta e o Django pode enviá-la para o navegador do cliente.

Claro, a descrição acima é muito simplificada, mas você não precisa saber detalhes técnicos ainda. Ter uma ideia geral já é suficiente.

Então em vez de mergulhar em muitos detalhes, nós simplesmente vamos começar criando algo com o Django e aprenderemos todas as partes importantes ao longo do caminho!
