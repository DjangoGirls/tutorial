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

Not too much stuff here yet.

Remember that lines starting with `#` are comments – this means that those lines won't be run by Python.

Let's create a *view* as the comment suggests. Add the following minimal view below it:

{% filename %}blog/views.py{% endfilename %}

```python
def post_list(request):
    return render(request, 'blog/post_list.html', {})
```

As you can see, we created a function (`def`) called `post_list` that takes `request` and will `return` the value it gets from calling another function `render` that will render (put together) our template `blog/post_list.html`.

Save the file, go to http://127.0.0.1:8000/ and see what we've got.

Another error! Read what's going on now:

![Error](images/error.png)

This shows that the server is running again, at least, but it still doesn't look right, does it? Don't worry, it's just an error page, nothing to be scared of! Just like the error messages in the console, these are actually pretty useful. You can read that the *TemplateDoesNotExist*. Let's fix this bug and create a template in the next chapter!

> Learn more about Django views by reading the official documentation: https://docs.djangoproject.com/en/2.0/topics/http/views/