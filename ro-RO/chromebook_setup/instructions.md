Poţi [sări peste această secţiune](http://tutorial.djangogirls.org/en/installation/#install-python) dacă nu foloseşti Chromebook. Dacă îl folosești, experiența de instalare va fi puțin diferită. Poți ignora restul instrucţiunilor de instalare.

### Cloud IDE (PaizaCloud Cloud IDE, AWS Cloud9, Glitch.com)

Cloud IDE este un instrument care îți oferă un editor de cod şi acces la un calculator care rulează pe Internet, în care poți instala, scrie şi executa software-ul. Pe durata acestui tutorial, Cloud IDE va funcționa ca și *calculatorul tău local *. Tu vei rula comenzile în interfața terminalului la fel ca și colegii care folosesc OS X, Ubuntu sau Windows, dar terminalul pe care îl vei folosi tu este conectat la un calculator care rulează în altă parte, pe care Cloud IDE ți l-a configurat. Aici sunt instrucţiunile pentru Cloud IDE (PaizaCloud Cloud IDE, AWS Cloud9). Poţi alege unul dintre programele Cloud IDE şi urmări instrucţiunile programului Cloud IDE.

#### PaizaCloud Cloud IDE

1. Deschide aplicaţia [PaizaCloud Cloud IDE](https://paiza.cloud/)
2. Creează-ți un cont
3. Fă click pe *Server nou* și alege aplicația Django
4. Fă click pe butonul Terminal (în partea stângă a ferestrei)

Acum ar trebui să vezi o interfaţă cu o bară laterală cu butoane în stânga. Fă click pe butonul Terminal pentru a deschide fereastra terminalului, care va afişa:

{% filename %}Terminal{% endfilename %}

    $
    

Terminalul de pe PaizaCloud Cloud IDE este pregătit pentru instrucțiunile tale. Poți redimensiona sau maximiza această fereastră pentru a o face puțin mai mare.

#### AWS Cloud9

Actual, Cloud 9 îți cere să te înregistrezi cu AWS și să introduci datele cardului tău de credit.

1. Instalează Cloud 9 din [magazinul de aplicații Chrome](https://chrome.google.com/webstore/detail/cloud9/nbdmccoknlfggadpfkmcpnamfnbkmkcp)
2. Mergi la [c9.io](https://c9.io) și fă click pe *Începe cu Cloud9 AWS*
3. Înscrie-te pentru un cont AWS (necesită informații despre cardul de credit, dar îl poți folosi gratuit)
4. În tabloul de bord AWS, introdu *Cloud9* în bara de căutare și fă click pe el
5. În tabloul de bord Cloud 9, fă click pe *Creare Mediu*
6. Numește-l *django-girls*
7. La configurarea setărilor, selectează *Creați o nouă instanță pentru mediu (EC2)* pentru "Tipul de mediu" și *t2. icro* "Tip de instanţă" (ar trebui să spună "Eligibil pentru rang gratuit"). Setarea implicită de reducere a costurilor este bună și poți păstra celelalte valori implicite.
8. Fă click pe * Server nou *
9. Fă click pe *Creează Mediu*

Acum ar trebui să vezi o interfață cu o bară laterală, o mare fereastră principală cu ceva text şi o fereastră mică în partea de jos care arată cam aşa:

{% filename %}bash{% endfilename %}

    numeutilizator:~/workspace $
    

Această zonă de jos este terminalul tău. Poți folosi terminalul pentru a trimite instrucțiuni calculatorului din Cloud 9. Poți redimensiona fereastra pentru a o face puțin mai mare.

#### IDE Cloud Glitch.com

1. Mergi la [Glitch.com](https://glitch.com/)
2. Înscrie-te pentru un cont (https://glitch.com/signup) sau folosește contul tău GitHub dacă ai unul. (Vezi instrucțiunile GitHub de mai jos.)
3. Fă lick pe *New Project* și alege *hello-webpage*
4. Fă click pe lista verticală de instrumente Tools (în partea din stânga jos a ferestrei), apoi pe butonul Terminal pentru a deschide fereastra terminalului cu un prompt ca acesta:

{% filename %}Terminal{% endfilename %}

    app@numele-proiectului-tău-glitch:~
    

Când folosești Glitch.com ca și Cloud IDE, nu e nevoie să creezi un mediu virtual. În schimb, creează următoarele fișiere manual:

{% filename %}glitch.json{% endfilename %}

```json
{
  "install": "pip3 install -r requirements.txt --user",
  "start": "bash start.sh",
  "watch": {
    "throttle": 1000
  }
}
```

{% filename %}requirements.txt{% endfilename %}

    Django~={{ book.django_version }}
    

{% filename %}.bash_profile{% endfilename %}

```bash
alias python=python3
alias pip=pip3
```

{% filename %}start.sh{% endfilename %}

```bash
chmod 600 .bash_profile
pip3 install -r requirements.txt --user
python3 manage.py makemigrations
python3 manage.py migrate
python3 manage.py runserver $PORT
```

Odată ce aceste fișiere sunt create, mergi în Terminal și execută următoarele comenzi pentru a crea primul tău proiect Django:

{% filename %}Terminal{% endfilename %}

    django-admin.py startproject mysite .
    refresh
    

Pentru a vedea mesaje de eroare detaliate, poți activa jurnalele de depanare Django pentru aplicația Glitch. Doar adaugă la sfârșitul fișierului `mysite/settings.py:</p>

<p>{% filename %}mysite/settings.py{% endfilename %}</p>

<pre><code class="python">LOGGING = {
    'version': 1,
    'disable_existing_loggers': False,
    'handlers': {
        'file': {
            'level': 'DEBUG',
            'class': 'logging.FileHandler',
            'filename': 'debug.log',
        },
    },
    'loggers': {
        'django': {
            'handlers': ['file'],
            'level': 'DEBUG',
            'propagate': True,
        },
    },
}
`</pre> 

Asta va crea un fișier `debug.log` care detaliază operațiunile în Django și orice mesaje de eroare care ar putea apărea. Cu ajutorul acestui fișier este mai ușor să remediezi site-ul dacă nu funcționează.

Repornirea iniţială a proiectului Glitch ar trebui să eşueze. (Dacă faci clic pe butonul derulant de sus `Afișați` apoi faci clic pe `Într-o fereastră nouă`, vei primi un mesaj de eroare `DisallowedHost` . Nu-ți face griji în această etapă, tutorialul va remedia această problemă de îndată ce actualizezi setările Django ale proiectului în fișierul `mysite/settings.py`.

### Mediul Virtual

Un mediu virtual (numit și virtualenv) este ca o cutie privată în care putem să punem cod de calculator util pentru un proiect la care lucrăm. Putem folosi medii virtuale pentru a păstra diverse bucăți de cod de care avem nevoie pentru diferite proiecte, pentru a nu le amesteca între proiecte.

Execută:

{% filename %}Cloud 9{% endfilename %}

    mkdir djangogirls
    cd djangogirls
    python3 -m venv myvenv
    source myvenv/bin/activate
    pip install django~={{ book.django_version }}
    

(observă că pe ultima linie conține o tildă urmată de semnul egal: `~=`).

### GitHub

Creează-ți un cont [GitHub](https://github.com).

### PythonAnywhere

The Django Girls tutorial includes a section on what is called Deployment, which is the process of taking the code that powers your new web application and moving it to a publicly accessible computer (called a server) so other people can see your work.

This part is a little odd when doing the tutorial on a Chromebook since we're already using a computer that is on the Internet (as opposed to, say, a laptop). However, it's still useful, as we can think of our Cloud 9 workspace as a place for our "in progress" work and Python Anywhere as a place to show off our stuff as it becomes more complete.

Thus, sign up for a new Python Anywhere account at [www.pythonanywhere.com](https://www.pythonanywhere.com).