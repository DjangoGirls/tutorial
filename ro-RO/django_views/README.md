# Django views - este timpul să le creăm!

Este timp să corectăm eroare pe care am creat-o în ultim capitol :)

*view* este loc unde noi punem toata logica aplicației. El va solicita informație de la `model` pe care l-am creat mai înainte și va transmite `template`-ului. O să creăm template în capitolul următor. View-urile sunt doar funțiile Python care sunt puțin mai complicate decât cele pe care le-am scris în capitolul **Introducere în Python**.

View-urile sunt plasate în fișierul `views.py`. O să adăugăm *views* în fișier `blog/views.py`.

## blog/views.py

OK, hai să deschidem fișierul dat în editorul de cod și să vedem ce este în el:

{% filename %}blog/views.py{% endfilename %}

```python
from django.shortcuts import render

# Create your views here.
```

Nu prea multe lucruri aici.

Țineți minte că liniile care încep cu `#` sunt comentarii – acesta înseamnă ca ele nu vor fi interpretate de Python.

Hai să creăm *view* cum ne propune comentariu. Adăugați un view mic:

{% filename %}blog/views.py{% endfilename %}

```python
def post_list(request):
    return render(request, 'blog/post_list.html', {})
```

Am creat o funcție (`def`) numită `post_list` care are `request` ca parametry și va returna `return` o valoare care ea primește de la executarea funcției `render` care va face template-ul nostru `blog/post_list.html`.

Salvați fișierul, mergeți la http://127.0.0.1:8000/ și vedeți ce s-a primit.

O altă eroare! Citiți ce s-a întâmplat acum:

![Eroare](images/error.png)

Acesta arată că server lucrează, dar nici acum nu arăte corect? Nu faceți grijă, acesta este doar o pagină de eroare! Ca și erorile în consola, ei sunt destul de utile. Puteți să vedeți că *TemplateDoesNotExist* (Template nu există). Hai s-o corectăm eroare această și să creăm template în capitol următor!

> Learn more about Django views by reading the official documentation: https://docs.djangoproject.com/en/2.2/topics/http/views/