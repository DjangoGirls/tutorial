# Django views – time to create!

E' ora di liberarsi di quel bug che abbiamo creato nel capitolo precedente! :)

Una *view* è un posto dove viene messa la "logica" della nostra applicazione. Essa richiederà informazioni dal `modello` che hai creato prima e lo passerà ad un `template`. Creeremo un template nel prossimo capitolo. Le views sono solo metodi di Python un po' più complicati di quelli che abbiamo descritto nel capitolo **Introduzione a Python**.

Le views vengono collocate nel file `views.py`. Noi aggiungeremo le nostre *views* nel file `blog/views.py`.

## blog/views.py

OK, let's open up this file in our code editor and see what's in there:

{% filename %}blog/views.py{% endfilename %}

```python
from django.shortcuts import render

# Crea le tue views qui.
```

Non c'è altro qui.

Remember that lines starting with `#` are comments – this means that those lines won't be run by Python.

Let's create a *view* as the comment suggests. Add the following minimal view below it:

{% filename %}blog/views.py{% endfilename %}

```python
def post_list(request):
    return render(request, 'blog/post_list.html', {})
```

Come puoi vedere, abbiamo creato una funzione (`def`) chiamata `post_list` che prende `request` e restituisce `return` una funzione `render` che renderizza (mette insieme) il nostro template `blog/post_list.html`.

Save the file, go to http://127.0.0.1:8000/ and see what we've got.

Un altro errore! Leggi cosa sta succedendo adesso:

![Errore](images/error.png)

Questo mostra che almeno il server è ancora attivo, ma ancora non sembra corretto, vero? Non preoccuparti, è solo una pagina di errore, nulla di cui aver paura! Come l messaggi di errore nella console, sono davvero utili. Puoi leggere il *TemplateDoesNotExist*. Correggiamo questo bug e creiamo un template nel capitolo successivo!

> Learn more about Django views by reading the official documentation: https://docs.djangoproject.com/en/2.0/topics/http/views/