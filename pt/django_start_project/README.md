# Seu primeiro projeto Django!

> Parte deste capítulo é baseado nos tutoriais do Geek Girls Carrots (https://github.com/ggcarrots/django-carrots).
> 
> Parte deste capítulo é baseado no [django-marcador tutorial][1] licenciado sobre Creative Commons Attribution-ShareAlike 4.0 International License. O tutorial do django-marcador é protegido por direitos autorais por Markus Zapke-Gründemann et al.

 [1]: http://django-marcador.keimlink.de/

Nós vamos criar um blog simples!

O primeiro passo para criá-lo é começar um novo projeto de Django. Basicamente, isto significa que vamos executar alguns scripts fornecidos pelo Django que irá criar o esqueleto de um projeto Django para nós: um bando de diretórios e arquivos que usaremos mais tarde.

Os nomes de alguns arquivos e diretórios são muito importantes para o Django. Não renomeie os arquivos que estamos prestes a criar. Mover para um lugar diferente também não é uma boa idéia. Django precisa manter uma determinada estrutura para ser capaz de encontrar coisas importantes.

> Lembre-se que tudo no virtualenv. Se você não vê um prefixo `(myvenv)` em seu console, você precisa ativar o virtualenv. Nós explicamos como fazer isso no capítulo **instalação do Django** na parte **trabalhando com virtualenv**. Você pode fazer isso digitando o seguinte comando: `myvenv\Scripts\activate` no Windows ou `myvenv/bin/activate` no Mac OS / Linux.
> 
> **Nota** Verifique que você incluiu o ponto (`.`) no final do comando, é importante porque diz o script para instalar o Django em seu diretório atual.

No console, você deve executar (Lembre-se de que você não pode digitar `~/djangogirls$ (myvenv)`, OK?):

    (myvenv) ~/djangogirls$ django-admin startproject mysite .
    

no Windows:

    (myvenv) C:\Users\Name\djangogirls> python myvenv\Scripts\django-admin.py startproject mysite .
    

`Django-admin` é um script que irá criar os diretórios e arquivos para você. Agora, você deve ter um diretório estrutura que se parece com isso:

    djangogirls
    ├───manage.py
    └───mysite
            settings.py
            urls.py
            wsgi.py
            __init__.py
    

`manage.py` é um script que ajuda com a gestão do site. Com isso seremos capazes de iniciar um servidor de web no nosso computador sem instalar nada, entre outras coisas.

O arquivo `settings.py` contém a configuração do seu site.

Lembra quando falamos sobre um carteiro verificando onde entregar uma carta? arquivo `urls.py` contém uma lista dos padrões usados por `urlresolver`.

Vamos ignorar os outros arquivos por agora - nós não vamos mudá-los. A única coisa a lembrar é não excluí-los por acidente!

## Configurando

Vamos fazer algumas alterações no `mysite/settings.py`. Abra o arquivo usando o editor de código que você instalou anteriormente.

Seria bom ter a hora correta no nosso site. Vá para a <[wikipedia timezones list][2] e copie seu fuso horário. (por exemplo. `America/Sao_Paulo`)

 [2]: http://en.wikipedia.org/wiki/List_of_tz_database_time_zones

Em settings.py, localize a linha que contém `TIME_ZONE` e modifique para escolher seu próprio fuso horário:

```python
TIME_ZONE = 'America/Sao_Paulo'
```    

Modifique "America/Sao_Paulo", conforme o caso

Nós também precisaramos adicionar um caminho para arquivos estáticos (nós vamos descobrir tudo sobre arquivos estáticos e CSS mais tarde no tutorial). Desça até o *final* do arquivo e logo abaixo da entrada `STATIC_URL`, adicione um novo um chamado `STATIC_ROOT`:

```python
STATIC_URL = '/static/'
STATIC_ROOT = os.path.join(BASE_DIR, 'static') 
```    

## Instalação de um banco de dados

Há vários softwares de banco de dados diferentes que pode armazenar dados para o seu site. Nós vamos usar o padrão, `sqlite3`.

Isto já está configurado nesta parte do seu arquivo `mysite/settings.py`:

```python
DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.sqlite3',
        'NAME': os.path.join(BASE_DIR, 'db.sqlite3'),
    }
}
```

Para criar um banco de dados para o nosso blog, vamos fazer o seguinte no console. Digite: `python manage.py migrate` (precisamos estar no diretório que contém o arquivo `manage.py` `djangogirls`). Se isso der certo, você deve ver algo como isto:

    (myvenv) ~/djangogirls$ python manage.py migrate
    Operations to perform:
      Apply all migrations: admin, contenttypes, auth, sessions
    Running migrations:
      Applying contenttypes.0001_initial... OK
      Applying auth.0001_initial... OK
      Applying admin.0001_initial... OK
      Applying sessions.0001_initial... OK
    

E está pronto! Hora de iniciar o servidor web e ver se nosso site está funcionando!

Você precisa estar no diretório que contém o arquivo `manage.py` (o diretório `djangogirls`). No console, nós podemos iniciar o servidor web executando o `python manage.py runserver`:

    (myvenv) ~/djangogirls$ python manage.py runserver
    

Agora tudo que você precisa fazer é verificar se seu site está sendo executado - abra seu navegador (Firefox, Chrome, Safari, Internet Explorer ou o que você usa) e digite o endereço:

    http://127.0.0.1:8000/
    

O servidor web vai assumir seu prompt de comando até você pará-lo: para digitar mais comandos ou abrir uma nova janela do terminal (e não se esqueça de ativar seu virtualenv nele também), ou parar o servidor de web, alternando de volta para a janela na qual está executando e pressionando CTRL + C - botões de controle e C juntos (no Windows, você pode ter que pressionar Ctrl + Break).

Parabéns! Você criou seu primeiro site e o executou usando um servidor de web! Não é impressionante?

![Funcionou!][3]

 [3]: images/it_worked2.png

Pronto para o próximo passo? Está na hora de criar algum conteúdo!
