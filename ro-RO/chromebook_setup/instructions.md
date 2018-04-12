Poți [sări peste această secțiune](http://tutorial.djangogirls.org/en/installation/#install-python) dacă nu folosești Chromebook. Dacă-l folosești însă, procesul de instalare va fi un pic diferit. Puteţi ignora restul instrucţiunilor de instalare.

### Cloud 9

Cloud 9 este un instrument care îți oferă un editor de cod şi acces la un calculator care rulează pe Internet, în care poți scrie, și unde poți instala şi executa software-ul. Pe durata acestui tutorial, Cloud 9 se va comporta ca și *calculatorul tău local *. Tu vei rula comenzile în interfața terminalului la fel ca și colegii ce vor folosi Os X, Ubuntu, sau Windows, dar terminalul pe care îl vei folosi tu, este conectat la un calculator care rulează în altă parte, pe care Cloud 9 ți la configurat.

1. Instalează Cloud 9 din [magazinul de aplicații Chrome](https://chrome.google.com/webstore/detail/cloud9/nbdmccoknlfggadpfkmcpnamfnbkmkcp)
2. Acceasează [c9.io](https://c9.io)
3. Creează-ți un cont
4. Apasă pe *Create a New Workspace*
5. Numește-l *django-girls*
6. Selectează rândul *Blank* (al doilea rând din dreapta cel cu logoo-ul portocaliu)

Acum puteți vedea o interfață cu un meniu, fereastra principală ce conține un text și o mică ferestruică în partea de jos, ce arată în felul următor:

{% filename %}Cloud 9{% endfilename %}

    yourusername:~/workspace $
    

Această porțiune de jos este *terminal-ul* tău, unde tu vei putea introduce instrucțiunile necesare pentru ca acestea să fie executate de calculatorul Cloud 9. Ai posibilitatea să mărești dimensiunile acestei ferestre.

### Mediul Virtual

Mediul virtual (eng. = Virtual Environment, prescurtat virtualenv) este ca o cutie privată în care poate fi stocat codul scris pentru proiectul la care noi vom lucra. Noi le folosim pentru a păstra diverse bucăți de cod de care avem nevoie pentru diverse proiecte, pentru a nu le mixa între acestea.

În terminalul tău din partea de jos a interfeței Cloud 9, execută următoarea instrucțiune:

{% filename %}Cloud 9{% endfilename %}

    sudo apt update
    sudo apt install python3.6-venv
    

Dacă întâmpini careva obstacole, apelează la mentorul tău pentru ajutor.

Apoi execută:

{% filename %}Cloud 9{% endfilename %}

    mkdir djangogirls
    cd djangogirls
    python3.6 -mvenv myvenv
    source myvenv/bin/activate
    pip install django~=1.11.0
    

(observă că ultima linie utilizată conține tildă și semnul egal: ~=).

### Github

Crează-ți un cont [Github](https://github.com).

### PythonAnywhere

Tutorial-ul Django Girls include o secțiune pentru așa-numitu-l Deployment, ce reprezintă procesul de transfer a codului aplicației tale web pe un calculator public (numit server) pentru ca alte persoane să poată vizualiza proiectul tău.

Această secțiune pare un pic ciudată atunci când tutorial-ul este realizat pe Chromebook, deoarece noi deja utilizăm un calculator public ce este accesibil prin intermediul Internet-ului (spre deosebire de, de exemplu, un laptop). În orice caz, asta oricum este util, noi putem considera Cloud 9 ca un spațiu de lucru, sau munca noastră ce se află în decurs de desfășurare și Python Anywhere, ca locul în care noi putem prezenta proiectul nostru odată ce acesta se apropie de finiș.

Thus, sign up for a new Python Anywhere account at [www.pythonanywhere.com](https://www.pythonanywhere.com).