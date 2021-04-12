# Django ORM և QuerySets

Այս գլխում դուք կսովորեք, թե ինչպես է Django- ն միանում և պահում տեղեկատվությունը տվյալների բազայում: Եկեք սկսենք:

## Ի՞նչ է QuerySet- ը:

QuerySet- ը, ըստ էության, տվյալ Մոդելի օբյեկտների ցուցակն է: QuerySets- ը թույլ է տալիս կարդալ տվյալների բազան, զտել և փոխել դրանց կարգը:

Օրինակով սովորելը ամենահեշտն է: Փորձենք սա, այնպես չէ՞:

## Django shell

Բացեք ձեր տեղական վահանակը (ոչ PythonAnywhere- ում) և մուտքագրեք այս հրամանը.

{% filename %}command-line{% endfilename %}

    (myvenv) ~/djangogirls$ python manage.py shell
    

Արդյունքն այսպիսին պետք է լինի.

{% filename %}command-line{% endfilename %}

```python
(InteractiveConsole)
>>>
```

Դուք այժմ Django- ի ինտերակտիվ վահանակում եք: Դա ճիշտ է Python- ի հուշման նման, բայց ինչ-որ լրացուցիչ Django մոգությամբ: :) Այստեղ կարող եք օգտագործել Python- ի բոլոր հրամանները:

### Բոլոր օբյեկտները

Փորձենք նախ ցուցադրել մեր բոլոր հաղորդագրությունները: Դա կարող եք անել հետևյալ հրահանգով.

{% filename %}command-line{% endfilename %}

```python
>>> Post.objects.all()
Traceback (most recent call last):
      File "<console>", line 1, in <module>
NameError: name 'Post' is not defined
```

Վայ Սխալ առաջացավ: Այն մեզ ասում է, որ Փոստ չկա: Եվ դա ճիշտ է. Մենք մոռացել ենք ներմուծել այն:

{% filename %}command-line{% endfilename %}

```python
>>> from blog.models import Post
```

Մենք ներմուծում ենք `Post` մոդելը `blog.models`-ից:Փորձենք կրկին ստանալ բլոգի բոլոր գրառումները.

{% filename %}command-line{% endfilename %}

```python
>>> Post.objects.all()
<QuerySet [<Post: my post title>, <Post: another post title>]>
```

Սա ավելի վաղ ստեղծած հաղորդագրությունների ցուցակն է: Մենք ստեղծեցինք այս հաղորդագրությունները Django ադմինիստրատորի ինտերֆեյսի միջոցով: Բայց հիմա մենք ուզում ենք ստեղծել նոր հաղորդագրություններ Python- ի միջոցով, ինչպե՞ս դա անել:

### Ստեղծել օբյեկտ

Ահա, թե ինչպես եք դուք ստեղծում նոր Post օբյեկտ տվյալների բազայում/database.

{% filename %}command-line{% endfilename %}

```python
>>> Post.objects.create(author=me, title='Sample title', text='Test')
```

Բայց այստեղ մենք ունենք մեկ պակասող բաղադրիչ ՝ `me/ես`: Մենք պետք է որպես հեղինակ փոխանցենք `User/Օգտագործող` մոդելի օրինակ: Ինչպե՞ս դա անել:

Եկեք նախ ներմուծենք Օգտագործողի մոդելը/User model.

{% filename %}command-line{% endfilename %}

```python
>>> from django.contrib.auth.models import User
```

Ի՞նչ օգտվողներ ունենք մեր տվյալների բազայում/database: Փորձեք այս:

{% filename %}command-line{% endfilename %}

```python
>>> User.objects.all()
<QuerySet [<User: ola>]>
```

Սա նույն գերշահագործողն է/superuser, որը մենք ստեղծել ենք ավելի վաղ: Այժմ եկեք ստեղծենք օգտագործողի օրինակ (այս տողը հարմարեցրեք ձեր սեփական օգտվողի անվանմանը).

{% filename %}command-line{% endfilename %}

```python
>>> me = User.objects.get(username='ola')
```

Ինչպես տեսնում եք, մենք այժմ ստանում ենք `get` a `User` `username`/օգտագործող անունով, որը համարժեք է «ola»-ին: Կոկիկ! 

Այժմ մենք վերջապես կարող ենք ստեղծել մեր գրառումը.

{% filename %}command-line{% endfilename %}

```python
>>> Post.objects.create(author=me, title='Sample title', text='Test')
<Post: Sample title>
```

Ուռա! Ցանկանու՞մ եք ստուգել, ​​արդյո՞ք այն աշխատում է:

{% filename %}command-line{% endfilename %}

```python
>>> Post.objects.all()
<QuerySet [<Post: my post title>, <Post: another post title>, <Post: Sample title>]>
```

Ահա, ևս մեկ գրառում ցուցակում:

### Ավելացրեք այլ հաղորդագրություններ

Այժմ կարող եք մի փոքր զվարճանալ և ավելացնել նոր հաղորդագրություններ ՝ տեսնելու համար, թե ինչպես է դա աշխատում: Ավելացրեք ևս երկու-երեքը, ապա անցեք հաջորդ մասին:

### Ֆիլտրեք օբյեկտները

QuerySets- ի կարեւոր առանձնահատկությունը օբյեկտները զտելու հնարավորությունն է: Ասենք, որ ուզում ենք գտնել ola օգտվողի հեղինակած բոլոր գրառումնները: `Post.objects.all()` –ում `all/ամբողջի` փոխարեն մենք կօգտագործենք `filter/ֆիլտր ` : Փակագծերի մեջ մենք նշելու ենք այն պայմանները, որոնցով կկառուցվի գրառումների ընտրությունը: Մեր դեպքում պայմանն այն է, որ `author/հեղինակը` պետք է հավասար լինի `me/ինձ `: Django- ում այն կգրվի այսպես `author=me`: Մեր ծածկագիրն այժմ ունի այսպիսի տեսք.

{% filename %}command-line{% endfilename %}

```python
>>> Post.objects.filter(author=me)
<QuerySet [<Post: Sample title>, <Post: Post number 2>, <Post: My 3rd post!>, <Post: 4th title of post>]>
```

Կամ գուցե `title/վերնագիր` դաշտում ուզում ենք տեսնել բոլոր գրառումները, որոնք պարունակում են «վերնագիր»/'title' բառը:

{% filename %}command-line{% endfilename %}

```python
>>> Post.objects.filter(title__contains='title')
<QuerySet [<Post: Sample title>, <Post: 4th title of post>]>
```

> **Նշում** որ `title/Վերնագրի` և `contains/պարունակության` միջև կա երկու ընդգծված նիշ (`_`): Django- ի ORM- ն այս կանոնն օգտագործում է դաշտերի անունները («վերնագիր»/"title") և գործողությունները կամ ֆիլտրերն առանձնացնելու համար («պարունակում է»/"contains"): Եթե ​​դուք օգտագործեք միայն մեկ ընդգծում, դուք կստանաք սխալ ՝ "FieldError: Cannot resolve keyword title_contains".

Կարող եք նաև ստանալ բոլոր հրապարակված հաղորդագրությունների ցուցակը: Մենք դա անում ենք ՝ զտելով անցյալում տեղադրված `published_date/հրապարակված_ամսաթերթը` բոլոր հաղորդագրությունները:

{% filename %}command-line{% endfilename %}

```python
>>> from django.utils import timezone
>>> Post.objects.filter(published_date__lte=timezone.now())
<QuerySet []>
```

Ցավոք, գրառումը, որը մենք ավելացրել ենք Python կոնսոլից, դեռ հրապարակված չէ: Բայց մենք կարող ենք դա փոխել: Նախ ընտրենք այն գրառումը, որը մենք ցանկանում ենք հրապարակել.

{% filename %}command-line{% endfilename %}

```python
>>> post = Post.objects.get(title="Sample title")
```

Եվ այնուհետև հրապարակեք այն մեր `publish/հրապարակել ` եղանակով:

{% filename %}command-line{% endfilename %}

```python
>>> post.publish()
```

Այժմ կրկին փորձեք ստանալ հրապարակված հաղորդագրությունների ցուցակը (3 անգամ սեղմեք վեր սլաքը և ապա `enter`).

{% filename %}command-line{% endfilename %}

```python
>>> Post.objects.filter(published_date__lte=timezone.now())
<QuerySet [<Post: Sample title>]>
```

### Օբյեկտների կարգավորում

QuerySets- ը թույլ է տալիս տեսակավորել օբյեկտները: Փորձենք տեսակավորել ըստ `created_date/ստեղծման_ամսաթիվ` դաշտի.

{% filename %}command-line{% endfilename %}

```python
>>> Post.objects.order_by('created_date')
<QuerySet [<Post: Sample title>, <Post: Post number 2>, <Post: My 3rd post!>, <Post: 4th title of post>]>
```

Կարող ենք նաև հակադարձել հրամանը ՝ սկզբում ավելացնելով սա `-`

{% filename %}command-line{% endfilename %}

```python
>>> Post.objects.order_by('-created_date')
<QuerySet [<Post: 4th title of post>,  <Post: My 3rd post!>, <Post: Post number 2>, <Post: Sample title>]>
```

### Բարդ հարցումներ մեթոդի շղթայացման միջոցով

Ինչպես տեսնում եք, `Post.objects` - ի որոշ մեթոդներ վերադարձնում են QuerySet- ը: Նույն մեթոդները կարելի է կրկին կանչել QuerySet- ում, և նրանք կվերադարձնեն նոր QuerySet: Այս կերպ Դուք կարող եք շղթայել դրանց ազդեցությունը ՝ դրանք միմյանց **chaining/կապակցելով**:

```python
>>> Post.objects.filter(published_date__lte=timezone.now()).order_by('published_date')
<QuerySet [<Post: Post number 2>, <Post: My 3rd post!>, <Post: 4th title of post>, <Post: Sample title>]>
```

Սա իսկապես հզոր է և թույլ է տալիս գրել բավականին բարդ հարցումներ:

Գերազանց է! Այժմ դուք պատրաստ եք հաջորդ մասի: Ինտերակտիվ վահանակը/shell փակելու համար մուտքագրեք ՝

{% filename %}command-line{% endfilename %}

```python
>>> exit()
$
```