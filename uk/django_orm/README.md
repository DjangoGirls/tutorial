# Django ORM і QuerySets

У цьому розділі ви дізнаєтесь, як Django з'єднується із базою даних і зберігає в ній дані. Почнемо занурення!


## Що таке QuerySet?

A QuerySet є, по суті, списком об'єктів заданої моделі Model. QuerySet дозволяє вам считувати дані з бази даних, а також фільтрувати і впорядковувати їх.

Найпростіше показати на прикладі. Давайте спробуємо?


## Django shell

Відкрийте свій локальний термінал (не PythonAnywhere) і наберіть цю команду:

    (myvenv) ~/djangogirls$ python manage.py shell

Результатом повинно бути:

    (InteractiveConsole)
    >>>

Ви опинетесь в інтерактивній консолі Django. Це щось подібне на командний рядок Python, але має додаткову магію Django :). Звичайно, тут ви також можете використовувати усі команди Python.


### Усі об'єкти

Давайте спробуємо спочатку вивести усі наші пости. Можна це зробити за допомогою наступної команди:

    >>> Post.objects.all()
    Traceback (most recent call last):
          File "<console>", line 1, in <module>
    NameError: name 'Post' is not defined

Ой! З'явилась помилка. Вона повідомляє нам, що немає ніяких постів. І це правильно, адже ми забули спочатку імпортувати їх!

    >>> from blog.models import Post

Усе просто: імпортуємо модель `Post` з `blog.models`. Спробуємо вивести усі пости знову:

    >>> Post.objects.all()
    [<Post: my post title>, <Post: another post title>]

Це список з дописів, з якими ми працювали раніше! Ми створили ці дописи через панель адміністратора Django. Проте, зараз ми хочемо створити нові дописи за допомогою Python, як ми цього доб'ємось?


### Створення об'єкту

Мова йдеться про те, як створити об'єкт Post в базі даних:

    >>> Post.objects.create(author=me, title='Sample title', text='Test')

Однак, ми пропустили один елемент : `me`. Потрібно передати екземпляр моделі `User` у якості автора. Як це зробити?

Спочатку імпортуємо модель User:

    >>> from django.contrib.auth.models import User

Які користувачі присутні в нашій базі даних? Спробуймо це:

    >>> User.objects.all()
    [<User: ola>]

Це суперкористувач, якого ми створили раніше! Нам потрібен його екземпляр:

    me = User.objects.get(username='ola')

Як бачимо, ми отримали користувача із іменем, що дорівнює 'ola'. Чудово! Звісно, ви мали б використовувати ваше ім'я.

Тепер ми нарешті можемо створити наш пост:

    >>> Post.objects.create(author=me, title='Sample title', text='Test')

Ура! Бажаєте перевірити, чи це працює?

    >>> Post.objects.all()
    [<Post: my post title>, <Post: another post title>, <Post: Sample title>]

Є, ще один допис в списку!


### Додайте більше постів

А тепер можете трохи побавитися і пододавати більше постів, щоб побачити, як це працює. Додайте ще 2-3 поста і переходьте до наступної частини.


### Фільтрування об'єктів

Великою частиною QuerySets є можливість фільтрувати запити до бази даних. Скажімо, ми хочемо відшукати усі пости, що мають автора ola. Будемо використовувати `filter` замість `all` в `Post.objects.all()`. В дужках ми вказуємо яким умовам повинен відповідати пост, щоб завершити наш запит до бази даних. У нашому випадку це автор `author`, що дорівнює `me`. В Django цю умову можна виразити як: `author=me`. Тепер наш шматок коду виглядає так:

    >>> Post.objects.filter(author=me)
    [<Post: Sample title>, <Post: Post number 2>, <Post: My 3rd post!>, <Post: 4th title of post>]

Чи, можливо, ми хочемо побачити усі пости, що містять слово 'title' в полі `title`?

    >>> Post.objects.filter(title__contains='title')
    [<Post: Sample title>, <Post: 4th title of post>]

> **Зауваження** Тут використано два знаки підкреслювання (`_`) між `title` і `contains`. Django ORM використовує цей синтаксис щоб відокремити імена полів ("title") і операції або фільтри ("contains"). Якщо ви раптом використаєте одне підкреслювання, то отримаєте помилку на кшталт "FieldError: Cannot resolve keyword title_contains".

Ви також можете отримати список всіх опублікованих дописів. Ми робимо це шляхом фільтрації всіх дописів, які мають встановлене поле `published_date`:
    >>> from django.utils import timezone
    >>> Post.objects.filter(published_date__lte=timezone.now())
    []

На жаль, доданий з Python консолі допис ще не опублікований. Ми можемо змінити це! Спершу отримаємо екземпляр допису, який хочемо опублікувати:

    >>> post = Post.objects.get(title="Sample title")

А далі опублікуємо його за допомогою нашого методу `publish`!

    >>> post.publish()

Тепер спробуйте отримати список опублікованих дописів знову (натисніть стрілку вгору 3 рази, а потім `enter`):

    >>> Post.objects.filter(published_date__lte=timezone.now())
    [<Post: Sample title>]


### Впорядкування об'єктів

QuerySets також дозволяє впорядковувати список об'єктів. Давайте спробуємо впорядкувати їх за параметром поля `created_date`:

    >>> Post.objects.order_by('created_date')
    [<Post: Sample title>, <Post: Post number 2>, <Post: My 3rd post!>, <Post: 4th title of post>]

Також можна здійснити впорядкування у зворотньому напрямку, додавши `-` на початку:

    >>> Post.objects.order_by('-created_date')
    [<Post: 4th title of post>,  <Post: My 3rd post!>, <Post: Post number 2>, <Post: Sample title>]


### З'єднання QuerySets

QuerySets можна поєднувати, створюючи **ланцюжки**:

    >>> Post.objects.filter(published_date__lte=timezone.now()).order_by('published_date')

Це дуже потужний механізм, що дозволяє вам писати дуже складні запити.

Клас! Тепер ви готові до наступної частини! Щоб закрити командну оболонку, наберіть:

    >>> exit()
    $
