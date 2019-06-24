# Àwọn view ti Django – àkókò láti ṣẹ̀dá!

Àkókò láti mú àṣìṣe tí a ṣẹ̀dá nínú àkòrí tó ṣáájú náà kúrò! :)

*View* jẹ́ ààyè kan tí a fi "ọgbọ́n" ètò wa sí. Yóò béèrè àlàyé lọ́wọ́ `model` tí o ti ṣẹ̀dá tẹ́lẹ̀ àti pé yíò darí àlàyé náà sí `template` kan. A ó ṣẹ̀dá àwòṣe (template) kan nínú àkòrí tó kàn náà. Views are just Python functions that are a little bit more complicated than the ones we wrote in the **Introduction to Python** chapter.

Àwọn View máa ń wà nínú fáìlì `views.py`. A ó ṣàfikún àwọn *view* wa sínú fáìlì `blog/views.py` náà.

## blog/views.py

O dáa, jẹ́ ká ṣí fáìlì yìí nínú olóòtú kóòdù wa láti rí ohun tó wà níbẹ̀:

{% filename %}blog/views.py{% endfilename %}

```python
from django.shortcuts import render

# Create your views here.
```

Kò tíì sí nnkan púpọ̀ níbí.

Rántí pé àwọn ìlà tó n bẹ̀rẹ̀ pẹ̀lú `#` jẹ́ àwọn àlàyé – èyí túmọ̀ sí pé àwọn ìlà yẹn kò ní jẹ́ ṣíṣe nípasẹ̀ Python.

Jẹ́ ká ṣẹ̀dá *view* kan bíi àlàyé náà ṣe sọ. Ṣàfikún ìwọnba view tó tẹ̀le yìí sí abẹ́ rẹ̀:

{% filename %}blog/views.py{% endfilename %}

```python
def post_list(request):
    return render(request, 'blog/post_list.html', {})
```

Gẹ́gẹ́ bó o ṣe ríi, a ti ṣẹ̀dá iṣẹ́ kan (`def`) tí a n pè ní `post_list` tó máa gba `request` tí yíò sì `return` ohun tó bá gba láti pípè iṣẹ́ mìíràn `render` tí yíò ṣàfihàn (ṣàkópọ̀) àwòṣe (template) wa `blog/post_list.html`.

Tọ́jú fáìlì náà, lọ sí http://127.0.0.1:8000/ láti wo ohun tí a ti ní.

Àṣìṣe mìíràn! Ka ohun tí ń ṣẹlẹ̀ lọ́wọ́:

![Error](images/error.png)

This shows that the server is running again, at least, but it still doesn't look right, does it? Don't worry, it's just an error page, nothing to be scared of! Just like the error messages in the console, these are actually pretty useful. You can read that the *TemplateDoesNotExist*. Let's fix this bug and create a template in the next chapter!

> Learn more about Django views by reading the official documentation: https://docs.djangoproject.com/en/2.0/topics/http/views/