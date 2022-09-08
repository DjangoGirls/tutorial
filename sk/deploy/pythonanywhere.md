# Vytvorenie nášho blogu na PythonAnywhere

## Vytvorenie PythonAnywhere účtu

> **Poznámka** Možno si si už účet na PythonAnywhere vytvorila počas inštalácie - ak áno, nemusíš to robiť znova. 
> 
> {% include "/deploy/signup_pythonanywhere.md" %}


## Konfigurácia našej stránky na PythonAnywhere

Choď naspäť do hlavného [PythonAnywhere Dashboardu](https://www.pythonanywhere.com/) kliknutím na logo a vyber možnosť začať "Bash" konzolu -- to je PythonAnywhere verzia príkazového riadku, presne ako na tvojom počítači.

![Sekcia "New Console" na webovom rozhraní PythonAnywhere s tlačítkom pre "bash"](images/pythonanywhere_bash_console.png)

> **Poznámka** PythonAnywhere je založený na Linuxe, takže ak si vo Windowse, konzola bude vyzerať trochu inak ako v tvojom počítači. Deployment webovej aplikácie na PythonAnywhere znamená stiahnutie kódu z GitHubu a nakonfigurovanie PythonAnywhere, aby ho rozpoznal a začal ho poskytovať ako webovú aplikáciu.  Sú manuálne spôsoby, ako to urobiť, ale PythonAnywhere poskytuje pomocný nástroj, ktorý všetko urobí za teba. Najprv ho nainštalujme:

{% filename %}PythonAnywhere command-line{% endfilename %}
```
$ pip{{ book.pa_py_version }} install --user pythonanywhere
```

Malo by to zobraziť niečo ako `Collecting pythonanywhere` a nakoniec skončiť riadkom, ktorý hovorí `Successfully installed (...) pythonanywhere- (...)`.

Teraz spustíme pomocníka, ktorý automaticky nakonfiguruje našu aplikáciu z GitHubu. Zadaj nasledujúci príkaz do konzoly na PythonAnywhere (nezabudni použiť užívateľské meno z GitHubu namiesto `<your-github-username>`, aby sa URL zhodovala s klonovacou URL z GitHubu):

{% filename %}PythonAnywhere command-line{% endfilename %}
```
$ pa_autoconfigure_django.py --python={{ book.pa_py_version }} https://github.com/<your-github-username>/my-first-blog.git
```

Keď budeš sledovať, ako to beží, uvidíš, čo to robí:

- Sťahuje tvoj kód z GitHubu
- Vytvára virtualenv na PythonAnywhere, presne ako na tvojom počítači
- Aktualizuje tvoj súbor settings so zopár nastaveniami špecifickými pre deployovanie
- Pripravuje databázu na PythonAnywhere pomocou príkazu `manage.py migrate`
- Nastavuje tvoje statické súbory (o tých sa dozvieme viac neskôr)
- A nastavuje PythonAnywhere, aby sprístupnil tvoju stránku cez svoju API

Na PythonAnywhere sú všetky tieto kroky zautomatizované, ale sú to presne tie isté kroky, aké by si musela spraviť u hocijakého iného poskytovateľa serverov.

Dôležitá vec, ktorú si treba teraz všimnúť, je, že tvoja databáza na PythonAnywhere je vlastne úplne iná a oddelená od databázy na tvojom PC - to znamená, že budeš mať iné príspevky a administrátorský účet. Preto musíme najprv inicializovať admin účet pomocou `createsuperuser`, presne ako sme to spravili na svojom vlastnom počítači. PythonAnywhere pre teba automaticky vytvoril virtualenv, takže ti stačí spustiť:

{% filename %}PythonAnywhere command-line{% endfilename %}
```
(ola.pythonanywhere.com) $ python manage.py createsuperuser
```

Zadaj detaily pre admin užívateľa.  Najlepšie je použiť tie isté, ako používaš na vlastnom počítači a predísť tak zmätku, ibaže by si chcela spraviť heslo na PythonAnywhere o niečo bezpečnejšie.

A teraz, ak chceš, sa môžeš pozrieť na svoj kód na PythonAnywhere pomocou `ls`:

{% filename %}PythonAnywhere command-line{% endfilename %}
```
(ola.pythonanywhere.com) $ ls
blog  db.sqlite3  manage.py  mysite requirements.txt static
(ola.pythonanywhere.com) $ ls blog/
__init__.py  __pycache__  admin.py  apps.py  migrations  models.py
tests.py  views.py
```

Môžeš tiež ísť do záložky "Files" a pohybovať sa pomocou zabudovaného PythonAnywhere prehliadača súborov. (Na stránke Console sa vieš dostať ku zvyšku stránok na PythonAnywhere pomocou tlačítka v menu v pravom hornom okraji. Keď už si na jednej z týchto stránok, linky na ostatné nájdeš hore.)


## Si online!

Tvoja stránka by teraz mala byť online na internete!  Preklikaj sa cez stránku "Web" na PythonAnywhere, kým sa dostaneš k odkazu na ňu. Môžeš ho poslať, komu len chceš. :)


> **Poznámka** Toto je začiatočnícky tutoriál a pre deploynutie stránky sme si niektoré veci zjednodušili, čo nie je ideálne z pohľadu bezpečnosti.  Ak sa rozhodneš na tomto projekte ďalej stavať, mala by si si prejsť [Django deployment checklist](https://docs.djangoproject.com/en/3.2/howto/deployment/checklist/) pre zopár tipov, ako svoju stránku zabezpečiť.

## Debugovacie tipy


Ak uvídíš chybu počas behu skriptu `pa_autoconfigure_django.py`, toto sú niektoré z častých dôvodov:

- Zabudla si si vytvoriť PythonAnywhere API token.
- Urobila si chybu vo svojej GitHub URL.
- Ak sa ti zobrazí chybové hlásenie, že *"Could not find your settings.py"*, pravdepodobne je to spôsobené tým, že sa ti nepodarilo pridať všetky súbory do Gitu a/alebo sa ich nepodarilo úspešne pridať na GitHub.  Znovu sa pozri na odstavec o Gite vyššie
- Ak si už mala účet na PythonAnywhere a mala si problém s collectstatic, pravdepodobne máš účet so staršou verziou SQLite (napr. 3.8.2). V takom prípade si vytvor nový účet a skús príkazy v sekcii PythonAnywhere vyššie.


Ak pri pokuse navštíviť svoju stránku uvidíš chybu, prvým miestom, kde hľadať problém, je **error log**. Odkaz naň nájdeš na PythonAnywhere v [záložke Web](https://www.pythonanywhere.com/web_app_setup/). Pozri, či tam nie sú nejaké chybové hlášky - tie najnovšie sú naspodku.

Môžeš skúsiť aj [všeobecné debugovacie tipy na help stránke PythonAnywhere](http://help.pythonanywhere.com/pages/DebuggingImportError).

A nezabudni, tvoja mentorka alebo mentor sú tu na to, aby ti pomohli!
