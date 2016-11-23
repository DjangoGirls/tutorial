# Instalação do Django

> Parte deste capítulo é baseado nos tutoriais do Geek Girls Carrots (https://github.com/ggcarrots/django-carrots).
> 
> Parte deste capítulo é baseado no [django-marcador tutorial][1] licenciado sobre Creative Commons Attribution-ShareAlike 4.0 International License. O tutorial do django-marcador é protegido por direitos autorais por Markus Zapke-Gründemann et al.

 [1]: http://django-marcador.keimlink.de/

## Ambiente virtual

Antes de instalarmos o Django, nós iremos instalar uma ferramenta extremamente útil que irá ajudar a manter seu ambiente de desenvolvimento arrumado em seu computador. É possível ignorar este passo, mas ele é altamente recomendado. Começar com a melhor configuração possível te salvará de muitos problemas no futuro!

Então, vamos criar um **ambiente virtual**(também chamado um *virtualenv*). Isso isolará sua configuração Python/Django em uma base por projeto, significa que quaisquer mudanças que fizer em um website não afetará quaisquer outras aplicações que estiver desenvolvendo a parte. Arrumado, certo?

Tudo o que você precisa fazer é encontrar um diretório no qual você deseja criar o `virtualenv`; Seu diretório Home, por exemplo. No Windows pode parecer como `C:\Usuário\Nome` (onde `Nome` é o nome do seu login).

Para este tutorial usaremos um novo diretório`djangogirls` do seu diretório home:

    mkdir djangogirls
    cd djangogirls
    

Nós vamos fazer um virtualenv chamado `myvenv`. O formato geral desse comando é:

    python3 -m venv myvenv
    

### Windows

Para criar um novo `virtualenv`, você precisa abrir o console(Nós falamos sobre isso alguns capítulos atrás, lembra-se?) e executar `C:\Python34\python -m venv myvenv`. Será algo parecido com isto:

    C:\Usuário\Nome\djangogirls> C:\Python34\python -m venv myvenv
    

onde `C:\Python34\python` é o diretório em que você previamente instalou Python e `myvenv` é o nome da sua `virtualenv`. Você pode usar qualquer outro nome, mas sempre use minúsculas e sem espaços, acentos ou caracteres especiais. Também é uma boa ideia manter o nome curto - você irá referenciar muito a ele!

### Linux e OS X

Criar um `virtualenv` tanto no Linux como OS X é simples como executar `python3 -m venv myvenv`. Será algo parecido com isto:

    ~/djangogirls$ python3 -m venv myvenv
    

`myvenv` é o nome da sua `virtualenv`. Você pode usar qualquer outro nome, mas permaneça em caixa baixa(minúsculas) e não use espaços entre os nomes. Também é uma boa ideia manter o nome curto - você irá referenciar muito a ele!

> **NOTA:**Iniciar o ambiente virtual no Ubuntu 14.04 assim retornará o seguinte erro:
> 
>     Error: Command '['/home/eddie/Slask/tmp/venv/bin/python3', '-Im', 'ensurepip', '--upgrade', '--default-pip']' returned non-zero exit status 1
>     
> 
> Para contornar esse problema, use o comando `virtualenv`.
> 
>     ~/djangogirls$ sudo apt-get install python-virtualenv
>     ~/djangogirls$ virtualenv --python=python3.4 myvenv
>     

## Trabalhando com o virtualenv

O comando acima criará um diretório chamado `myvenv` (ou seja o nome que você escolheu) que contém o nosso ambiente virtual(basicamente um conjunto de diretórios e arquivos). Tudo o que queremos por enquanto é iniciá-lo executando:

    C:\Usuário\Nome\djangogirls> myvenv\Scripts\activate
    

no Windows, ou:

    ~/djangogirls$ source myvenv/bin/activate
    

no OS X e no Linux.

Lembre-se de substituir `myvenv` com seu nome escolhido do `virtualenv`!

> **NOTE:** às vezes `source(fonte)` pode não estar disponível. Nesses casos, tente fazer isso:
> 
>     ~/djangogirls$ . myvenv/bin/activate
>     

Você vai saber que tem um `virtualenv` funcionando quando ver o prompt no seu console se parecer com:

    (myvenv) C:\Usuário\Nome\djangogirls>
    

ou:

    (myvenv) ~/djangogirls$
    

Perceba que o prefixo `(myvenv)` aparece!

Ao trabalhar dentro de um ambiente virtual, `python` irá automaticamente se referir a versão correta para que possa utilizar `python` em vez de `python3`.

Ok, nós temos todas as dependências importantes no lugar. Finalmente podemos instalar o Django!

## Instalando o Django

Agora que você tem a sua `virtualenv` iniciado, você pode instalar Django usando `pip`. No console, execute `pip install django==1.8.5` (Perceba que usamos um duplo sinal de igual: `==`).

    (myvenv) ~$ pip install django==1.8.5
    Downloading/unpacking django==1.8.5
    Installing collected packages: django
    Successfully installed django
    Cleaning up...
    

no Windows

> Se você receber um erro ao chamar o pip na plataforma Windows por favor, verifique se o caminho do projeto contém espaços, acentos ou caracteres especiais (exemplo, `C:\Users\User Name\djangogirls`). Se sim por favor mova para outro lugar sem espaços, acentos ou caracteres especiais (sugestão é: `C:\djangogirls`). Após a mudança, por favor tente novamente o comando acima.

No Linux

> Se você receber um erro ao chamar pip no Ubuntu 12.04 por favor execute `python -m pip install -U --force-reinstall pip` para corrigir a instalação do pip no virtualenv.

É isso! Agora você está (finalmente) pronto para criar uma aplicação Django!
