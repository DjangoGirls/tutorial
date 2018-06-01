> Parte deste capítulo é baseado nos tutoriais do Geek Girls Carrots (https://github.com/ggcarrots/django-carrots).
>
> Parte deste capítulo é baseado no [django-marcador
tutorial](http://django-marcador.keimlink.de/) licenciado sobre Creative Commons Attribution-ShareAlike 4.0 International License. O tutorial do django-marcador é protegido por direitos autorais por Markus Zapke-Gründemann et al.

 ## Ambiente virtual

Antes de instalarmos o Django, nós iremos instalar uma ferramenta extremamente útil que irá ajudar a manter seu ambiente de desenvolvimento arrumado em seu computador. É possível ignorar este passo, mas ele é altamente recomendado. Começar com a melhor configuração possível te salvará de muitos problemas no futuro!

Então, vamos criar um **ambiente virtual**(também chamado um *virtualenv*). Isso isolará sua configuração Python/Django em uma base por projeto, significa que quaisquer mudanças que fizer em um website não afetará quaisquer outras aplicações que estiver desenvolvendo a parte. Arrumado, certo?

Tudo o que você precisa fazer é encontrar um diretório no qual você deseja criar o `virtualenv`; Seu diretório Home, por exemplo. No Windows pode parecer como `C:\Usuário\Nome` (onde `Nome` é o nome do seu login).

> __NOTA:__ No Windows, certifique-se que esse diretório  não contenha acento ou caracteres especiais; se o seu nome de
usuário contém caracteres de acento, use um diretório diferente, como por exemplo: `C:\djangogirls`.

Para este tutorial usaremos um novo diretório `djangogirls` dentro do seu diretório home:

{% filename %}command-line{% endfilename %}
```
$ mkdir djangogirls
$ cd djangogirls
```

Nós vamos fazer um virtualenv chamado `myvenv`. O formato geral desse comando é:

{% filename %}command-line{% endfilename %}
```
$ python3 -m venv myvenv
```
<!--sec data-title="Windows" data-id="virtualenv_installation_windows"
data-collapse=true ces-->

Para criar um novo `virtualenv`, você precisa abrir o console(Nós falamos sobre isso alguns capítulos atrás, lembra-se?) e executar `C:\Python35\python -m venv myvenv`. Será algo parecido com isto:

{% filename %}command-line{% endfilename %}
```
C:\Users\Name\djangogirls> C:\Python35\python -m venv myvenv
```

onde `C:\Python35\python` é o diretório em que você previamente instalou Python e `myvenv` é o nome da sua `virtualenv`. Você pode usar qualquer outro nome, mas sempre use minúsculas e sem espaços, acentos ou caracteres especiais. Também é uma boa ideia manter o nome curto - você irá referenciar muito a ele!

<!--endsec-->

<!--sec data-title="Linux and OS X" data-id="virtualenv_installation_linuxosx"
data-collapse=true ces-->

Criar um `virtualenv` tanto no Linux como OS X é tão simples quanto executar `python3 -m venv myvenv`. Será algo parecido com isto:

{% filename %}command-line{% endfilename %}
```
$ python3 -m venv myvenv
```

`myvenv` é o nome da sua `virtualenv`. Você pode usar qualquer outro nome, mas sempre use minúsculas e não use espaços entre os nomes. Também é uma boa ideia manter o nome curto - você irá referenciar muito a ele!

> __NOTA:__ Em algumas versões do Debian/Ubuntu você pode se depara com o seguinte erro:

> {% filename %}command-line{% endfilename %}
>```
> The virtual environment was not created successfully because ensurepip is not available.  On Debian/Ubuntu systems, you need to install the python3-venv package using the following command.
>    apt install python3-venv
> You may need to use sudo with that command.  After installing the python3-venv package, recreate your virtual environment.
>```
>
> Nesse caso, siga as instruções acima e instale o pacote `python3-venv`:
>{% filename %}command-line{% endfilename %}
>```
>$ sudo apt install python3-venv
>```

> __NOTA:__ Em algumas versões do Debian/Ubuntu inicializar o ambiente virtual dessa forma retorna o seguinte erro:

>{% filename %}command-line{% endfilename %}
>```
>Error: Command '['/home/eddie/Slask/tmp/venv/bin/python3', '-Im', 'ensurepip', '--upgrade', '--default-pip']' returned non-zero exit status 1
>```

> Para contornar isso, use o comando `virtualenv` em seu lugar.

>{% filename %}command-line{% endfilename %}
>```
>$ sudo apt install python-virtualenv
>$ virtualenv --python=python3.5 myvenv
>```

> __NOTA:__ Se você teve um erro como

>{% filename %}command-line{% endfilename %}
>```
>E: Unable to locate package python3-venv
>```

> então execute:
>
>{% filename %}command-line{% endfilename %}
>```
>sudo apt install python3.5-venv
>```

<!--endsec-->

## Trabalhando com o virtualenv

O comando acima criará um diretório chamado `myvenv` (ou qualquer nome que você tenha escolhido) que contém o nosso ambiente virtual(basicamente um conjunto de diretórios e arquivos)

<!--sec data-title="Windows" data-id="virtualenv_windows"
data-collapse=true ces-->

Inicie seu ambiente virtual executando:

{% filename %}command-line{% endfilename %}
```
C:\Users\Name\djangogirls> myvenv\Scripts\activate
```

 > __NOTA:__ No Windows 10 você pode ter um erro no Windows PowerShell que diz `execution of scripts is disabled on this system`. Nesse caso, abra outro Windows PowerShell com a opção "Run as Administrator".  E então tente digitar o seguinte
 comando antes de iniciar seu ambiente virtual:
>
>{% filename %}command-line{% endfilename %}
>```
>C:\WINDOWS\system32> Set-ExecutionPolicy -ExecutionPolicy RemoteSigned
>     Execution Policy Change
>     The execution policy helps protect you from scripts that you do not trust. Changing the execution policy might expose you to the security risks described in the about_Execution_Policies help topic at http://go.microsoft.com/fwlink/?LinkID=135170. Do you want to change the execution policy? [Y] Yes  [A] Yes to All  [N] No  [L] No to All  [S] Suspend  [?] Help (default is "N"): A
>```

<!--endsec-->  

<!--sec data-title="Linux and OS X" data-id="virtualenv_linuxosx"
data-collapse=true ces-->

Inicie seu ambiente virtual executando:

{% filename %}command-line{% endfilename %}
```
$ source myvenv/bin/activate
```

Lembre-se de substituir `myvenv` com seu nome escolhido do `virtualenv`!

> **NOTE:** às vezes `source(fonte)` pode não estar disponível. Nesses casos, tente fazer isso:
>
>{% filename %}command-line{% endfilename %}
>```
>$ . myvenv/bin/activate
>```

<!--endsec-->

Você vai saber que tem um `virtualenv` funcionando quando ver o prompt no seu console com o prefixo `(myenv)`:

Ao trabalhar dentro de um ambiente virtual, `python` irá automaticamente se referir a versão correta para que possa utilizar `python` em vez de `python3`.

Ok, nós temos todas as dependências importantes no lugar. Finalmente podemos instalar o Django!

## Instalando o Django

Agora que você tem a sua `virtualenv` iniciada, você pode instalar Django.

Antes de nós fazermos isso, nós devemos ter certeza que temos a última versão do `pip`, o software que nós usamos para instalar
o Django:

{% filename %}command-line{% endfilename %}
```
(myvenv) ~$ python3 -m pip install --upgrade pip
```

E então execute `pip install django~=1.9.0` (note que nós usamos um til seguido por um sinal de igual: `~=`) para instalar
o Django.

{% filename %}command-line{% endfilename %}
```
(myvenv) ~$ pip install django~=1.9.0
Downloading/unpacking django==1.9
Installing collected packages: django
Successfully installed django
Cleaning up...
```

<!--sec data-title="Windows" data-id="django_err_windows"
data-collapse=true ces-->

>Se você receber um erro ao chamar o pip na plataforma Windows por favor, verifique se o caminho do projeto contém espaços, acentos ou caracteres especiais (exemplo, `C:\Users\User Name\djangogirls`). Se sim, por favor considere usar outro lugar sem espaços, acentos ou caracteres especiais (sugestão é: `C:\djangogirls`). Crie um novo virtualenv no diretório novo, então
remova o diretório antigo e tente o comando acima novamente. (Mover o diretório virtualenv não funciona já que o virtualenv usa
caminhos absolutos.)

<!--endsec-->

<!--sec data-title="Windows 8 and Windows 10" data-id="django_err_windows8and10"
data-collapse=true ces-->

> Sua linha de comando pode congelar depois de você tentar instalar o Django. Se isso acontecer, ao invés do comando acima use:
>
>{% filename %}command-line{% endfilename %}
>```
>C:\Users\Name\djangogirls> python -m pip install django~=1.9.0
>```

<!--endsec-->

<!--sec data-title="Linux" data-id="django_err_linux"
data-collapse=true ces-->

> Se você receber um erro ao chamar pip no Ubuntu 12.04 por favor execute `python -m pip install -U --force-reinstall pip` para corrigir a instalação do pip no virtualenv.

<!--endsec-->

É isso! Agora você está (finalmente) pronta para criar uma aplicação Django!
