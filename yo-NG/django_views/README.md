# Àwọn view ti Django – àkókò láti ṣẹ̀dá!

Àkókò láti mú àṣìṣe tí a ṣẹ̀dá nínú àkòrí tó ṣáájú náà kúrò! :)

*View* jẹ́ ààyè kan tí a fi "ọgbọ́n" ètò wa sí. Yóò béèrè àlàyé lọ́wọ́ `model` tí o ti ṣẹ̀dá tẹ́lẹ̀ àti pé yíò darí àlàyé náà sí `template` kan. A ó ṣẹ̀dá àwòṣe (template) kan nínú àkòrí tó kàn náà. Awon view wulẹ̀ jẹ́ àwọn iṣẹ́ Python tó ṣòro díẹ̀ ju àwọn tí a kọ nínú àkòrí **Ìfihàn sí Python** náà.

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

![Àṣìṣe](images/error.png)

Èyí fi hàn pé server náà tí n ṣiṣẹ́ padà, ṣùgbọ́n kò tíì rí bó ti yẹ, àbí ó rí bẹ́ẹ̀ ni? Má dààmú, ó kàn jẹ́ ojú-ìwé àṣìṣe kan, kò sí ohun kan láti bẹrù! Gẹ́gẹ́ bí àwọn ìròyìn àṣìṣe tó wà nínú console náà, àwọn wọ̀nyí wúlò púpọ̀ gan-an. O lè kà pé *TemplateDoesNotExist*. Jẹ́ ká ṣàtúnṣe àṣìṣe yìí àti ṣẹ̀dá àwòṣe (template) kan nínú àkòrí tó kàn náà!

> Learn more about Django views by reading the official documentation: https://docs.djangoproject.com/en/2.2/topics/http/views/