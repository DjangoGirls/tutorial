# Dynamic data in templates

Մենք ունենք տարբեր կտորներ. `Post` մոդելը սահմանվում է `models.py`- ում, մենք ունենք `post_list`- ը `views.py` - ում և ավելացնում է ձևանմուշը: Բայց ինչպե՞ս ցուցադրել գրառումները HTML էջի ձևանմուշում: Ի վերջո, սա հենց այն է, ինչին մենք ուզում ենք հասնել. Վերցնել որոշակի բովանդակություն (շտեմարանում պահվող մոդելներ) և ճշգրիտ ցուցադրել դրանք մեր ձևանմուշում/ template, այնպես չէ՞:

Դրան են ծառայում դիտումները/*views* ՝ մոդելներն ու ձևանմուշները/models and templates/ միացնելու համար: `post_list` *view*-ում մենք պետք է վերցնենք այն մոդելները, որոնք մենք ցանկանում ենք ցուցադրել, և այնուհետև դրանք փոխանցել ձևանմուշին: *view*-ից մենք որոշում ենք, թե ինչ (մոդել) կցուցադրվի ձևանմուշում:

Լավ, բա ինչպե՞ս ենք դրան հասնելու:

Մենք պետք է բացենք `blog/views.py` ֆայլը կոդի խմբագրում/code editor: Այսպիսով, `post_list` *view* այսպիսի տեսք ունի.

{% filename %}blog/views.py{% endfilename %}

```python
from django.shortcuts import render

def post_list(request):
    return render(request, 'blog/post_list.html', {})
```

Հիշո՞ւմ եք, մենք խոսեցինք այլ ֆայլերից կոդ ներառելու մասին: Այժմ մենք պետք է ներառենք մեր սահմանած մոդելը `models.py` ֆայլում: Մենք կավելացնենք տողը `from .models import Post` - ից հետևյալ կերպ.

{% filename %}blog/views.py{% endfilename %}

```python
from django.shortcuts import render
from .models import Post
```

Մոդելներից առաջ կետը/dot նշանակում է *current directory/ընթացիկ գրացուցակ * կամ *current application/ընթացիկ ծրագիր*: Թե `views.py`- ը, թե `models.py` - ին գտնվում են նույն գրացուցակում: Սա նշանակում է, որ մենք կարող ենք օգտագործել կետ `.` և ֆայլի անունը (առանց `.py`-ի): Դրանից հետո մենք ներմուծում ենք մոդելի անվանումը (`Post`):

Բայց ի՞նչ է հաջորդը: `Post` մոդելից իրական գրառում ստանալու համար մեզ պետք է այսպես կոչված `QuerySet`:

## QuerySet

Դուք արդեն պետք է ծանոթ լինեք, թե ինչպես է աշխատում QuerySets- ը: Մենք դրա մասին խոսեցինք [Django ORM (QuerySets) գլխում ](../django_orm/README.md):

Այսպիսով, հիմա մենք ուզում ենք հրապարակված բլոգային հաղորդագրություններ/ published blog posts ՝ տեսակավորված ըստ published_date- ի, ճիշտ է: Մենք դա արդեն արեցինք QuerySets գլխում: 

{% filename %}blog/views.py{% endfilename %}

```python
Post.objects.filter(published_date__lte=timezone.now()).order_by('published_date')
```

Այսպիսով, եկեք բացենք `blog/views.py` ֆայլը կոդի խմբագրում և ավելացնենք կոդի այս կտորը `def post_list(request)`, բայց մի մոռացեք ֆայլի սկզբում ավելացնել `from django.utils import timezone`.

{% filename %}blog/views.py{% endfilename %}

```python
from django.shortcuts import render
from django.utils import timezone
from .models import Post

def post_list(request):
    posts = Post.objects.filter(published_date__lte=timezone.now()).order_by('published_date')
    return render(request, 'blog/post_list.html', {})
```

Մնացել է ընդամենը երկու բան ՝ մեր QuerySet- ը բլոգի գրառումների ցուցակում ցուցադրելու համար.

1. Pass the `posts` QuerySet to the template context, by changing the `render` function call. We'll do this now.
2. Modify the template to display the `posts` QuerySet. We'll cover this in a later chapter.

Please note that we create a *variable* for our QuerySet: `posts`. Treat this as the name of our QuerySet. From now on we can refer to it by this name.

In the `render` function we have one parameter `request` (everything we receive from the user via the Internet) and another giving the template file (`'blog/post_list.html'`). The last parameter, `{}`, is a place in which we can add some things for the template to use. We need to give them names (we will stick to `'posts'` right now). :) It should look like this: `{'posts': posts}`. Please note that the part before `:` is a string; you need to wrap it with quotes: `''`.

So finally our `blog/views.py` file should look like this:

{% filename %}blog/views.py{% endfilename %}

```python
from django.shortcuts import render
from django.utils import timezone
from .models import Post

def post_list(request):
    posts = Post.objects.filter(published_date__lte=timezone.now()).order_by('published_date')
    return render(request, 'blog/post_list.html', {'posts': posts})
```

That's it! Time to go back to our template and display this QuerySet!

Want to read a little bit more about QuerySets in Django? You should look here: https://docs.djangoproject.com/en/2.2/ref/models/querysets/