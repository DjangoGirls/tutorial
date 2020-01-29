Você pode [pular este capítulo](http://tutorial.djangogirls.org/en/installation/#install-python) se não estiver usando um Chromebook. Caso esteja, sua experiência de instalação será um pouco diferente. Você pode ignorar o restante das instruções de instalação.

### IDE na (PaizaCloud Cloud IDE, AWS Cloud9)

O IDE na nuvem é uma ferramenta que fornece um editor de código e acesso a um computador em execução na Internet, onde você pode instalar, gravar e executar software. Pela duração desse tutorial, o IDE na nuvem funcionará como sua * máquina local *. Você ainda estará executando comandos em uma interface de terminal (ou prompt de comando), como suas colegas de oficina no OS X, Ubuntu ou Windows, mas seu prompt estará conectado a um computador remoto configurado pelo Cloud 9. Estas são as instruções para IDEs na nuvem (PaizaCloud Cloud IDE, AWS Cloud9). Você pode escolher uma das IDEs na nuvem e seguir as instruções.

#### IDE na Nuvem PaizaCloud

1. Vá para *PaizaCloud Cloud IDE *
2. Registre-se
3. Clique em *Novo Servidor* e escolha o aplicativo Django
4. Clique no botão Terminal (no lado esquerdo da janela)

Agora você deve ver uma interface com uma barra lateral, botões no canto esquerdo. Clique no botão "Terminal" para abrir a janela de terminal com prompt desta maneira:

{% filename %}Terminal{% endfilename %}

    $
    

O terminal na IDE na nuvem PaizaCloud está pronto para suas instruções. Você pode ajustar o tamanho ou maximizar a janela para torná-la um pouco maior.

#### AWS Cloud9

Atualmente o Cloud 9 requer que você se cadastre com AWS e insira as informações do cartão de crédito.

1. Instale o Cloud 9 através do [Chrome Web Store](https://chrome.google.com/webstore/detail/cloud9/nbdmccoknlfggadpfkmcpnamfnbkmkcp)
2. Acesse [c9.io](https://c9.io) e clique em *Iniciar com AWS Cloud9*
3. Cadastre-se em uma conta AWS (requer informações de cartão de crédito, mas você pode usá-la gratuitamente)
4. No painel de controle da AWS, digite *Cloud9* na barra de pesquisa e clique nele
5. No painel de controle do Cloud 9, click em *Create environment*
6. Nomeie como *django-girls*
7. While configuring settings, select *Create a new instance for environment (EC2)* for "Environment Type" and the *t2.micro* "Instance type" (it should say "Free-tier eligible."). The default cost-saving setting is fine and you can keep the other defaults.
8. Click *Next step*
9. Click *Create environment*

Agora, a sua tela deve exibir uma interface com uma barra lateral, uma grande janela principal com algum texto e uma pequena janela na parte inferior, semelhante a isto:

{% filename %}bash{% endfilename %}

    seunomedeusuário:~/workspace $
    

Essa janela na parte inferior é o seu terminal. Você pode usá-la para enviar instruções para o computador remoto Cloud 9. Se preferir, você pode redimensioná-la para que fique um pouco maior.

### Ambiente Virtual

Um ambiente virtual (também chamado de virtualenv) é como uma caixa privada em que podemos colocar código de computador útil para um projeto em que estejamos trabalhando. Nós os utilizamos para manter separados os vários pedaços de código de nossos diferentes projetos, para que as coisas não se misturem entre eles.

Executar

{% filename %}Cloud 9{% endfilename %}

    mkdir djangogirls
    cd djangogirls
    python3.6 -mvenv myvenv
    source myvenv/bin/activate
    pip install django~={{ book.django_version }}
    

(note que na última linha, utilizamos um til seguido de um sinal de igual: `~=`).

### GitHub

Crie uma conta no [GitHub](https://github.com).

### PythonAnywhere

The Django Girls tutorial includes a section on what is called Deployment, which is the process of taking the code that powers your new web application and moving it to a publicly accessible computer (called a server) so other people can see your work.

Esta parte é um pouco estranha quando o tutorial é feito num Chromebook por que já estamos usando um computador que está na Internet (ao contrário de, digamos, um laptop). However, it's still useful, as we can think of our Cloud 9 workspace as a place for our "in progress" work and Python Anywhere as a place to show off our stuff as it becomes more complete.

Thus, sign up for a new Python Anywhere account at [www.pythonanywhere.com](https://www.pythonanywhere.com).