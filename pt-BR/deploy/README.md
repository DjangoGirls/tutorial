# Deploy!

> **Nota** O capítulo seguinte pode ser às vezes um pouco difícil de terminar. Persista e termine-o; Deploy é uma parte importante do processo de desenvolvimento de website. Colocar o seu site no ar é um pouco mais complicado, então esse capítulo está no meio do tutorial para que seu treinador possa lhe ajudar nessa tarefa. Isto significa que você ainda pode terminar o tutorial por conta própria se você continuar em outro momento.

Até agora, seu site só estava disponível no seu computador. Agora você aprenderá como implantá-lo (fazer o 'deploy')! O deploy é o processo de publicação do seu aplicativo na Internet de tal forma que as pessoas possam, finalmente, ver seu aplicativo. :)

Como você aprendeu, um website precisa estar localizado num servidor. Existe na internet muitos fornecedores de servidor disponíveis, vamos usar o [PythonAnywhere](https://www.pythonanywhere.com/). O PythonAnyWhere é grátis para pequenas aplicações que não possuem muitos visitantes, então ele será por enquanto suficiente para ti.

O outro serviço externo que usaremos é [GitHub](https://www.github.com), que é um serviço de hospedagem de código. Existem outros, mas quase todos os programadores possuem uma conta no GitHub atualmente e agora você também!

Estes três lugares serão importantes para você. Seu computador local será o lugar onde você faz o desenvolvimento e testes. Quando você estiver feliz com as mudanças, você colocará uma cópia de seu programa no GitHub. Seu site estará na PythonAnywhere e você irá atualizá-lo, ao puxar uma nova cópia do seu código de GitHub.

# Git

> **Nota** Se você já fez os passos de instalação, não precisa fazer isso novamente - você pode pular para a próxima seção e comece a criar seu repositório Git.

{% include "/deploy/install_git.md" %}

## Começando nosso repositório no Git

O Git controla as alterações para um determinado conjunto de arquivos no que chamamos de repositório de código (ou "repo"). Vamos começar um para nosso projeto. Abra o console e execute esses comandos, no diretório `djangogirls`:

> **Nota**: Verifique o seu diretório de trabalho atual com um `pwd` (OSX/Linux) ou o comando `cd` (Windows) antes de inicializar o repositório. Você deve estar na pasta `djangogirls`.

{% filename %}command-line{% endfilename %}

    $ git init
    Initialized empty Git repository in ~/djangogirls/.git/
    $ git config --global user.name "Seu Nome"
    $ git config --global user.email voce@exemplo.com
    

Só necessitamos de iniciar o repositório git apenas uma vez por projeto (e não será necessário colocar novamente o nome do utilizador e email).

Git irá controlar as alterações para todos os arquivos e pastas neste diretório, mas existem alguns arquivos que queremos ignorar. Fazemos isso através da criação de um arquivo chamado `.gitignore` no diretório base. Abra seu editor e crie um novo arquivo com o seguinte conteúdo:

{% filename %}.gitignore{% endfilename %}

    *.pyc
    *~
    __pycache__
    myvenv
    db.sqlite3
    /static
    .DS_Store
    

E salve-o como `.gitignore` na pasta "djangogirls".

> **Nota** O ponto no início do nome do arquivo é importante! Se estás com algum tipo de dificuldade em criá-lo (por exemplo, os Macs não gostam de criar arquivos que começam com um ponto através do Finder), usa o recurso "Guardar Como" no teu editor; que nunca irá falhar.
> 
> **Nota** Um dos arquivos que especificaste no teu `.gitignore` é `db.sqlite3`. Esse arquivo será a tua base de dados local, onde todos os teus posts estão armazenados. O teu website na PythonAnywhere irá utilizar um banco de dados diferente, assim não queremos adicionar isto ao teu repositório. That database could be SQLite, like your development machine, but usually you will use one called MySQL which can deal with a lot more site visitors than SQLite. Either way, by ignoring your SQLite database for the GitHub copy, it means that all of the posts you created so far are going to stay and only be available locally, but you're going to have to add them again on production. Pense no seu banco de dados local como um bom parque de diversões onde você pode testar coisas diferentes e não ter medo de que você vai apagar os posts reais do seu blog.

É uma boa idéia usar um comando `git status` antes de `git add` ou sempre que você não tiver certeza do que mudou. This will help prevent any surprises from happening, such as wrong files being added or committed. The `git status` command returns information about any untracked/modified/staged files, the branch status, and much more. The output should be similar to the following:

{% filename %}command-line{% endfilename %}

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
    

E finalmente nós salvamos nossas alterações. Vá para o seu console e execute estes comandos:

{% filename %}command-line{% endfilename %}

    $ git add --all .
    $ git commit -m "My Django Girls app, first commit"  
    [...]
    13 files changed, 200 insertions(+)  
    create mode 100644 .gitignore  
    [...]  
    create mode 100644 mysite/wsgi.py  
    ``` 
    
    
    ## Enviando seu código para  GitHub
    
    Vá para [GitHub.com](https://www.github.com) e se registre numa conta nova (Se você já tinha preparado  isso é ótimo!)  
    
    Em seguida, crie um novo repositório, dando-lhe o nome "my-first-blog". Deixe o "initialize with a README" desmarcado, deixe a opção .gitignore em branco (já fizemos isso manualmente) e a licença como None.
    
    <img src="images/new_github_repo.png" />
    
     > **Nota*** O nome my-first-blog é importante --você poderia escolher outro nome, mas vamos usá-lo muitas vezes nas instruções abaixo e você teria que substituí-lo cada vez. É provavelmente mais fácil ficar com o nome my-first-blog`.
    
    Na tela seguinte, será mostrado o URL para clonar seu repo. Escolha a versão "HTTPS", copie para  podemos colá-lo no terminal em breve: 
    
    <img src="images/github_get_repo_url_screenshot.png" /> 
    
    agora precisamos conectar o repositório Git no seu computador para o GitHub.
    
    Digite o seguinte no seu terminal 
    (Substitua <your-github-username> pelo nome de usuário que você escolheu quando criou sua conta no GitHub, mas sem os símbolos de maior e menor):
    

$ git remote add origin https://github.com/<your-github-username>/my-first-blog.git $ git push -u origin master

    <br />Enter your GitHub username and password and you should see something like this:
    
    {% filename %}command-line{% endfilename %}
    

Username for 'https://github.com': hjwp Password for 'https://hjwp@github.com': Counting objects: 6, done. Writing objects: 100% (6/6), 200 bytes | 0 bytes/s, done. Total 3 (delta 0), reused 0 (delta 0) To https://github.com/hjwp/my-first-blog.git

- [new branch] master -> master Branch master set up to track remote branch master from origin.

    <br />&lt;!--TODO: maybe do ssh keys installs in install party, and point ppl who dont have it to an extension --&gt;
    
    Your code is now on GitHub. Vá e confira!  You'll find it's in fine company – [Django](https://github.com/django/django), the [Django Girls Tutorial](https://github.com/DjangoGirls/tutorial), and many other great open source software projects also host their code on GitHub. :)
    
    
    # Setting up our blog on PythonAnywhere
    
    &gt; **Note** You might have already created a PythonAnywhere account earlier during the install steps – if so, no need to do it again.
    
    {% include "/deploy/signup_pythonanywhere.md" %}
    
    
    ## Pulling our code down on PythonAnywhere
    
    When you've signed up for PythonAnywhere, you'll be taken to your dashboard or "Consoles" page. Choose the option to start a "Bash" console – that's the PythonAnywhere version of a console, just like the one on your computer.
    
    &lt;img src="images/pythonanywhere_bash_console.png" alt="pointing at Other: Bash in Start a new Console" /&gt;
    
    &gt; **Note** PythonAnywhere is based on Linux, so if you're on Windows, the console will look a little different from the one on your computer.
    
    Vamos trazer nosso código do GitHub para o PythonAnywhere criando um "clone" do nosso repositório. Type the following into the console on PythonAnywhere (don't forget to use your GitHub username in place of `&lt;your-github-username&gt;`):
    
    {% filename %}PythonAnywhere command-line{% endfilename %}
    

$ git clone https://github.com/<your-github-username>/my-first-blog.git

    <br />This will pull down a copy of your code onto PythonAnywhere. Check it out by typing `tree my-first-blog`:
    
    {% filename %}PythonAnywhere command-line{% endfilename %}
    

$ tree my-first-blog my-first-blog/ ├── blog │ ├── **init**.py │ ├── admin.py │ ├── migrations │ │ ├── 0001_initial.py │ │ └── **init**.py │ ├── models.py │ ├── tests.py │ └── views.py ├── manage.py └── mysite ├── **init**.py ├── settings.py ├── urls.py └── wsgi.py

    <br /><br />### Creating a virtualenv on PythonAnywhere
    
    Just like you did on your own computer, you can create a virtualenv on PythonAnywhere. In the Bash console, type:
    
    {% filename %}PythonAnywhere command-line{% endfilename %}
    

$ cd my-first-blog

$ virtualenv --python=python3.6 myvenv Running virtualenv with interpreter /usr/bin/python3.6 [...] Installing setuptools, pip...done.

$ source myvenv/bin/activate

(myvenv) $ pip install django~=1.11.0 Collecting django [...] Successfully installed django-1.11.3

    <br /><br />&gt; **Note** The `pip install` step can take a couple of minutes.  Patience, patience!  But if it takes more than five minutes, something is wrong.  Ask your coach.
    
    &lt;!--TODO: think about using requirements.txt instead of pip install.--&gt;
    
    ### Creating the database on PythonAnywhere
    
    Here's another thing that's different between your own computer and the server: it uses a different database. So the user accounts and posts can be different on the server and on your computer.
    
    Just as we did on your own computer, we repeat the step to initialize the database on the server, with `migrate` and `createsuperuser`:
    
    {% filename %}PythonAnywhere command-line{% endfilename %}
    

(mvenv) $ python manage.py migrate Operations to perform: [...] Applying sessions.0001_initial... OK (mvenv) $ python manage.py createsuperuser

    <br />## Publishing our blog as a web app
    
    Now our code is on PythonAnywhere, our virtualenv is ready, and the database is initialized. We're ready to publish it as a web app!
    
    Click back to the PythonAnywhere dashboard by clicking on its logo, and then click on the **Web** tab. Finally, hit **Add a new web app**.
    
    After confirming your domain name, choose **manual configuration** (N.B. – *not* the "Django" option) in the dialog. Next choose **Python 3.6**, and click Next to finish the wizard.
    
    &gt; **Note** Make sure you choose the "Manual configuration" option, not the "Django" one. We're too cool for the default PythonAnywhere Django setup. ;-)
    
    
    ### Setting the virtualenv
    
    You'll be taken to the PythonAnywhere config screen for your webapp, which is where you'll need to go whenever you want to make changes to the app on the server.
    
    &lt;img src="images/pythonanywhere_web_tab_virtualenv.png" /&gt;
    
    In the "Virtualenv" section, click the red text that says "Enter the path to a virtualenv", and enter `/home/&lt;your-PythonAnywhere-username&gt;/my-first-blog/myvenv/`. Click the blue box with the checkmark to save the path before moving on.
    
    &gt; **Note** Substitute your own PythonAnywhere username as appropriate. If you make a mistake, PythonAnywhere will show you a little warning.
    
    
    ### Configuring the WSGI file
    
    Django works using the "WSGI protocol", a standard for serving websites using Python, which PythonAnywhere supports. The way we configure PythonAnywhere to recognize our Django blog is by editing a WSGI configuration file.
    
    Click on the "WSGI configuration file" link (in the "Code" section near the top of the page – it'll be named something like `/var/www/&lt;your-PythonAnywhere-username&gt;_pythonanywhere_com_wsgi.py`), and you'll be taken to an editor.
    
    Delete all the contents and replace them with the following:
    
    {% filename %}&lt;your-username&gt;_pythonanywhere_com_wsgi.py{% endfilename %}
    ```python
    import os
    import sys
    
    path = os.path.expanduser('~/my-first-blog')
    if path not in sys.path:
        sys.path.append(path)
    
    os.environ['DJANGO_SETTINGS_MODULE'] = 'mysite.settings'
    
    from django.core.wsgi import get_wsgi_application
    from django.contrib.staticfiles.handlers import StaticFilesHandler
    application = StaticFilesHandler(get_wsgi_application())
    

O trabalho deste arquivo é dizer para PythonAnywhere onde mora a nossa aplicação web e qual o nome do nosso arquivo de configurações do Django.

O `StaticFilesHandler` é para lidar com nosso CSS. Isto é cuidado automaticamente para você durante o desenvolvimento local pelo comando `runserver`. Vamos descobrir um pouco mais sobre arquivos estáticos mais tarde no tutorial, quando editarmos o CSS para o nosso site.

Clique em **Save** e depois volte para a aba **Web**.

Tudo pronto! Clique no grande botão verde **Reload** e você poderá ir visualizar sua aplicação. Você encontrará um link para ela no topo da página.

## Dicas de debugging

Se você encontrar um erro ao tentar acessar seu site, o primeiro lugar para buscar informações sobre para debugar é o seu **error log**. Você encontrará um link para ele na [aba Web](https://www.pythonanywhere.com/web_app_setup/) do PythonAnywhere. Verifique se existem mensagens de erro aqui; os erros mais recentes estarão no final do arquivo. Problemas comuns incluem:

- Esquecer algum dos passos que fizemos no terminal: criar o virtualenv, ativá-lo, instalar o Django nele, migrar o banco de dados.

- Making a mistake in the virtualenv path on the Web tab – there will usually be a little red error message on there, if there is a problem.

- Making a mistake in the WSGI configuration file – did you get the path to your my-first-blog folder right?

- Você escolheu a mesma versão do Python para o seu virtualenv daquela escolhida para sua aplicação? Ambas devem ser 3.6.

There are also some [general debugging tips on the PythonAnywhere wiki](https://www.pythonanywhere.com/wiki/DebuggingImportError).

E lembre-se, o seu treinador está aqui para ajudar!

# Você está no ar!

The default page for your site should say "It worked!", just like it does on your local computer. Tente adicionar `/admin/` no final da URL, e você será levado ao site admin. Fazer login com o nome de usuário e senha, e você verá que você pode adicionar novos Posts no servidor.

Uma vez que você tem alguns posts criados, você pode voltar para sua instalação local (não no PythonAnywhere). A partir daqui, você deveria trabalhar na sua configuração local para fazer as alterações. This is a common workflow in web development – make changes locally, push those changes to GitHub, and pull your changes down to your live Web server. Isto permite-lhe trabalhar e experimentar sem quebrar seu site da Web em produção. Daora, né?

Dê a você um *Grande* tapinha nas costas! :D Deploy no servidor é uma das partes mais complicadas no desenvolvimento web, e muitas vezes as pessoas levam dias até conseguir deixar tudo funcionando. Mas você já tem seu site publicado, na internet! \o