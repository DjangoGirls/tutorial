# Jak działa internet

> Niniejszy rozdział został zainspirowany prelekcją "Jak działa internet" Jessiki McKellar (http://web.mit.edu/jesstess/www/).

Możemy się założyć, że używasz go każdego dnia. Ale czy naprawdę wiesz co się dzieje, gdy wpisujesz w przeglądarce adres http://djangogirls.org i wciskasz `enter`?

Aby zrozumieć jak działa internet powinnaś najpierw dowiedzieć się czym tak naprawdę jest strona internetowa, a jest ona tylko zbiorem plików zapisanych na dysku twardym. Tak samo jak twoje zdjęcia, muzyka czy filmy. Aczkolwiek strony internetowe różnią się od nich tym, że zawierają kod komputerowy zwany HTML.

Jeśli nie miałaś wcześniej do czynienia z programowaniem, może być Ci na początku trudno zrozumieć HTML, ale przeglądarki internetowe (takie jak Chrome, Safari, Firefox itd.) uwielbiają go. Zostały one zaprojektowane po to, by czytać ten kod, przetwarzać go i postępować zgodnie z jego instrukcjami. Prezentują pliki, z których składa się Twoja strona - by wyglądała dokładnie tak jak Ty chcesz.

Tak jak w przypadku każdego innego pliku, musimy umiejscowić pliki HTML na dysku twardym. Do przechowywania plików HTML używamy specjalnych, potężnych komputerów zwanych *serwerami (ang. servers)*. Serwery nie posiadają monitorów, myszy ani klawiatur, ponieważ ich głownym celem jest przechowywanie danych i serwowanie ich. Dlatego są one nazywane *serwerami* -- ponieważ służą do *serwowania* danych.

Ok, ale pewnie chciałabyś wiedzieć jak wygląda internet?

Narysowaliśmy Ci schemat Internetu! Wygląda tak:

![Rysunek 1.1][1]

 [1]: images/internet_1.png

Wygląda dość chaotycznie, prawda? W rzeczywistości jest to sieć połączonych między sobą maszyn (wspomnianych wyżej *serverów*). Setki tysięcy maszyn! Wiele, wiele kilometrów kabli na całym świecie! Możesz wejść na stronę Submarine Cable Map (http://submarinecablemap.com) i sama zobaczyć jak skomplikowana jest ta sieć. Oto zrzut ekranu ze strony internetowej:

![Rysunek 1.2][2]

 [2]: images/internet_3.png

To fascynujące, prawda? Ale oczywiście niemożliwe jest stworzenie bezpośredniego połączenia kablowego między każdym komputerem w internecie. Więc aby dostać się do maszyny dostępnej w internecie (na przykład tej, na której zapisane jest http://djangogirls.org) potrzebujemy wykonać zapytanie przechodzące przez wiele, wiele różnych maszyn.

Wygląda to tak:

![Rysunek 1.3][3]

 [3]: images/internet_2.png

Wyobraź sobie, że po wpisaniu http://djangogirls.org, wysyłasz list o treści: "Drogie Django Girls, chcę zobaczyć stronę djangogirls.org. Wyślijcie ją do mnie, proszę! "

List trafia do urzędu pocztowego najbliżej Ciebie. Potem idzie do drugiego urzędu, który znajduje się trochę bliżej Twojego adresata. Potem do kolejnego, kolejnego, kolejnego, aż w końcu zostanie doręczony do miejsca przeznaczenia. Ciekawa rzecz - jeśli wyślesz wiele listów (*pakietów danych*) do tego samego adresata, mogą przejść przez zupełnie inne urzędy pocztowe (*routery*). To zależy od tego w jaki sposób zostaną rozdzielone w każdym urzędzie.

![Rysunek 1.4][4]

 [4]: images/internet_4.png

Tak, to takie proste. Wysyłasz wiadomości i oczekujesz jakiejś odpowiedzi. Oczywście, zamiast papieru i długopisu używasz bitów danych, ale koncepcja jest dokładnie taka sama!

Zamiast adresów z nazwą ulicy, miastem, kodem pocztowym oraz nazwą kraju, używa się adresów IP. Twój komputer najpierw pyta serwera DNS (system nazw domenowych, ang. DNS - Domain Name System) o przetłumaczenie djangogirls.org na adres IP. Działa to podobnie do dawnych książek telefonicznych, w których mogłaś poszukać adresu czy numeru po nazwisku osoby, z którą chciałaś się skontaktować.

Listy muszą spełniać konkretne warunki, żeby zostały poprawnie doręczone: muszą posiadać adres, znaczek itd. Muszą być też napisane językiem zrozumiałym dla odbiorcy. To samo dotyczy *pakietów danych*, które wysyłasz, by zobaczyć jakąś stronę. Używany jest protokół HTTP (Hypertext Transfer Protocol).

Tak więc, ogólnie rzecz ujmując, jeśli chcesz mieć swoją stronę internetową musisz mieć *serwer* (komputer), gdzie będzie ona funkcjonować. Gdy *serwer* odbiera przychodzące *żądania* (Twój list), wysyła Ci w odpowiedzi Twoją stronę (kolejny list).

Zapytasz pewnie co robi Django, skoro masz przed sobą tutorial Django. Kiedy odpowiadasz na żądanie, nie chcesz aby każdy dostawał tę samą odpowiedź, prawda? Zdecydowanie lepiej jest jeśli listy są spersonalizowane i skierowane do konkretnej osoby, do tej, która napisała do Ciebie. Django pomaga Ci w tworzeniu tych spersonalizowanych, interesujących listów :).

Wystarczy teorii, zabieramy się za tworzenie!