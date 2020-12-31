> Para leitoras em casa: esse capítulo é abordado no vídeo [Instalando Python & Editor de Código](https://www.youtube.com/watch?v=pVTaqzKZCdA).
> 
> Esta seção baseia-se em tutoriais das Geek Girls Carrots (https://github.com/ggcarrots/django-carrots)

Django é escrito em Python. Precisamos de Python para fazer qualquer coisa no Django. Vamos começar por instalá-lo! Queremos que você instale a versão mais recente do Python 3, então, se você tiver uma versão anterior, precisará atualizá-la. If you already have version {{ book.py_min_version }} or higher you should be fine.

Por favor, instale o Python normal da seguinte maneira, mesmo tenha o Anaconda instalado no seu computador.

<!--sec data-title="Install Python: Windows" data-id="python_windows" data-collapse=true ces-->

Primeiramente, verifique se o seu computador está rodando uma versão 32-bit ou 64-bit do Windows, na linha "Tipo de Sistema" na página de informação do Sistema. Para chegar a essa página, tente um desses métodos:

* Aperte as teclas do Windows e "Pause/Break" ao mesmo tempo
* Abra o seu Painel de Controle pelo menu do Windows, e navegue para "Sistema e Segurança", depois "Sistema"
* Aperte o botão do Windows no seu teclado, então navegue para Configurações > Sistema > Sobre
* Search the Windows Start menu for "System Information". To do that, click the Start button or press the Windows key, then begin to type `System Information`. Ele começará a fazer sugestões assim que você começar a digitar. Você pode selecionar a sugestão assim que ela aparecer.

Você pode baixar Python para Windows do site https://www.python.org/downloads/windows/. Clique no link "Versão mais recente do Python 3 - Python x.x.x". Se o seu computador está executando uma versão **64-bit** do Windows, baixe o instalador executável **Windows x86-64**. Caso contrário, baixe o instalador executável **Windows x86**. Depois de baixar o instalador, você deve executá-lo (com clique duplo) e seguir as instruções fornecidas.

Uma coisa para prestar atenção: durante a instalação, você notará uma janela marcada "Setup". Make sure you tick the "Add Python {{ book.py_version }} to PATH" or 'Add Python to your environment variables" checkbox and click on "Install Now", as shown here (it may look a bit different if you are installing a different version):

![Não se esqueça de adicionar o Python ao Path](../python_installation/images/python-installation-options.png)

Quando a instalação for concluída, pode aparecer uma caixa de diálogo com um link que você pode seguir para saber mais sobre Python ou sobre a versão que instalou. Feche ou cancele essa caixa de diálogo -- você vai aprender mais neste tutorial!

Note: If you are using an older version of Windows (7, Vista, or any older version) and the Python {{ book.py_version }} installer fails with an error, then install all Windows Updates and try to install Python again. If you still have the error, try installing Python version {{ book.py_min_release }} from [Python.org](https://www.python.org/downloads/windows/).

> Django {{ book.django_version }} needs Python {{ book.py_min_version }} or greater, which does not support Windows XP or earlier versions.

<!--endsec-->

<!--sec data-title="Install Python: OS X" data-id="python_OSX"
data-collapse=true ces-->

> **Note** Before you install Python on OS X, you should ensure your Mac settings allow installing packages that aren't from the App Store. Go to System Preferences (it's in the Applications folder), click "Security & Privacy," and then the "General" tab. If your "Allow apps downloaded from:" is set to "Mac App Store," change it to "Mac App Store and identified developers."

You need to go to the website https://www.python.org/downloads/mac-osx/ and download the latest Python installer:

* Faça o download do arquivo *Mac OS X 64-bit/32-bit installer*,
* Dê um duplo clique no arquivo *python-3.6.1-macosx10.6.pkg* para iniciar a instalação.

<!--endsec-->

<!--sec data-title="Install Python: Linux" data-id="python_linux"
data-collapse=true ces-->

It is very likely that you already have Python installed out of the box. To check if you have it installed (and which version it is), open a console and type the following command:

{% filename %}command-line{% endfilename %}

    $ python3 --version
    Python {{ book.py_release }}
    

If you have a different version of Python installed, at least {{ book.py_min_version }} (e.g. {{ book.py_min_release }}), then you don't have to upgrade. If you don't have Python installed, or if you want a different version, first check what Linux distribution you are using with the following command:

{% filename %}command-line{% endfilename %}

    $ grep '^NAME=' /etc/os-release
    

Afterwards, depending on the result, follow one of the following installation guides below this section.

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
    Python {{ book.py_release }}
    

The version shown may be different from {{ book.py_release }} -- it should match the version you installed.

**NOTE:** If you're on Windows and you get an error message that `python3` wasn't found, try using `python` (without the `3`) and check if it still might be a version of Python that is {{ book.py_min_version }} or higher. If that doesn't work either, you may open a new command prompt and try again; this happens if you use a command prompt left open from before the Python installation.

* * *

If you have any doubts, or if something went wrong and you have no idea what to do next, please ask your coach! Sometimes things don't go smoothly and it's better to ask for help from someone with more experience.