> Esta seção baseia-se em tutoriais da Geek Girls Carrots (https://github.com/ggcarrots/django-carrots).
> 
> Part of this section is based on the [django-marcador tutorial](http://django-marcador.keimlink.de/) licensed under the Creative Commons Attribution-ShareAlike 4.0 International License. O tutorial do django-marcador é protegido por direitos autorais por Markus Zapke-Gründemann et al.

## Ambiente virtual

Antes de instalarmos o Django, vamos instalar uma ferramenta muito útil para ajudar a manter nosso ambiente de trabalho organizado no nosso computador. Você pode pular esse passo, mas ele é altamente recomendado. Iniciar com a melhor instalação possível salvará você de muito trabalho no futuro!

Então, vamos criar um **ambiente virtual**(também chamado um *virtualenv*). O virtualenv irá isolar seu código Python/Django em um ambiente "por projeto". Isso significa que qualquer alteração que você fizer em um website não afetará os outros que você também estiver desenvolvendo. Legal, certo?

Tudo o que você precisa fazer é encontrar um diretório no qual você deseja criar o `virtualenv`; seu diretório Home, por exemplo. No Windows, pode aparecer como `C:\Users\Nome` (onde `Nome` é seu usuário de login).

> ** Nota:** No Windows, certifique-se de que esse diretório não contém palavras acentuadas ou caracteres especias; se o seu usuário contém caracteres acentuados, use um diretório diferente, por exemplo: ` C:\djangogirls`.

Para este tutorial usaremos um novo diretório`djangogirls` do seu diretório home:

{% filename %}command-line{% endfilename %}

    $ mkdir djangogirls 
    $ cd djangogirls
    

Nós vamos fazer um virtualenv chamado `meuenv`. O formato geral desse comando é:

{% filename %}command-line{% endfilename %}

    $ python3 -m venv myvenv
    

<!--sec data-title="Virtual environment: Windows" data-id="virtualenv_installation_windows"
data-collapse=true ces-->

To create a new `virtualenv`, you need to open the command prompt and run `python -m venv myvenv`. It will look like this:

{% filename %}command-line{% endfilename %}

    C:\Users\Name\djangogirls> python -m venv myvenv
    

Where `myvenv` is the name of your `virtualenv`. Você pode usar qualquer outro nome, mas sempre use minúsculas e sem espaços, acentos ou caracteres especiais. It is also good idea to keep the name short – you'll be referencing it a lot!

<!--endsec-->

<!--sec data-title="Virtual environment: Linux and OS X" data-id="virtualenv_installation_linuxosx"
data-collapse=true ces-->

We can create a `virtualenv` on both Linux and OS X by running `python3 -m venv myvenv`. It will look like this:

{% filename %}command-line{% endfilename %}

    $ python3 -m venv myvenv
    

`myvenv` é o nome do seu `virtualenv`. Você pode usar qualquer outro nome, mas permaneça em caixa baixa(minúsculas) e não use espaços entre os nomes. It is also a good idea to keep the name short as you'll be referencing it a lot!

> **NOTA:** Em algumas versões do Debian/Ubuntu, você pode receber o seguinte erro:
> 
> {% filename %}command-line{% endfilename %}
> 
>     O ambiente virtual não foi criado com êxito, porque o ensurepip não está disponível.  Em sistemas Debian/Ubuntu, você precisa instalar o pacote python3-venv usando o comando a seguir.
>        apt install python3-venv
>     You may need to use sudo with that command.  Depois de instalar o pacote python3-venv, recrie seu ambiente virtual.
>     
> 
> In this case, follow the instructions above and install the `python3-venv` package: {% filename %}command-line{% endfilename %}
> 
>     $ sudo apt install python3-venv
>     
> 
> **NOTE:** On some versions of Debian/Ubuntu initiating the virtual environment like this currently gives the following error:
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
> **NOTE:** If you get an error like
> 
> {% filename %}command-line{% endfilename %}
> 
>     E: Unable to locate package python3-venv
>     
> 
> then instead run:
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

    C:\Usuário\Nome\djangogirls> myvenv\Scripts\activate
    

> **NOTE:** on Windows 10 you might get an error in the Windows PowerShell that says `execution of scripts is disabled on this system`. In this case, open another Windows PowerShell with the "Run as Administrator" option. Then try typing the following command before starting your virtual environment:
> 
> {% filename %}command-line{% endfilename %}
> 
>     C:\WINDOWS\system32> Set-ExecutionPolicy -ExecutionPolicy RemoteSigned
>         Execution Policy Change
>         The execution policy helps protect you from scripts that you do not trust. Changing the execution policy might expose you to the security risks described in the about_Execution_Policies help topic at http://go.microsoft.com/fwlink/?LinkID=135170. Do you want to change the execution policy? [Y] Yes  [A] Yes to All  [N] No  [L] No to All  [S] Suspend  [?] Help (default is "N"): A
>     

<!--endsec-->

<!--sec data-title="Working with virtualenv: Linux and OS X" data-id="virtualenv_linuxosx"
data-collapse=true ces-->

Inicie o seu ambiente virtual executando:

{% filename %}command-line{% endfilename %}

    $ source myvenv/bin/activate
    

Lembre-se de substituir `myvenv` com seu nome escolhido do `virtualenv`!

> **NOTE:** às vezes `source` pode não estar disponível. Nesses casos, tente fazer isso em vez disso:
> 
> {% filename %}command-line{% endfilename %}
> 
>     $ . myvenv/bin/activate
>     

<!--endsec-->

Você vai saber que tem um `virtualenv` funcionando quando ver sua linha de comando no seu console ter o prefixo `(myvenv)`.

Ao trabalhar dentro de um ambiente virtual, `python` irá automaticamente se referir a versão correta para que possa utilizar `python` em vez de `python3`.

Ok, nós temos todas as dependências importantes no lugar. Finalmente podemos instalar o Django!

## Instalando o Django

Now that you have your `virtualenv` started, you can install Django.

Before we do that, we should make sure we have the latest version of `pip`, the software that we use to install Django:

{% filename %}command-line{% endfilename %}

    (myvenv) ~$ python3 -m pip install --upgrade pip
    

### Installing packages with requirements

A requirements file keeps a list of dependencies to be installed using `pip install`:

First create a `requirements.txt` file inside of `djangogirls/` folder:

    djangogirls
    └───requirements.txt
    

In your `djangogirls/requirements.txt` file you should add the following text:

{% filename %}djangogirls/requirements.txt{% endfilename %}

    Django=={{ book.django_version }}
    

Now, run `pip install -r requirements.txt` to install Django.

{% filename %}command-line{% endfilename %}

    (myvenv) ~$ pip install -r requirements.txt
    Collecting Django=={{ book.django_version }} (from -r requirements.txt (line 1))
      Downloading Django-{{ book.django_version }}-py3-none-any.whl (7.1MB)
    Installing collected packages: Django
    Successfully installed Django-{{ book.django_version }}
    

<!--sec data-title="Installing Django: Windows" data-id="django_err_windows"
data-collapse=true ces-->

> If you get an error when calling pip on Windows platform, please check if your project pathname contains spaces, accents or special characters (for example, `C:\Users\User Name\djangogirls`). If it does, please consider using another place without spaces, accents or special characters (suggestion: `C:\djangogirls`). Criar um novo virtualenv no novo diretório, em seguida exclua o velho e tente novamente o comando acima. (Mover o diretório de virtualenv não vai funcionar pois o virtualenv usa caminhos absolutos.)

<!--endsec-->

<!--sec data-title="Installing Django: Windows 8 and Windows 10" data-id="django_err_windows8and10"
data-collapse=true ces-->

> Sua linha de comando pode congelar depois de você tentar instalar o Django. Neste caso, ao invés do comando acima use:
> 
> {% filename %}command-line{% endfilename %}
> 
>     C:\Users\Name\djangogirls> python -m pip install -r requirements.txt
>     

<!--endsec-->

<!--sec data-title="Installing Django: Linux" data-id="django_err_linux"
data-collapse=true ces-->

> Se você receber um erro ao chamar pip no Ubuntu 12.04 por favor execute `python -m pip install -U --force-reinstall pip` para corrigir a instalação do pip no virtualenv.

<!--endsec-->

That's it! You're now (finally) ready to create a Django application!