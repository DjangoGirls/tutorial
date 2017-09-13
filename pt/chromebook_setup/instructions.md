Você pode [pular essa seção totalmente](http://tutorial.djangogirls.org/en/installation/#install-python) se você não estiver 
usando um Chromebook. Se você estiver usando, seus passos de instalação serão um pouco diferentes. Você pode ignorar o resto 
das instruções de instalação.

### Cloud 9

Cloud 9 é uma ferramenta que lhe fornece um editor de código e acesso a um
computador rodando na Internet onde você pode instalar, escrever, e rodar
software. Durante esse tutorial, o Cloud 9 irá atuar como sua _máquina local_. 
Você continuará a executar comandos em uma interface de terminal, como seus
companheiros de classe em um OS X, Ubuntu, ou Windows, mas seu terminal 
estará conectado em um computador que está rodando em algum outro lugar, com as
configuraçoes que o Cloud 9 fez para você.

1. Instale o Cloud 9 a partir da [Chrome web store](https://chrome.google.com/webstore/detail/cloud9/nbdmccoknlfggadpfkmcpnamfnbkmkcp)
2. Go to [c9.io](https://c9.io)
3. Registre uma conta
4. Clique em _Create a New Workspace_
5. Nomeie como _django-girls_
6. Selecione o _Blank_ (segundo a direita, na linha de baixo com a logo laranja)

Agora você deve ver uma interface com uma barra lateral, uma grande janela principal com
algum texto, e uma pequena janela embaixo que parece com algo como isso:

{% filename %}Cloud 9{% endfilename %}
```
yourusername:~/workspace $
```

Essa área abaixo é o seu _terminal_, onde você irá encontrar o computador Cloud 9
preparado para suas instruções. você pode redimencionar essa janela para torná-la
um pouco maior.

### Ambiente Virtual

Um ambiente virtual (também chamado de virtualenv) é como uma caixa privada onde nós
podemos colocar códigos de computador úteis para um projeto em que estamos trabalhando.
Nós usamos um ambiente virtual para manter os vários bits de código que nós queremos
usar em nosso projeto em separado, para que as coisas não se misturem entre diferentes 
projetos.

Em seu terminal, na parte de baixo da interface do Cloud 9, execute o seguinte:

{% filename %}Cloud 9{% endfilename %}
```
sudo apt install python3.5-venv
```

Se isso não funcionar, peça uma ajuda ao seu treinador.

Em seguida, execute:

{% filename %}Cloud 9{% endfilename %}
```
mkdir djangogirls
cd djangogirls
python3.5 -mvenv myvenv
source myvenv/bin/activate
pip install django~=1.9.0
```

(note que na última linha nós usamos um "til" seguido de um sinal de igual: ~=).

### Github

Crie uma conta no [Github](https://github.com).

### PythonAnywhere

O tutorial Django Girls inclui uma seção que é chamada Deployment,
que é o processo de pegar o código criado para nossa nova aplicação web e 
movê-lo para um computador de acesso público (chamado de servidor), para
que outras pessoas possam ver o seu trabalho.

Essa parte é um pouco estranha quando o tutorial é feito por um Chromebook,
já que nós já estamos usando um computador que está na Internet (ao contrário de, 
digamos, um laptop). Entretanto, ainda é útil, se nós pudermos pensar em nosso 
ambiente de trabalho no Cloud 9 como um lugar de desenvolvimento de nosso trabalho 
e Python Anywhere como um lugar para exibir nossas coisas assim que elas se 
tornarem mais completas.
 
Sendo assim, registre com uma nova conta em Python Anywhere
[www.pythonanywhere.com](https://www.pythonanywhere.com).
