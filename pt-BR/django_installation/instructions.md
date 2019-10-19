> Esta seção baseia-se em tutoriais da Geek Girls Carrots (https://github.com/ggcarrots/django-carrots).
> 
> Parte deste capítulo é baseada em [tutorial django-marcador](http://django-marcador.keimlink.de/) licenciado sob Creative Commons Attribution-ShareAlike 4.0 International License. O tutorial do django-marcador é protegido por direitos autorais por Markus Zapke-Gründemann et al.

## Ambiente virtual

Antes de instalar o Django, vamos instalar uma ferramenta muito útil para ajudar a manter o ambiente de trabalho no nosso computador organizado. Você pode pular esse passo, mas ele é altamente recomendado. Começar com a melhor instalação possível poupará você de muito trabalho no futuro!

Vamos criar um **ambiente virtual** (também chamado um *virtualenv*). O virtualenv isolará seu código Python/Django em um ambiente organizado por projetos. Isso significa que as alterações que você fizer em um website não afetarão os outros projetos que você estiver desenvolvendo ao mesmo tempo. Legal, né?

Tudo o que você precisa fazer é encontrar o diretório em que você quer criar o `virtualenv`; seu diretório Home, por exemplo. No Windows, pode aparecer como `C:\Users\Name` (onde `Nome` é seu usuário de login).

> ** Observação:** No Windows, certifique-se de que esse diretório não contém palavras acentuadas ou caracteres especias; se o seu usuário contém caracteres acentuados, use um diretório diferente, por exemplo: ` C:\djangogirls`.

Para este tutorial, usaremos um novo diretório `djangogirls` no seu diretório home:

{% filename %}command-line{% endfilename %}

    $ mkdir djangogirls 
    $ cd djangogirls
    

Vamos criar um virtualenv chamado `myvenv`. O formato geral desse comando é:

{% filename %}command-line{% endfilename %}

    $ python3 -m venv myvenv
    

<!--sec data-title="Virtual environment: Windows" data-id="virtualenv_installation_windows"
data-collapse=true ces-->

Para criar um novo `virtualenv`, você deve abrir o terminal e executar `python -m venv myvenv`. Deve ficar assim:

{% filename %}command-line{% endfilename %}

    C:\Users\Name\djangogirls> python -m venv myvenv
    

Onde `myvenv` é o nome do seu `virtualenv`. Você pode usar qualquer outro nome, mas sempre use minúsculas e não use espaços, acentos ou caracteres especiais. Também é uma boa ideia manter o nome curto - você irá referenciá-lo muitas vezes!

<!--endsec-->

<!--sec data-title="Virtual environment: Linux and OS X" data-id="virtualenv_installation_linuxosx"
data-collapse=true ces-->

Podemos criar um `virtualenv` no Linux ou no OS X executando `python3 -m venv myvenv`. Deve ficar assim:

{% filename %}command-line{% endfilename %}

    $ python3 -m venv myvenv
    

`myvenv` é o nome do seu `virtualenv`. Você pode usar qualquer outro nome, mas use sempre letras minúsculas e não use espaços entre as palavras. Também é uma boa ideia manter o nome curto pois você vai escrevê-lo muitas vezes!

> **Observação:** Em algumas versões do Debian/Ubuntu, você pode receber o seguinte erro:
> 
> {% filename %}command-line{% endfilename %}
> 
>     The virtual environment was not created successfully because ensurepip is not available.  On Debian/Ubuntu systems, you need to install the python3-venv package using the following command.
>        apt install python3-venv
>     You may need to use sudo with that command.  After installing the python3-venv package, recreate your virtual environment.
>     
> 
> Caso você receba esse erro, siga as instruções acima e instale o pacote `python3-venv`: {% filename %}command-line{% endfilename %}
> 
>     $ sudo apt install python3-venv
>     
> 
> **Observação:** Em algumas versões do Debian/Ubuntu, iniciar o ambiente virtual com este comando gera o seguinte erro:
> 
> {% filename %}command-line{% endfilename %}
> 
>     Error: Command '['/home/eddie/Slask/tmp/venv/bin/python3', '-Im', 'ensurepip', '--upgrade', '--default-pip']' returned non-zero exit status 1
>     
> 
> Para contornar esse problema, use o comando `virtualenv`.
> 
> {% filename %}command-line{% endfilename %}
> 
>     $ sudo apt install python-virtualenv
>     $ virtualenv --python=python3.6 myvenv
>     
> 
> **Oservação:** Se você obtiver um erro como
> 
> {% filename %}command-line{% endfilename %}
> 
>     E: Unable to locate package python3-venv
>     
> 
> no lugar do comando mostrado acima, execute esse:
> 
> {% filename %}command-line{% endfilename %}
> 
>     sudo apt install python3.6-venv
>     

<!--endsec-->

## Trabalhando com o virtualenv

O comando acima criará um diretório chamado `myvenv` (ou qualquer que seja o nome que você escolheu) que contém o nosso ambiente virtual (basicamente um conjunto de diretórios e arquivos).

<!--sec data-title="Working with virtualenv: Windows" data-id="virtualenv_windows"
data-collapse=true ces-->

Inicie o seu ambiente virtual executando:

{% filename %}command-line{% endfilename %}

    C:\Users\Name\djangogirls> myvenv\Scripts\activate
    

> **Observação:** no Windows 10, você pode obter um erro no Windows PowerShell que diz `execution of scripts is disabled on this system`. Neste caso, abra uma outra janela do Windows PowerShell com a opção de "Executar como Administrador". Assim, execute o comando abaixo antes de iniciar o seu ambiente virtual:
> 
> {% filename %}command-line{% endfilename %}
> 
>     C:\WINDOWS\system32> Set-ExecutionPolicy -ExecutionPolicy RemoteSigned
>         Execution Policy Change
>         The execution policy helps protect you from scripts that you do not trust. Changing the execution policy might expose you to the security risks described in the about_Execution_Policies help topic at http://go.microsoft.com/fwlink/?LinkID=135170. Do you want to change the execution policy? [Y] Yes  [A] Yes to All  [N] No  [L] No to All  [S] Suspend  [?] Help (default is "N"): A
>     
> 
> **NOTE:** For users of the popular editor VS Code, which come with an integrated terminal based off windows powershell, if you wish to stick with the integrated terminal, you may run the following command to activate your virtual environment:
> 
>     $ . myvenv\Scripts\activate.ps1
>     
> 
> The advantage is that you don't have to switch between editor windows and command-line windows

<!--endsec-->

<!--sec data-title="Working with virtualenv: Linux and OS X" data-id="virtualenv_linuxosx"
data-collapse=true ces-->

Inicie o seu ambiente virtual executando:

{% filename %}command-line{% endfilename %}

    $ source myvenv/bin/activate
    

Lembre-se de substituir `myvenv` pelo nome que você escolheu para o `virtualenv`!

> **Observação:** às vezes `source` pode não estar disponível. Nesses casos, tente fazer isso:
> 
> {% filename %}command-line{% endfilename %}
> 
>     $ . myvenv/bin/activate
>     

<!--endsec-->

Você vai saber que tem um `virtualenv` funcionando quando vir que a linha de comando no seu console tem o prefixo `(myvenv)`.

Ao trabalhar em de um ambiente virtual, o comando `python` irá automaticamente se referir à versão correta para que você possa digitar `python` em vez de `python3`.

Pronto, já temos todas as dependências importantes no lugar. Finalmente podemos instalar o Django!

## Instalando o Django

Agora que você tem seu `virtualenv` ativo, pode instalar o Django.

Antes de fazer isto, devemos garantir que temos instalada a última versão do `pip`, que é o software que usamos para instalar o Django:

{% filename %}command-line{% endfilename %}

    (myvenv) ~$ python -m pip install --upgrade pip
    

### Instalando pacotes com requisitos

O arquivo "requirements.txt" guarda as depenências que serão instaladas utilizando o `pip install`:

Primeiro, crie um arquivo `requirements.txt` dentro da sua pasta `djangogirls/` usando o editor de código que você instalou mais cedo. Para fazer isso, abra um novo arquivo no editor e salve-o como `requirements.txt` na pasta `djangogirls`. O seu diretório vai parecer com isso:

    djangogirls
    ├── myvenv
    │   └── ...
    └───requirements.txt
    

E adicione o seguinte texto ao arquivo `djangogirls/requirements.txt`:

{% filename %}djangogirls/requirements.txt{% endfilename %}

    Django~={{ book.django_version }}
    

Agora, execute `pip install -r requirements.txt` para instalar o Django.

{% filename %}command-line{% endfilename %}

    (myvenv) ~$ pip install -r requirements.txt
    Collecting Django~={{ book.django_version }} (from -r requirements.txt (line 1))
      Downloading Django-{{ book.django_version }}-py3-none-any.whl (7.1MB)
    Installing collected packages: Django
    Successfully installed Django-{{ book.django_version }}
    

<!--sec data-title="Installing Django: Windows" data-id="django_err_windows"
data-collapse=true ces-->

> If you get an error when calling pip on Windows platform, please check if your project pathname contains spaces, accents or special characters (for example, `C:\Users\User Name\djangogirls`). If it does, please consider using another place without spaces, accents or special characters (suggestion: `C:\djangogirls`). Create a new virtualenv in the new directory, then delete the old one and try the above command again. (Moving the virtualenv directory won't work since virtualenv uses absolute paths.)

<!--endsec-->

<!--sec data-title="Installing Django: Windows 8 and Windows 10" data-id="django_err_windows8and10"
data-collapse=true ces-->

> Your command line might freeze after when you try to install Django. If this happens, instead of the above command use:
> 
> {% filename %}command-line{% endfilename %}
> 
>     C:\Users\Name\djangogirls> python -m pip install -r requirements.txt
>     

<!--endsec-->

<!--sec data-title="Installing Django: Linux" data-id="django_err_linux"
data-collapse=true ces-->

> If you get an error when calling pip on Ubuntu 12.04 please run `python -m pip install -U --force-reinstall pip` to fix the pip installation in the virtualenv.

<!--endsec-->

É isto! Você agora (finalmente) está pronta para criar uma aplicação Django!