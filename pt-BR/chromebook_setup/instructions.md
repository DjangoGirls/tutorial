Você pode [pular este capítulo](http://tutorial.djangogirls.org/en/installation/#install-python) se não estiver usando um Chromebook. Caso esteja, sua experiência de instalação será um pouco diferente. Você pode ignorar o restante das instruções de instalação.

### Cloud IDE (PaizaCloud Cloud IDE, AWS Cloud9, Glitch.com)

O IDE na nuvem é uma ferramenta que fornece um editor de código e acesso a um computador em execução na Internet, onde você pode instalar, gravar e executar software. Pela duração desse tutorial, o IDE na nuvem funcionará como sua * máquina local *. Você ainda estará executando comandos em uma interface de terminal (ou prompt de comando), como suas colegas de oficina no OS X, Ubuntu ou Windows, mas seu prompt estará conectado a um computador remoto configurado pelo Cloud 9. Here are the instructions for cloud IDEs (PaizaCloud Cloud IDE, AWS Cloud9, Glitch.com). Você pode escolher uma das IDEs na nuvem e seguir as instruções.

#### IDE na Nuvem PaizaCloud

1. Vá para *PaizaCloud Cloud IDE *
2. Registre-se
3. Clique em *Novo Servidor* e escolha o aplicativo Django
4. Clique no botão Terminal (no lado esquerdo da janela)

Agora você deve ver uma interface com uma barra lateral, botões no canto esquerdo. Clique no botão "Terminal" para abrir a janela de terminal com prompt desta maneira:

{% filename %}Terminal{% endfilename %}

    $
    

O terminal na IDE na nuvem PaizaCloud está pronto para suas instruções. Você pode ajustar o tamanho ou maximizar a janela para torná-la um pouco maior.

#### AWS Cloud9

Atualmente o Cloud 9 requer que você se cadastre com AWS e insira as informações do cartão de crédito.

1. Instale o Cloud 9 através do [Chrome Web Store](https://chrome.google.com/webstore/detail/cloud9/nbdmccoknlfggadpfkmcpnamfnbkmkcp)
2. Acesse [c9.io](https://c9.io) e clique em *Iniciar com AWS Cloud9*
3. Cadastre-se em uma conta AWS (requer informações de cartão de crédito, mas você pode usá-la gratuitamente)
4. No painel de controle da AWS, digite *Cloud9* na barra de pesquisa e clique nele
5. No painel de controle do Cloud 9, click em *Create environment*
6. Nomeie como *django-girls*
7. Ao configurar, selecione *Criar uma nova instância para o ambiente (EC2)* para "Tipo de Ambiente" e o *t2.micro* "Tipo de Instância" (deve dizer "Free-tier elegíveel."). A configuração padrão de economia de custos está bem e você pode manter o outro padrão.
8. Clique em *Próximo passo*
9. Clique em *Criar ambiente*

Agora, a sua tela deve exibir uma interface com uma barra lateral, uma grande janela principal com algum texto e uma pequena janela na parte inferior, semelhante a isto:

{% filename %}bash{% endfilename %}

    seunomedeusuário:~/workspace $
    

Essa janela na parte inferior é o seu terminal. Você pode usá-la para enviar instruções para o computador remoto Cloud 9. Se preferir, você pode redimensioná-la para que fique um pouco maior.

#### Glitch.com Cloud IDE

1. Go to [Glitch.com](https://glitch.com/)
2. Crie uma conta (https://glitch.com/signup) ou use a sua conta do GitHub se tiver uma. (Veja instruções abaixo)
3. Clique * Novo projeto* e escolha*hello-webpage*
4. Clique na lista suspensa de Ferramentas (no lado esquerdo inferior da janela), em seguida clique no botão Terminal para abrir a aba terminal com um prompt assim:

{% filename %}Terminal{% endfilename %}

    app@name-of-your-glitch-project:~
    

When using Glitch.com as your Cloud IDE, you don't have to create a virtual environment. Instead, create the following files manually:

{% filename %}glitch.json{% endfilename %}

```json
{
  "install": "pip3 install -r requirements.txt --user",
  "start": "bash start.sh",
  "watch": {
    "throttle": 1000
  }
}
```

{% filename %}requirements.txt{% endfilename %}

    Django~={{ book.django_version }}
    

{% filename %}.bash_profile{% endfilename %}

```bash
alias python=python3
alias pip=pip3
```

{% filename %}start.sh{% endfilename %}

```bash
chmod 600 .bash_profile
pip3 install -r requirements.txt --user
python3 manage.py makemigrations
python3 manage.py migrate
python3 manage.py runserver $PORT
```

Depois que esse arquivos foram criados, vá para o Terminal e execute os seguintes comandos para criar seu primeiro projeto Django:

{% filename %}Terminal{% endfilename %}

    django-admin.py startproject mysite .
    refresh
    

In order to see detailed error messages, you can activate Django debug logs for your Glitch application. Simply add the following at the end of the `mysite/settings.py` file.

{% filename %}mysite/settings.py{% endfilename %}

```python
LOGGING = {
    'version': 1,
    'disable_existing_loggers': False,
    'handlers': {
        'file': {
            'level': 'DEBUG',
            'class': 'logging.FileHandler',
            'filename': 'debug.log',
        },
    },
    'loggers': {
        'django': {
            'handlers': ['file'],
            'level': 'DEBUG',
            'propagate': True,
        },
    },
}
```

This will create a `debug.log` file detailing Django operations and any error messages that might come up, making it much easier to fix if your website does not work.

The initial restarting of the Glitch project should fail. (If you click on the top dropdown button `Show` then click on `In a New Window`, you will receive a `DisallowedHost` error message.) Do not worry about it at this stage, the tutorial will fix this as soon as you update the Django settings of your project in the `mysite/settings.py` file.

### Ambiente Virtual

Um ambiente virtual (também chamado virtualenv) é como uma caixa privada em que podemos colocar código de computador útil em um projeto em que estamos trabalhando. We use them to keep the various bits of code we want for our various projects separate so things don't get mixed up between projects.

Run:

{% filename %}Cloud 9{% endfilename %}

    mkdir djangogirls
    cd djangogirls
    python3 -m venv myvenv
    source myvenv/bin/activate
    pip install django~={{ book.django_version }}
    

(note that on the last line we use a tilde followed by an equal sign: `~=`).

### GitHub

Make a [GitHub](https://github.com) account.

### PythonAnywhere

The Django Girls tutorial includes a section on what is called Deployment, which is the process of taking the code that powers your new web application and moving it to a publicly accessible computer (called a server) so other people can see your work.

This part is a little odd when doing the tutorial on a Chromebook since we're already using a computer that is on the Internet (as opposed to, say, a laptop). However, it's still useful, as we can think of our Cloud 9 workspace as a place for our "in progress" work and Python Anywhere as a place to show off our stuff as it becomes more complete.

Thus, sign up for a new Python Anywhere account at [www.pythonanywhere.com](https://www.pythonanywhere.com).