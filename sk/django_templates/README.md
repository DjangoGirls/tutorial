# Šablóny Django

Je na čase zobraziť nejaké údaje! Na to nám Django ponúka užitočné vstavané **šablónové tagy**.

## Čo sú to šablónové tagy?

V HTML vlastne nemôžeš písať pythonský kód, pretože prehliadače mu nerozumejú. Poznajú len HTML. Vieme, že HTML je skôr statické, kým Python je oveľa dynamickejší.

**Django šablónové tagy** nám umožňujú previesť Pythonské veci do HTML, takže dynamické webové stránky môžeš vytvoriť rýchlejšie a jednoduchšie. Paráda!

## Zobraz šablónu so zoznamom príspevkov

V predchádzajúcej kapitole sme našej šablóne dali zoznam príspevkov v premennej `posts`. Teraz to zobrazíme v HTML.

Na vypísanie premennej v Django šablónach použijeme dvojitú zloženú zátvorku s názvom premennej vo vnútri, asi takto:

```html
{{ posts }}
```

Vyskúšaj to vo svojej šablóne `blog/templates/blog/post_list.html`. Nahraď všetko od druhého `<div>` po tretí `</div>` týmto kódom: `{{ posts }}`. Ulož súbor a obnov stránku, aby sme videli výsledky:

![Obrázok 13.1][1]

 [1]: images/step1.png

Ako vidíš, dostali sme len toto:

```
[<Post: My second post>, <Post: My first post>]
```

To znamená, že to Django chápe ako zoznam objektov. Pamätáš si z kapitoly **Úvod do Pythonu** ako môžeme zobraziť zoznamy? Áno, cyklami! V Django šablóne ich urobíš takto:

```html
{% for post in posts %}
    {{ post }}
{% endfor %}
```

Vyskúšaj si to vo svojej šablóne.

![Obrázok 13.2][2]

 [2]: images/step2.png

Funguje to! Ale my chceme, aby sa zobrazili ako tie statické príspevky, ktoré sme vytvorili predtým v kapitole **Úvod do HTML**. Môžeš skombinovať HTML a šablónové tagy. Naše `body` bude vyzerať takto:

```html
<div>
    <h1><a href="/">Django Girls Blog</a></h1>
</div>

{% for post in posts %}
    <div>
        <p>published: {{ post.published_date }}</p>
        <h1><a href="">{{ post.title }}</a></h1>
        <p>{{ post.text|linebreaksbr }}</p>
    </div>
{% endfor %}
```

{% raw %}Všetko, čo dáš medzi `{% for %}` a `{% endfor %}` sa bude opakovať pre každý objekt v zozname. Obnov svoju stránku:{% endraw %}

![Obrázok 13.3][3]

 [3]: images/step3.png

Všimla si si, že sme tentokrát použili trochu odlišné zápisy `{{ post.title }}` alebo `{{ post.text }}`? Pristupujeme k údajom v každom z polí definovanom v našom `Post` modeli. Okrem toho `|linebreaksbr` preposiela texty príspevkov cez filter, ktorý konvertuje zalomenie riadkov na odstavce.

## Ešte jedna vec

Bolo by fajn vidieť či bude tvoja web stránka stále funkčná aj na Internete, však? Skúsme to znova nasadiť na PythonAnywhere. Tu je rekapitulácia postupu...

*   Najskôr pošli svoj kód na Github

```
$ git status
[...]
$ git add -A .
$ git status
[...]
$ git commit -m "Modified templates to display posts from database."
[...]
$ git push
```

*   Potom sa prihlás do [PythonAnywhere][4] a choď do **Bash konzoly** (alebo spusti novú) a zadaj:

 [4]: https://www.pythonanywhere.com/consoles/

```
$ cd my-first-blog
$ git pull
[...]
```

*   A nakoniec prejdi na [záložku Web][5] a stlač **Reload** na svojej webovej aplikácii. Aktualizácia by mala byť online!

 [5]: https://www.pythonanywhere.com/web_app_setup/

Gratulujeme! Teraz skús pridať nový príspevok v Django adminovi (nezabudni pridať published_date!), potom obnov stránku a pozri sa, či sa príspevok zobrazí.

Funguje ako hodinky? Sme hrdí! Teraz si na chvíľku oddýchni od počítača, zaslúžiš si trochu voľna. :)

![Obrázok 13.4][6]

 [6]: images/donut.png
