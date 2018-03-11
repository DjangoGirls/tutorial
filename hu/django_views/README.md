# Django views - itt az ideje alkotni!

Eljött az idő, hogy megszabaduljunk a hibától, amit az előző fejezetben szereztünk :)

A *nézet (view)* az a rész, ahova az applikációnk "logikáját" írjuk. Szükség lesz a nemrég elkészült `model`-ben megadott adatokra, amit majd továbbít a `template`-nek. A template-et majd a következő fejezetben hozzuk létre. A nézetek ugyanolyan Python metódusok, mint amiket a **Bevezetés a Python-ba** című fejezetben csináltunk, csak egy kicsit bonyolultabbak.

A nézetek a `views.py` fájlban találhatók. A *view-kat* a `blog/views.py` fájlba fogjuk írni.

## blog/views.py

Ok, nyissuk ki ezt a fájlt és nézzük, mi van benne:

```python
from django.shortcuts import render

# Create your views here.
```

Egyelőre nem túl sok minden. A legegyszerűbb *view* így néz ki.

```python
def post_list(request):
    return render(request, 'blog/post_list.html', {})
```

Mint látod, létrehoztunk egy `post_list` elnevezésű metódust (`def`), ami vesz egy `request`-et és `return`-öl (visszaad) egy `render` metódust, ami összeállítja a `blog/post_list.html` template-et.

Mentsd el a fájlt, menj a http://127.0.0.1:8000/ címre és lássuk, mink van.

Újabb hiba! Olvasd el, mi a helyzet:

![Hiba][1]

 [1]: images/error.png

Ez egyszerű: *TemplateDoesNotExist*. Javítsuk ki ezt a hibát, és hozzunk létre egy template-et a következő fejezetben!

> Tanulj meg többet a Django nézetekről a hivatalos dokumentációból: https://docs.djangoproject.com/en/1.11/topics/http/views/