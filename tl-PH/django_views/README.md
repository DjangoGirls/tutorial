# Mga view ng Django - oras na para maglikha!

Oras na para ayusin ang bug na nagawa natin sa huling kabanata! :)

Ang *view* ay isang lugar kung saan natin ilalagay ang "logic" ng ating aplikasyon. Humihingi ito ng mga impormasyon galing sa ating `model` na nalikha dati at ipasa niya ito sa `template`. Gagawa tayo ng template sa susunod na kabanata. Ang mga view ay mga functions ng Python na medyo mahirap kung ikumpara natin sa mga nasulat natin sa **Introduksyon sa Python** na kabanata.

Ang mga view ay nakalagay sa `views.py` na file. Magdadagdag tayo ng *views* sa ating `blog/views.py` na file.

## blog/views.py

OK, let's open up this file in our code editor and see what's in there:

{% filename %}blog/views.py{% endfilename %}

```python
from django.shortcuts import render

# Maglikha ng iyong mga view dito.
```

Wala pang masyadong nakasulat dito.

Tandaan na ang linya na nagsisimula sa `#` ay mga komento - ibig sabihin na ang mga linyang ito ay hindi papatakbuhin ni Python.

Gagawa tayo ng *view* gaya ng inimungkahe sa komento. Idagdag ang sumusunod na minimal view sa baba nito:

{% filename %}blog/views.py{% endfilename %}

```python
def post_list(request):
    return render(request, 'blog/post_list.html', {})
```

Gaya ng makikita mo, naglikha tayo ng function (`def`) na tinatawag na `post_list` na kukuha ng mga `request` at `magbalik` ng function na `render` na mag render (bumuo) sa ating template na `blog/post_list.html`.

I-save ang file, puntahan ang http://127.0.0.1:8000/ at tingnan kung ano ang laman.

May ibang error na naman! Basahin kung ano ang nangyari ngayon:

![Error](images/error.png)

Ito ay nagpapakita na ang server ay tumatakbo na ulit, pero hindi pa rin ito tama, di ba? Huwag mag-alala, isa lang itong error page, walang dapat na katakutan! Gaya ng mga error messages sa console, ang mga ito ay talagang nakakatulong. Mabasa mo ang *TemplateDoesNotExist*. Ayusin natin ang bug at maglikha tayo ng template sa susunod na kabanata!

> Learn more about Django views by reading the official documentation: https://docs.djangoproject.com/en/2.0/topics/http/views/