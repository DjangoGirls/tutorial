# Jak działa internet

> Niniejszy rozdział został zainspirowany prelekcją "Jak działa internet" Jessiki McKellar (http://web.mit.edu/jesstess/www/).

Założymy się, że używasz internetu codziennie. Ale czy wiesz co dzieje się kiedy wpisujesz w oknie przeglądarki adres taki jak http://djangogirls.org i naciskasz `enter`?

Aby zrozumieć jak działa internet powinnaś najpierw dowiedzieć się czym tak naprawdę jest strona internetowa, a jest ona tylko zbiorem plików zapisanych na dysku twardym. Dokładnie tak samo jak filmy, muzyka czy zdjęcia na Twoim komputerze. Aczkolwiek strony internetowe różnią się od nich tym, że zawierają kod komputerowy zwany HTML.

Jeśli do tej pory nie miałaś styczności z programowaniem, na początku może być Ci trudno zrozumieć czym jest HTML, ale Twoje przeglądarki (takie jak Chrome, Safari, Firefox itp.) go uwielbiają. Przeglądarki internetowe są zaprojektowane i stworzone tak, aby rozumieć ten kod, wykonywać zawarte w nim instrukcje i wyświetlać wszystkie pliki składające się na stronę internetową w taki sposób jak Ty tego chcesz.

Tak jak w przypadku każdego innego pliku, musimy umiejscowić pliki HTML na dysku twardym. Do przechowywania plików HTML używamy specjalnych, potężnych komputerów zwanych *serwerami (ang. servers)*. Serwery nie posiadają monitorów, myszy ani klawiatur, ponieważ ich głownym celem jest przechowywanie danych i serwowanie ich. Dlatego są one nazywane *serwerami* -- ponieważ służą do *serwowania* danych.

Ok, ale pewnie chciałabyś wiedzieć jak wygląda internet?

Narysowaliśmy Ci schemat Internetu! Wygląda tak:

![Rysunek 1.1](images/internet_1.png)

Wygląda dość chaotycznie, prawda? W rzeczywistości jest to sieć połączonych między sobą maszyn (wspomnianych wyżej *serwerów*). Setki tysięcy maszyn! Wiele, wiele kilometrów kabli na całym świecie! Możesz odwiedzić stronę mapy podwodnych kabli (http://submarinecablemap.com/) aby zobaczyć, jak skomplikowana jest to sieć. Oto zrzut ekranu ze strony internetowej:

![Rysunek 1.2](images/internet_3.png)

To fascynujące, prawda? Ale oczywiście niemożliwe jest stworzenie bezpośredniego połączenia kablowego między każdym komputerem w internecie. Więc aby dostać się do maszyny dostępnej w internecie (na przykład tej, na której zapisane jest http://djangogirls.org) potrzebujemy wykonać zapytanie przez wiele, wiele różnych maszyn.

Wygląda to tak:

![Rysunek 1.3](images/internet_2.png)

Wyobraź sobie, że po wpisaniu http://djangogirls.org, wysyłasz list o treści: "Drogie Django Girls, chcę zobaczyć stronę djangogirls.org. Wyślijcie ją do mnie, proszę! "

List trafia do urzędu pocztowego najbliżej Ciebie. Następnie trafia do kolejnego urzędu bliżej adresata, i do następnego, i następnego, aż zostanie doręczony do miejsca przeznaczenia. Jeśli chodzi o strony internetowe, sytuacja jest bardzo podobna. Różnica polega na tym, że nawet jeśli wysyłasz listy (*pakiety danych*) do tego samego miejsca, to każdy z nich może "przejść" przez zupełnie inne pośrednie urzędy pocztowe (*routery*).

![Rysunek 1.4](images/internet_4.png)

Tak, to jest tak proste. Wysyłasz wiadomości i oczekujesz jakiejś odpowiedzi. Oczywiście, zamiast papieru i długopisu używasz bitów danych, ale koncepcja jest dokładnie ta sama!

Zamiast adresów z nazwą ulicy, miastem, kodem pocztowym oraz nazwą kraju, używa się adresów IP. Twój komputer najpierw prosi serwer DNS (system nazw domenowych, ang. DNS - Domain Name System) o przetłumaczenie djangogirls.org na adres IP. Działa to trochę jak stare książki telefoniczne, gdzie można było poszukać nazwiska i imienia w celu znalezienia konkretnej osoby, jej numeru telefonu i adresu.

Listy muszą spełniać konkretne warunki, żeby zostały poprawnie doręczone: muszą posiadać adres, znaczek itd. Muszą one też być napisane językiem zrozumiałym dla odbiorcy. Tak samo jest z *pakietami danych*, które wysyłasz w celu obejrzenia strony internetowej: używasz protokołu zwanego HTTP (Hypertext Transfer Protocol).

Ogólnie rzecz ujmując, aby mieć stronę internetową musisz mieć *serwer* (komputer) gdzie będzie ona funkcjonować. *Serwer* oczekuje na nadchodzące *żądania* (listy, które proszą o wysłanie Twojej strony) i odsyła odpowiedź z Twoją stroną internetową (jako kolejny list).

Zapytasz pewnie co robi Django, skoro masz przed sobą tutorial Django. Kiedy odpowiadasz na żądanie, nie chcesz aby każdy dostawał tę samą odpowiedź, prawda? Zdecydowanie lepiej jest, jeśli listy są spersonalizowane i skierowane do konkretnej osoby - konkretnie do tej, która napisała do Ciebie. Django pomaga Ci w tworzeniu tych spersonalizowanych, interesujących listów. :)

Wystarczy teorii, zabieramy się za tworzenie!
