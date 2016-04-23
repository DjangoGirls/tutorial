# Django šablony

Je čas zobrazit nějaká data! Django nám k tomuto účelu poskytuje užitečné, vestavěné **šablonové tagy**.

## Co jsou šablonové tagy?

Víš, v HTML ve skutečnosti nemůžeš použít Python kód, protože prohlížeče mu nerozumí. Znají pouze HTML. Víme, že HTML je spíše statické, zatímco Python je mnohem dynamičtější.

**Django šablonové tagy** nám umožňují přenést věci podobné Pythonu do HTML, abys mohla postavit dynamickou webovou stránku rychleji a snadněji.

## Zobraz šablonu se seznamem příspěvků

V předchozí kapitole jsme dali naší šabloně seznam příspěvků v proměnné `posts`. Teď to zobrazíme v HTML.

V Django šabloně se proměnná vypíše pomocí dvojitých složených závorek s názvem proměnné uvnitř. Takhle:

```html
    {{ posts }}
```  

Zkus to ve své šabloně `blog/templates/blog/post_list.html`. Nahraď vše od druhého `<div>` do třetího `</div>` řádkou `{{ posts }}`. Ulož soubor a obnov stránku, abys viděla výsledek:

![Figure 13.1][1]

 [1]: images/step1.png

Jak vidíš, dostali jsme toto:

```
    [<Post: My second post>, <Post: My first post>]
```  

To znamená, že to Django chápe jako seznam objektů. Vzpomínáš si z kapitoly **Úvod do pythonu**, jak můžeme zobrazit seznam? Ano, pomocí for smyček! V Django šabloně je použiješ takto:

```html
    {% for post in posts %}
        {{ post }}
    {% endfor %}
```  

Zkus udělat tohle ve své šabloně.

![Figure 13.2][2]

 [2]: images/step2.png

Funguje to! Ale chceme, aby se zobrazovaly jako ty statické příspěvky, které jsme vytvořili dříve v kapitole **Úvod do HTML**. Můžeš smíchat HTML tagy se šablonovými. Naše `body` bude vypadat takhle:

```html
    <div>
        <h1><a href="/">Django Girls Blog</a></h1>
    </div>

    {% for post in posts %}
        <div>
            <p>published: {{ post.published_date }}</p>
            <h1><a href="">{{ post.title }}</a></h1>
            <p>{{ post.text|linebreaks }}</p>
        </div>
    {% endfor %}
```  

{% raw %}Všechno co dáš mezi `{% for %}` a `{% endfor %}` se zopakuje pro každý objekt v seznamu. Obnov svou stránku:{% endraw %}

![Figure 13.3][3]

 [3]: images/step3.png

Všimla sis, že jsme tentokrát použili lehce rozdílnou notaci (`{{ post.title }}` nebo `{{ post.text }}`)? Přistupujeme k datům v každém poli defnovaném v našem `Post` modelu. Dále `|linebreaks` posílá text příspěvku filterem, aby konvertoval zalomení řádků na paragrafy.

## Ještě jedna věc

Bylo by dobré vidět, jestli tvá webová stránka bude stále fungovat i na webu, že jo? Pojďme zkusit další nasazení/deploy na PythonAnywhere. Tady je rekapitulace postupu...

*   Nejdřív hoď svůj kód na Github

```
    $ git status
    [...]
    $ git add --all .
    $ git status
    [...]
    $ git commit -m "Modified templates to display posts from database."
    [...]
    $ git push
```  

*   Pak se přihlaš do [PythonAnywhere][4] s jdi do **Bash konzole** (nebo vytvoř novou) a zadej:

 [4]: https://www.pythonanywhere.com/consoles/

```
    $ cd my-first-blog
    $ git pull
    [...]
```  

*   Konečně, jdi na záložku [Web][5] a klikni na **Reload**. Tvá stránka by měla být aktuální!

 [5]: https://www.pythonanywhere.com/web_app_setup/

Gratulujeme! Teď jdi zkusit přidat nové příspěvky ve tvém Django administračním rozhraní (nezapomeň přidat published_date!), potom obnov stránku a podívej se jestli se nové příspěvky zobrazí.

Funguje to dokonale? Jsme hrdí! Odpočiň si na chvíli od počítače, zasloužíš si přestávku. :)

![Figure 13.4][6]

 [6]: images/donut.png
