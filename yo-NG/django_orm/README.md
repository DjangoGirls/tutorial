# Django ORM àti QuerySets

Nínú àkòrí yìí, ìwọ yíò kẹ́kọ̀ọ́ bí Django ṣe n sopọ̀ mọ́ àkójọpọ̀ dátà náà àti bí ó ṣe n tọ́jú dátà sínú rẹ̀. Jẹ́ ká bẹ̀rẹ̀!

## Kíni QuerySet kan?

QuerySet kan jẹ́, ní pàtàkì, àkójọ àwọn ohun èlò ti Àwòṣe pàtó kan. QuerySets fún ọ láàyè láti ka dátà tó wà nínú àkójọpọ̀ dátà náà, sẹ́ ẹ àti tò ó lẹ́sẹẹsẹ.

Èyí tó rọrùn jù ní láti kẹ́kọ̀ọ́ pẹ̀lú àpẹẹrẹ. Jẹ́ ká gbìyànjú èyí, ṣé ká bẹ̀rẹ̀?

## Django shell

Ṣí console kọ̀mpútà rẹ kalẹ̀ (kìí ṣe lórí PythonAnywhere) kí o sì tẹ àṣẹ yìí:

{% filename %}command-line{% endfilename %}

    (myvenv) ~/djangogirls$ python manage.py shell
    

Ó yẹ kí àbájáde náà rí báyìí:

{% filename %}command-line{% endfilename %}

```python
(InteractiveConsole)
>>>
```

O ti wà nínú console ìjọṣepọ̀ ti Django ní báyìí. Ó rí bíi prompt Python náà, ṣùgbọ́n pẹ̀lú àwọn iṣẹ́ Django mìíràn. :) O lè lo gbogbo àwọn àṣẹ Python náà níbí yìí.

### Gbogbo àwọn ohun èlò

Jẹ́ ká gbìyànjú láti kọ́kọ́ ṣàfihàn gbogbo àwọn àròkọ wa. O lè ṣe ìyẹn pẹ̀lú àṣẹ tó tẹ̀le yìí:

{% filename %}command-line{% endfilename %}

```python
>>> Post.objects.all()
Traceback (most recent call last):
      File "<console>", line 1, in <module>
NameError: name 'Post' is not defined
```

Oops! Àṣìṣe kan ló fojú hàn. Ó n sọ fún wa pé kò sí Post. Òtítọ́ ni – a ti gbàgbé láti kọ́kọ́ ṣàgbéwọlé rẹ̀!

{% filename %}command-line{% endfilename %}

```python
>>> from blog.models import Post
```

A ṣàgbéwọlé àwòṣe `Post` náà láti `blog.models`. Jẹ́ ká gbìyànjú ṣíṣe àfihàn gbogbo àwọn àròkọ lẹ́ẹ̀kan si:

{% filename %}command-line{% endfilename %}

```python
>>> Post.objects.all()
<QuerySet [<Post: my post title>, <Post: another post title>]>
```

Èyí jẹ́ àkójọ àwọn àròkọ tí a ti ṣẹ̀dá ṣáájú! A ṣẹ̀dá àwọn àròkọ wọ̀nyí pẹ̀lú lílo atọ́kùn alábòójútó Django náà. Ṣùgbọ́n ní báyìí, a fẹ́ ṣẹ̀dá àwọn àròkọ tuntun pẹ̀lú lílo Python, nítorí náà báwo la ṣe máa ṣe ìyẹn?

### Ṣẹ̀dá ohun èlò

Báyìí ní o ṣe máa ṣẹ̀dá ohun èlò Post tuntun kan nínú àkójọpọ̀ dátà:

{% filename %}command-line{% endfilename %}

```python
>>> Post.objects.create(author=me, title='Sample title', text='Test')
```

Ṣùgbọ́n a ṣì pàdánù èròjà kan níbí: `me`. A nílò láti darí àpẹẹrẹ kan ti àwòṣe `User` gẹ́gẹ́ bí olùdásílẹ̀ kan. Báwo la ṣe máa ṣe ìyẹn?

Jẹ́ ká kọ́kọ́ ṣàgbéwọlé àwòṣe User:

{% filename %}command-line{% endfilename %}

```python
>>> from django.contrib.auth.models import User
```

Àwọn aṣàmúlò wo la ní nínú àkójọpọ̀ dátà wa? Gbìyànjú èyí:

{% filename %}command-line{% endfilename %}

```python
>>> User.objects.all()
<QuerySet [<User: ola>]>
```

Èyí ni alábòójútó tí a ti ṣẹ̀dá ṣáájú! Jẹ́ ká gba àpẹẹrẹ kan ti aṣàmúlò náà ni báyìí (ṣàtúnṣe ìlà yìí láti lo orúkọ aṣàmúlò tìẹ):

{% filename %}command-line{% endfilename %}

```python
>>> me = User.objects.get(username='ola')
```

Gẹ́gẹ́ bó o ṣe ríi, a `get` (gba) `User` kan pẹ̀lú `username` tó dọ́gba pẹ̀lú 'ola'. Ó dára!

Ní báyìí, a lè wá ṣẹ̀dá àròkọ wa:

{% filename %}command-line{% endfilename %}

```python
>>> Post.objects.create(author=me, title='Sample title', text='Test')
<Post: Sample title>
```

Inú wa dùn! Ṣé o fẹ́ ṣàyẹ̀wò bóyá ó ti ṣiṣẹ́?

{% filename %}command-line{% endfilename %}

```python
>>> Post.objects.all()
<QuerySet [<Post: my post title>, <Post: another post title>, <Post: Sample title>]>
```

Òhun nìyẹn, àròkọ kan síi nínú àkójọ náà!

### Ṣàfikún àwọn àròkọ síi

O lè wá ṣeré díẹ̀ báyìí kí o ṣàfikún àwọn àròkọ síi láti wo bó ṣe n ṣiṣẹ́. Ṣàfikún bíi méjì àbí mẹ́ta síi, lẹ́yìn náà tẹ̀síwájú sí apá tó kàn náà.

### Sẹ́ àwọn ohun èlò

Apá kan tó ṣe pàtàkì nínú QuerySets ni ìkápá láti sẹ́ wọn. Jẹ́ ká sọ pé a fẹ́ wá gbogbo àwọn àròkọ tí aṣàmúlò ola jẹ́ olùdásílẹ̀ fún. A ó lo `filter` dípò `all` nínú `Post.objects.all()`. Nínú àkámọ́, a sọ irú ipò (àwọn ipò) tí àròkọ blog kan gbọ́dọ̀ ní láti wà nínú queryset wa. Ní ìṣẹ̀lẹ̀ tiwa, ipò náà ni pé `author` ní láti dọ́gba pẹ̀lú `me`. Bí a ṣe máa kọ́ ní Django jẹ́ `author=me`. Ní báyìí, abala kóòdù wa yíò rí báyìí:

{% filename %}command-line{% endfilename %}

```python
>>> Post.objects.filter(author=me)
<QuerySet [<Post: Sample title>, <Post: Post number 2>, <Post: My 3rd post!>, <Post: 4th title of post>]>
```

Tàbí bóyá a fẹ́ rí gbogbo àwọn àròkọ tó ní ọ̀rọ̀ 'title' nínú ààyè `title` náà?

{% filename %}command-line{% endfilename %}

```python
>>> Post.objects.filter(title__contains='title')
<QuerySet [<Post: Sample title>, <Post: 4th title of post>]>
```

> **Ṣàkíyèsí** Àwọn àmì-dáàṣì-ìsàlẹ̀ (`_`) méjì ló wà láàrín `title` àti `contains`. ORM ti Django máa n lo òfin yìí láti fi ìyàtọ̀ sí àárín àwọn orúkọ ààyè ("title") àti àwọn iṣẹ́ tàbí asẹ́ ("contains"). Tí o bá lo àmì-dáàṣì-ìsàlẹ̀ kan ṣoṣo, ìwọ yíò rí àṣìṣe kan bíi "FieldError: Cannot resolve keyword title_contains".

O tún lè gba àkójọ kan ti gbogbo àwọn àròkọ tí a ti ṣàtẹ̀jáde. A máa ṣe èyí nípasẹ̀ sísẹ́ gbogbo àwọn àròkọ tó bá ní ọjọ́ ìtẹ̀jáde, `published_date`, tẹ́lẹ̀tẹ́lẹ̀:

{% filename %}command-line{% endfilename %}

```python
>>> from django.utils import timezone
>>> Post.objects.filter(published_date__lte=timezone.now())
<QuerySet []>
```

Ó bani nínú jẹ́ pé, a kò tíì ṣàtẹ̀jáde àròkọ tí a ṣàfikún láti console Python náà. Ṣùgbọ́n a lè yí ìyẹn padà! Kọ́kọ́ gba àpẹẹrẹ kan ti àròkọ tí a fẹ́ ṣàtẹ̀jáde kan:

{% filename %}command-line{% endfilename %}

```python
>>> post = Post.objects.get(title="Sample title")
```

Lẹ́yìn náà, ṣàtẹ̀jáde rẹ̀ pẹ̀lú ọ̀nà `publish` wa:

{% filename %}command-line{% endfilename %}

```python
>>> post.publish()
```

Now try to get list of published posts again (press the up arrow key three times and hit `enter`):

{% filename %}command-line{% endfilename %}

```python
>>> Post.objects.filter(published_date__lte=timezone.now())
<QuerySet [<Post: Sample title>]>
```

### Títo àwọn ohun èlò lẹ́sẹẹsẹ

QuerySets tún gbà ọ́ láàyè láti to àkójọ àwọn ohun èlò náà lẹ́sẹẹsẹ. Jẹ́ ká gbìyànjú láti tò wọ́n pẹ̀lú ààyè `created_date`:

{% filename %}command-line{% endfilename %}

```python
>>> Post.objects.order_by('created_date')
<QuerySet [<Post: Sample title>, <Post: Post number 2>, <Post: My 3rd post!>, <Post: 4th title of post>]>
```

A tún lè yí títò náà padà pẹ̀lú ṣíṣe àfikún `-` ní ìbẹ̀rẹ̀:

{% filename %}command-line{% endfilename %}

```python
>>> Post.objects.order_by('-created_date')
<QuerySet [<Post: 4th title of post>,  <Post: My 3rd post!>, <Post: Post number 2>, <Post: Sample title>]>
```

### Àwọn ìbéèrè tó ṣòro nípasẹ̀ ṣíṣe ìsopọ̀ ọ̀nà

Gẹ́gẹ́ bó ti rí i, àwọn ọ̀nà kan lórí `Post.objects` dá QuerySet kan padà. Àwọn ọ̀nà kannáà tún lè jẹ́ pípè lórí QuerySet kan, tí yíò sì dá QuerySet tuntun kan padà. Nítorí náà, o lè ṣàkópọ̀ àbájáde wọn nípasẹ̀ **ṣíṣe ìsopọ̀** wọn papọ̀:

```python
>>> Post.objects.filter(published_date__lte=timezone.now()).order_by('published_date')
<QuerySet [<Post: Post number 2>, <Post: My 3rd post!>, <Post: 4th title of post>, <Post: Sample title>]>
```

Èyí lágbára púpọ̀ àti pé yóò jẹ́ kí o kọ àwọn ìbéèrè tó ṣòro gan-an.

Ó dára! O ti ṣetán báyìí fún apá tó kàn náà! Láti pa shell náà dé, tẹ èyí:

{% filename %}command-line{% endfilename %}

```python
>>> exit()
$
```