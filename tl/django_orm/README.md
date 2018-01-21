# ORM at QuerySets ng Django

Sa kabanatang ito matutunan mo kung paano si Django magkonek sa database at maglagay ng mga datos dito. Tara na!

## Ano ang QuerySet?

Ang QuerySet ay, masasabi natin na isang listahan ng mga object sa isang binigay na Model. Ang QuerySet ay nagbigay ng pamamaraan para mabasa mo ang mga datos mula sa database, mag-filter nito at mag-ayos ayon sa pagkasunod-sunod nito.

Mas madali pag natutunan mo ito sa pamamagitan ng halimbawa, tara na?

## Shell ng Django

Bukasan ang iyong local na console (hindi yung sa PythonAnywhere) at i-type ang command na ito:

{% filename %}command-line{% endfilename %}

    (myvenv) ~/djangogirls$ python manage.py shell
    

Ang epekto nito ay dapat ganito:

{% filename %}command-line{% endfilename %}

```python
(InteractiveConsole)
>>>
```

Ikaw ngayon ay nasa interactive console na ni Django. Gaya lang ito ng prompt ng Pythod, pero may mga karagdagang mahika ni Django. :) Maari mong magamit ang lahat ng mga command ni Python dito, siyempre.

### Lahat ng mga object

Subukan nating magdisplay ng lahat ng ating mga post muna. Magagawa mo ito sa pamamagitan ng sumunod na command:

{% filename %}command-line{% endfilename %}

```python
>>> Post.objects.all()
Traceback (most recent call last):
      File "<console>", line 1, in <module>
NameError: name 'Post' is not defined
```

Ayy! May problemang nakita. Sinasabi nito na walang umiiral na Post. Tama po ito - nakalimutan nating mag-import muna!

{% filename %}command-line{% endfilename %}

```python
>>> from blog.models import Post
```

We import the model `Post` from `blog.models`. Let's try displaying all posts again:

{% filename %}command-line{% endfilename %}

```python
>>> Post.objects.all()
<QuerySet [<Post: my post title>, <Post: another post title>]>
```

Ito ay ang listahan ng mga post na nalikha natin kanina lang. Nilikha natin ang mga post na mga ito gamit ang admin interface ng Django. Pero ngayon gusto nating maglikha ng mga bagong post gamit ang Python, paano kaya natin magagawa ito?

### Create object

Ito ang paraan para maglikha ng bagong Post na object sa ating database:

{% filename %}command-line{% endfilename %}

```python
>>> Post.objects.create(author=me, title='Sample title', text='Test')
```

Pero may nalilimutan tayong isang sangkap dito: `me`. Kailangan nating magpasa ng instance ng `User` na model isip may-akda. Paano natin magawa ito?

Mag-import muna tayo ng User na model:

{% filename %}command-line{% endfilename %}

```python
>>> from django.contrib.auth.models import User
```

Anong mga gumagamit ang nasa loob ng ating database? Subukan natin ito:

{% filename %}command-line{% endfilename %}

```python
>>> User.objects.all()
<QuerySet [<User: ola>]>
```

Ito ay ang superuser na nilikha natin kanina! Ngayon ay kukuha tayo ng instance ng user na ito:

{% filename %}command-line{% endfilename %}

```python
>>> me = User.objects.get(username='ola')
```

Gaya ng makikita mo, may `nakuha` tayong isang `User` na may `bansag` na katumbas ng 'ola'. Mahusay! Siyempre, kailangan natin itong baguhin gamit ang ating sariling bansag.

Ngayon makakalikha na tayo ng post sa wakas:

{% filename %}command-line{% endfilename %}

```python
>>> Post.objects.create(author=me, title='Sample title', text='Test')
```

Yay! Gusto mong tingnan kung gumana ba ito?

{% filename %}command-line{% endfilename %}

```python
>>> Post.objects.all()
<QuerySet [<Post: my post title>, <Post: another post title>, <Post: Sample title>]>
```

Ayon, may isang nadagdag na post sa listahan!

### Magdagdag pa ng mga post

Maari kang maglaro muna at magdagdag pa nga mga post para makita mo kung paano ito gumagana. Magdagdag ng dalawa o tatlo pa at pagkatapos ay punta na tayo sa sumunod na parte.

### Mag-filter ng mga object

Ang malaking parte ng QuerySet ay ang abilidad na pagfilter nito. Sabihin natin na gusto nating hanapin ang lahat ng post na sinulat ng user na si ola. Gagamit tayo ng `filter` sa halip na `all` sa ating `Post.objects.all()`. Sa panaklong, sasabihin natin ang (mga) kondisyon na dapat makita sa blog post para mapunta siya sa ating queryset. Sa kaso natin, ang kondisyon ay ang `author` ay dapat katumbas na `me`. Ang pamamaraan ng pagsulat nito sa Django ay `author=me`. Ngayon ang ating piraso ng code ay maging kagaya nito:

{% filename %}command-line{% endfilename %}

```python
>>> Post.objects.filter(author=me)
[<Post: Sample title>, <Post: Post number 2>, <Post: My 3rd post!>, <Post: 4th title of post>]
```

O maari din na gusto nating makita ang mga post na naglalaman ng salitang 'title' sa ating `title` na field?

{% filename %}command-line{% endfilename %}

```python
>>> Post.objects.filter(title__contains='title')
[<Post: Sample title>, <Post: 4th title of post>]
```

> **Paalala** May dalawang salungguhit na letra (`_`) sa pagitan ng `title` at ang `contains`. Ang ORM ni Django ay gumagamit ng mga tuntunin para ihiwalay ang mga field name na ("title") at ang mga operasyon o mga filter na ("contains"). Kung gagamit ka lang ng isang salungguhit, makakuha ka ng error gaya ng "FieldError: Cannot resolve keyword title_contains".

Maaring ding makuha mo ang lahat ng nalathala na mga post. Magagawa natin ito sa pamamagitan ng pagfilter sa lahat ng posts na mayroong `published_date` na nakalipas na:

{% filename %}command-line{% endfilename %}

```python
>>> from django.utils import timezone
>>> Post.objects.filter(published_date__lte=timezone.now())
[]
```

Sa kasamaang palad, ang post na ating nadagdag mula sa console ng Python ay hindi pa nalathala. Pero mababago natin ito! Una, kukuha tayo ng instance ng post na gusto nating ilathala:

{% filename %}command-line{% endfilename %}

```python
>>> post = Post.objects.get(title="Sample title")
```

At i-publish ito gamit ang ating `publish` na method:

{% filename %}command-line{% endfilename %}

```python
>>> post.publish()
```

Ngayon, subukan mong kumuha ng mga nailathala na mga post ulit (pindutin ang up na key ng tatlong beses at pindutin ang `enter`):

{% filename %}command-line{% endfilename %}

```python
>>> Post.objects.filter(published_date__lte=timezone.now())
[<Post: Sample title>]
```

### Pagkakaayos ng mga Object

Ang QuerySet ay magtutulot sa iyo na ayusin ang lista ng mga object. Subukan nating iayos sila sa pamamagitan ng `created_date` na field:

{% filename %}command-line{% endfilename %}

```python
>>> Post.objects.order_by('created_date')
[<Post: Sample title>, <Post: Post number 2>, <Post: My 3rd post!>, <Post: 4th title of post>]
```

Maari din nating ibaligtad ang pagkakasunod sa pamamagitan ng pagdagdag ng `-` sa simula:

{% filename %}command-line{% endfilename %}

```python
>>> Post.objects.order_by('-created_date')
[<Post: 4th title of post>,  <Post: My 3rd post!>, <Post: Post number 2>, <Post: Sample title>]
```

### Pag-chain ng mga QuerySet

Maari mo ding pagsamahin ang mga QuerySet sa pamamagitan ng **pag-chain** nila ng sabay-sabay:

    >>> Post.objects.filter(published_date__lte=timezone.now()).order_by('published_date')
    

Ito ay tunay na makapangyarihan at sa pamamagitan nito maari kang gumawa ng mga komplekado na mga query.

Magaling! Handa ka na ngayon sa susunod na parte! Para isara ang shell, i-type mo ito:

{% filename %}command-line{% endfilename %}

```python
>>> exit()
$
```