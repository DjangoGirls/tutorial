# Czym jest Django?

Django (czytaj: dżango) to darmowy, open-source framework do tworzenia aplikacji webowych, napisany w Pythonie. To taki zbiór narzędzi, dzięki którym tworzenie stron internetowych jest szybsze i łatwiejsze.

Gdy budujesz stronę internetową, często potrzebujesz tych samych rzeczy: uwierzytelnić użytkowników (rejestracja, logowanie, wylogowywanie), panel zarządzania stroną, formularzy, sposobu przesyłania plików itd.

Na szczęście pewni programiści już kiedyś zauważyli, że wszyscy web developerzy stają przed takimi samymi problemami i stworzyli frameworki (Django jest jednym z nich), które dostarczają nam gotowych do użycia komponentów.

Frameworki istnieją, by oszczędzić Ci wyważania otwartych drzwi i ułatwić Ci proces tworzenia nowej strony.

## Dlaczego potrzebujesz frameworku?

By zrozumieć do czego naprawdę służy Django, musimy lepiej przyjrzeć się serwerom. Pierwszą rzeczą którą musi wiedzieć serwer jest to, że chcesz, żeby wyświetlił Ci stronę.

Wyobraź sobie skrzynkę pocztową (port), która monitorowana pod kątem przychodzących listów (żądań). To właśnie rola serwera WWW. Serwer czyta list, i odsyła z powrotem odpowiedź w formie strony internetowej. Ale gdy chesz coś wysłać, musisz mieć jakąś treść. A Django jest właśnie tym, co pomoże Ci stworzyć tę treść.

## Co się dzieje, gdy ktoś chce otworzyć stronę z Twojego serwera?

Kiedy serwer otrzymuje żądanie, przekazuje je dalej do Django, aby ten ustalił, czego właściwie ono dotyczy. Django sprawdza najpierw adres strony i decyduje, co zrobić dalej. Ta część jest wykonywana przez obecny w Django mechanizm rozpoznawania adresów (ang. **urlresolver** - zwróć uwagę, że adres strony to inaczej adres URL, czyli angielska nazwa tego modułu nie jest przypadkowa). Nie jest on zbyt inteligentny - jego działanie sprowadza się do porównania adresu URL z listą wzorców. Django sprawdza wzorce od góry do dołu i jeśli uda mu się znaleźć pasującą regułę, jest on przekazywana do odpowiedniej funkcji (zwanej *widokiem*).

Wyobraź sobie listonosza niosącego list. Idzie ulicą i porównuje każdy numer domu z adresem na kopercie. List zostawia w skrzynce tego domu, którego adres pasuje. Tak samo działa urlresolver!

W funkcji *widoku* dzieje się wszystko to, co najciekawsze: tutaj możemy połączyć się z bazą danych i wyszukać potrzebne nam informacje. Może użytkownik poprosił o zmianę danych? To tak, jakbyś wysłała list o treści "proszę o zmianę opisu mojego stanowiska pracy" - *widok* może sprawdzić, czy masz takie uprawnienia, a następnie dokona zmiany opisu i odeśle odpowiedź "Zrobione!". Wówczas *widok* generuje odpowiedź, a Django wysyła ją do przeglądarki użytkownika.

Oczywiście powyższy opis jest nieco uproszczony, ale znajomość niuansów technicznych nie jest Ci na razie potrzebna. Wystarczy, że zrozumiesz ogólną zasadę działania.

Dlatego nie będziemy się zbyt mocno zagłębiać w szczegóły i zacznijmy po prostu budować coś w Django. Wszystkich potrzebnych rzeczy nauczymy się po drodze!