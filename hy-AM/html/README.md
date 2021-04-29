# HTML- ի ներածություն

Կարո՞ղ եք հարցնել, թե ի՞նչ ձևանմուշ է:

Կաղապարը ֆայլ է, որը մենք կարող ենք կրկին օգտագործել `տարբեր տեղեկատվություն կայուն ձևաչափով ներկայացնելու համար. Օրինակ, դուք կարող եք օգտագործել ձևանմուշ, որը կօգնի ձեզ նամակ գրել, քանի որ չնայած յուրաքանչյուր նամակ կարող է պարունակել տարբեր հաղորդագրություն և հասցեագրված լինել այլ անձի: , նրանք կկիսվեն նույն ձևաչափով:

Django ձևանմուշի ձևաչափը նկարագրված է HTML կոչվող լեզվով (դա HTML- ն է, որը մենք նշել ենք առաջին գլխում ՝ ** How the Internet works (Ինչպես է աշխատում ինտերնետը) **):

## Ի՞նչ է HTML- ը:

HTML- ը ծածկագիր է, որը մեկնաբանվում է ձեր վեբ զննարկչի կողմից, ինչպիսիք են Chrome- ը, Firefox- ը կամ Safari- ն `օգտագործողի համար վեբ էջ ցուցադրելու համար:

HTML- ը նշանակում է «HyperText Markup Language»: ** HyperText ** նշանակում է, որ դա տեքստի տեսակ է, որն աջակցում է էջերի միջև հիպերհղումները: ** Markup (Նշում) ** նշանակում է, որ մենք վերցրել ենք մի փաստաթուղթ և նշել այն կոդով, որպեսզի ինչ-որ բան ասենք (այս դեպքում ՝ զննարկիչ), թե ինչպես մեկնաբանել էջը: HTML կոդը կառուցված է ** tags (պիտակներով) **, յուրաքանչյուրը սկսվում է `<` - ով և ավարտվում `>` - ով: Այս tag-ները (պիտակները) ներկայացնում են markup (մակնշման) ** element-ներ(տարրեր) **:

## Ձեր առաջին template-ը (ձևանմուշը):

Կաղապար ստեղծել նշանակում է ձևանմուշի ֆայլ ստեղծել: Ամեն ինչ ֆայլ է, չէ՞: Դուք հավանաբար դա արդեն նկատել եք:

Ձևանմուշները պահվում են ` blog/templates/blog` գրացուցակում: Այսպիսով, նախ ստեղծեք ` template-ներ (կաղապարներ) ` կոչվող գրացուցակ ձեր բլոգի գրացուցակի ներսում: Դրանից հետո ստեղծեք մեկ այլ գրացուցակ, որը կոչվում է ` blog` ձեր ձևանմուշների գրացուցակում.

    blog
    └───templates
        └───blog
    

(Կարող եք զարմանալ, թե ինչու են մեզ հարկավոր երկու գրացուցակներ, որոնք կոչվում են ` blog`, ինչպես կիմանաք ավելի ուշ, սա անվանակոչման օգտակար պայմանագիր է, որը կյանքն ավելի է հեշտացնում, երբ ամեն ինչ սկսում է բարդանալ:

Եվ հիմա ստեղծեք ` post_list.html ` ֆայլ (պարզապես թողեք այն դատարկ) առայժմ `blog/templates/blog ` գրացուցակի ներսում:

Տեսեք, թե ինչպես է ձեր կայքը այժմ նայում. Http://127.0.0.1:8000/

> Եթե ​​դեռ սխալ ունեք ` TemplateDoesNotExist ` - ը, փորձեք վերագործարկել ձեր սերվերը: Անցեք հրամանի տող, դադարեցրեք սերվերը ՝ Ctrl + C (Control և C ստեղները միասին) սեղմելով և այն նորից սկսեք ՝ գործարկելով ` python manage.py runserver ` command-ը (հրամանը):

![Figure 11.1](images/step1.png)

Այլևս ոչ մի սխալ: Շնորհավորում եմ :) Այնուամենայնիվ, ձեր կայքը իրականում ոչինչ չի հրապարակում, բացի դատարկ էջից, քանի որ ձեր ձևանմուշն էլ է դատարկ: Մենք պետք է դա շտկենք:

Բացեք նոր ֆայլը ծածկագրի խմբագրում և ավելացրեք հետևյալը.

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
<!DOCTYPE html>
<html>
<body>
    <p>Hi there!</p>
    <p>It works!</p>
</body>
</html>
```

Այսպիսով, ինչպես է ձեր կայքը այժմ նայում: Այցելեք այն ՝ պարզելու համար ՝ http://127.0.0.1:8000/

![Figure 11.2](images/step3.png)

Դա աշխատեց. Հաճելի աշխատանք այնտեղ: :)

* `<! DOCTYPE html >` տողը HTML պիտակ չէ: Այն հայտարարում է միայն փաստաթղթի տեսակը: Այստեղ այն զննարկչին տեղեկացնում է, որ փաստաթղթի տեսակը [ HTML5 ](https://html.spec.whatwg.org/#the-doctype) է: Սա միշտ էլ ցանկացած HTML5 ֆայլի սկիզբ է:
* Ամենահիմնական թեգը ՝ `<html>`, միշտ html բովանդակության սկիզբն է, և `</html> ` միշտ վերջը: Ինչպես տեսնում եք, կայքի ամբողջ բովանդակությունը անցնում է `<html>` սկզբի և եզրափակիչ թեգի միջև`</html>`
* `<p>` պիտակ է պարբերության տարրերի համար; `</p> ` փակվում է յուրաքանչյուր պարբերություն

## Գլուխը և մարմինը

Յուրաքանչյուր HTML էջ բաժանվում է նաև երկու element-երի ** head ** և ** body **

* ** head-ը ** էլեմենտ է, որը պարունակում է տեղեկություններ էկրանին չներկայացվող փաստաթղթի մասին:

* ** body-ին ** էլեմենտ է, որը պարունակում է այն ամենը, ինչ ցուցադրվում է որպես վեբ էջի մաս:

Մենք օգտագործում ենք `<head>` ՝ զննարկիչին էջի կազմաձևման մասին պատմելու համար, և `<body>` ՝ պատմելու համար, թե իրականում որն է էջում:

Օրինակ, `<head>` - ի ներսում կարող եք տեղադրել վեբ էջի վերնագրի էլեմենտ, ինչպես հետևյալը.

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
<!DOCTYPE html>
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

Պահեք (save) ֆայլը և թարմացրեք ձեր էջը:

![Figure 11.3](images/step4.png)

Նկատեք, թե զննարկիչը ինչպե՞ս է հասկացել, որ "Ola's blog"( «Օլայի բլոգը») ձեր էջի վերնագիրն է: Այն մեկնաբանել է `<title> Օla's blog </title>` և տեքստը դրել ձեր զննարկչի վերնագրի տողում (այն կօգտագործվի նաև էջանիշների համար և այլն):

Հավանաբար, դուք նաև նկատել եք, որ յուրաքանչյուր բացող պիտակ համընկնում է * closing tag (փակող պիտակ) * - ի հետ, ` / ` - ով, և որ էլեմենտ * nested (տեղադրված են) * (այսինքն ՝ կարող եք փակեք որոշակի tag (պիտակ), մինչև որ փակվեն բոլոր ներսում գտնվողները):

Դա նման է իրերը տուփերի մեջ դնելուն: Դուք ունեք մեկ մեծ տուփ ՝ `<html> </html>`; դրա ներսում կա `<body> </body>`, և դա պարունակում է դեռ ավելի փոքր տուփեր. `<p> </p>`

Դուք պետք է պահպանեք պիտակների* closing (փակման) * և * nesting(բնադրման)* տարրերի այս կանոնները. Եթե դա չես անում, զննարկիչը չի կարողանա դրանք ճիշտ մեկնաբանել, և ձեր էջը կցուցադրվի սխալ

## Անհատականացրեք ձեր ձևանմուշը

Այժմ կարող եք մի փոքր զվարճանալ և փորձել հարմարեցնել ձեր ձևանմուշը: Ահա դրա համար մի քանի օգտակար tags (պիտակ):

* `<h1> A heading (Վերնագիր) </h1>` ձեր ամենակարևոր վերնագրի համար
* `<h2> sub-heading (ենթավերնագիր) </h2>`Հաջորդ մակարդակի վերնագրի համար
* Նույնիսկ ավելի փոքր`<h3> Ենթավերնագիր </h3>`… և այլն, մինչև `<h6>`
* `
<p> Տեքստի մի պարբերություն </p>`
* `<em> տեքստը </em>` ընդգծում է ձեր տեքստը
* `<strong> տեքստը </strong>` խիստ ընդգծում է ձեր տեքստը
* `<br>` անցնում է մեկ այլ տողի (br- ի ներսում ոչինչ չես դնի, և փակիչ պիտակ չկա)
* `<a href="https://djangogirls.org"> link-ը (հղումը) </a>` ստեղծում է link-ը (հղումը)
* `<ul> <li> առաջին նյութը </li> <li> երկրորդ կետը </li> </ul>` կազմում է ցուցակ, ինչպես այս մեկը:
* `<div> </div>` սահմանում է էջի մի հատված
* `<nav> </nav>` սահմանում է նավիգացիոն հղումների շարք
* `<article> </article>` սահմանում է անկախ, ինքնամփոփ բովանդակություն
* `<section> </section>` փաստաթղթում բաժին է սահմանում 
* `<header> </header>` նշանակում է փաստաթղթի կամ բաժնի վերնագիր
* `<main> </main>` սահմանում է փաստաթղթի հիմնական բովանդակությունը
* `<aside></aside>` defines some content aside from the content it is placed in (like a sidebar)
* `<footer> </footer>` սահմանում է փաստաթղթի կամ բաժնի տողատակ
* `<time> </time>` սահմանում է որոշակի ժամանակ (կամ տվյալների ժամանակը)

Ահա ամբողջական ձևանմուշի օրինակ, պատճենեք և տեղադրեք այն ` blog/templates/blog/post_list.html`:

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
<!DOCTYPE html>
<html>
    <head>
        <title>Django Girls blog</title>
    </head>
    <body>
        <header>
            <h1><a href="/">Django Girls Blog</a></h1>
        </header>

        <article>
            <time>published: 14.06.2014, 12:14</time>
            <h2><a href="">My first post</a></h2>
            <p>Aenean eu leo quam. Pellentesque ornare sem lacinia quam venenatis vestibulum. Donec id elit non mi porta gravida at eget metus. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus.</p>
        </article>

        <article>
            <time>published: 14.06.2014, 12:14</time>
            <h2><a href="">My second post</a></h2>
            <p>Aenean eu leo quam. Pellentesque ornare sem lacinia quam venenatis vestibulum. Donec id elit non mi porta gravida at eget metus. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut f.</p>
        </article>
    </body>
</html>
```

Մենք այստեղ ստեղծել ենք մեկ ` header (վերնագիր) ` և երկու ` artcicle (հոդված) ` բաժիններ:

* ` header (վերնագիր) ` տարրը պարունակում է մեր բլոգի վերնագիրը. Դա վերնագիր է և link
* ` article-ի (հոդվածի) ` երկու տարրերը պարունակում են մեր բլոգի հաղորդագրությունները հրապարակված ամսաթվով ` ժամանակ ` տարրում, ` h2 ` տարրը `գրառման վերնագրով, որը սեղմված է և ` p ` (paragraph/ պարբերություն) տարր `մեր բլոգի գրառման տեքստի համար:

It gives us this effect:

![Figure 11.4](images/step6.png)

Yaaay! But so far, our template only ever displays exactly **the same information** – whereas earlier we were talking about templates as allowing us to display **different** information in the **same format**.

What we really want to do is display real posts added in our Django admin – and that's where we're going next.

## One more thing: deploy!

It'd be good to see all this out and live on the Internet, right? Let's do another PythonAnywhere deploy:

### Commit, and push your code up to GitHub

First off, let's see what files have changed since we last deployed (run these commands locally, not on PythonAnywhere):

{% filename %}command-line{% endfilename %}

    $ git status
    

Make sure you're in the `djangogirls` directory and let's tell `git` to include all the changes in this directory:

{% filename %}command-line{% endfilename %}

    $ git add .
    

Before we upload all the files, let's check what `git` will be uploading (all the files that `git` will upload should now appear in green):

{% filename %}command-line{% endfilename %}

    $ git status
    

We're almost there, now it's time to tell it to save this change in its history. We're going to give it a "commit message" where we describe what we've changed. You can type anything you'd like at this stage, but it's helpful to type something descriptive so that you can remember what you've done in the future.

{% filename %}command-line{% endfilename %}

    $ git commit -m "Changed the HTML for the site."
    

> **Note** Make sure you use double quotes around the commit message.

Once we've done that, we upload (push) our changes up to GitHub:

{% filename %}command-line{% endfilename %}

    $ git push
    

### Pull your new code down to PythonAnywhere, and reload your web app

* Open up the [PythonAnywhere consoles page](https://www.pythonanywhere.com/consoles/) and go to your **Bash console** (or start a new one). Then, run:

{% filename %}PythonAnywhere command-line{% endfilename %}

    $ cd ~/<your-pythonanywhere-domain>.pythonanywhere.com
    $ git pull
    [...]
    

You'll need to substitute `<your-pythonanywhere-domain>` with your actual PythonAnywhere subdomain name, without the angle-brackets. Your subdomain name is normally your PythonAnywhere user name, but in some cases it might be a bit different (such as if your user name contains capital letters). So if this command doesn't work, use the `ls` (list files) command to find your actual subdomain/folder name, and then `cd` to there.

Now watch your code get downloaded. If you want to check that it's arrived, you can hop over to the **"Files" page** and view your code on PythonAnywhere (you can reach other PythonAnywhere pages from the menu button on the console page).

* Finally, hop on over to the ["Web" page](https://www.pythonanywhere.com/web_app_setup/) and hit **Reload** on your web app.

Your update should be live! Go ahead and refresh your website in the browser. Changes should be visible. :)