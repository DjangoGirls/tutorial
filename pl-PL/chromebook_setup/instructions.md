Możesz [pominąć tę sekcję](http://tutorial.djangogirls.org/en/installation/#install-python), jeżeli nie używasz Chromebooka. W przeciwnym wypadku, proces instalacji będzie wyglądał nieco inaczej. Możesz zignorować pozostałe elementy instrukcji dotyczące instalacji.

### Cloud IDE (PaizaCloud Cloud IDE, AWS Cloud9)

Cloud IDE jest narzędziem, które pełni funkcję edytora kodu oraz umożliwia dostęp do komputera uruchomionego w internecie, gdzie możesz instalować, pisać oraz uruchamiać programy. Na czas trwania tutoriala Cloud IDE będzie działać jako *komputer lokalny*. Będziesz mogła uruchamiać komendy w terminalu, tak jak inne osoby korzystające z systemu OS X, Ubuntu czy Windows, z tym że Twój terminal będzie podłączony do komputera, który ustawi dla Ciebie Cloud IDE. Oto instrukcje dotyczące różnych Cloud IDE (PaizaCloud Cloud IDE, AWS Cloud9). Możesz wybrać jedno z poniższych Cloud IDE i postępować zgodnie z instrukcją.

#### PaizaCloud Cloud IDE

1. Przejdź do [PaizaCloud Cloud IDE](https://paiza.cloud/)
2. Załóż konto
3. Kliknij *Nowy serwer* i wybierz aplikację Django
4. Kliknij przycisk "Terminal" (po lewej stronie okna)

Teraz powinnaś zobaczyć interfejs z bocznym paskiem i przyciski po lewej stronie. Kliknij przycisk "Terminal", aby otworzyć okno terminala ze znakiem zachęty takim jak ten:

{% filename %}Terminal{% endfilename %}

    $
    

Terminal PaizaCloud Cloud ID jest gotowy na Twoje instrukcje. Możesz zmienić rozmiar tego okna i powiększyć je, aby było troszkę większe.

#### AWS Cloud9

Obecnie Cloud 9 wymaga rejestracji w AWS i wprowadzenia informacji o karcie kredytowej.

1. Zainstaluj Cloud 9 ze [ sklepu internetowego Chrome](https://chrome.google.com/webstore/detail/cloud9/nbdmccoknlfggadpfkmcpnamfnbkmkcp)
2. Przejdź do [c9.io](https://c9.io) i kliknij *Zacznij z AWS Cloud9*
3. Zarejestruj konto AWS (wymaga danych karty kredytowej, ale możesz używać go za darmo)
4. W Panelu AWS wpisz * Cloud9 * na pasku wyszukiwania i kliknij go
5. W panelu Cloud 9 kliknij * Utwórz środowisko *
6. Nazwij go * django-girls *
7. While configuring settings, select *Create a new instance for environment (EC2)* for "Environment Type" and the *t2.micro* "Instance type" (it should say "Free-tier eligible."). The default cost-saving setting is fine and you can keep the other defaults.
8. Kliknij *Next step*
9. Kliknij *Create Environment*

Now you should see an interface with a sidebar, a big main window with some text, and a small window at the bottom that looks something like this:

{% filename %}bash{% endfilename %}

    twojanazwaużytkownika:~/workspace $
    

This bottom area is your terminal. You can use the terminal to send instructions to the remote Cloud 9 computer. You can resize that window to make it a bit bigger.

### Środowisko wirtualne

A virtual environment (also called a virtualenv) is like a private box we can stuff useful computer code into for a project we're working on. We use them to keep the various bits of code we want for our various projects separate so things don't get mixed up between projects.

Run:

{% filename %}Cloud 9{% endfilename %}

    mkdir djangogirls
    cd djangogirls
    python3.6 -mvenv myvenv
    source myvenv/bin/activate
    pip install django~={{ book.django_version }}
    

(note that on the last line we use a tilde followed by an equal sign: `~=`).

### GitHub

Załóż konto na [GitHubie](https://github.com).

### PythonAnywhere

The Django Girls tutorial includes a section on what is called Deployment, which is the process of taking the code that powers your new web application and moving it to a publicly accessible computer (called a server) so other people can see your work.

This part is a little odd when doing the tutorial on a Chromebook since we're already using a computer that is on the Internet (as opposed to, say, a laptop). However, it's still useful, as we can think of our Cloud 9 workspace as a place for our "in progress" work and Python Anywhere as a place to show off our stuff as it becomes more complete.

Tak więc, załóż nowe konto w PythonAnywhere pod adresem [www.pythonanywhere.com](https://www.pythonanywhere.com).