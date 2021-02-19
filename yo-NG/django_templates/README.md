# Àwọn àwòṣe (template) Django

Àkókò láti ṣàfihàn àwọn dátà kan! Django fún wa ní **àwọn àmì àwòṣe** (template tags) tó wúlò fún ìyẹn.

## Kíni àwọn àmì àwòṣe?

Wòó, nínú HTML, ìwọ kò lè kọ kóòdù Python, nítorí pé àwọn aṣàwákiri kò loye rẹ̀. Wọ́n mọ HTML nìkan. A sì mọ̀ pé HTML má n wà lójú kan, nígbà tí Python má n ṣiṣẹ́.

**Àwọn àmì àwòṣe Django** fún wa láàyè láti gbé àwọn nnkan tó jẹ́ mọ́ Python sínú HTML, kó o bàa lè yára kọ́ àwọn ààyè ayélujára tó n ṣiṣẹ́. Ó dára!

## Ṣàfihàn àwòṣe àkójọ àròkọ

Nínú àkòrí tó ṣáájú náà, a fún àwòṣe wa ní àkójọ àwọn àròkọ kan nínú variable `posts` náà. Ní báyìí, a ó ṣàfihàn rẹ̀ nínú HTML.

Láti ṣàtẹ̀jáde variable kan nínú àwọn àwòṣe Django, a ma lo àkámọ́ onídodo méjì pẹ̀lú orúkọ variable náà nínú rẹ̀, báyìí:

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
{{ posts }}
```

Gbìyànjú èyí nínú àwòṣe `blog/templates/blog/post_list.html` rẹ. Ṣí i sílẹ̀ nínú olóòtú kóòdù náà, kí o sì rọ́pò gbogbo nnkan láti `<div>` kejì sí `</div>` kẹta pẹ̀lú `{{ posts }}`. Tọ́jú fáìlì náà, kí o sì ṣe ìmúdójúìwọ̀n ojú-ìwé náà láti rí àbájáde náà:

![Figure 13.1](images/step1.png)

Gẹ́gẹ́ bó o ṣe ríi, gbogbo ohun tí a ní ni èyí:

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
<QuerySet [<Post: My second post>, <Post: My first post>]>
```

Èyí túmọ̀ sí pé Django lóye rẹ̀ gẹ́gẹ́ bí àkójọ àwọn ohun-èlò kan. Rántí láti **Ìfihàn sí Python** bí a ṣe lè ṣàfihàn àwọn àkójọ? Bẹ́ẹ̀ni, pẹ̀lú for loops! Nínú àwòṣe Django kan, wàá ṣe wọ́n báyìí:

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
{% for post in posts %}
    {{ post }}
{% endfor %}
```

Gbìyànjú èyí nínú àwòṣe rẹ.

![Figure 13.2](images/step2.png)

Ó n ṣiṣẹ́! Ṣùgbọ́n a fẹ́ kí àwọn àròkọ náà gba ìfihàn gẹ́gẹ́ bí àwọn àròkọ tó wà lójú kan tí a ti ṣẹ̀dá ṣáájú nínú àkòrí **Ìfihàn sí HTML** náà. O lè da HTML àti àwọn àmì àwòṣe papọ̀. `body` wa yíò rí báyìí:

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
<header>
    <h1><a href="/">Django Girls Blog</a></h1>
</header>

{% for post in posts %}
    <article>
        <time>published: {{ post.published_date }}</time>
        <h2><a href="">{{ post.title }}</a></h2>
        <p>{{ post.text|linebreaksbr }}</p>
    </article>
{% endfor %}
```

{% raw %} Gbogbo nnkan tí o bá fi sí àárín `{% for %}` àti `{% endfor %}` yíò máa jẹ́ ṣíṣe fún ohun-èlò kọ̀ọ̀kan nínú àkójọ náà. Ṣe ìmúdójúìwọ̀n ojú-ìwé rẹ:{% endraw %}

![Figure 13.3](images/step3.png)

Ṣe o ti ṣàkíyèsí pé a lo àkọsílẹ̀ tó yàtọ̀ díẹ̀ lọ́tẹ̀ yìí (`{{ post.title }}` tàbí `{{ post.text }}`)? A ń lo dátà tó wà nínú ọ̀kọ̀ọ̀kan àwọn ààyè tí a ṣàlàyé nínú àwòṣe `Post` wa. Àti pé, `|linebreaksbr` náà n mú ọ̀rọ̀ àwọn àròkọ náà gba asẹ́ kan kọjá láti ṣàyípadà àwọn ìdá ìlà (line-breaks) sí ìpínrọ̀ (paragraphs).

## Ó ṣì ku nnkan kan

Yóò dára láti ṣàyẹ̀wò bóyá ààyè ayélujára rẹ ṣì máa ṣiṣẹ́ lórí Íńtánẹ́ẹ̀tì gbangba náà, àbí bẹ́ẹ̀ kọ? Jẹ́ ká gbìyànjú ṣíṣe àgbékalẹ̀ sí PythonAnywhere lẹ́ẹ̀kan si. Àwọn ìgbésẹ̀ náà ní ṣókí nìyí…

* Lákọ̀ọ́kọ́, ti kóòdù rẹ sí GitHub

{% filename %}command-line{% endfilename %}

    $ git status
    [...]
    $ git add .
    $ git status
    [...]
    $ git commit -m "Modified templates to display posts from database."
    [...]
    $ git push
    

* Lẹ́yìn náà, wọlé padà sí [PythonAnywhere](https://www.pythonanywhere.com/consoles/) kí o lọ sí **Bash console** rẹ (tàbí bẹ̀rẹ̀ tuntun kan), àti ṣe:

{% filename %}PythonAnywhere command-line{% endfilename %}

    $ cd <your-pythonanywhere-domain>.pythonanywhere.com
    $ git pull
    [...]
    

(Rántí láti rọ́pò `<your-pythonanywhere-domain>` pẹ̀lú subdomain PythonAnywhere rẹ, láìsí àwọn àkámọ́ onígun náà.)

* Ní ìparí, lọ sí [ojú-ìwé "Ayélujára"](https://www.pythonanywhere.com/web_app_setup/) náà kí o sì tẹ **Reload** lórí ètò ayélujára rẹ. (Láti dé àwọn ojú-ìwé PythonAnywhere mìíràn láti console náà, lo bọ́tìnnì àkójọ àṣàyàn náà ní igun òkè lápá ọ̀tún.) Ó yẹ kí ìmúdójúìwọ̀n rẹ ti máa ṣiṣẹ́ lórí https://subdomain.pythonanywhere.com -- ṣàyẹ̀wò rẹ̀ nínú aṣàwákiri náà! Tí àwọn àròkọ blog lórí ààyè PythonAnywhere rẹ kò bá dọ́gba pẹ̀lú àwọn àròkọ tó wà lórí blog tí o pèsè lórí server kọ̀mpútà rẹ, kò sóhun tó burú níbẹ̀. Àwọn àkójọpọ̀ dátà tó wà lórí kọ̀mpútà tìẹ àti Python Anywhere kò ní ìbádọ́gba pẹ̀lú àwọn fáìlì rẹ yòókù.

Kú oríire! Ní báyìí, tẹ̀síwájú kí o gbìyànjú ṣíṣe àfikún àròkọ tuntun kan sínú alábòójútó Django rẹ (rántí láti ṣàfikún published_date! (ọjọ́ ìtẹ̀jáde)) Rí dájú pé o wà nínú alábòójútó Django náà fún ààyè pythonanywhere rẹ, https://subdomain.pythonanywhere.com/admin. Lẹ́yìn náà, ṣe ìmúdójúìwọ̀n ojú-ìwé rẹ láti ṣàyẹ̀wò bóyá àròkọ náà máa hàn níbẹ̀.

Ó n ṣiṣẹ́ bíi oògùn kan? Inú wa dùn! kúrò níbi kọ̀mpútà rẹ fún ìgbà díẹ̀ – o lè sinmi báyìí. :)

![Figure 13.4](images/donut.png)