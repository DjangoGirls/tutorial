> Para os leitores em casa: este capítulo pode ser visto neste vídeo [InstalandoPhyton& EditordeCódigo](https://www.youtube.com/watch?v=pVTaqzKZCdA).
> 
> Esta seção baseia-se em tutoriais da Geek Girls Carrots (https://github.com/ggcarrots/django-carrots)

Django é escrito em Phyton. Precisamos de Phyton para fazer qualquer coisa no Django. Vamos começar instalando o Django! Nós precisamos que você instale o Phyton 3.6, então se você tiver qualquer versão anterior de Phyton, é preciso atualizá-lo.

<!--sec data-title="Install Python: Windows" data-id="python_windows" data-collapse=true ces-->

Primeiro verifique se o computador está executando a versão 32-bit ou a versão 64-bit do Windows. Faça isso pressionando a tecla do windows no seu teclado (aquela com a janela do windows) + a tecla Pause/Break. Feito isso, abrirá uma tela com as informações do seu windows. Nessa tela, verifique a seção "Tipo de sistema" e cheque a versão que está sendo executada. Você pode baixar Phyton para Windoes nesse site: https://www.python.org/downloads/windows/. Clique no link: "Versão Mais Recente Phyton 3 - Phyton x.x.x". Se seu computador está executando a versão **64-bit** do windows, baixe o **instalador executável do Windows x86-64**. Caso contrário, baixe o **instalador executável x86 do Windows**. Depois de baixar o instalador do arquivo, você precisa executá-lo (dando um duplo-clique nele) e seguir as instruções.

One thing to watch out for: During the installation, you will notice a window marked "Setup". Make sure you tick the "Add Python 3.6 to PATH" checkbox and click on "Install Now", as shown here:

![Não se esqueça de adicionar o Python no Path](../python_installation/images/python-installation-options.png)

Nas próximas etapas, você estará usando a linha de comando do Windows (também vamos te explicar tudo sobre isso). Por agora, se você precisar digitar alguns comandos, vá para o Menu Iniciar → → Sistema do Windows → Prompt de Comando. Você também pode clicar na tecla do Windows no seu teclado (aquela com a janela do Windows) e pressionar a tecla "R", até que apareça a janela "Executar". Para abrir a Linha de Comando, digite "cmd" e pressione enter na janela "Executar". (Em versões mais recentes do Windows, você pode ter que procurar "Prompt de Comando", já que às vezes está oculto.)

![Type "cmd" in the "Run" window](../python_installation/images/windows-plus-r.png)

Nota: se você estiver usando uma versão antiga do Windows (7, Vista, ou qualquer versão mais antiga) e o instalador do 3.6. x Python falhar e dar erro, você pode tentar também:

1. install all Windows Updates and try to install Python 3.6 again; or
2. install an [older version of Python](https://www.python.org/downloads/windows/), e.g., [3.4.6](https://www.python.org/downloads/release/python-346/).

If you install an older version of Python, the installation screen may look a bit different than shown above. Make sure you scroll down to see "Add python.exe to Path", then click the button on the left and pick "Will be installed on local hard drive":

![Add Python to the Path, older versions](../python_installation/images/add_python_to_windows_path.png)

<!--endsec-->

<!--sec data-title="Install Python: OS X" data-id="python_OSX"
data-collapse=true ces-->

> **Note** Before you install Python on OS X, you should ensure your Mac settings allow installing packages that aren't from the App Store. Go to System Preferences (it's in the Applications folder), click "Security & Privacy," and then the "General" tab. If your "Allow apps downloaded from:" is set to "Mac App Store," change it to "Mac App Store and identified developers."

Você precisa visitar https://www.python.org/downloads/release/python-361/ e fazer o download do instalador do Python:

* Faça o download do arquivo *Mac OS X 64-bit/32-bit installer*,
* Double click *python-3.6.1-macosx10.6.pkg* to run the installer.

<!--endsec-->

<!--sec data-title="Install Python: Linux" data-id="python_linux"
data-collapse=true ces-->

É muito provável que você já tenha o Python instalado e configurado. Para ter certeza se ele está instalado (e qual a sua versão), abra um terminal e digite o seguinte comando:

{% filename %}command-line{% endfilename %}

    $ python3 --version
    Python 3.6.1
    

Se você tem uma 'micro version' diferente do Python instalado, por exemplo, 3.6.0, então você não precisa atualizar. Se você não tiver o Python instalado, ou se você quiser uma versão diferente, você pode fazer da seguinte maneira:

<!--endsec-->

<!--sec data-title="Install Python: Debian or Ubuntu" data-id="python_debian" data-collapse=true ces-->

Digite o seguinte comando no terminal:

{% filename %}command-line{% endfilename %}

    $ sudo apt install python3.6
    

<!--endsec-->

<!--sec data-title="Install Python: Fedora" data-id="python_fedora"
data-collapse=true ces-->

Use o seguinte comando no terminal:

{% filename %}command-line{% endfilename %}

    $ sudo dnf install python3
    

If you're on older Fedora versions you might get an error that the command `dnf` is not found. In that case, you need to use yum instead.

<!--endsec-->

<!--sec data-title="Install Python: openSUSE" data-id="python_openSUSE"
data-collapse=true ces-->

Use o seguinte comando no terminal:

{% filename %}command-line{% endfilename %}

    $ sudo zypper install python3
    

<!--endsec-->

Verify the installation was successful by opening a command prompt and running the `python3` command:

{% filename %}command-line{% endfilename %}

    $ python3 --version
    Python 3.6.1
    

**NOTE:** If you're on Windows and you get an error message that `python3` wasn't found, try using `python` (without the `3`) and check if it still might be a version of Python 3.6.

* * *

If you have any doubts, or if something went wrong and you have no idea what to do next, please ask your coach! Nem sempre tudo sai como o esperado e é melhor pedir ajuda a alguém mais experimente.