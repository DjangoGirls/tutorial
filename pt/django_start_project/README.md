# Seu primeiro projeto Django!

> Parte deste capítulo é baseado nos tutoriais do Geek Girls Carrots (https://github.com/ggcarrots/django-carrots).
>
> Parte deste capítulo é baseado no [django-marcador tutorial](http://django-marcador.keimlink.de/) licenciado sobre Creative Commons Attribution-ShareAlike 4.0 International License. O tutorial do django-marcador é protegido por direitos autorais por Markus Zapke-Gründemann et al.

 Nós vamos criar um blog simples!

O primeiro passo para criá-lo é começar um novo projeto de Django. Basicamente, isto significa que vamos executar alguns scripts fornecidos pelo Django que irão criar o esqueleto de um projeto Django para nós: um bando de diretórios e arquivos que usaremos mais tarde.

Os nomes de alguns arquivos e diretórios são muito importantes para o Django. Não renomeie os arquivos que estamos prestes a criar. Mover para um lugar diferente também não é uma boa idéia. Django precisa manter uma determinada estrutura para ser capaz de encontrar coisas importantes.

> Lembre-se de executar tudo no virtualenv. Se você não vê um prefixo `(myvenv)` em seu console, você precisa ativar o virtualenv. Nós explicamos como fazer isso no capítulo de __instalação do Django__ na parte __Trabalhando com virtualenv__. Você pode fazer isso digitando o seguinte comando: `myvenv\Scripts\activate` no Windows ou `source myvenv/bin/activate` no Mac OS / Linux.

<!--sec data-title="OS X or Linux" data-id="django_start_project_OSX_Linux" data-collapse=true ces-->

No seu console Mac OS X ou Linux, você deve executar o seguinte comando. **Não se esqueça de adicionar o ponto `.` no final!**

{% filename %}command-line{% endfilename %}
```
(myvenv) ~/djangogirls$ django-admin startproject mysite .
```
> O ponto `.` é crucial porque ele informa ao script para instalar o Django no seu diretório atual (para o qual o ponto `.` é uma referência abreviada).

 > **Nota** Durante a digitação do comando acima, lembre-se que você apenas digita a parte que começa com `django-admin`.
A parte `(myvenv) ~/djangogirls$` mostrada aqui é apenas um exemplo de prompt que está convidando você a digitar algo em sua linha de comando.

<!--endsec-->

<!--sec data-title="Windows" data-id="django_start_project_windows" data-collapse=true ces-->

No Windows você deve executar o seguinte comando. **(Não se esqueça de adicionar o ponto `.` no final**:

{% filename %}command-line{% endfilename %}
```
(myvenv) C:\Users\Name\djangogirls> django-admin.py startproject mysite .
```
> O ponto `.` é crucial porque ele informa ao script para instalar o Django no seu diretório atual (para o qual o ponto `.` é uma referência abreviada).

> **Nota** Durante a digitação do comando acima, lembre-se que você apenas digita a parte que começa com `django-admin.py`.
A parte `(myvenv) C:\Users\Name\djangogirls>` mostrada aqui é apenas um exemplo de prompt que está convidando você a digitar algo em sua linha de comando.

<!--endsec-->

`Django-admin` é um script que irá criar os diretórios e arquivos para você. Agora, você deve ter um diretório estrutura que se parece com isso:

```
djangogirls
├───manage.py
└───mysite
        settings.py
        urls.py
        wsgi.py
        __init__.py
```

`manage.py` é um script que ajuda com a gestão do site. Com isso seremos capazes de iniciar um servidor de web no nosso computador sem instalar nada, entre outras coisas.

O arquivo `settings.py` contém a configuração do seu site.

Lembra quando falamos sobre um carteiro verificando onde entregar uma carta? arquivo `urls.py` contém uma lista dos padrões usados por `urlresolver`.

Vamos ignorar os outros arquivos por agora - nós não vamos mudá-los. A única coisa a lembrar é não excluí-los por acidente!

## Alterando as configurações

Vamos fazer algumas alterações no `mysite/settings.py`. Abra o arquivo usando o editor de código que você instalou anteriormente.

Seria bom ter a hora correta no nosso site. Vá para a [lista da Wikipedia de fusos horários](https://en.wikipedia.org/wiki/List_of_tz_database_time_zones) e copie seu fuso horário relevante (TZ) (por exemplo. `America/Sao_Paulo`).

Em settings.py, localize a linha que contém `TIME_ZONE` e modifique para escolher seu próprio fuso horário:

{% filename %}mysite/settings.py{% endfilename %}
```python
TIME_ZONE = 'America/Sao_Paulo'
```

Modifique "America/Sao_Paulo", conforme o caso

Nós também precisaremos adicionar um caminho para arquivos estáticos (nós vamos descobrir tudo sobre arquivos estáticos e CSS mais tarde no tutorial). Desça até o *final* do arquivo e logo abaixo da entrada `STATIC_URL`, adicione um novo um chamado `STATIC_ROOT`:

{% filename %}mysite/settings.py{% endfilename %}
```python
STATIC_URL = '/static/'
STATIC_ROOT = os.path.join(BASE_DIR, 'static')
```

Quando a variável `DEBUG` está como `True` e `ALLOWED_HOSTS` é vazio, o host considera `['localhost', '127.0.0.1', '[::1]']`. Isso não corresponde ao seu nome de usuário no PythonAnywhere. Uma vez que você fez a implantação da sua aplicação, nós devemos mudar as seguintes propriedades no arquivo `mysite/settings.py`:

{% filename %}mysite/settings.py{% endfilename %}
```python
ALLOWED_HOSTS = ['127.0.0.1', '<your_username>.pythonanywhere.com']
```

> **Note**: Se você está usando um Chromebook, adicione esta linha ao final do seu arquivo settings.py:
> `MESSAGE_STORAGE = 'django.contrib.messages.storage.session.SessionStorage'`

## Instalação de um banco de dados

Há vários softwares de banco de dados diferentes que podem armazenar dados para o seu site. Nós vamos usar o padrão, `sqlite3`.

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

Para criar um banco de dados para o nosso blog, vamos fazer o seguinte no console. Digite: `python manage.py migrate` (precisamos estar no diretório `djangogirls` que contém o arquivo `manage.py`). Se isso der certo, você deve ver algo como isto:

{% filename %}command-line{% endfilename %}
```
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
```

E está pronto! Hora de iniciar o servidor web e ver se nosso site está funcionando!

## Iniciando o servidor web

Você precisa estar no diretório que contém o arquivo `manage.py` (o diretório `djangogirls`). No console, nós podemos iniciar o servidor web executando o `python manage.py runserver`:

 {% filename %}command-line{% endfilename %}
```
(myvenv) ~/djangogirls$ python manage.py runserver
```

Se você está em um Chromebook, use esse comando:

{% filename %}Cloud 9{% endfilename %}
```
(myvenv) ~/djangogirls$ python manage.py runserver 0.0.0.0:8080
```

Se você está em um Windows e isso falhar com um `UnicodeDecodeError`, use esse comando:

{% filename %}command-line{% endfilename %}
```
(myvenv) ~/djangogirls$ python manage.py runserver 0:8000
```

Agora tudo que você precisa fazer é verificar se seu site está sendo executado - abra seu navegador (Firefox, Chrome, Safari, Internet Explorer ou o que quer que seja que você usa) e digite o endereço:

{% filename %}browser{% endfilename %}
```
http://127.0.0.1:8000/
```

Se você estiver usando um Chromebook, você sempre irá visitar seu servidor de testes acessando:

{% filename %}browser{% endfilename %}
```
https://django-girls-<your cloud9 username>.c9users.io
```

Parabéns! Você criou seu primeiro site e o executou usando um servidor de web! Não é impressionante?

![It worked!](images/it_worked2.png)

Enquanto o servidor web estiver rodando você não verá um novo prompt na linha de comando esperando por comandos adicionais. O terminal aceitará texto novo, mas não vai executar novos comandos. Devido a contínua execução do servidor web que fica aguardando por entrada de requisições.

> Nós revisamos como os servidores web trabalham no capítulo <b>Como a Internet funciona</b>.

Para digitar mais comandos enquanto o servidor web estiver rodando , abra uma nova janela de terminal e ative seu virtualenv. Para parar o servidor de web, volte para a janela na qual ele está sendo executado e pressionando CTRL + C - botões de controle e C juntos (no Windows, você pode ter que pressionar Ctrl + Break).

Pronto para o próximo passo? Está na hora de criar algum conteúdo!
