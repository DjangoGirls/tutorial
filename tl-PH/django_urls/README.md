# Mga URL ng Django

Tayo ay gagawa ng ating kauna-unahang webpage: ang homepage para sa iyong blog! Pero una, pag-aralan muna natin ang tungkol sa mga URLs ng Django.

## Ano ang URL?

Ang URL ay isang web address lamang. Makikita mo ang URL sa bawat oras na bibisita ka ng website - makikita mo ito sa address bar ng iyong browser. (Oo! ang `127.0.0.1:8000` ay isang URL! At ang `https://djangogirls.org` ay isa ring URL.)

![Url](images/url.png)

Bawat pahina na nasa Internet ay nangangailangan ng sariling URL. Sa ganitong paraan, malalaman ng iyong aplikasyon kung ano dapat ang ipakita niya sa user na nagbubukas ng URL na ito. In Django, we use something called `URLconf` (URL configuration). URLconf is a set of patterns that Django will try to match the requested URL to find the correct view.

## Paano gumagana ang mga URL sa Django?

Buksan natin ang `mysite/urls.py` na file sa ating editor ng code at tingnan natin ang laman nito:

{% filename %}mysite/urls.py{% endfilename %}

```python
"""mysite URL Configuration

[...]
"""
from django.conf.urls import url
from django.contrib import admin

urlpatterns = [
    url(r'^admin/', admin.site.urls),
]
```

Makikita mo, may nilagay na si Django doon para sa atin.

Ang mga linya sa pagitan ng tripleng mga panipi (`'''` or `"""`) ay tinatawag na mga docstrings - maari mo silang isulat sa taas ng file, class, o method para ilarawan kung ano ang ginagawa nito. Hindi sila papatakbuhin ni Python.

The admin URL, which you visited in the previous chapter, is already here:

{% filename %}mysite/urls.py{% endfilename %}

```python
    url(r'^admin/', admin.site.urls),
```

Ang ibig sabihin ng linyang ito ay bawat URL na nagsisimula sa `admin/`, si Django ay maghahanap ng katugmang *view*. In this case, we're including a lot of admin URLs so it isn't all packed into this small file – it's more readable and cleaner.

## Regex

Naisip mo ba kung paano tinugma ni Django ang mga URL sa mga view? Buweno, ang parteng ito ay mahirap. Si Django ay gumagamit ng mga `regex`, pinaikli sa "regular expressions". Si regex ay mayroong napakaraming (napakarami!) mga patakaran na bumuo sa search pattern. Since regexes are an advanced topic, we will not go into detail over how they work.

Kung gusto mo pa ring maintindihan kung paano natin nilikha ang mga pattern, heto ang isang halimbawa ng proseso - mangangailangan lang tayo ng makitid na kubtangkas ng mga patakara para ipahayag ang pattern na ating hinahanap:

* `^` para sa simula ng teksto
* `$` para sa katapusan ng teksto
* `\d` para sa numero
* `+` para ipakita ang nakaraang aytem ay dapat ulitin nang hindi kukulangin ng isa
* `()` para kunin ang parte ng pattern

Kahit anong parte ng URL na nagbibigay-kahulugan ay literal na kukukunin.

Ngayon, isipin mo na may website ka na may address gaya ng `http://www.mysite.com/post/12345/`, kung saan ang `12345` ay ang numero ng iyong post.

Ang pagsulat ng hiwalay na mga view para sa lahat ng numero ng mga post ay sobrang nakakaasar. Gamit ang mga regular na ekspresyon, maari tayong maglikha ng pattern na magtugma sa ating URL at kukuha ng numero para sa atin: `^post/(\d+)/$`. Hahatiin natin ito sa pira-piraso para makita natin kung ano ang ginagawa natin dito:

* **^post/** is telling Django to take anything that has `post/` at the beginning of the URL (right after `^`)
* Ibig sabihin ng **(\d+)** ay may mga numero (isa o higit pa na numero) at gusto nating hulihin at kukunin ang numero
* **/** tells Django that another `/` character should follow
* Ang **$** ay nagpapahiwatig sa katapusan ng URL, ibig sabihin na ang mga string lang na nagtatapos sa `/` ay tutugma sa pattern na ito

## Ang iyong kauna-unang URL ng Django!

Oras na para maglikha ng ating unang URL! Gusto natin na ang 'http://127.0.0.1:8000/' ang magiging home page ng ating blog at para i-display ang lista ng mga post.

Gusto din natin na panatilihin ang `mysite/urls.py` na file na malinis, kaya mag-import lang tayo ng mga URL mula sa ating `blog` na aplikasyon papunta sa pangunahing `mysite/urls.py` na file.

Go ahead, add a line that will import `blog.urls`. Note that we are using the `include` function here so you will need to add that import.

Ang iyong `mysite/urls.py` na file ay dapat kagaya nito:

{% filename %}mysite/urls.py{% endfilename %}

```python
from django.conf.urls import include
from django.conf.urls import url
from django.contrib import admin

urlpatterns = [
    url(r'^admin/', admin.site.urls),
    url(r'', include('blog.urls')),
]
```

Django will now redirect everything that comes into 'http://127.0.0.1:8000/' to `blog.urls` and looks for further instructions there.

Ang pagsulat nga mga regular expression sa Python ay parating ginagawa na may `r` sa harap ng string. Ito ay nakakatulong na palatandaan para sa Python na ang string ay maaring maglaman ng mga espesyal na karakter na hindi para sa Python, kundi sa halip ay para sa regular na expression.

## blog.urls

Maglikha ng bago na walang laman na file na pinangalangang `urls.py` sa `blog` na directory. O sige! Idagdag mo ang unang dalawang linya:

{% filename %}blog/urls.py{% endfilename %}

```python
from django.conf.urls import url
from . import views
```

Dito iniimport natin ang function ng Django na `url` at ang lahat ng ating mga `view` mula sa `blog` na aplikasyon. (Wala pa tayong kahit na ano, pero pupunta tayo dyan pagkatapos ng ilang minuto!)

Pagkatapos niyan, maari nating idagdag ang ating unang URL na pattern:

{% filename %}blog/urls.py{% endfilename %}

```python
urlpatterns = [
    url(r'^$', views.post_list, name='post_list'),
]
```

Gaya ng makikita mo, tayo ngayon ay naglalaan na ng `view` na tinatawag na `post_list` sa `^$` na URL. Ang regular expression ay magtutugma sa `^` (ang simula) kasunod ng `$` (ang katapusan) - kaya ang string na walang laman lang ang matugma. Tama iyan, dahil sa loob ng mga resolver ng Django URL, ang 'http://127.0.0.1:8000/' ay hindi parte ng URL. Ang patter na ito ay magsasabi kay Django na ang `view.post_list` ay ang tamang lugar na puntahan kung may bumibista sa iyong website sa 'http://127.0.0.1:8000/' na address.

Ang huling parte, ang `name='post_list'`, ay ang pangalan ng URL na gagamitin natin para matukoy ang view. Maari itong kaparehas sa pangalan ng ating view ngunit maari din itong ganap na magkaiba. Gagamitin natin mamaya ang mga napangalangang mga URL sa ating proyekto, kaya importante na pangalanan ang bawat URL sa app. Dapat din nating subukan na gawing pambihira ang pangalan ng mga URL at madaling tandaan.

Kung bibisitahin mo ang http://127.0.0.1:8000/ ngayon, makikita mo ang mensahe na nagsasabing 'web page not available'. Ito ay dahil ang server (naalala mo ang pagtype natin ng `runserver`?) natin ay hindi na nakatakbo. Tingnan ang iyong server console window para malaman kung bakit.

![Error](images/error1.png)

Ang iyong console ay nagpapakita ng error, ngunit huwag mag-alala - ito ay talagang nakakatulog: sinasabi nito na mayroon kang **walang attribute na 'post_list'**. Iyan ang pangalan ng *view* na sinubukang hanapin at gamitin ni Django, ngunit hindi pa natin ito nalikha. At this stage, your `/admin/` will also not work. Huwag mag-alala - dadating din tayo diyan.

> Kung gusto mong malaman ng masinsinan ang tungkol sa Django URLconfs, tingnan ang opisyal na dokumentasyon: https://docs.djangoproject.com/en/1.11/topics/http/urls/