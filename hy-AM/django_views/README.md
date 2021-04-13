# Django- ի դիտում. Ստեղծագործելու ժամանակն է:

Ժամանակն է ազատվել այն սխալից, որի հետ մենք բախվեցինք վերջին գլխում: :)

*view/տեսարանը * այն հատվածն է, որտեղ տեղադրում ենք մեր հավելվածի «տրամաբանությունը»: Այն տեղեկատվություն կխնդրի ձեր ստեղծած նախկին `model`-ից և կփոխանցի `template/ձևանմուշ`-ին: Հաջորդ գլխում շաբլոն/template կստեղծենք: Views/Դիտումները պարզապես Python գործառույթներ/ Python functions են, որոնք մի փոքր ավելի բարդ են, քան այն, ինչ մենք գրել ենք **Introduction to Python/Python- ի «Ներածություն»** գլխում:

Դիտումները տեղակայված են ` views.py ` ֆայլում: Մենք կավելացնենք մեր *views/դիտումները * `blog/views.py`- ին:

## blog/views.py

Լավ, եկեք բացենք այս ֆայլը մեր կոդի խմբագրում/code editor և տեսնենք, թե ինչ կա այնտեղ:

{% filename %}blog/views.py{% endfilename %}

```python
from django.shortcuts import render

# Create your views here.
```

Այստեղ դեռ շատ բան չկա:

Հիշեք, որ ` # ` - ով սկսվող տողերը մեկնաբանություններ են. դա նշանակում է, որ այս տողերը չեն աշխատի Python- ում:

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

> Learn more about Django views by reading the official documentation: https://docs.djangoproject.com/en/2.2/topics/http/views/