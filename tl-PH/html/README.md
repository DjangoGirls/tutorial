# Introduksyon sa HTML

Ano ang template, maaring nakapagtanong ka?

A template is a file that we can re-use to present different information in a consistent format – for example, you could use a template to help you write a letter because although each letter might contain a different message and be addressed to a different person, they will share the same format.

Ang format ng Django template ay inilarawan sa wika na tinatawag na HTML (ito ang HTML na nabanggit natin sa unang kabanata, **Paano gumagana ang Internet**).

## Ano ang HTML?

HTML is a code that is interpreted by your web browser – such as Chrome, Firefox or Safari – to display a web page for the user.

Ang HTML ay kumakatawan sa "HyperText Markup Language". Ang **HyperText** na ibig sabihin ay tipo ng teksto na sumusuporta ng mga hyperlinks sa pagitan ng pahina. Ang **Markup** na ibig sabihin na kumukuha tayo ng dokumento at minarkahan ito ng code para magsabi (sa kasong ito, ang browser) kung paano isalin ang pahina. Ang HTML code ay nagawa gamit ang mga **tags**, bawat isa ay nagsisimula sa `<` at nagtatapos sa `>`. Ang mga tag na ito ay kumakatawan sa markup na mga **elemento**.

## Ang iyong unang template!

Ang paggawa ng isang template ay nangangahulugan ng paggawa ng isang template file. Lahat ay file, tama? Malamang ay napuna mo na ito.

Ang mga templates ay naka-save sa `blog/templates/blog` na directory. Una, ay gumawa ng isang directory na tinatawag na `templates` sa loob ng iyong blog directory. Pagkatapos ay gumawa ng isa pang directory na tinatawag na `blog` sa loob ng iyong templates directory:

    blog
    └───templates
        └───blog
    

(You might wonder why we need two directories both called `blog` – as you will discover later, this is a useful naming convention that makes life easier when things start to get more complicated.)

At ngayon, gumawa ng isang `post_list.html` na file (hayaan itong blangko sa ngayon) sa loob ng `blog/templates/blog` na directory.

Tingnan kung ano ang hitsura ng iyong website ngayon: http://127.0.0.1:8000/

> Kung mayroon ka pang error na `TemplateDoesNotExist`, subukan mong i-restart ang iyong server. Go to the command line, stop the server by pressing Ctrl+C (Control and C keys together) and start it again by running a `python manage.py runserver` command.

![Tambilang 11.1](images/step1.png)

Wala nang error! Binabati kita :) Subalit, ang iyong website ay walang pina-publish na kahit ano maliban sa isang page na walang laman, dahil ang iyong template ay wala ring laman. Kailangan natin itong ayusin.

Open the new file in the code editor, and add the following:

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
<html>
<body>
    <p>Hi there!</p>
    <p>It works!</p>
</body>
</html>
```

Ano ang hitsura ng iyong website ngayon? Dalawin ito upang malaman: http://127.0.0.1:8000/

![Tambilang 11.2](images/step3.png)

Gumana siya! Magaling na gawa :)

* Ang pinaka-basic na tag, `<html>`, ay palaging simula ng kahit anong web page at ang `</html>` ay palaging katapusan. Gaya ng iyong nakikita, ang kabuuang nilalaman ng website ay nasa pagitan ng pansimulang tag `<html>` at pangwakas na tag `</html>`
* `<p>` ay isang tag pra sa mga elemento ng talata;`</p>` ngwawakas ng bawat talata

## Ulo at katawan

Ang bawat HTML page ay nahahati din sa dalawang elemento: **head** at **body**.

* Ang **head** ay isang elemento na naglalaman ng impormasyon tungkol sa dokumento na hindi ipinapakita sa screen.

* Ang **body** ay isang elemento na naglalaman ng lahat ng bagay na ipinapakita bilang parte ng web page.

Ating ginagamit ang `<head>` upang sabihan ang browser tungkol sa kumpigurasyon ng page, at `<body>` upang sabihan ito kung ano talaga ang nasa page.

Halimbawa, maaari mong ilagay ang web page title na elemento sa loob ng `<head>`, katulad nito:

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
<html>
    <head>
        <title>Blog ni Ola</title>
    </head>
    <body>
        <p>Kumusta!</p>
        <p>Ito ay gumagana!</p>
    </body>
</html>
```

I-save ang file at i-refresh ang iyong page.

![Tambilang 11.3](images/step4.png)

Punain kung paano naintindihan ng browser na ang "Blog ni Ola" ay ang pamagat ng iyong page? Binigyan-kahulugan nito ang `<title>Ola'sblog</title>` at inilagay ang teksto sa title bar ng iyong browser (ito rin ay gagamitin para sa mga bookmark at iba pa).

Marahil ay napansin mo rin na ang bawat isang opening tag ay itinugma sa *closing tag*, na may ``, at ang mga elemento ay *nested* (i.e. hindi mo maisasara ang partikular na tag hanggang ang lahat ng mga nasa loob nito ay naisara na rin).

Ito ay kagaya ng paglalagay ng mga bagay sa mga kahon. Ikaw ay mayroong isang malaking kahon, `<html></html>`; sa loob nito ay mayroong `<body></body>`, at ito ay naglalaman ng mas maliit na mga kahon: `<p></p>`.

Kinakailangan mong sundin ang mga panuntunan na ito ng *closing* ng mga tag, at ng *nesting* ng mga elemento - kung hindi mo ito gawin, ang browser ay maaaring hindi mabigyang-kahulugan ito ng maayos at ang iyong pahina ay maipapakita ng hindi tama.

## I-customize ang template

Maaari ka na ngayong magkaroon ng kaunting kasiyahan at subukang i-customize ang iyong template! Nandito ang ilang mga kapaki-pakinabang na mga tag para diyan:

* `<h1>A heading</h1>` para sa iyong pinaka-importanteng heading
* `<h2>A sub-heading</h2>` para sa isang heading sa susunod na antas
* `<h3>A sub-sub-heading</h3>`… at iba pa, hanggang `<h6>`
* `<p>A paragraph of text</p>`
* `<em>text</em>` binibigyang-diin ang iyong teksto
* `<strong>text</strong>`mahigpit na binibigyang-diin ang iyong teksto
* `<br>` goes to another line (you can't put anything inside br and there's no closing tag)
* `<a href="https://djangogirls.org">link</a>` lumilikha ng isang link
* `<ul><li> first item</li><li>second item</li></ul>` gumagawa ng isang listahan, kagaya ng isang ito!
* `<div></div>` tumutukoy sa isang seksyon ng pahina

Nandito ang isang halimbawa ng isang buong template, kopyahin at ilagay ito sa `blog/templates/blog/post_list.html`:

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
<html>
    <head>
        <title>Django Girls na blog</title>
    </head>
    <body>
        <div>
            <h1><a href="/">Django Girls na Blog</a></h1>
        </div>

        <div>
            <p>Nailathala noong: 14.06.2014, 12:14</p>
            <h2><a href="">Ang aking unang post</a></h2>
            <p>Aenean eu leo quam. Pellentesque ornare sem lacinia quam venenatis vestibulum. Donec id elit non mi porta gravida at eget metus. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus.</p>
        </div>

        <div>
            <p>published: 14.06.2014, 12:14</p>
            <h2><a href="">Aking pangalawang post</a></h2>
            <p>Aenean eu leo quam. Pellentesque ornare sem lacinia quam venenatis vestibulum. Donec id elit non mi porta gravida at eget metus. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut f.</p>
        </div>
    </body>
</html>
```

Gumawa tayo ng tatlong `div` na mga seksyon dito.

* Ang unang `div` na elemento ay naglalaman sa pamagat ng ating blog - ito ay isang heading at isang link
* Another two `div` elements contain our blog posts with a published date, `h2` with a post title that is clickable and two `p`s (paragraph) of text, one for the date and one for our blog post.

Ito ay nagbibigay sa atin ng effect na ito:

![Tambilang 11.4](images/step6.png)

Yaay! Ngunit sa ngayon, ang ating template ay nagpapakita lamang ng eksaktong **the same information** - samantalang kanina tayo ay nag-uusap tungkol sa mga template bilang nagpapahintulot sa ating magpakita ng **different** impormasyon sa **same format**.

Ang gusto talaga nating gawin ay ang magpakita ng mga totoong post na naidagdag sa ating Django admin - at diyan ang sunod nating pupuntahan.

## Isa pang bagay: mag-deploy!

Makabubuting makita ang lahat ng ito at live sa Internet, hindi ba? Gumawa tayo ulit ng ibang PythonAnywhere deploy:

### Commit, and push your code up to GitHub

Una sa lahat, tingnan natin kung anong mga file ang nagbago mula noong huli tayong nag-deploy (patakbuhin ang mga command sa lugar na ito, hindi sa PythonAnywhere):

{% filename %}command-line{% endfilename %}

    $ git status
    

Make sure you're in the `djangogirls` directory and let's tell `git` to include all the changes in this directory:

{% filename %}command-line{% endfilename %}

    $ git add .
    

Bago natin i-upload ang lahat ng mga file, tingnan natin kung ano ang i-a-upload ni `git` (ang lahat ng mga file na i-a-upload ni `git` ay dapat nang lumitaw ngayon sa berde):

{% filename %}command-line{% endfilename %}

    $ git status
    

Malapit na tayo, oras na ngayon upang sabihan ito na i-save ang mga pagbabago sa kasaysayan nito. Bibigyan natin ito ng isang "commit message" kung saan natin ilalaraan kung ano ang ating mga binago. Maaari kang mag-type ng kahit na anong gusto mo sa yugtong ito, ngunit makatutulong mag-type ng isang bagay na naglalarawan upang maaalala mo ang iyong nagawa sa hinaharap.

{% filename %}command-line{% endfilename %}

    $ git commit -m "Binago ang HTML para sa site na ito."
    

> **Note** Make sure you use double quotes around the commit message.

Sa sandaling nagawa na natin iyan, i-a-upload natin (ipasa) ang ating mga pagbabago sa Github:

{% filename %}command-line{% endfilename %}

    $ git push
    

### Hilahin ang iyong bagong code pababa sa PythonAnywhere, at i-reload ang iyong web app

* Buksan ang [PythonAnywhere consoles page](https://www.pythonanywhere.com/consoles/) at pumunta sa iyong **Bash console** (o magsimula ng panibago). Pagkatapos ay patakbuhin ang:

{% filename %}PythonAnywhere command-line{% endfilename %}

    $ cd ~/<your-pythonanywhere-domain>.pythonanywhere.com
    $ git pull
    [...]
    

You'll need to substitute `<your-pythonanywhere-domain>` with your actual PythonAnywhere subdomain name, without the angle-brackets. Your subdomain name is normally your PythonAnywhere user name, but in some cases it might be a bit different (such as if your user name contains capital letters). So if this command doesn't work, use the `ls` (list files) command to find your actual subdomain/folder name, and then `cd` to there.

Now watch your code get downloaded. If you want to check that it's arrived, you can hop over to the **"Files" page** and view your code on PythonAnywhere (you can reach other PythonAnywhere pages from the menu button on the console page).

* Finally, hop on over to the ["Web" page](https://www.pythonanywhere.com/web_app_setup/) and hit **Reload** on your web app.

Your update should be live! Go ahead and refresh your website in the browser. Changes should be visible. :)