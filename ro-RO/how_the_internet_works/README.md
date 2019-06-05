# Cum funcționează Internetul

> Pentru cititorii de acasă: acest capitol este acoperit în video [Cum funcționează Internetul](https://www.youtube.com/watch?v=oM9yAA09wdc).
> 
> Acest capitol este inspirat de o discuție "Cum funcționează Internetul" de Jessica McKellar (http://web.mit.edu/jesstess/www/).

Suntem siguri că utilizați Internetul în fiecare zi. Dar știți ce anume se întâmplă când voi întroduceți o adresă, de exemplu, https://djangogirls.org, în browser și apăsați pe `enter`?

Primul lucru pe care trebuie să înțelegeți este că un website constă din fișiere păstrate pe discul hard. Precum sunt filme, musica sau fotografiile voastre. Totuși, paginile web au ceva special: conțin un cod numit HTML.

Dacă nu sunteți familiare cu programare, ar putea fi greu să înțelegi HTML-ul la început, dar browserele tale (Chrome, Safari, Firefox, etc.) îl adoră. Browserele de web sunt făcute să înțeleagă acest cod, să-i urmeze instrucțiunile și să prezinte toate aceste fișiere din care e format website-ul tău exact așa cum vrei tu să fie prezentate.

Ca orice fișier, și cele care conțin HTML trebuie stocate undeva, pe un hard disk. În cazul internetului, folosim computere speciale foarte puternice numite *servere*. Ele nu au monitor, mouse sau tastatură pentru că principalul lor scop e să stocheze și să livreze date. De aceea se și numesc *servere* -- pentru că ne *servesc* date.

OK, dar probabil vrei să știi cum arată Internetul, așa-i?

Ți-am desenat o schemă! Arată așa:

![Figura 1.1](images/internet_1.png)

Cam haos, nu? De fapt, este o rețea de computere conectate (*serverele* mai sus menționate). Sute de mii de computere! Mulți, mulți kilometri de cabluri în toată lumea! Poți vizita un site cu Harta Cablurilor Submarine (http://submarinecablemap.com/) să vezi cât de alambicată e rețeaua. Uite un screenshot de pe site:

![Figura 1.2](images/internet_3.png)

E fascinant, nu-i așa? Dar, evident, nu e posibil să existe un cablu care să unească toate calculatoarele conectate la Internet. Așa că, pentru a ajunge la un calculator (de exemplu la cel pe care e salvat https://djangogirls.org) trebuie să transmitem o cerere prin multe, multe alte computere.

Arată așa:

![Figura 1.3](images/internet_2.png)

Imaginează-ți că atunci când tastezi https://djangogirls.org, trimiți o scrisoare care zice: "Dragă Django Girls, vreau să văd site-ul djangogirls.org. Vă rog să mi-l trimiteți!”

Scrisoarea ta ajunge la oficiul poștal cel mai apropiat. Apoi ajunge la altul, care e puțin mai aproape de destinatar, apoi la altul, și la altul până ce e livrat la destinație. Singur unic lucru este că dacă transmiteți multe litere (*pachete de date*) în aceeași loc, ei poate să meargă prin oficille poștale total diferite (*routere*). Acesta depinde de cum ei sunt distribuite în fiecare oficiu.

![Figura 1.4](images/internet_4.png)

Da, e atât de simplu. Trimiți mesaje și aștepți răspunsuri. Desigur, în loc de hârtie și pix folosești biți de date, dar ideea e aceeași!

În loc de adrese cu numele străzii, oraș, cod și numele țării, folosim adrese IP. Computerul tău cere de la DNS (Domain Name System) să traducă djangogirls.org într-o adresă IP. Seamănă puțin cu vechile cărți de telefoane în care ați putut să căutați numele persoanei pe care ați dorit s-o contactați și îi găsiți numărul de telefon și adresa.

Când trimiteți o scrisoare, trebuie să aibă anumite elemente ca să fie expediată corect: adresă, timbru etc. De asemeni, folosești un limbaj pe care destinatarul îl înțelege, nu? Aceeași aplică și pentru *pachete de date* pe care transmiteți ca să vedeți pe website. Este utilizat protocolul numit HTTP (Hypertext Transfer Protocol).

Deci, practic, atunci când aveți un site, trebuie să aveți un *server* (calculator) unde să-l țineți. Când *server* primește o cerere *request* (în scriisoare), el transmite înapoi website-ul (în altă scriisoare).

Pentru că acesta e un tutorial Django, poate vă întrebați ce face Django. Când trimiți un răspuns, nu vrei întotdeauna să trimiți același lucru tuturor. E mult mai bine dacă scrisorile tale sunt personalizate special pentru persoana care tocmai ți-a scris, nu? Django te ajută să creezi aceste scrisori personalizate și interesante. :)

Gata cu vorba, e timpul să creăm!