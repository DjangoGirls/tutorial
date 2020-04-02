> Para leitoras em casa: esse capítulo é abordado no vídeo [Instalando Python & Editor de Código](https://www.youtube.com/watch?v=pVTaqzKZCdA).
> 
> Esta seção baseia-se em tutoriais das Geek Girls Carrots (https://github.com/ggcarrots/django-carrots)

Django é escrito em Python. Precisamos de Python para fazer qualquer coisa no Django. Vamos começar por instalá-lo! Queremos que você instale a versão mais recente do Python 3, então, se você tiver uma versão anterior, precisará atualizá-la. Se você já tem versão 3.4 ou superior, deve estar bem.

Por favor, instale o Python normal da seguinte maneira, mesmo tenha o Anaconda instalado no seu computador.

<!--sec data-title="Install Python: Windows" data-id="python_windows" data-collapse=true ces-->

Primeiramente, verifique se o seu computador está rodando uma versão 32-bit ou 64-bit do Windows, na linha "Tipo de Sistema" na página de informação do Sistema. Para chegar a essa página, tente um desses métodos:

* Aperte as teclas do Windows e "Pause/Break" ao mesmo tempo
* Abra o seu Painel de Controle pelo menu do Windows, e navegue para "Sistema e Segurança", depois "Sistema"
* Aperte o botão do Windows no seu teclado, então navegue para Configurações > Sistema > Sobre

Você pode baixar Python para Windows do site https://www.python.org/downloads/windows/. Clique no link "Versão mais recente do Python 3 - Python x.x.x". Se o seu computador está executando uma versão **64-bit** do Windows, baixe o instalador executável **Windows x86-64**. Caso contrário, baixe o instalador executável **Windows x86**. Depois de baixar o instalador, você deve executá-lo (com clique duplo) e seguir as instruções fornecidas.

Uma coisa para prestar atenção: durante a instalação, você notará uma janela marcada "Setup". Certifique-se de marcar a caixa "Adicionar Python 3.6 ao PATH" ou "Adicionar Python às suas variáveis de ambiente" e clicar em "Instalar Agora", como mostrado aqui (pode aparecer um pouco diferente se você estiver instalando uma outra versão):

![Não se esqueça de adicionar o Python ao Path](../python_installation/images/python-installation-options.png)

Quando a instalação for concluída, pode aparecer uma caixa de diálogo com um link que você pode seguir para saber mais sobre Python ou sobre a versão que instalou. Feche ou cancele essa caixa de diálogo -- você vai aprender mais neste tutorial!

Observação: se você estiver usando uma versão antiga do Windows (7, Vista, ou qualquer outra mais antiga) e o instalador do 3.6. x Python falhar com um erro, você pode tentar:

1. instalar todas as atualizações do Windows e tentar instalar o Python novamente; ou
2. instalar uma [versão mais antiga do Python](https://www.python.org/downloads/windows/), por exemplo, [3.4.6](https://www.python.org/downloads/release/python-346/).

Se você instalar uma versão mais antiga do Python, a tela de instalação pode parecer um pouco diferente da mostrada. Se certifique de rolar o botão do meio do mouse para baixo, até ver "Add python.exe to Path", então clique no botão à esquerda e selecione "Will be installed on local hard drive".

![Adicione o Python ao PATH, versões mais antigas](../python_installation/images/add_python_to_windows_path.png)

<!--endsec-->

<!--sec data-title="Install Python: OS X" data-id="python_OSX"
data-collapse=true ces-->

> **Observação:** Antes de instalar o Python no Mac OS X, você deve garantir que suas configurações permitam a instalação de pacotes que não estejam na App Store. Vá para preferências do sistema (dentro da pasta Aplicativos), clique em "Segurança & Privacidade" e depois na guia "Geral". Se a configuração "Permitir que apps baixados:" estiver definida como "Mac App Store," mude para "Mac App Store e desenvolvedores identificados."

Você precisa visitar https://www.python.org/downloads/release/python-361/ e baixar o instalador do Python:

* Faça o download do arquivo *Mac OS X 64-bit/32-bit installer*,
* Dê um duplo clique no arquivo *python-3.6.1-macosx10.6.pkg* para executar o instalador.

<!--endsec-->

<!--sec data-title="Install Python: Linux" data-id="python_linux"
data-collapse=true ces-->

É muito provável que você já tenha o Python instalado e configurado. Para ter certeza se ele está instalado (e qual a sua versão), abra o terminal e digite o seguinte comando:

{% filename %}command-line{% endfilename %}

    $ python3 --version
    Python 3.6.1
    

Se você tem instalada uma outra "versão micro" do Python, por exemplo, 3.6.0, não precisa atualizá-la. Se você não tem Python instalado, ou se você quer uma versão diferente, primeiro verifique qual distribuição Linux você está usando o seguinte comando:

{% filename %}command-line{% endfilename %}

    $ grep '^NAME=' /etc/os-release
    

Depois, dependendo do resultado, siga um dos seguintes guias de instalação abaixo desta seção.

<!--endsec-->

<!--sec data-title="Install Python: Debian or Ubuntu" data-id="python_debian" data-collapse=true ces-->

Digite o seguinte comando no terminal:

{% filename %}command-line{% endfilename %}

    $ sudo apt install python3
    

<!--endsec-->

<!--sec data-title="Install Python: Fedora" data-id="python_fedora"
data-collapse=true ces-->

Use o seguinte comando no terminal:

{% filename %}command-line{% endfilename %}

    $ sudo dnf install python3
    

Se você estiver em versões mais antigas do Fedora, pode receber um erro dizendo que o comando `dnf` não foi encontrado. Nesse caso, você precisa usar o `yum` em vez disso.

<!--endsec-->

<!--sec data-title="Install Python: openSUSE" data-id="python_openSUSE"
data-collapse=true ces-->

Use o seguinte comando no terminal:

{% filename %}command-line{% endfilename %}

    $ sudo zypper install python3
    

<!--endsec-->

Verifique se a instalação foi bem sucedida abrindo o terminal e digitando o comando `python3`:

{% filename %}command-line{% endfilename %}

    $ python3 --version
    Python 3.6.1
    

A versão mostrada pode ser diferente da versão 3.6.1 -- deve corresponder à versão que você instalou.

**NOTE:** If you're on Windows and you get an error message that `python3` wasn't found, try using `python` (without the `3`) and check if it still might be a version of Python that is 3.4.0 or higher. If that doesn't work either, you may open a new command prompt and try again; this happens if you use a command prompt left open from before the Python installation.

* * *

Se você tem alguma dúvida ou se alguma coisa deu errado e você não tem a menor ideia do que fazer, pergunte à sua monitora! Nem sempre tudo sai conforme o esperado e é melhor pedir ajuda a alguém mais experiente.