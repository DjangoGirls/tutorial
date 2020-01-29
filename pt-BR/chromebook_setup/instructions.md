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
7. Ao configurar, selecione *Criar uma nova instância para o ambiente (EC2)* para "Tipo de Ambiente" e o *t2.micro* "Tipo de Instância" (deve dizer "Free-tier elegíveel."). A configuração padrão de economia de custos está bem e você pode manter o outro padrão.
8. Clique em *Próximo passo*
9. Clique em *Criar ambiente*

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

O tutorial da Django Girls inclui uma seção chamada de Desenvolvimento, que é o processo de mover o código que alimenta sua nova aplicação web para um computador de acesso público (chamado de servidor) para que outras pessoas possam ver o seu trabalho.

Esta parte é um pouco estranha quando o tutorial é feito num Chromebook por que já estamos usando um computador que está na Internet (ao contrário de, digamos, um laptop). However, it's still useful, as we can think of our Cloud 9 workspace as a place for our "in progress" work and Python Anywhere as a place to show off our stuff as it becomes more complete.

Portanto, cadastre-se para uma nova conta Python Anywhere em [www.pythonanywhere.com](https://www.pythonanywhere.com).