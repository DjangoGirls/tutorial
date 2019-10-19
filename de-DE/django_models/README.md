# Django-Models

Wir erstellen jetzt etwas, damit wir alle Posts von unserem Blog speichern können. Aber um das zu tun, müssen wir zunächst über `Objekte` sprechen.

## Objekte

Eine Herangehensweise an das Programmieren ist das so genannte `objektorientierte Programmieren`. Die Idee dahinter ist, dass wir Dinge und ihre Interaktionen untereinander modellieren können und nicht alles als langweilige Kette von Programmbefehlen hintereinander aufschreiben müssen.

Was ist denn nun ein Objekt? Ein Objekt ist eine Sammlung von Eigenschaften und Aktionsmöglichkeiten, das anhand einer Vorlage (Klasse) erstellt wird. Das klingt erst einmal komisch, aber hier haben wir gleich ein Beispiel.

Wenn wir zum Beispiel eine Katze modellieren wollen, erschaffen wir eine Objektvorlage `Katze`, eine Art Blaupause oder Schema, nach welcher zukünftig jedes spezifische Katzenobjekt erstellt werden kann. Die Vorlage beschreibt typische Eigenschaften von Katzen, z.B. `farbe`, `alter`, `stimmung` (also gut, schlecht oder müde ;)), `besitzerin` (die ein `Person`-Objekt ist oder – im Falle einer Streunerkatze – leer bleibt).

Jedes Objekt einer `Katze` soll natürlich auch einige Aktionsmöglichkeiten besitzen: `schnurren`, `kratzen` oder `füttern` (hier bekäme die Katze ein bisschen `Katzenfutter`, welches wieder durch ein eigenes Objekt mit Eigenschaften wie `Geschmack` repräsentiert sein könnte).

    Katze
    --------
    farbe
    alter
    stimmung
    besitzerin
    schnurren()
    kratzen()
    fuettern(katzen_futter)
    

    Katzenfutter
    --------
    geschmack
    

Der Gedanke dahinter ist also, echte Dinge mit Hilfe von Eigenschaften (genannt `Objekteigenschaften`) und Aktionsmöglichkeiten (genannt `Methoden`) im Programmcode zu beschreiben.

Wie also modellieren wir Blogposts? Schließlich wollen wir ja einen Blog bauen, nicht wahr?

Wir müssen folgende Fragen beantworten: Was ist ein Blogpost? Welche Eigenschaften sollte er haben?

Nun, zum einen braucht unser Blogpost Text mit einem Inhalt und einen Titel, oder? Außerdem wäre es schön zu wissen, wer ihn geschrieben hat – wir brauchen also noch einen Autor. Schließlich wollen wir wissen, wann der Post geschrieben und veröffentlicht wurde.

    Post 
    -------- 
    title 
    text
    author
    created_date
    published_date
    

Was für Dinge könnte man mit einem Blogpost machen? Es wäre schön, wenn wir eine `Methode` hätten, die den Post veröffentlicht, nicht wahr?

Wir brauchen also eine `veröffentlichen`-Methode.

Da wir jetzt wissen, was wir erreichen wollen, können wir nun damit anfangen, es in Django zu formulieren!

## Ein Django-Model erstellen

Da wir jetzt in etwa wissen, was ein Objekt ist, wollen wir ein Django-Model, eine Vorlage, für unsere Blogposts anlegen, nach welcher wir zukünftig unsere Blogpostobjekte erstellen können.

Ein "Modell" ist in Django ein Objekt einer speziellen Sorte – eines das in der `Datenbank` gespeichert wird. Eine Datenbank ist eine Sammlung von Daten. Dies ist ein Ort, an dem du Informationen zu Benutzern, deinen Blogposts usw. speichern wirst. Wir benutzen dafür eine SQLite-Datenbank. Das ist die Voreinstellung in Django – für uns wird das erst einmal ausreichen.

Du kannst dir ein Model wie eine Tabelle mit Spalten ("Feldern", englisch "fields") und Zeilen (Datensätzen) vorstellen.

### Eine Applikation für unseren Blog

Um unsere Webseite aufgeräumt zu halten, werden wir eine eigene Anwendung für unser Projekt erstellen, wir nennen das eine Applikation. Wir wollen uns gleich daran gewöhnen, alles ordentlich und sortiert zu halten. Um eine Applikation zu erstellen, müssen wir das folgende Kommando in der Konsole ausführen (wieder in dem `djangogirls`-Verzeichnis, in dem die `manage.py`-Datei liegt):

{% filename %}Mac OS X und Linux:{% endfilename %}

    (myvenv) ~/djangogirls$ python manage.py startapp blog
    

{% filename %}Windows:{% endfilename %}

    (myvenv) C:\Users\Name\djangogirls> python manage.py startapp blog
    

Wie du sehen kannst, wurde ein neues `blog`-Verzeichnis erstellt, welches schon einige Dateien enthält. Das Verzeichnis und die Dateien unseres Projektes sollten jetzt so aussehen:

    djangogirls
    ├── blog
    │   ├── __init__.py
    │   ├── admin.py
    │   ├── apps.py
    │   ├── migrations
    │   │   └── __init__.py
    │   ├── models.py
    │   ├── tests.py
    │   └── views.py
    ├── db.sqlite3
    ├── manage.py
    ├── mysite
    │   ├── __init__.py
    │   ├── settings.py
    │   ├── urls.py
    │   └── wsgi.py
    └── requirements.txt
    

Nach dem Erstellen der Applikation müssen wir Django noch sagen, dass diese auch genutzt werden soll. Das tun wir in der Datei `mysite/settings.py` -- öffne diese in deinem Code-Editor. Wir suchen den Eintrag `INSTALLED_APPS` und fügen darin die Zeile `'blog.apps.BlogConfig',` direkt über der schließenden Klammer `]` ein. Danach sollte es also so aussehen:

{% filename %}mysite/settings.py{% endfilename %}

```python
INSTALLED_APPS = [
    'django.contrib.admin',
    'django.contrib.auth',
    'django.contrib.contenttypes',
    'django.contrib.sessions',
    'django.contrib.messages',
    'django.contrib.staticfiles',
    'blog.apps.BlogConfig',
]
```

### Das Blogpost-Model

Alle `Models` unserer Applikation werden in der `blog/models.py`-Datei definiert. Dies ist also der richtige Platz für unser Blogpost-Model.

Öffnen wir also `blog/models.py` im Code-Editor, löschen alles darin und schreiben Code wie diesen:

{% filename %}blog/models.py{% endfilename %}

```python
from django.conf import settings
from django.db import models
from django.utils import timezone


class Post(models.Model):
    author = models.ForeignKey(settings.AUTH_USER_MODEL, on_delete=models.CASCADE)
    title = models.CharField(max_length=200)
    text = models.TextField()
    created_date = models.DateTimeField(default=timezone.now)
    published_date = models.DateTimeField(blank=True, null=True)

    def publish(self):
        self.published_date = timezone.now()
        self.save()

    def __str__(self):
        return self.title
```

> Kontrolliere nochmal, dass du zwei Unterstriche (`__`) vor und hinter dem `str` gesetzt hast. Diese Konvention wird häufig in Python benutzt und manchmal nennen wir es "dunder" (kurz für "double-underscore").

Es sieht kompliziert aus, oder? Aber keine Sorge, wir werden erklären, was diese Zeilen bedeuten!

Die Zeilen, die mit `from` oder `import` beginnen, sind Anweisungen, um Sachen aus anderen Dateien mitzunutzen. Anstatt häufig genutzten Code in jede Datei einzeln zu kopieren, binden wir ihn ein mit: `from... import ...`.

`class Post(models.Model):` – Diese Zeile definiert unser Model (eine Objekt-Vorlage).

- `class` ist ein spezielles Schlüsselwort, das angibt, dass wir hier eine Klasse, eine Vorlage für zukünftige Objekte, definieren wollen.
- `Post` ist der Name unseres Models. Wir können ihm auch einen anderen Namen geben (aber wir müssen Sonderzeichen und Leerzeichen vermeiden). Beginne einen Klassennamen immer mit einem Großbuchstaben.
- `models.Model` gibt an, dass das Post-Model ein Django-Model ist, so weiß Django, dass es in der Datenbank gespeichert werden soll.

Jetzt definieren wir die Eigenschaften, über welche wir gesprochen haben: `title`, `text`, `created_date`, `published_date` und `author`. Um dies zu tun, müssen wir den Typ jedes Felds definieren. (Ist es Text? Eine Zahl? Ein Datum? Eine Beziehung zu einem anderen Objekt, z.B. einem Benutzer?)

- `models.CharField` – so definierst du ein Textfeld mit einer limitierten Anzahl von Zeichen.
- `models.TextField` – so definierst du ein langes Textfeld ohne Grössenbeschränkung. Klingt doch perfekt für unsere Blogpostinhalte, oder?
- `models.DateTimeField` – ein Feld für einen Zeitpunkt (ein Datum und eine Uhrzeit).
- `models.ForeignKey` – definiert eine Verknüpfung/Beziehung zu einem anderen Model.

Wir werden nicht den gesamten Code hier erklären, da das zu lange dauern würde. Du solltest einen Blick in die offizielle Django-Dokumentation werfen, wenn du mehr über Modelfelder und darüber wissen möchtest, wie man auch andere Dinge als die oben beschriebenen definiert (https://docs.djangoproject.com/en/2.2/ref/models/fields/#field-types).

Was ist mit `def publish(self):`? Das ist genau die `publish`-Methode zum Veröffentlichen unserer Blogposts, über die wir vorher bereits sprachen. `def` zeigt an, dass es sich nachfolgend um eine Funktion/Methode handelt, und `publish` ist der Name der Methode. Du kannst den Namen der Methode auch ändern, wenn du möchtest. Die Benennungsregel ist, dass wir Kleinbuchstaben verwenden, und anstatt Leerzeichen (die in Funktionsnamen nicht vorkommend dürfen) Unterstriche. Eine Methode, die einen Durchschnittspreis berechnet, könnte zum Beispiel `calculate_average_price` genannt werden.

Oft geben Methoden einen Wert zurück (englisch: `return`). Ein Beispiel dafür ist die Methode `__str__`. In diesem Szenario, wenn wir `__str__()` aufrufen, bekommen wir einen Text (**string**) mit einem Blogpost-Titel zurück.

Beachte, dass sowohl `def publish(self):` als auch `def __str__(self):` in unserer Klasse eingerückt sind. Mit der Einrückung sagen wir Python, dass diese Methoden Teil der Klasse sind. Ohne die Einrückung wären es für Python Funktionen ausserhalb der Klasse, was zu anderem Verhalten führen würde.

Wenn dir über Methoden noch etwas nicht klar ist, dann zögere nicht, deinen Coach zu fragen! Wir wissen, dass es kompliziert ist, vor allem, wenn du gleichzeitig lernst, was Objekte und Funktionen sind. Aber hoffentlich sieht es für dich jetzt etwas weniger nach Magie aus!

### Tabellen für Models in deiner Datenbank erstellen

Als letzten Schritt wollen wir unser neues Model der Datenbank hinzufügen. Dazu müssen wir Django erst 'mal mitteilen, dass wir einige Änderungen an unserem Model vorgenommen haben. (Wir haben es eben erst erstellt!) Scheibe `python manage.py makemigrations blog` in dein Kommandozeilen-Fenster. Das sieht dann so aus:

{% filename %}command-line{% endfilename %}

    (myvenv) ~/djangogirls$ python manage.py makemigrations blog
    Migrations for 'blog':
      blog/migrations/0001_initial.py:
    
      - Create model Post
    

**Hinweis:** Denke daran, die Dateien nach dem Editieren zu speichern. Ansonsten führt dein Computer die vorherige Version aus, was zu unerwarteten Fehlermeldungen führen kann.

Django hat eine Migrationsdatei für uns vorbereitet, die wir nun auf unsere Datenbank anwenden müssen. Schreibe `python manage.py migrate blog`. Die Ausgabe sollte so aussehen:

{% filename %}command-line{% endfilename %}

    (myvenv) ~/djangogirls$ python manage.py migrate blog
    Operations to perform:   
       Apply all migrations: blog
    Running migrations:
       Applying blog.0001_initial... OK
    

Hurra! Unser Post-Model ist ab sofort in unserer Datenbank gespeichert! Es wäre doch schön, zu wissen, wie es aussieht, oder? Springe zum nächsten Kapitel, um es dir anzusehen!