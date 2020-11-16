# Ìfihàn sí HTML

Kíni àwòṣe (template) kan, o lè béèrè?

Àwòṣe kan jẹ́ fáìlì kan tí a lè tún lò láti ṣàfihàn ìròyìn ọ̀tọ̀ọ̀tọ̀ ni àgbékalẹ̀ tó báramu kan – fún àpẹẹrẹ, o lè lo àwòṣe kan láti ràn ọ́ lọ́wọ́ lórí kíkọ lẹ́tà kan nítorí bó tilẹ̀ jẹ́ pé lẹ́tà kọ̀ọ̀kan lè ní ìròyìn ọ̀tọ̀ọ̀tọ̀ àti pé wọ́n lè jẹ́ kíkọ sí èèyàn ọ̀tọ̀ọ̀tọ̀, wọ́n máa lo àgbékalẹ̀ kannáà.

Àgbékalẹ̀ àwòṣe Django kan ni a ṣàpèjúwe ní èdè kan tí a n pè ní HTML (ìyẹn ni HTML tí a dárúkọ ní àkòrí àkọ́kọ́ náà, **Bí Íńtánẹ́ẹ̀tì ṣé n ṣiṣẹ́**).

## Kíni HTML?

HTML jẹ́ kóòdù kan tí aṣàwákiri ayélujára rẹ - bíi Chrome, Firefox àbí Safari - máa túmọ̀ láti ṣàfihàn ojú-ìwé ayélujára kan fún aṣàmúlò náà.

HTML dúró fún "HyperText Markup Language". **HyperText** túmọ̀ sí pé ó jẹ́ irú ọ̀rọ̀ kan tó n ṣàtìlẹ́yìn fún àwọn ọ̀rọ̀-atọ̀ka láàrín àwọn ojú-ìwé. **Markup** túmọ̀ sí pé a ti mú àkọsílẹ kan tí a sì ṣàmì síi pẹ̀lú kóòdù láti sọ fún nnkan kan (ní irú ìṣẹ̀lẹ̀ yìí, aṣàwákiri kan) bí ó ṣe lè túmọ̀ ojú-ìwé náà. Kóòdù HTML gba kíkọ́ pẹ̀lú **àwọn àmì**, ọ̀kọ̀ọ̀kan n bẹ̀rẹ̀ pẹ̀lú `<` tó sì n parí pẹ̀lú `>`. Àwọn àmì wọ̀nyí dúró fún **àwọn element** ìṣàmìsí.

## Àwòṣe àkọ́kọ́ rẹ!

Ṣíṣẹ̀dá àwòṣe kan túmọ̀ sí ṣíṣẹ̀dá fáìlì àwòṣe kan. Gbogbo nnkan ni fáìlì kan, àbí bẹ́ẹ̀ kọ? Ó ṣeéṣe kí o ti ṣàkíyèsí èyí tẹ́lẹ̀.

A máa n tọ́jú àwọn àwòṣe sínú àkójọpọ̀ fáìlì `blog/templates/blog`. Nítorí náà, kọ́kọ́ ṣẹ̀dá àkójọpọ̀ fáìlì kan tí a n pè ní `templates` sínú àkójọpọ̀ fáìlì blog rẹ. Lẹ́yìn náà, ṣẹ̀dá àkójọpọ̀ fáìlì mìíràn tí a n pè ní `blog` sínú àkójọpọ̀ fáìlì àwọn àwòṣe rẹ:

    blog
    └───templates
        └───blog
    

(O lè máa ronú pé kí nìdí tí a fi nílò àwọn àkójọpọ̀ fáìlì méjì tó n jẹ́ `blog` – bí o ṣe máa ṣàwárí tó bá yá, èyí jẹ́ ọ̀nà ìkọrúkọ tó wúlò kan tí yíò mú ayé rọrùn nígbà tí àwọn nnkan bá bẹ̀rẹ̀ sí ní ṣòro.)

Ní báyìí, ṣẹ̀dá fáìlì `post_list.html` kan (fi sílẹ̀ ní òfìfo) sínú àkójọpọ̀ fáìlì `blog/templates/blog` náà.

Wo bí ààyè ayélujára rẹ ṣe rí ní báyìí: http://127.0.0.1:8000/

> Tí o bá ṣì ní àṣìṣe kan `TemplateDoesNotExist`, gbìyànjú láti tún server rẹ bẹ̀rẹ̀. Lọ sí ìlà ìpàṣẹ náà, dá server náà dúró nípasẹ̀ títẹ Ctrl+C (àwọn bọ́tìnnì Control àti C papọ̀) kí o sì bẹ̀rẹ̀ rẹ̀ padà nípasẹ̀ lílo àṣẹ `python manage.py runserver` kan.

![Figure 11.1](images/step1.png)

No error anymore! Congratulations! :) However, your website isn't actually publishing anything except an empty page, because your template is empty too. We need to fix that.

Ṣí fáìlì tuntun náà nínú olóòtú kóòdù náà, kí o sì ṣàfikún èyí tó tẹ̀le yìí:

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
<html>
<body>
    <p>Hi there!</p>
    <p>It works!</p>
</body>
</html>
```

Báwo wá ni ààyè ayélujára rẹ ṣe rí ní báyìí? Ṣàbẹ̀wò rẹ láti wádìí: http://127.0.0.1:8000/

![Figure 11.2](images/step3.png)

It worked. Nice work there! :)

* Àmì tó ṣe pàtàkì jù náà, `<html>`, máa n jẹ́ ìbẹ̀rẹ̀ èyíkéyìí ojú-ìwé ayélujára àti pé `</html>` máa n jẹ́ ìparí náà. Gẹ́gẹ́ bó o ṣe ríi, gbogbo àkóónú ààyè ayélujára náà máa wà láàrín àmì ìbẹ̀rẹ̀ `<html>` àti àmì ìparí `</html>` náà
* `<p>` jẹ́ àmì kan fún àwọn element ìpínrọ: `</p>` yíò parí ìpínrọ kọ̀ọ̀kan

## Orí àti ara

Ojú-ìwé HTML kọ̀ọ̀kan tún gba pínpín sí àwọn element méjì: **head** àti **body**.

* **head** jẹ́ element kan tó kó àlàyé nípa àkọsílẹ̀ náà tí kò ní hàn lórí ojú àwòrán náà sínú.

* **body** jẹ́ element kan tó kó gbogbo nnkan yòókù tó fojú hàn gẹ́gẹ́ bí ara ojú-ìwé ayélujára náà sínú.

A máa n lo `<head>` láti sọ fún aṣàwákiri náà nípa ìṣètò ojú-ìwé náà, àti `<body>` láti sọ ohun tó ma wà lórí ojú-ìwé náà gan-an.

Fún àpẹẹrẹ, o lè fi element àkọlé ojú-ìwé ayélujára kan sínú `<head>` náà, báyìí:

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
<html>
    <head>
        <title>Ola's blog</title>
    </head>
    <body>
        <p>Hi there!</p>
        <p>It works!</p>
    </body>
</html>
```

Tọ́jú fáìlì náà kí o sì ṣe ìmúdójúìwọ̀n ojú-ìwé rẹ.

![Figure 11.3](images/step4.png)

Ṣàkíyèsí bí aṣàwákiri náà ṣe mọ̀ pé "Ola's blog" ni àkọlé ojú-ìwé rẹ? Ó ti túmọ̀ `<title>Ola's blog</title>` àti pé ó ti gbé e ọ̀rọ̀ náà sínú pẹpẹ àkọlé aṣàwákiri rẹ (yóò tún jẹ́ lílò fún àwọn àmì ìwé àti bẹ́ẹ̀ bẹ́ẹ̀ lọ).

Ó ṣeéṣe kí o ti tún ṣàkíyèsí pé àmì ìbẹ̀rẹ̀ kọ̀ọ̀kan ló ní *àmì ìparí* kan, pẹ̀lú `/` kan, àti pé a n fi àwọn element bọ̀ inú ara wọn (ìyẹn ni pé, o kò lè parí àmì pàtó kan títí di ìgbà tí gbogbo àwọn tó wà nínú rẹ̀ bá ti parí).</p> 

Ó dàbí fífi àwọn nǹkan sínú àwọn àpótí. O ní àpótí nlá kan, `<html></html>`; nínú rẹ̀ ni `<body></body>`wà, àti pé ìyẹn tún kó àwọn àpótí kékeré sínú: `<p></p>`.

O nílò láti tẹ̀lé àwọn òfin ti àwọn àmì *ìparí*, àti ti fífi àwọn element bọ̀ inú ara wọn – tí ìwọ kò bá ṣe bẹ́ẹ̀, ó ṣeéṣe kí aṣàwákiri náà má lè túmọ̀ wọn dáadáa àti pé ojú-ìwé rẹ kò ní fojú hàn bó ṣe tọ́.

## Ṣe àwòṣe rẹ bí o ṣe fẹ́

O lè wá ṣeré díẹ̀ báyìí kí o gbìyànjú láti ṣe àwòṣe rẹ bí o ṣe fẹ́! Díẹ lára àwọn àmì tó wúlò fún ìyẹn nìyí:

* `<h1>Àkọsórí kan</h1>` fún àkọsórí rẹ tó ṣe pàtàkì jù
* `<h2>Ìsọ̀rí orí ọ̀rọ̀ kan</h2>` fún àkọsórí kan ní ìpele tó kàn
* `<h3>Ìsọ̀rí lábẹ́ ìsọ̀rí orí ọ̀rọ̀ kan</h3>` …àti bẹ́ẹ̀ bẹ́ẹ̀ lọ, títí dé `<h6>`
* `<p>Ìpínrọ̀ ọ̀rọ̀ kan</p>`
* `<em>ọ̀rọ̀</em>` yíò ṣàgbéyọ ọ̀rọ̀ rẹ pẹ̀lú lẹ́tà tó dagun
* `<strong>ọ̀rọ̀</strong>` yíò ṣàgbéyọ ọ̀rọ̀ rẹ pẹ̀lú lẹ́tà tó nípọn
* `<br>` yíò lọ sí ìlà mìíràn (o kò lè fi nnkan kan sínú br àti pé kò sí àmì ìparí)
* `<a href="https://djangogirls.org">atọ́ka</a>` yíò ṣẹ̀dá atọ́ka kan
* `<ul><li>nǹkan àkọ́kọ́</li><li>nǹkan èkejì</li></ul>` yíò ṣe àkójọ kan, gẹ́gẹ́ bí eléyìí!
* `<div></div>` yíò ṣàlàyé abala kan ti ojú-ìwé náà

Àpẹẹrẹ àwòṣe kíkún kan nìyí, ṣàdàkọ rẹ̀ sínú `blog/templates/blog/post_list.html`:

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
<html>
    <head>
        <title>Django Girls blog</title>
    </head>
    <body>
        <div>
            <h1><a href="/">Django Girls Blog</a></h1>
        </div>

        <div>
            <p>published: 14.06.2014, 12:14</p>
            <h2><a href="">My first post</a></h2>
            <p>Aenean eu leo quam. Pellentesque ornare sem lacinia quam venenatis vestibulum. Donec id elit non mi porta gravida at eget metus. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus.</p>
        </div>

        <div>
            <p>published: 14.06.2014, 12:14</p>
            <h2><a href="">My second post</a></h2>
            <p>Aenean eu leo quam. Pellentesque ornare sem lacinia quam venenatis vestibulum. Donec id elit non mi porta gravida at eget metus. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut f.</p>
        </div>
    </body>
</html>
```

A ti ṣẹ̀dá àwọn abala `div` mẹ́ta níbí.

* Element `div` àkọ́kọ́ náà kó àkọlé blog wa sínú – ó jẹ́ àkọsórí kan àti atọ́ka kan
* Àwọn element `div` méjì mìíràn kó àwọn àròkọ blog wa sínú pẹ̀lú ọjọ́ ìtẹ̀jáde kan, `h2` pẹ̀lú àkọlé àròkọ kan tó lè gba títẹ̀ àti àwọn `p` (ìpínrọ̀) ọ̀rọ̀ méjì, ọ̀kan fún ọjọ́ náà àti ọ̀kan fún àròkọ blog wa.

Yóò fún wa ní àbájáde yìí:

![Figure 11.4](images/step6.png)

Yaaay! Ṣùgbọ́n títí di báyìí, àwòṣe wa máa n ṣàfihàn **ìròyìn kannáà** nìkan – nígbà tó jẹ́ pé ní ìbẹ̀rẹ̀ a n sọ̀rọ̀ nípa àwọn àwòṣe bí wọ́n ṣe n gbà wa láàyè láti ṣàfihàn ìròyìn **ọ̀tọ̀ọ̀tọ̀** pẹ̀lú **àgbékalẹ̀ kannáà**.

Ohun tí a fẹ́ ṣe gan-an ni láti ṣàfihàn àwọn àwòṣe gidi tí a ṣàfikún nínú alábòójútó Django wa – ibi tó kàn tí a n lọ nìyẹn.

## Ó ṣì ku nnkan kan: ṣàgbékalẹ̀!

Yóò dára láti rí pé gbogbo èyí n ṣiṣẹ́ lórí Íńtánẹ́ẹ̀tì náà, àbí bẹ́ẹ̀ kọ? Jẹ́ ká ṣe àgbékalẹ̀ sí PythonAnywhere mìíràn:

### Commit, kí o sì ti kóòdù rẹ sí GitHub

Lákọ̀ọ́kọ́, jẹ́ ká wo àwọn fáìlì tó ti yí padà láti ìgbà tí a ti ṣàgbékalẹ̀ kẹ́yìn (ṣe àwọn àṣẹ wọ̀nyí lórí kọ̀mpútà rẹ, kìí ṣe lórí PythonAnywhere):

{% filename %}command-line{% endfilename %}

    $ git status
    

Ri dájú pé o wà nínú àkójọpọ̀ fáìlì `djangogirls` náà kí a sì sọ fún `git` láti ṣàfikún gbogbo àwọn ìyípadà tó wà nínú àkójọpọ̀ fáìlì yìí:

{% filename %}command-line{% endfilename %}

    $ git add .
    

Ṣáájú kí a tó gbé gbogbo àwọn fáìlì náà jáde, jẹ́ ká ṣàyẹ̀wò nnkan tí `git` yíò máa gbé jáde (ó yẹ kí gbogbo àwọn fáìlì tí `git` máa gbé jáde ti fojú hàn ní àwọ̀ ewé):

{% filename %}command-line{% endfilename %}

    $ git status
    

A ti fẹ́rẹ̀ẹ́ débẹ̀, àkókò ti tó báyìí láti sọ fún-un pé kí ó tọ́jú ìyípadà yìí sínú ìtàn rẹ̀. A máa fún-un ní "ìròyìn commit" kan níbi tí a ti máa ṣàpèjúwe ohun tí a ti yípadà. O lè tẹ ohunkóhun tí o bá fẹ́ lákòókò yìí, ṣùgbọ́n ó máa wúlò láti tẹ nnkan ìṣàpèjúwe kan kí o bá lè rántí ohun tí o ti ṣe ní ọjọ́ iwájú.

{% filename %}command-line{% endfilename %}

    $ git commit -m "Changed the HTML for the site."
    

> **Note** Make sure you use double quotes around the commit message.

Tá a bá ti ṣe ìyẹn, a máa gbé (ti) àwọn ìyípadà wa jáde sí GitHub:

{% filename %}command-line{% endfilename %}

    $ git push
    

### Fa kóòdù tuntun rẹ sí PythonAnywhere, kí o sì ṣe ìmúdójúìwọ̀n ètò ayélujára rẹ

* Ṣí [ojú-ìwé àwọn console PythonAnywhere](https://www.pythonanywhere.com/consoles/) náà kálẹ̀ kí o lọ sí **Bash console** rẹ (tàbí bẹ̀rẹ̀ tuntun kan). Lẹ́yìn náà, ṣe:

{% filename %}PythonAnywhere command-line{% endfilename %}

    $ cd ~/<your-pythonanywhere-domain>.pythonanywhere.com
    $ git pull
    [...]
    

O máa nílò láti rọ́pò `<your-pythonanywhere-domain>` pẹ̀lú orúkọ subdomain PythonAnywhere rẹ gan-an, láìsí àwọn àkámọ́ onígun náà. Orúkọ subdomain rẹ máa n sábà jẹ́ orúkọ aṣàmúlò PythonAnywhere rẹ, ṣùgbọ́n nígbà mìíràn ó lè yàtọ̀ díè (irú bíi tí orúkọ aṣàmúlò rẹ bá ní àwọn lẹ́tà ńlá). Nítorí náà, tí àṣẹ yìí kò bá ṣiṣẹ́, lo àṣẹ `ls` (ṣàkọsílẹ̀ àwọn fáìlì) náà láti wá orúkọ subdomain/fódà rẹ gan-an, lẹ́yìn náà `cd` lọ síbẹ̀.

Ní báyìí, wo bí kóòdù rẹ ṣe n gba gbígbà. Tí o bá fẹ́ ṣàyẹ̀wò bóyá ó ti dé, o lè lọ sí **ojú-ìwé "Àwọn fáìlì"** náà kí o sì wo kóòdù rẹ lórí PythonAnywhere (o lè dé àwọn ojú-ìwé PythonAnywhere mìíràn láti bọ́tìnnì àkójọ àṣàyàn lórí ojú-ìwé console náà).

* Ní ìparí, lọ sí [ojú-ìwé "Ayélujára"](https://www.pythonanywhere.com/web_app_setup/) náà kí o sì tẹ **Reload** lórí ètò ayélujára rẹ.

Ó yẹ kí ìmúdójúìwọ̀n rẹ ti máa ṣiṣẹ́! Tẹ̀síwájú láti ṣe ìmúdójúìwọ̀n ààyè ayélujára rẹ nínú aṣàwákiri náà. Ó yẹ kí àwọn ìyípadà ti fojú hàn. :)