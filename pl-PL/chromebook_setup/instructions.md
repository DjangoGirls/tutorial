Możesz [pominąć tę sekcję](http://tutorial.djangogirls.org/en/installation/#install-python) jeżeli nie używasz Chromebooka. Jeżeli używasz, proces instalacji będzie wyglądał następująco. Możesz zignorować pozostałą cześć instrukcji.

### Cloud 9

Cloud 9 jest narzędziem, które pełni funkcję edytora kodu oraz umożliwia dostęp do komputera uruchomionego w Internecie, gdzie możesz instalować, pisać oraz uruchamiać programy. Na czas trwania tutoriala Cloud9 będzie działać jako *komputer lokalny*. Nadal będziesz mogła uruchamiać komendy w terminalu, tak jak inne osoby korzystające z systemu OS X, Ubuntu czy Windowsa, z tym że Twój terminal będzie podłączony do komputera z systemem, który ustawia dla Ciebie Cloud 9.

1. Zainstaluj Cloud 9 ze [ sklepu Chrome](https://chrome.google.com/webstore/detail/cloud9/nbdmccoknlfggadpfkmcpnamfnbkmkcp)
2. Przejdź do [c9.io](https://c9.io)
3. Załóż konto
4. Kliknij przycisk *Utwórz nowy obszar roboczy*
5. Nadaj mu nazwę *django-girls*
6. Wybierz *Puste* (drugi od prawej w dolnym rzędzie z pomarańczowym logo)

Teraz powinnaś zobaczyć interfejs z bocznym paskiem, duże główne okno z tekstem i małe okno na dole, które wygląda następująco:

{% filename %}Cloud 9{% endfilename %}

    twojanazwaużytkownika:~/workspace $
    

This bottom area is your *terminal*, where you will give the computer Cloud 9 has prepared for your instructions. You can resize that window to make it a bit bigger.

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
    pip install django~=1.11.0
    

(zauważ, że w ostatniej linii użyliśmy tyldy, za którą następuje znak równości: ~=).

### GitHub

Załóż konto na [Githubie](https://github.com).

### PythonAnywhere

Tutorial Django Girls zawiera sekcję dotycząca wdrożenia, tzn. procesu przenoszenia kodu programu, który odpowiada za działanie naszej nowej aplikacji internetowej na publicznie dostępny komputer (zwany serwerem) w taki sposób, by inne osoby były wstanie zobaczyć nasze dzieło.

Ta część może wydać się lekko niezrozumiała, gdy przechodzimy tutorial na Chromebooka, skoro w trakcie tutoriala używamy komputera, który już jest w Internecie (w odróżnieniu od chociażby naszego laptopa). Jednak, może ona być cały czas przydatna, byśmy traktowały nasze konto w Cloud9 jako miejsce, w którym postępuje nasz praca oraz Python Anywhere jako miejsce, gdzie możemy pokazać światu nasze dzieło, jak tylko będzie ono bardziej dokończone.

Dlatego właśnie załóż nowe konto w Python Anywhere pod adresem [www.pythonanywhere.com](https://www.pythonanywhere.com).