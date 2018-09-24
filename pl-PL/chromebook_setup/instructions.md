Możesz [pominąć tę sekcję](http://tutorial.djangogirls.org/en/installation/#install-python) jeżeli nie używasz Chromebooka. W przeciwnym wypadku, proces instalacji będzie wyglądał nieco inaczej. Możesz zignorować pozostałe elementy instrukcji dotyczące instalacji.

### Cloud IDE (PaizaCloud Cloud IDE, AWS Cloud9)

Cloud IDE is a tool that gives you a code editor and access to a computer running on the Internet where you can install, write, and run the software. For the duration of the tutorial, cloud IDE will act as your *local machine*. You'll still be running commands in a terminal interface just like your classmates on OS X, Ubuntu, or Windows, but your terminal will be connected to a computer running somewhere else that cloud IDE sets up for you. Here is the instructions for cloud IDEs (PaizaCloud Cloud IDE, AWS Cloud9). You can choose one of the cloud IDEs, and follow the instruction of the cloud IDE.

#### PaizaCloud Cloud IDE

1. Go to [PaizaCloud Cloud IDE](https://paiza.cloud/)
2. Załóż konto
3. Click *New Server*
4. Click Terminal button(on the left side of the window)

Now you should see an interface with a sidebar, buttons at the left. Click "Terminal" button to open terminal window with prompt like this:

{% filename %}Terminal{% endfilename %}

    $
    

The terminal will give the computer Cloud 9 has prepared for your instructions. You can resize or maximize that window to make it a bit bigger.

#### AWS Cloud9

1. Go to [AWS Cloud9](https://aws.amazon.com/cloud9/)
2. Załóż konto
3. Click *Create Environment*

Teraz powinnaś zobaczyć interfejs z bocznym paskiem, duże główne okno z tekstem i małe okno na dole, które wygląda następująco:

{% filename %}bash{% endfilename %}

    twojanazwaużytkownika:~/workspace $
    

Dolny obszar jest Twoim *terminalem*, gdzie będziesz wpisywać komendy do Cloud 9, który jest przygotowany na Twoje instrukcje. Możesz też zmienić rozmiar tego okna, aby było nieco większe.

### Środowisko wirtualne

Środowisko wirtualne (Virtual Environment - zwany także virtualenv) jest jak skrzynka, do której możemy wstawić użyteczny program komputerowy dla projektu nad którym pracujemy. Używamy go aby oddzielić od siebie różne części kodu, potrzebne nam w różnych projektach, przez co nie mieszają się one pomiędzy różnymi projektami.

W swoim terminalu na dole ekranu Cloud 9 wykonaj następujące polecenie:

{% filename %}Cloud 9{% endfilename %}

    sudo apt update
    sudo apt install python3.6-venv
    

Jeżeli polecenie cały czas nie chce zadziałać, poproś o pomoc swojego mentora.

Następnie uruchom:

{% filename %}Cloud 9{% endfilename %}

    mkdir djangogirls
    cd djangogirls
    python3.6 -mvenv myvenv
    source myvenv/bin/activate
    pip install django~={{ book.django_version }}
    

(zauważ, że w ostatniej linii użyliśmy tyldy, za którą następuje znak równości: ~=).

### GitHub

Załóż konto na [GitHubie](https://github.com).

### PythonAnywhere

Tutorial Django Girls zawiera sekcję dotycząca wdrożenia, tzn. procesu przenoszenia kodu programu, który odpowiada za działanie naszej nowej aplikacji internetowej na publicznie dostępny komputer (zwany serwerem) w taki sposób, by inne osoby były w stanie zobaczyć Twoje dzieło.

Ta część może wydać się lekko niezrozumiała, gdy przechodzimy tutorial na Chromebooku, skoro w trakcie tutoriala używamy komputera, który już jest w Internecie (w odróżnieniu od chociażby naszego laptopa). Jednak, może ona być cały czas przydatna, byśmy traktowały nasze konto w Cloud9 jako miejsce, w którym postępuje nasza praca oraz PythonAnywhere jako miejsce, gdzie możemy pokazać światu nasze dzieło, gdy tylko będzie ono bardziej dokończone.

Dlatego właśnie załóż nowe konto w PythonAnywhere pod adresem [www.pythonanywhere.com](https://www.pythonanywhere.com).