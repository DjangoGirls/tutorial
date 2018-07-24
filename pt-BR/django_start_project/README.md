# Seu primeiro projeto Django!

> Parte deste capítulo é baseado no tutorial da Geek Girls Carrots (https://github.com/ggcarrots/django-carrots).
> 
> Parte deste capítulo é baseado no [django-marcador tutorial](http://django-marcador.keimlink.de/) licenciado sobre Creative Commons Attribution-ShareAlike 4.0 International License. O tutorial do django-marcador é protegido por direitos autorais por Markus Zapke-Gründemann et al.

Nós vamos criar um blog simples!

O primeiro passo é iniciar um novo projeto Django. Basicamente, isso significa que devemos rodar alguns scripts providos pelo Django que irão criar um esqueleto de projeto Django para nós. O resultado é um conjunto de diretórios e arquivos que nós iremos utilizar e modificar mais tarde.

Os nomes de alguns arquivos e diretórios são muito importantes para o Django. Você não deve renomear os arquivos que estamos prestes a criar. Mover para um lugar diferente também não é uma boa idéia. O Django precisa manter uma certa estrutura para conseguir encontrar algumas coisas importantes.

> Lembre-se de rodar tudo no virtualenv. Se você não vê um prefixo `(myvenv)` em seu console, é necessário ativar o virtualenv. Nós explicamos como fazer isso no capítulo **Instalação do Django** na parte **Ambiente Virtual**. Digitar `myvenv\Scripts\activate` no Windows ou `source myvenv/bin/activate` no Mac OS / Linux fará isso para você.

<!--sec data-title="Create project: OS X or Linux" data-id="django_start_project_OSX_Linux" data-collapse=true ces-->

No MacOS ou no console do Linux, você pode rodar o seguinte comando; **não esqueça de adicionar o ponto `.` no final**

{% filename %}command-line{% endfilename %}

    (myvenv) ~/djangogirls$ django-admin startproject mysite .
    

> O ponto `.` é crucial por que ele diz para o script instalar o Django no diretório atual (o ponto `.` é um atalho para referenciar este diretório).
> 
> **Bos** Quando digitar o comando acima, lembre-se de digitar apenas a parte que inicia em `django-admin`. A parte `(myvenv) ~/djangogirls$` apresentada aqui é apenas um exemplo do que pode aparecer no seu terminal quando você for digitar seus comandos.

<!--endsec-->

<!--sec data-title="Create project: Windows" data-id="django_start_project_windows" data-collapse=true ces-->

No Windows você pode rodar o seguinte comando; **não esqueça de adicionar o ponto `.` no final**:

{% filename %}command-line{% endfilename %}

    (myvenv) C:\Users\Name\djangogirls> django-admin.exe startproject mysite .
    

> O ponto `.` é crucial por que ele diz para o script instalar o Django no diretório atual (o ponto `.` é um atalho para referenciar este diretório).
> 
> **Bos** Quando digitar o comando acima, lembre-se de digitar apenas a parte que inicia em `django-admin.exe`. A parte `(myvenv) C:\Users\Name\djangogirls>` apresentada aqui é apenas um exemplo do que pode aparecer no seu terminal quando você for digitar seus comandos.

<!--endsec-->

`django-admin` é um script que irá criar os diretórios e arquivos para você. Agora, você deve ter um diretório estrutura que se parece com isso:

    djangogirls
    ├───manage.py
    └───mysite
            settings.py
            urls.py
            wsgi.py
            __init__.py
    

> **Obs**: em sua estrutura de diretórios, você também verá o o diretório do virtualenv, `venv`, que criamos antes.

`manage.py` é um script que ajuda com a gestão do site. Com ele, podemos iniciar um servidor de web no nosso computador sem instalar nada, entre outras coisas.

O arquivo `settings.py` contém a configuração do seu site.

Lembra quando falamos sobre um carteiro verificando onde entregar uma carta? arquivo `urls.py` contém uma lista dos padrões usados por `urlresolver`.

Vamos ignorar os outros arquivos por enquanto pois não vamos modificá-los. A única coisa a ser lembrada é para não excluí-los por acidente!

## Configurando

Vamos fazer algumas alterações no `mysite/settings.py`. Abra o arquivo usando o editor de código que você instalou anteriormente.

**Obs**: Lembre-se que o `settings.py` é um arquivo comum, como qualquer outro. Você pode abri-lo de dentro do editor de código usando as ações de menu "Arquivo-> Abrir". Assim, você deve encontrá-lo na janela usual para selecionar arquivos e abrí-lo. Ou então, é possível abrir o arquivo navegando até o diretório do djangogirls e abrindo o arquivo com o botão direito. Uma vez clicado, selecione o seu editor de código preferido da lista. Selecionar o editor apropriado é importante uma vez que você pode ter outros programas instalados que podem abrir o arquivo, mas não editá-lo.

Para começar, seria bom ter a hora correta no nosso site. Para isto, devemos configurar o fuso horário correto de onde você está. Se você estiver no Brasil é bem provável que o fuso horário seja `America/Sao_Paulo` (aqui conhecido como horário de Brasília). Caso queira saber mais, vá para [Wikipedia's list of time zones](https://en.wikipedia.org/wiki/List_of_tz_database_time_zones) e copie e cole o fuso horário correspondende à sua localização.

Em `settings.py`, localize a linha que contém `TIME_ZONE` e modifique para escolher seu próprio fuso horário:

{% filename %}mysite/settings.py{% endfilename %}

```python
TIME_ZONE = 'America/Sao_Paulo'
```

Um código de idioma consistem da língua, por exemplo, `en` para inglês ou `pt` para português e o código do país, por exemplo, `br` para Brasil ou `pt` para a Portugal. Já que o inglês provavelmente não é sua língua nativa, você pode pode adicionar um novo código de país para deixar os botões padrão e notificações de Django em seu idioma. Assim, você teria por exemplo um botão "Cancel" traduzido para a língua da sua escolha (ex: "Cancelar" em português). [Django vem com um monte de traduções já preparadas](https://docs.djangoproject.com/en/2.0/ref/settings/#language-code).

Se você quiser um idioma diferente do inglês, especifique o código de idioma alterando a seguinte linha:

{% filename %}mysite/settings.py{% endfilename %}

```python
LANGUAGE_CODE = 'pt-BR'
```

Também precisamos adicionar o caminho para os arquivos estáticos. (Nós discutiremos tudo sobre arquivos estáticos e CSS mais adiante no tutorial.) Vá até o *final* do arquivo e, logo abaixo da linha com `STATIC_URL`, adicione uma nova variável chamada `STATIC_ROOT`:

{% filename %}mysite/settings.py{% endfilename %}

```python
STATIC_URL = '/static/'
STATIC_ROOT = os.path.join(BASE_DIR, 'static')
```

Quando `DEBUG` for `True` e `ALLOWED_HOSTS` estiver vazia, o domínio do site será validado como `['localhost', '127.0.0.1', '[::1]']`. Isso não corresponde ao nosso domínio no PythonAnywhere quando implantarmos a nossa aplicação, então mudamos a seguinte configuração:

{% filename %}mysite/settings.py{% endfilename %}

```python
ALLOWED_HOSTS = ['127.0.0.1', '.pythonanywhere.com']
```

> **Obs**: Se você estiver utilizando um Chromebook, adicione esta linha ao final do arquivo settings.py: `MESSAGE_STORAGE = 'django.contrib.messages.storage.session.SessionStorage'`
> 
> Also add `.c9users.io` to the `ALLOWED_HOSTS` if you are using cloud9

## Set up a database

Há um monte de software de banco de dados diferente que pode armazenar dados para o seu site. Nós vamos usar o padrão, `sqlite3`.

Isto já está configurado nesta parte do seu arquivo `mysite/settings.py`:

{% filename %}mysite/settings.py{% endfilename %}

```python
DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.sqlite3',
        'NAME': os.path.join(BASE_DIR, 'db.sqlite3'),
    }
}
```

Para criar um banco de dados para o nosso blog, vamos fazer o seguinte no console. Digite: `python manage.py migrate` (precisamos estar no diretório que contém o arquivo `manage.py` `djangogirls`). Se isso der certo, você deve ver algo como isto:

{% filename %}command-line{% endfilename %}

    (myvenv) ~/djangogirls$ python manage.py migrate
    Operations to perform: 
      Apply all migrations: auth, admin, contenttypes, sessions
    Running migrations: 
      Rendering model states... DONE
      Applying contenttypes.0001_initial... OK
      Applying auth.0001_initial... OK
      Applying admin.0001_initial... OK
      Applying admin.0002_logentry_remove_auto_add... OK
      Applying contenttypes.0002_remove_content_type_name... OK
      Applying auth.0002_alter_permission_name_max_length... OK
      Applying auth.0003_alter_user_email_max_length... OK
      Applying auth.0004_alter_user_username_opts... OK
      Applying auth.0005_alter_user_last_login_null... OK
      Applying auth.0006_require_contenttypes_0002... OK
      Applying auth.0007_alter_validators_add_error_messages... OK
      Applying sessions.0001_initial... OK
    

E está pronto! Hora de iniciar o servidor web e ver se nosso site está funcionando!

## Starting the web server

Você precisa estar no diretório que contém o arquivo `manage.py` (o diretório `djangogirls`). No console, nós podemos iniciar o servidor web executando o `python manage.py runserver`:

{% filename %}command-line{% endfilename %}

    (myvenv) ~/djangogirls$ python manage.py runserver
    

If you are on a Chromebook, use this command instead:

{% filename %}Cloud 9{% endfilename %}

    (myvenv) ~/djangogirls$ python manage.py runserver 0.0.0.0:8080
    

Se você estiver no Windows e o comando falhar com `UnicodeDecodeError`, use o este comando:

{% filename %}command-line{% endfilename %}

    (myvenv) ~/djangogirls$ python manage.py runserver 0:8000
    

Now all you need to do is check that your website is running. Open your browser (Firefox, Chrome, Safari, Internet Explorer or whatever you use) and enter this address:

{% filename %}browser{% endfilename %}

    http://127.0.0.1:8000/
    

If you're using a Chromebook, you'll always visit your test server by accessing:

{% filename %}browser{% endfilename %}

    https://django-girls-<your cloud9 username>.c9users.io
    

Parabéns! Você criou seu primeiro site e o executou usando um servidor de web! Não é impressionante?

![Install worked!](images/install_worked.png)

While the web server is running, you won't see a new command-line prompt to enter additional commands. The terminal will accept new text but will not execute new commands. This is because the web server continuously runs in order to listen for incoming requests.

> We reviewed how web servers work in the **How the Internet works** chapter.

To type additional commands while the web server is running, open a new terminal window and activate your virtualenv. To stop the web server, switch back to the window in which it's running and press CTRL+C - Control and C keys together (on Windows, you might have to press Ctrl+Break).

Pronto para o próximo passo? Está na hora de criar algum conteúdo!