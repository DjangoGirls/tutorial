Możesz [pominąć tę sekcję](http://tutorial.djangogirls.org/en/installation/#install-python), jeżeli nie używasz Chromebooka. W przeciwnym wypadku, proces instalacji będzie wyglądał nieco inaczej. Możesz zignorować pozostałe elementy instrukcji dotyczące instalacji.

### Cloud IDE (PaizaCloud Cloud IDE, AWS Cloud9)

Cloud IDE jest narzędziem, które pełni funkcję edytora kodu oraz umożliwia dostęp do komputera uruchomionego w internecie, gdzie możesz instalować, pisać oraz uruchamiać programy. Na czas trwania tutoriala Cloud IDE będzie działać jako *komputer lokalny*. Będziesz mogła uruchamiać komendy w terminalu, tak jak inne osoby korzystające z systemu macOS, Ubuntu czy Windows, z tym że Twój terminal będzie podłączony do komputera, który ustawi dla Ciebie Cloud IDE. Oto instrukcje dotyczące różnych Cloud IDE (PaizaCloud Cloud IDE, AWS Cloud9). Możesz wybrać jedno z poniższych Cloud IDE i postępować zgodnie z instrukcją.

#### PaizaCloud Cloud IDE

1. Przejdź do [PaizaCloud Cloud IDE](https://paiza.cloud/)
2. Załóż konto
3. Kliknij przycisk *New Server*
4. Kliknij przycisk "Terminal" (po lewej stronie okna)

Teraz powinnaś zobaczyć interfejs z bocznym paskiem i przyciski po lewej stronie. Kliknij przycisk "Terminal", aby otworzyć okno terminala ze znakiem zachęty takim jak ten:

{% filename %}Terminal{% endfilename %}

    $
    

Terminal PaizaCloud Cloud ID jest gotowy na Twoje instrukcje. Możesz zmienić rozmiar tego okna i powiększyć je, aby było troszkę większe.

#### AWS Cloud9

1. Przejdź do [AWS Cloud9](https://aws.amazon.com/cloud9/)
2. Załóż konto
3. Kliknij *Create Environment*

Teraz powinnaś zobaczyć interfejs z bocznym paskiem, duże główne okno z tekstem i małe okno na dole, które wygląda następująco:

{% filename %}bash{% endfilename %}

    twojanazwaużytkownika:~/workspace $
    

Dolny obszar jest Twoim terminalem. Możesz użyć go do wysyłania instrukcji do zdalnego komputera Cloud 9. Możesz zmienić rozmiar tego okna, aby je trochę powiększyć.

### Środowisko wirtualne

Środowisko wirtualne (Virtual Environment - zwane także virtualenv) jest jak skrzynka, do której możemy wstawić użyteczny program komputerowy dla projektu, nad którym pracujemy. Używamy go, aby oddzielić od siebie różne części kodu potrzebne nam w różnych projektach, przez co nie mieszają się one pomiędzy nimi.

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
    

(zauważ, że w ostatniej linii użyłyśmy tyldy, za którą następuje znak równości: ~=).

### GitHub

Załóż konto na [GitHubie](https://github.com).

### PythonAnywhere

Tutorial Django Girls zawiera sekcję dotycząca wdrożenia, tzn. procesu przenoszenia kodu programu, który odpowiada za działanie naszej nowej aplikacji internetowej na publicznie dostępny komputer (zwany serwerem) w taki sposób, by inne osoby były w stanie zobaczyć Twoje dzieło.

Ta część może wydać się lekko niezrozumiała, gdy przechodzimy tutorial na Chromebooku, skoro w trakcie tutoriala używamy komputera, który już jest w internecie (w odróżnieniu od chociażby naszego laptopa). Jednak może ona być cały czas przydatna, byśmy traktowały nasze konto w Cloud9 jako miejsce, w którym postępuje nasza praca oraz PythonAnywhere jako miejsce, gdzie możemy pokazać światu nasze dzieło, gdy tylko będzie ono bardziej dokończone.

Dlatego właśnie załóż nowe konto w PythonAnywhere pod adresem [www.pythonanywhere.com](https://www.pythonanywhere.com).