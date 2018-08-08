> Para leitoras em casa: esse capítulo é aboradado no vídeo [Instalando Python & Editor de Código](https://www.youtube.com/watch?v=pVTaqzKZCdA).
> 
> Esta seção baseia-se em tutoriais da Geek Girls Carrots (https://github.com/ggcarrots/django-carrots)

Django é escrito em Python. Precisamos dele para fazer qualquer coisa no Django. Por isso, vamos começar instalando o Python! Nós precisamos que você instale o Python 3.6. Se você tiver alguma versão mais antiga, é preciso atualizá-la.

<!--sec data-title="Install Python: Windows" data-id="python_windows" data-collapse=true ces-->

Usuárias de Windows: primeiro, verifique se o computador está executando a versão 32-bit ou a versão 64-bit do Windows. Faça isso pressionando a tecla do windows no seu teclado (aquela com a janela do windows) + a tecla Pause/Break. Feito isso, uma tela abrirá com as informações do seu windows. Nessa tela, verifique a seção "Tipo de sistema" e confira que versão está sendo executada. Você pode baixar o Python para Windows no website https://www.python.org/downloads/windows/. Clique no link: "Versão Mais Recente Python 3 - Python x.x.x". Se seu computador está executando a versão **64-bit** do windows, baixe o **instalador executável do Windows x86-64**. Caso contrário, baixe o **instalador executável x86 do Windows**. Depois de baixar o instalador, você precisa executá-lo (dando um duplo-clique nele) e seguir as instruções.

Existe uma coisa com a qual você precisa ter cuidado: durante a instalação, você verá uma janela marcada como "Setup". Certifique-se de selecionar a caixa "Adicionar Python 3.6 ao CAMINHO" e clique em "Instalar agora", conforme mostrado aqui:

![Não se esqueça de adicionar o Python no Path](../python_installation/images/python-installation-options.png)

Nas próximas etapas, você usará a linha de comando do Windows (vamos te explicar tudo sobre isso também). Por enquanto, se você precisa digitar alguns comandos, vá ao menu iniciar e digite "Command Prompt" no campo de busca. (Em versões mais antigas do Windows, é possível iniciar a linha de comando com Start menu → Sistema do Windows → Prompt de comando.) Você também pode segurar a tecla windows + "R" até aparecer a janela "Executar". Para abrir a Linha de Comando, digite "cmd" e pressione enter na janela "Executar".

![Digite "cmd" na janela "Run"](../python_installation/images/windows-plus-r.png)

<0>Observação:</0> se você estiver usando uma versão antiga do Windows (7, Vista, ou qualquer outra mais antiga) e o instalador do 3.6. x Python falhar com um erro, você pode tentar:

1. instalar todas as atualizações do Windows e tentar instalar o Python 3.6 novamente; ou
2. instalar uma [versão mais antiga do Python](https://www.python.org/downloads/windows/), por exemplo, [3.4.6](https://www.python.org/downloads/release/python-346/).

Se você instalar uma versão mais antiga do Python, a tela de instalação pode parecer um pouco diferente da mostrada acima. Certifique-se de rolar até ver a opção "Add python.exe to Path", então clique no botão à esquerda e escolha "Will be installed on local hard drive":

![Adicionar o Python para o caminho, as versões mais antigas](../python_installation/images/add_python_to_windows_path.png)

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
    

Se você estiver em versões mais antigas do Fedora, você pode receber um erro que não se encontra o comando `dnf`. Nesse caso, você precisa usar o yum em vez disso.

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
    

**OBS:** Se você está no Windows e receber a mensagem de erro que `python3` não foi encontrado, tente utilizar `python` (sem o `3`) e verifique se ela corresponde à versão Python 3.6.

* * *

Se você está com alguma dúvida ou se alguma coisa deu errado e você não faz a menor ideia do que fazer, pergunte ao seu instrutor! Nem sempre tudo sai como o esperado e é melhor pedir ajuda a alguém mais experimente.