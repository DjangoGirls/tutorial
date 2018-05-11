Pots [saltar fins aquesta secció](http://tutorial.djangogirls.org/en/installation/#install-python) si no fas servir un Chromebook. Si el fas servir, La teva experiència d'instal·lació serà una mica diferent. Pots ignorar la resta d'instruccions d'instal·lació.

### Cloud 9

Cloud 9 és una eina que us ofereix un editor de codi i accés a un ordinador funcionant a Internet, on pots instal·lar, escriure i executar el programari. Durant la resta del tutorial, Cloud 9 actuarà com la teva *màquina local*. Estaràs executant comandes a una interfície de terminal com a les teves classes de mates amb OS X, Ubuntu o Windows, però la teva terminal estarà connectada a un ordinador funcionant a alguna altra part que Cloud 9 posa a la teva disposició.

1. Instal·la Cloud 9 desde la [Chrome web store](https://chrome.google.com/webstore/detail/cloud9/nbdmccoknlfggadpfkmcpnamfnbkmkcp)
2. Vés a [c9.io](https://c9.io)
3. Registra't
4. Fes click a *Create a New Workspace*
5. Anomena'l *django-girls*
6. Selecciona el *Blank* (segon per la dreta a la filera inferior amb un logo taronja)

Ara, hauries de veure una interfície amb una barra lateral, una gran finestra principal amb algun text, i una finestra petita a baix, similar a alguna cosa com aquesta:

{% filename %}Cloud 9{% endfilename %}

    yourusername:~/workspace $
    

Aquesta àrea inferior és la teva *terminal*, on li donaràs les instruccions a l'ordinador que Cloud 9 ha preparat per tu. Pots redimensionar aquesta finestra per a fer-la una mica més gran.

### Entorn Virtual

Un entorn virtual (també anomenat virtualenv o virtual environment) és com una caixa privada on podem posar-hi codi de programació molt útil per un projecte en el que estem treballant. Els usem per a mantenir separats els diversos trossos de codi que volem per a diversos projectes, així les coses no es barregen entre projectes.

In your terminal at the bottom of the Cloud 9 interface, run the following:

{% filename %}Cloud 9{% endfilename %}

    sudo apt update
    sudo apt install python3.6-venv
    

If this still doesn't work, ask your coach for some help.

Next, run:

{% filename %}Cloud 9{% endfilename %}

    mkdir djangogirls
    cd djangogirls
    python3.6 -mvenv myvenv
    source myvenv/bin/activate
    pip install django~=1.11.0
    

(note that on the last line we use a tilde followed by an equal sign: ~=).

### Github

Make a [Github](https://github.com) account.

### PythonAnywhere

The Django Girls tutorial includes a section on what is called Deployment, which is the process of taking the code that powers your new web application and moving it to a publicly accessible computer (called a server) so other people can see your work.

This part is a little odd when doing the tutorial on a Chromebook since we're already using a computer that is on the Internet (as opposed to, say, a laptop). However, it's still useful, as we can think of our Cloud 9 workspace as a place or our "in progress" work and Python Anywhere as a place to show off our stuff as it becomes more complete.

Thus, sign up for a new Python Anywhere account at [www.pythonanywhere.com](https://www.pythonanywhere.com).