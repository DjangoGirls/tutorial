# Domena

Heroku udostępnia Ci domenę, ale jest długa, trudna do zapamiętania i brzydka. Fajnie byłoby mieć nazwę domeny, która jest krótka i zapadająca w pamięć, nie?

W tym rozdziale nauczysz się, jak kupić domenę i podpiąć ją do Heroku!

## Gdzie zarejestrować domenę?

Typowa domena kosztuje około 15 dolarów rocznie. Są tańsze i droższe opcje w zależności od dostawcy. Mnóstwo firm oferuje możliwość zakupu domen: proste [zapytanie w google][1] zwraca setki wyników.

 [1]: https://www.google.com/search?q=register%20domain

Naszą ulubioną firmą jest [I want my name][2]. Reklamują się jako "bezbolesne zarządzanie domenami" i faktycznie tak jest.

 [2]: https://iwantmyname.com/

## Jak zarejestrować domenę w IWantMyName?

Przejdź do [iwantmyname][3] i w polu wyszukiwania wpisz nazwę domeny, którą chciałabyś mieć.

 [3]: http://iwantmyname.com

![][4]

 [4]: images/1.png

Teraz powinnaś zobaczyć listę wszystkich domen zawierających nazwę, którą wpisałaś w polu wyszukiwania. Jak widzisz, uśmiechnięta buźka sygnalizuje, że dana domena jest wolna i można ją kupić, zaś smutna buźka oznacza, że dana domena należy już do kogoś innego.

![][5]

 [5]: images/2.png

Postanowiłyśmy kupić domenę `djangogirls.in`:

![][6]

 [6]: images/3.png

Przejdź do podsumowania transakcji. Jeżeli nie masz jeszcze konta w iwantmyname, załóż je teraz. Gdy już to zrobisz, wpisz dane swojej karty kredytowej i domena będzie Twoja!

Następnie wybierz z menu opcję `Domains` i wybierz swoją nową domenę. Znajdź link `manage DNS records` i kliknij go:

![][7]

 [7]: images/4.png

Teraz musisz znaleźć taki formularz:

![][8]

 [8]: images/5.png

I wypełnić go w następujący sposób: - Hostname: www - Type: CNAME - Value: twoja domena w Heroku (na przykład djangogirls.herokuapp.com) - TTL: 3600

![][9]

 [9]: images/6.png

Kliknij przycisk Add oraz Save changes na dole.

Nim Twoja domena zacznie działać, może upłynąć kilka godzin. Bądź cierpliwa!

## Konfigurowanie domeny w Heroku

Musisz także poinformować Heroku, że chcesz używać swojej własnej domeny.

Przejdź do [panelu Heroku][10], zaloguj się do swojego konta i wybierz swoją aplikację. Następnie przejdź do ustawień aplikacji (Settings), dodaj swoją domenę w sekcji `Domains` i zapisz zmiany.

 [10]: https://dashboard.heroku.com/apps

I już!