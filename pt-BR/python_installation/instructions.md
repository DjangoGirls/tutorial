> Para leitoras em casa: esse capítulo é abordado no vídeo [Instalando Python & Editor de Código](https://www.youtube.com/watch?v=pVTaqzKZCdA).
> 
> Esta seção baseia-se em tutoriais das Geek Girls Carrots (https://github.com/ggcarrots/django-carrots)

Django é escrito em Python. Precisamos de Python para fazer qualquer coisa no Django. Vamos começar por instalá-lo! Queremos que você instale a versão mais recente do Python 3, então, se você tiver uma versão anterior, precisará atualizá-la. Se você já tem versão 3.4 ou superior, deve estar bem.

Por favor, instale o Python normal da seguinte maneira, mesmo tenha o Anaconda instalado no seu computador.

<!--sec data-title="Install Python: Windows" data-id="python_windows" data-collapse=true ces-->

First check whether your computer is running a 32-bit version or a 64-bit version of Windows, on the "System type" line of the System Info page. To reach this page, try one of these methods:

* Aperte as teclas do Windows e "Pause/Break" ao mesmo tempo
* Abra o seu Painel de Controle pelo menu do Windows, e navegue para "Sistema e Segurança", depois "Sistema"
* Aperte o botão do Windows no seu teclado, então navegue para Configurações > Sistema > Sobre

Você pode baixar Python para Windows do site https://www.python.org/downloads/windows/. Clique no link "Versão mais recente do Python 3 - Python x.x.x". Se o seu computador está executando uma versão **64-bit** do Windows, baixe o instalador executável **Windows x86-64**. Caso contrário, baixe o instalador executável **Windows x86**. Depois de baixar o instalador, você deve executá-lo (com clique duplo) e seguir as instruções fornecidas.

Uma coisa para prestar atenção: durante a instalação, você notará uma janela marcada "Setup". Certifique-se de marcar a caixa "Adicionar Python 3.6 ao PATH" ou "Adicionar Python às suas variáveis de ambiente" e clicar em "Instalar Agora", como mostrado aqui (pode aparecer um pouco diferente se você estiver instalando uma outra versão):

![Don't forget to add Python to the Path](../python_installation/images/python-installation-options.png)

Quando a instalação for concluída, pode aparecer uma caixa de diálogo com um link que você pode seguir para saber mais sobre Python ou sobre a versão que instalou. Feche ou cancele essa caixa de diálogo -- você vai aprender mais neste tutorial!

Note: if you are using an older version of Windows (7, Vista, or any older version) and the Python 3.6.x installer fails with an error, you can try either:

1. install all Windows Updates and try to install Python again; or
2. instalar uma [versão mais antiga do Python](https://www.python.org/downloads/windows/), por exemplo, [3.4.6](https://www.python.org/downloads/release/python-346/).

If you install an older version of Python, the installation screen may look a bit different than shown above. Make sure you scroll down to see "Add python.exe to Path", then click the button on the left and pick "Will be installed on local hard drive":

![Add Python to the Path, older versions](../python_installation/images/add_python_to_windows_path.png)

<!--endsec-->

<!--sec data-title="Install Python: OS X" data-id="python_OSX"
data-collapse=true ces-->

> **Observação:** Antes de instalar o Python no Mac OS X, você deve garantir que suas configurações permitam a instalação de pacotes que não estejam na App Store. Vá para preferências do sistema (dentro da pasta Aplicativos), clique em "Segurança & Privacidade" e depois na guia "Geral". Se a configuração "Permitir que apps baixados:" estiver definida como "Mac App Store," mude para "Mac App Store e desenvolvedores identificados."

You need to go to the website https://www.python.org/downloads/release/python-361/ and download the Python installer:

* Download the *Mac OS X 64-bit/32-bit installer* file,
* Double click *python-3.6.1-macosx10.6.pkg* to run the installer.

<!--endsec-->

<!--sec data-title="Install Python: Linux" data-id="python_linux"
data-collapse=true ces-->

It is very likely that you already have Python installed out of the box. To check if you have it installed (and which version it is), open a console and type the following command:

{% filename %}command-line{% endfilename %}

    $ python3 --version
    Python 3.6.1
    

If you have a different version of Python installed, at least 3.4.0 (e.g. 3.6.0), then you don't have to upgrade. If you don't have Python installed, or if you want a newer version, you can install it as follows:

<!--endsec-->

<!--sec data-title="Install Python: Debian or Ubuntu" data-id="python_debian" data-collapse=true ces-->

Type this command into your console:

{% filename %}command-line{% endfilename %}

    $ sudo apt install python3
    

<!--endsec-->

<!--sec data-title="Install Python: Fedora" data-id="python_fedora"
data-collapse=true ces-->

Use this command in your console:

{% filename %}command-line{% endfilename %}

    $ sudo dnf install python3
    

If you're on older Fedora versions you might get an error that the command `dnf` is not found. In that case, you need to use `yum` instead.

<!--endsec-->

<!--sec data-title="Install Python: openSUSE" data-id="python_openSUSE"
data-collapse=true ces-->

Use this command in your console:

{% filename %}command-line{% endfilename %}

    $ sudo zypper install python3
    

<!--endsec-->

Verify the installation was successful by opening a command prompt and running the `python3` command:

{% filename %}command-line{% endfilename %}

    $ python3 --version
    Python 3.6.1
    

The version shown may be different from 3.6.1 -- it should match the version you installed.

**NOTE:** If you're on Windows and you get an error message that `python3` wasn't found, try using `python` (without the `3`) and check if it still might be a version of Python that is 3.4.0 or higher.

* * *

If you have any doubts, or if something went wrong and you have no idea what to do next, please ask your coach! Sometimes things don't go smoothly and it's better to ask for help from someone with more experience.