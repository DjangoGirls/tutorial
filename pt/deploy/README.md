# Implantação!

> **Nota** O capítulo seguinte pode ser às vezes um pouco difícil de passar. Persista e termine-o; Implantação é uma parte importante do processo de desenvolvimento de website. Este capítulo está localizado no meio do tutorial para que seu tutor possa lhe ajudar com o processo ligeiramente complexo de colocar seu site online. Isto significa que você ainda pode terminar o tutorial por conta própria se você continuar em outro momento.

Até agora nosso site só estava disponível no seu computador, agora você vai aprender como publicar ele na internet! A implantação é o processo de publicação do seu aplicativo na Internet de tal forma que as pessoas possam, finalmente, ver seu aplicativo :).

Como você aprendeu, um website precisa estar localizado num servidor. Existem muitos provedores, mas iremos utilizar o que tem um processo de deploy relativamente simples: [PythonAnywhere][1]. PythonAnywhere é gratuito para aplicações pequenas que não possuem muitos visitantes, então será suficiente para você por enquanto.

 [1]: http://pythonanywhere.com/

O outro serviço externo que usaremos é [GitHub][2], que é um serviço de hospedagem de código. Existem outros, mas quase todos os programadores possuem uma conta no GitHub atualmente e agora você também!

 [2]: http://www.github.com

Usaremos o GitHub como um trampolim para transportar nosso código para o PythinAnywhere.

# Git

Git é "sistema de controle de versão" usado por muitos programadores - um software que controla mudanças nos arquivos ao longo do tempo para que você possa recuperar versões específicas depois. Um pouco como "controlar mudanças" no Microsoft Word, mas muito mais poderoso.

## Instalando o Git

### Windows

Você pode baixar Git em [git-scm.com][3]. Você pode apertar "next next next" em todos os passos exceto um; no quinto passo chamado "Adjusting your PATH environment", escolha "Run Git and associated Unix tools from the Windows command-line" (a opção de baixo). Além disso, o padrão está ótimo. Checkout estilo Windows, commit Unix-style linhas de confirmação está bom.

 [3]: http://git-scm.com/

### MacOS

Baixar Git [git-scm.com][3] e siga as instruções.

### Linux

Se ele já não estiver instalado, Git deve estar disponível através de seu gerenciador de pacotes, então tente:

    sudo apt-get install git
    # or
    sudo yum install git
    

## Começando nosso repositório no Git

Git controla as alterações para um determinado conjunto de arquivos no que chamamos de repositório de código (ou "repo"). Vamos começar um para nosso projeto. Abra o console e execute esses comandos, no diretório `djangogirls`:

> **Nota**: Verifique o seu diretório de trabalho atual com um `pwd` (OSX/Linux) ou o comando `cd` (Windows) antes de inicializar o repositório. Você deve estar na pasta `djangogirls`.

    $ git init
    Initialized empty Git repository in ~/djangogirls/.git/
    $ git config user.name "Your Name"
    $ git config user.email you@example.com
    

Inicializar o repositório git é algo que só precisamos fazer uma vez por projeto (e você não terá que re-introduzir o nome de usuário e e-mail nunca mais)

Git irá controlar as alterações para todos os arquivos e pastas neste diretório, mas existem alguns arquivos que queremos ignorar. Fazemos isso através da criação de um arquivo chamado `.gitignore` no diretório base. Abra seu editor e crie um novo arquivo com o seguinte conteúdo:

    *.pyc
    __pycache__
    myvenv
    db.sqlite3
    .DS_Store
    

E salve como `.gitignore` na pasta de nível superior "djangogirls".

> **Nota**: O ponto no início do nome do arquivo é importante! Se você está tendo alguma dificuldade em criá-la (Macs não gostam de criar arquivos que começam com um ponto através do Finder, por exemplo), use o recurso "Save As" no seu editor que sempre funciona.

É uma boa idéia para usar um comando de `git status` antes de `gitt add` ou sempre que você não tiver certeza de que será feito, para evitar surpresas (por exemplo, serão adicionados arquivos errados ou commitados). O comando `git status` retorna informações sobre todos os arquivos controlado/modificado/encenado, status de ramo e muito mais. O output deve ser semelhante a:

    $ git status
    On branch master
    
    Initial commit
    
    Untracked files:
      (use "git add <file>..." to include in what will be committed)
    
    .gitignore
    blog/
    manage.py
    mysite/
    
    nothing added to commit but untracked files present (use "git add" to track)
    

E finalmente nós salvamos nossas alterações, Vá para o seu console e execute estes comandos:

    $ git add --all .
    $ git commit -m "My Django Girls app, first commit"
     [...]
     13 files changed, 200 insertions(+)
     create mode 100644 .gitignore
     [...]
     create mode 100644 mysite/wsgi.py
    

## Empurrando o nosso código para GitHub

Vá para [GitHub.com][4] e cadastre uma nova e gratuita conta de usuário. Em seguida, crie um novo repositório, e dê o nome "my-first-blog". Deixe o "initialise with a README" desmarcado, deixe a opção .gitignore em branco (já fizemos isso manualmente) e a licença como None.

 [4]: http://www.github.com'

![][5]

 [5]: images/new_github_repo.png

> **Nota** O nome `my-first-blog` é importante --você poderia escolher outra coisa, mas vamos usá-lo muitas vezes nas instruções abaixo e você teria que substituí-lo cada vez. É provavelmente mais fácil ficar com o nome `my-first-blog`.

Na tela seguinte, você será mostrada a clone URL do seu repo. Escolha a versão "HTTPS",copie, e vamos colá-lo no terminal em breve:

![][6]

 [6]: images/github_get_repo_url_screenshot.png

Agora precisamos ligar o repositório Git no seu computador com o no GitHub.

    $ git remote add origin https://github.com/<your-github-username>/my-first-blog.git
    $ git push -u origin master
    

Digite seu GitHub username e senha, e você deve ver algo como isto:

    Username for 'https://github.com': hjwp
    Password for 'https://hjwp@github.com':
    Counting objects: 6, done.
    Writing objects: 100% (6/6), 200 bytes | 0 bytes/s, done.
    Total 3 (delta 0), reused 0 (delta 0)
    To https://github.com/hjwp/my-first-blog.git
     * [new branch]      master -> master
    Branch master set up to track remote branch master from origin.
    

<!--TODO: maybe do ssh keys installs in install party, and point ppl who dont have it to an extention -->

Seu código agora está no GitHub. Vá e confira! Você saberá que está em boa companhia - [Django][7], o [Django Girls Tutorial][8] e muitos outros grandes projetos de software de fonte aberta também hospedam seu código no GitHub :)

 [7]: https://github.com/django/django
 [8]: https://github.com/DjangoGirls/tutorial

# Criação de nosso blog em PythonAnywhere

Em seguida, é hora de se inscrever para uma conta gratuita de "Beginner" na PythonAnywhere.

*   [www.pythonanywhere.com][9]

 [9]: https://www.pythonanywhere.com/

> **Nota**: ao escolher seu nome de utilizador aqui, tenha em mente que a URL do seu blog terá o formulário `yourusername.pythonanywhere.com`, então escolha seu nickname ou o nome do que é o blog.

## Pulling our code down on PythonAnywhere

Quando você se inscreve para PythonAnywhere, você é levado ao seu painel de controle ou página "Consoles". Escolha a opção iniciar o console "Bash"--que é a versão PythonAnywhere de um console, como aquela no seu PC

> **Nota**: PythonAnywhere é baseado em Linux, assim se você estiver no Windows o console vai parecer um pouco diferente do que está no seu computador.

Vamos puxar nosso código de GitHub em PythonAnywhere através da criação de um "clone" do repo. Digite o seguinte para o console na PythonAnywhere:

    $ git clone https://github.com/<your-github-username>/my-first-blog.git
    

Isto puxará uma cópia do seu código para PythonAnywhere. Confira digitando:

    $ tree my-first-blog
    my-first-blog/
    ├── blog
    │   ├── __init__.py
    │   ├── admin.py
    │   ├── migrations
    │   │   ├── 0001_initial.py
    │   │   └── __init__.py
    │   ├── models.py
    │   ├── tests.py
    │   └── views.py
    ├── manage.py
    └── mysite
        ├── __init__.py
        ├── settings.py
        ├── urls.py
        └── wsgi.py
    

### Criando um virtualenv na PythonAnywhere

Assim como fez em seu próprio computador, você pode criar um virtualenv na PythonAnywhere. No console Bash, digite:

    20:20 ~ $ cd my-first-blog
    
    20:20 ~ $ virtualenv --python=python3.4 myvenv
    Running virtualenv with interpreter /usr/bin/python3.4
    [...]
    Installing setuptools, pip...done.
    
    20:20 ~ $ source myvenv/bin/activate
    
    (mvenv)20:20 ~ $  pip install django whitenoise
    Collecting django
    [...]
    Successfully installed django-1.8.5 whitenoise-2.0
    

<!--TODO: think about using requirements.txt instead of pip install.-->

### Coleta de arquivos estáticos.

Você estava imaginando o que é "whitenoise"? É uma ferramenta para servir os chamados "arquivos estáticos". Arquivos estáticos funcionam de forma diferente nos servidores em comparação com nosso próprio computador, e precisamos de uma ferramenta como o "whitenoise" para atendê-los.

Vamos descobrir um pouco mais sobre arquivos estáticos mais tarde no tutorial, quando vamos editar o CSS para o nosso site.

Por enaunto só precisamos executar um comando extra chamado "collectstatic" no servidor. Isso diz pro Django reunir todos os arquivos estáticos que ele precisa no servidor. Em sua maioria, estes são os arquivos estáticos que fazem o site do admin bonito no momento.

    20:20 ~ $ python manage.py collectstatic
    
    You have requested to collect static files at the destination
    location as specified in your settings:
    
        /home/edith/my-first-blog/static
    
    This will overwrite existing files!
    Are you sure you want to do this?
    
    Type 'yes' to continue, or 'no' to cancel: yes
    

Digite "Sim" e vai embora! Você não adora fazer computadores imprimir páginas e páginas de texto? Sempre faço pequenos ruídos para acompanhá-lo. Brp, brp brp...

    opying '/home/edith/.virtualenvs/mvenv/lib/python3.4/site-packages/django/contrib/admin/static/admin/js/actions.min.js'
    Copying '/home/edith/.virtualenvs/mvenv/lib/python3.4/site-packages/django/contrib/admin/static/admin/js/inlines.min.js'
    [...]
    Copying '/home/edith/.virtualenvs/mvenv/lib/python3.4/site-packages/django/contrib/admin/static/admin/css/changelists.css'
    Copying '/home/edith/.virtualenvs/mvenv/lib/python3.4/site-packages/django/contrib/admin/static/admin/css/base.css'
    62 static files copied to '/home/edith/my-first-blog/static'.
    

### Criando o banco de dados em PythonAnywhere

Aqui está outra coisa que é diferente entre seu computador e o servidor -- ele usa um banco de dados diferente. Então as contas de usuário e mensagens podem ser diferentes no servidor e no seu computador.

Então nós vamos inicializar o banco de dados no servidor tal como fizemos no seu próprio computador, com `migrate` e `createsuperuser`:

    (mvenv)20:20 ~ $ python manage.py migrate
    Operations to perform:
    [...]
      Applying sessions.0001_initial... OK
    
    
    (mvenv)20:20 ~ $ python manage.py createsuperuser
    

## Publicação do nosso blog como um aplicativo web

Agora nosso código está na PythonAnywhere, nossa virtualenv está pronta, os arquivos estáticos estão recolhidos e o banco de dados está inicializado, estamos prontos para publicá-lo como um aplicativo da web.

Clique em voltar para o PythonAnywhere dashboard clicando no seu logotipo e clique na guia **Web** e vá em **Add a new web app**.

Na caixa de diálogo, após a confirmação de seu nome de domínio, escolha **manual configuration** (NB *não* a opção "Django"). Em seguida, escolha **Python 3.4** e clique em Next para concluir o assistente.

> **Nota** certifique-se você escolheu a opção "Manual configuration", não a "Django". Nós somos demais para o padrão de configuração Django da PythonAnywhere ;-)

### Definindo o virtualenv

Você será levado para a tela de configuração de PythonAnywhere para seu webapp que é onde você precisará de ir quando quiser fazer alterações para o aplicativo no servidor.

![][10]

 [10]: images/pythonanywhere_web_tab_virtualenv.png

Na seção "Virtualenv", clique no texto vermelho que diz "Enter the path to a virtualenv" e digite: */home/<your-username>/my-first-blog/myvenv/*

> **Nota**: substitua seu próprio nome de usuário conforme apropriado. Se você cometer um erro, PythonAnywhere irá mostrar um pequeno aviso.

### Configurando o arquivo WSGI

Django funciona usando o WSGI protocol, um padrão para servir sites usando Python, que oferece suporte a PythonAnywhere. A maneira que configuramos PythonAnywhere para reconhecer nosso blog Django é editando um arquivo de configuração do WSGI.

Clique no link "AWSGI configuration file" (na seção "Code" perto do topo da página - -ele vai ser nomeado algo como `/var/www/<your-username>_pythonanywhere_com_wsgi.py`), e você será levado para um editor.

Exclua todo o conteúdo atual e substitua com algo parecido com isto:

```python
import os
import sys

path = '/home/<your-username>/my-first-blog'  # use your own username here
if path not in sys.path:
    sys.path.append(path)

os.environ['DJANGO_SETTINGS_MODULE'] = 'mysite.settings'

from django.core.wsgi import get_wsgi_application
from whitenoise.django import DjangoWhiteNoise
application = DjangoWhiteNoise(get_wsgi_application())
```

> **Nota** não se esqueça de substituir em seu próprio nome de usuário onde diz `<your-username>`

O que esse arquivo faz é dizer PythonAnywhere onde mora a nossa aplicação web e qual o nome do arquivo de configurações Django. Ele também define a ferramenta de arquivos estáticos "whitenoise".

Aperte **Save** e então volte para a guia **Web**.

Já terminamos! Aperte o botão grande verde de **Reload**e você será capaz de ir ver os seu aplicativo. Você encontrará um link para ele no topo da página.

## Dicas de debugging

Se você vir um erro quando você tenta visitar o seu site, o primeiro lugar para procurar alguma informação de debugging é no seu **error log** -- você encontrará um link para isso na guia web PythonAnywhere. Ver se há mensagens de erro lá. As mais recentes estão na parte inferior. Problemas comuns incluem

*   esquecer um dos passos que fizemos no console: criando o virtualenv, ativá-lo, instalando o Django, collectstatic, inicializando o banco de dados
*   cometer um erro no caminho do virtualenv na guia web -- haverá geralmente uma pequena mensagem de erro vermelho lá, se há um problema
*   cometer um erro no arquivo de configuração WSGI..--você usou o caminho para a pasta do my-first-blog certinho?

O treinador está aqui para ajudar!

# Você está live!

A página padrão para seu site deve dizer "Bem-vindo ao Django", como acontece no seu PC local. Tente adicionar `/admin/` para o final da URL, e você será levado ao site admin. Fazer login com o nome de usuário e senha, e você verá que você pode adicionar novas mensagens no servidor.

Dë em você mesma um *enorme* tapinha nas costas - implantações de servidor são uma das partes mais difíceis do desenvolvimento web, e muitas vezes leva as pessoas vários dias antes de fazer funcionar. Mas você tem seu site publicado, na internet, assim!
