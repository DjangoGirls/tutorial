# Տվյալների դինամիկ փոփոխություն ձևանմուշներում

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

1. Փոխանցեք `posts` QuerySet-ը ձևանմուշի մեջ ՝ զանգը/call փոխելով `render` function-ի /մատուցման գործառույթի (մենք դա կանենք հենց հիմա):
2. Փոփոխեք ձևանմուշը ՝ QuerySet `posts`-ը ցուցադրելու համար: Մենք կանդրադառնանք դրան հաջորդ գլխում:

Խնդրում ենք նկատի ունենալ, որ մենք QuerySet- ի համար *variable/փոփոխական* ենք ստեղծել. `posts/հաղորդագրություններ`: Դուք կարող եք դա համարել որպես անուն մեր QuerySet- ի համար: Այսուհետ մենք կարող ենք դրան անդրադառնալ այս անունով:

`render/ռենդեր ` գործառույթում մենք արդեն ունենք `request/հարցման` պարամետրը (այսինքն `այն ամենը, ինչ մենք ստանում ենք օգտագործողից որպես խնդրանք ինտերնետի միջոցով) և ձևանմուշի ֆայլը` (`'blog/post_list.html'`): Վերջին պարամետրը, որն ունի այսպիսի տեսք `{}`, այն է, որտեղ մենք կարող ենք ավելացնել ձևանմուշ օգտագործելու ցանկացած բան: Սա այն վայրն է, որտեղ մենք կարող ենք ավելացնել որոշ բաներ, ձևանմուշի օգտագործման համար: Մենք պետք է նրանց անուններ տանք (մենք հիմա հավատարիմ կմնանք `'posts'/ հաղորդագրություններին` ) :) Դա պետք է ունենա այսպիսի տեսք. `{'posts': posts}`: Նկատի ունեցեք, որ մինչ `:` այս հատվածը լար է; հարկավոր է այն փակել չակերտներով. ` '' `:

Այսպիսով, վերջապես, մեր `blog/views.py` ֆայլը պետք է ունենա այսպիսի տեսք.

{% filename %}blog/views.py{% endfilename %}

```python
from django.shortcuts import render
from django.utils import timezone
from .models import Post

def post_list(request):
    posts = Post.objects.filter(published_date__lte=timezone.now()).order_by('published_date')
    return render(request, 'blog/post_list.html', {'posts': posts})
```

Այսքանը: Հիմա ժամանակն է գնալ ձևանմուշ/template և ցուցադրել QuerySet- ը էջում:

Ցանկանու՞մ եք մի փոքր ավելին իմանալ Django- ի QuerySets- ի մասին: Անցեք այս հղումով՝ https://docs.djangoproject.com/en/2.2/ref/models/querysets/