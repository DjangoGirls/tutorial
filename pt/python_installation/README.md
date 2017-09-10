# Vamos começar com Python

Finalmente chegamos aqui!

Mas primeiro, vamos falar um pouco sobre o que o Python é. Python é uma linguagem de programação muito popular que pode ser usada para criar sites, jogos, softwares científicos, gráficos e muito, muito mais.

O Python é originário da década de 1980 e seu principal objetivo é ser legível por seres humanos (não apenas máquinas!), por isso ele parece muito mais simples do que outras linguagens de programação. Isso faz ele mais fácil de aprender, mas não se engane, Python também é muito poderoso!

# Instalação do Python

> Este subcapítulo é baseado em um tutorial criado por Geek Girls Carrots (https://github.com/ggcarrots/django-carrots)

Django é escrito em Python. Nós precisamos dele para fazer qualquer coisa em Django. Vamos começar com sua instalação! Nós queremos que você instale o Python 3.4, então se você tem qualquer versão anterior, você vai precisar atualizá-la.

<!--sec data-title="Windows" data-id="python_windows" data-collapse=true ces-->
Primeiro, verifique se seu computador está executando uma versão 32-bit ou 64-bit do Windows, apertando a tecla Windows + tecla Pause/Break. Vai abrir uma janela com as informações do seu sistema. Procure pela linha "Tipo de sistema" ou "Sistema Operacional". Você pode baixar Python para Windows do website https://www.python.org/downloads/windows/. 

Se seu computador está executando uma versão **32-bit** do Windows, escolha o arquivo **Windows x86 executable installer**. 

Se seu computador está executando uma versão **64-bit** do Windows, escolha **Windows x86-64 executable installer**.

Depois de fazer o download do arquivo ***.exe**, você precisa executá-lo (dando um duplo-clique nele) e seguir as instruções. **Cuidado com uma coisa**: na segunda tela do assistente de instalação, marcado "Customize", certifique-se você rolar para baixo e escolha a opção "Add python.exe to Path", então, clique no botão esquerdo do mouse e selecione "Will be installed on local hard drive", como em:

![Não se esqueça de adicionar o Python para o Path][1]

 [1]: images/add_python_to_windows_path.png

É importante lembrar o caminho (a pasta) onde você instalou o Python. Ela será útil depois!

Nos próximos passos, você estará usando a Linha de Comando do Windows (sobre a qual também vamos lhe falar sobre). Por enquanto, se você precisar digitar alguns comandos, em "Menu Iniciar → Todos os programas → Acessórios → Prompt de Comando". Uma alternativa é segurar a tecla Windows pressionada enquanto aperta "R" até que a janela "Executar" aparecer. Para abrir a linha de comando dessa forma, escreva "cmd" e pressione Enter, na janela do Executar. (Em versões mais novas do Windows, você pode ter de procurar por "Prompt de Comando", que às vezes está escondido.)

Nota: se você está usando uma versão mais antiga do Windows (7, Vista ou qualquer anterior) e tiver erro na instalação, verifique o Windows Update e certifique-se que seu sistema está com todas atualizações disponíveis instaladas.

<!--endsec-->

### Linux

<!--sec data-title="Linux" data-id="python_linux"
data-collapse=true ces-->
É muito provável que você já tenha o Python instalado e configurado. Para ter certeza se ele está instalado (e qual a sua versão), abra um terminal e digite o seguinte comando:


{% filename %}command-line{% endfilename %}
```
$ python3 --version
Python 3.4.2
```

Se você não tem o Python instalado ou quer uma versão diferente, você pode instalá-lo da seguinte maneira:

<!--endsec-->

<!--sec data-title="Debian or Ubuntu" data-id="python_debian"
data-collapse=true ces-->

#### Ubuntu

Digite o seguinte comando no terminal:

{% filename %}command-line{% endfilename %}
```
$ sudo apt-get install python3.5
```    
<!--endsec-->

<!--sec data-title="Fedora (up to 21)" data-id="python_fedora"
data-collapse=true ces-->
#### Fedora

Use o seguinte comando no terminal:

{% filename %}command-line{% endfilename %}
```
$ sudo yum install python3
```
<!--endsec-->

<!--sec data-title="Fedora (22+)" data-id="python_fedora22"
data-collapse=true ces-->

{% filename %}command-line{% endfilename %}
```
$ sudo dnf install python3
```

<!--endsec-->

<!--sec data-title="openSUSE" data-id="python_openSUSE"
data-collapse=true ces-->

#### openSUSE

Use o seguinte comando no terminal:

    sudo zypper install python3
<!--endsec-->    

<!--sec data-title="OS X" data-id="python_OSX"
data-collapse=true ces-->
### OS X

> **Nota**: Antes de instalar Python no OS X, certifique-se que as configurações do seu Mac permitem que você instale pacotes que não sejam da App Store. Vá em Preferências do Sistema (na pasta de Aplicações), clique em "Segurança & Privacidade" e, então, na aba "Geral". Se a sua opção "Permitir apps baixadas de:" está especificada apenas "Mac App Store", mude para "Mac App Store e desenvolvedores identificados"

Você precisa acessar o site https://www.python.org/downloads/release/python-342/ e baixar o instalador do Python:

*   download do *instalador Mac OS X 64-bit/32-bit* *DMG*,
*   Dê um duplo-clique para abri-lo,
*   Dê um duplo-clique no *Python.mpkg* para executar o instalador.
<!--endsec-->    

Verifique se a instalação foi bem sucedida abrindo o *Terminal* e digitando o comando `python3`:

    $ python3 --version
    Python 3.4.2

**NOTA:** Se você está no Windows e receber a mensagem que `python3` não foi encontrado, tente usar `python` (sem o `3`) e verifique se ainda assim vai ser uma versão do Python 3.


* * *

Se você tiver qualquer dúvida ou se alguma coisa deu errado e você não sabe o que fazer - por favor pergunte a sua treinadora ou treinador! Às vezes, as coisas não ocorrem como o esperado e é melhor pedir ajuda a alguém com mais experiência.
