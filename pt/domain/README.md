# Domínio

PythonAnywhere te deu um domínio gratuito, mas talvez você não queira ter ". pythonanywhere.com" no final da URL do seu blog. Talvez você queira seu blog apenas "www.fotos-infinitas-de-gatinhos.org" ou "www.pecas-de-maquinas-a-vapor-em-3D.com" ou "www.colecionando-antiguidades.com" ou "www.unicornioz-mutantez.net", ou seja o que vai ser.

Aqui vamos falar um pouco sobre onde obter um domínio e como ligá-lo a seu aplicativo da web em PythonAnywhere. No entanto, você deve saber que a maioria dos domínios custam dinheiro e PythonAnywere também cobra uma taxa mensal para usar seu próprio nome de domínio -- não é muito dinheiro, no total, mas isso provavelmente é algo que você só quer fazer se você está realmente comprometido!

## Onde registrar um domínio?

Um domínio normal custa mais ou menos 15 dólares por ano. Existem domínios mais caros e mais baratos dependendo do provedor. Existem uma série de empresas das quais você pode comprar um domínio: uma simples [pesquisa no google][1] pode listar uma série delas.

 [1]: https://www.google.com/search?q=register%20domain

O nosso favorito é o [I want my name][2] (eu quero meu nome). Eles anunciam seu serviço como "gestão de domínio indolor", e ele, realmente, é indolor.

 [2]: https://iwantmyname.com/

Você também pode obter domínios gratuitamente. [dot.tk][3] é um lugar para pegar um, mas você deve estar ciente de que domínios grátis às vezes parecem muito baratos -- se seu site vai ser para um profissional de negócios, você deve pensar em pagar por um domínio "correto" que termina em `.com`.

 [3]: http://www.dot.tk

## Como apontar seu domínio no PythonAnywhere

Se você passou por *iwantmyname.com*, clique em `domínios` no menu e escolha seu domínio recém-adquirido. Em seguida, localize e clique no link `manage DNS records`:

![][4]

 [4]: images/4.png

Agora você precisa localizar este formulário:

![][5]

 [5]: images/5.png

E preencher com os seguintes detalhes:-Hostname: www - tipo: CNAME - valor: seu domínio de PythonAnywhere (por exemplo djangogirls.pythonanywhere.com) - TTL: 60

![][6]

 [6]: images/6.png

Clique no botão Adicionar e salve as mudanças na parte de baixo.

> **Nota** Se você usou um provedor de domínio diferente, o UI exata para encontrar o seu DNS / configurações de CNAME será diferente, mas seu objetivo é o mesmo: para configurar um CNAME que aponta seu novo domínio no `yourusername.pythonanywhere.com`.

Pode levar alguns minutos para o seu domínio começar a trabalhar, então seja paciente!

## Configure o domínio através de um web app na PythonAnywhere.

Você também precisa dizer PythonAnywhere que você deseja usar o seu domínio personalizado.

Vá para a [página PythonAnywhere contas][7] e upgrade sua conta. A opção mais barata (um plano de "Hacker") é bom para começar, você pode sempre atualizá-lo mais tarde quando você ficar super famoso e tiver milhões de acessos.

 [7]: https://www.pythonanywhere.com/account/

Em seguida,vá na [Web tab][8] e anote algumas coisas:

 [8]: https://www.pythonanywhere.com/web_app_setup/

*   Copie o **caminho para seu virtualenv** e coloque em um lugar seguro
*   Clique para seu **arquivo de configuração do wsgi**, copie o conteúdo e cole em um lugar seguro.

Em seguida, **exclua** seu antigo web app. Não se preocupe, isso não vai excluir nada do seu código, ele apenas irá se desligar do domínio *yourusername.pythonanywhere.com*. Em seguida, crie um novo aplicativo web e siga estes passos:

*   Digite seu nome de domínio novo
*   Escolha "manual configuration"
*   Escolha Python 3.4
*   E é isso!

Quando você tiver voltado para a web tab.

*   Colar o caminho virtualenv que você salvou antes
*   Clicar no arquivo de configuração wsgi e colar o conteúdo do seu arquivo de configuração antigo

Clique em reload web app e você deve encontrar seu site live no novo domínio!

Se você tiver qualquer problema, clique no link "Enviar feedback" no site PythonAnywhere, e um dos seus administradores amigáveis vai estar lá para ajudá-la.
