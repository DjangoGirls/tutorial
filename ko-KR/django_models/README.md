# Django 모델

이번에 우리가 만들고자 하는 부분은 블로그 내 모든 포스트를 저장하는 부분이에요. 먼저 우리는 `객체(object)`에 대해서 조금 알고 있어야해요.

## 객체(Object)

프로그래밍 개발 방법 중에는 `객체 지향 프로그래밍(object oriented programming)`이라 부르는 개념이 있어요. 이 개발 방법은 프로그램이 어떻게 작동해야 하는지 모든 것을 하나하나 지시하는 것 대신, 모델을 만들어 그 모델이 어떤 역할을 가지고 어떻게 행동해야 하는지 정의하여 서로 알아서 상호작용할 수 있도록 만드는 것입니다.

그렇다면 객체란 무엇일까요? 객체란 속성과 행동을 모아놓은 것이라고 할 수 있어요. 낯설게 느껴지지만 예를 들어보면 별 것 아님을 알게 될 거에요.

예를 들어 `고양이(Cat)`라는 객체를 모델링 한다고 해볼게요. 이 고양이는 여러 속성을 가지고 있어요: `색깔`, `나이`, `분위기`(착한, 나쁜, 졸려 하는), `주인`(주인이 `사람`일 수도 있지만, 길고양이면 주인이 없으니 속성이 빈 값이 될 수 있어요) 등이 될 수 있겠지요.

또 `고양이는` 특정 행동을 할 수 있어요: `야옹야옹하기`, `긁기`, 또는 `먹기` 등이 있겠네요. (`맛`과, 고양이에게 `고양이먹이`는 행동하는 객체가 달라요).

    Cat
    --------
    color
    age
    mood
    owner
    purr()
    scratch()
    feed(cat_food)
    

    CatFood
    --------
    taste
    

기본적으로 객체지향설계 개념은 현실에 존재하는 것을 속성과 행위로 나타내는 것입니다. 여기서 속성은 `객체 속성(properties)`, 행위는 `메서드(methods)`로 구현됩니다).

그렇다면 블로그 글을 모델로 만들 수 있을까요? 우리는 블로그를 만들고 싶잖아요, 그렇죠?

우리는 다음 질문에 답할 수 있어야 해요: 블로그 글이란 무엇일까? 어떤 속성들을 가져야 할까?

블로그는 제목과 내용이 필요하죠? It would be also nice to know who wrote it – so we need an author. 마지막으로, 그 글이 작성된 날짜와 게시된 날짜도 알면 좋겠어요.

    Post
    --------
    title
    text
    author
    created_date
    published_date
    

블로그 글로 할 수 있는 것은 어떤 것들이 있을까요? 글을 출판하는 `메서드(method)`가 있으면 좋겠죠?

그래서 우리는 `publish` 메서드도 만들어야 합니다.

이제 무엇을 만들어야하는지 이미 알았으니, 장고에서 모델을 만들어 봅시다!

## 장고 모델

객체(object) 가 어떻게 구성되어야 하는지 이전에 살펴봤으니, 이번에는 블로그 글을 위한 장고 모델을 만들어봅시다.

장고 안의 모델은 객체의 특별한 종류입니다. 이 모델을 저장하면 `데이터베이스`에 저장되것이죠. 데이터베이스란 데이터의 집합입니다. 데이터들이 모아져 있는 곳이지요. 이곳에 유저에 대한 정보나 여러분의 블로그 글 등등이 저장되어 있습니다. 우리는 데이터를 저장하기 위해서 여러가지 데이터베이스를 입맛에 맞게 고를 수 있는데요, 여기서는 SQLite 데이터베이스를 사용하겠습니다. Sqlite는 장고에서 기본으로 설정되여 있는 자료기지입니다. 이것을 어댑터라고 하죠. 어댑터가 무엇인지 알려면 설명이 길어지니 지금은 이 정도만 알고 있어도 충분할것 같아요.

쉽게 말해 데이터베이스안의 모델이란 엑셀 스프레드시트와 같다고 말할 수 있어요. 엑셀 스프레드시트를 보면 열(필드) 와 행(데이터) 로 구성되어 있죠? 모델도 마찬가지입니다.

### 어플리케이션 제작하기

잘 정돈된 상태에서 시작하기 위해, 프로젝트 내부에 별도의 어플리케이션을 만들어볼 거에요. 처음부터 모든 것이 잘 준비되어있다면 훌륭하죠. 어플리케이션을 만들기 위해 콘솔창(`djangogirls` 디렉토리에서 `manage.py` 파일)에서 아래 명령어를 실행하세요.

{% filename %}Mac OS X and Linux:{% endfilename %}

    (myvenv) ~/djangogirls$ python manage.py startapp blog
    

{% filename %}Windows:{% endfilename %}

    (myvenv) C:\Users\Name\djangogirls> python manage.py startapp blog
    

이제 `blog`디렉터리가 생성되고 그 안에 여러 파일도 같이 들어있는 것을 알 수 있어요. 디렉토리와 그 안의 파일들은 아래와 같을거에요.

    djangogirls
    ├── blog
    │   ├── admin.py
    │   ├── apps.py
    │   ├── __init__.py
    │   ├── migrations
    │   │   └── __init__.py
    │   ├── models.py
    │   ├── tests.py
    │   └── views.py
    ├── db.sqlite3
    ├── manage.py
    ├── mysite
    │   ├── __init__.py
    │   ├── settings.py
    │   ├── urls.py
    │   └── wsgi.py
    ├── myvenv
    │   └── ...
    └── requirements.txt
    
    

After creating an application, we also need to tell Django that it should use it. We do that in the file `mysite/settings.py` -- open it in your code editor. We need to find `INSTALLED_APPS` and add a line containing `'blog.apps.BlogConfig',` just above `]`. So the final product should look like this:

{% filename %}mysite/settings.py{% endfilename %}

```python
INSTALLED_APPS = [
    'django.contrib.admin',
    'django.contrib.auth',
    'django.contrib.contenttypes',
    'django.contrib.sessions',
    'django.contrib.messages',
    'django.contrib.staticfiles',
    'blog.apps.BlogConfig',
]
```

### 블로그 글 모델 만들기

In the `blog/models.py` file we define all objects called `Models` – this is a place in which we will define our blog post.

Let's open `blog/models.py` in the code editor, remove everything from it, and write code like this:

{% filename %}blog/models.py{% endfilename %}

```python
from django.conf import settings
from django.db import models
from django.utils import timezone


class Post(models.Model):
    author = models.ForeignKey(settings.AUTH_USER_MODEL, on_delete=models.CASCADE)
    title = models.CharField(max_length=200)
    text = models.TextField()
    created_date = models.DateTimeField(default=timezone.now)
    published_date = models.DateTimeField(blank=True, null=True)

    def publish(self):
        self.published_date = timezone.now()
        self.save()

    def __str__(self):
        return self.title
```

> `str`양 옆에 언더스코어(`_`) 를 두 개씩 넣었는지 다시 확인하세요. 이건 관습은 파이썬에서 자주 사용되는데, "던더(dunder; 더블-언더스코어의 준말)"라고도 불려요.

It looks scary, right? But don't worry – we will explain what these lines mean!

All lines starting with `from` or `import` are lines that add some bits from other files. So instead of copying and pasting the same things in every file, we can include some parts with `from ... import ...`.

`class Post(models.Model):` – this line defines our model (it is an `object`).

- `class`는 특별한 키워드로, 객체를 정의한다는 것을 알려줍니다.
- `Post` is the name of our model. We can give it a different name (but we must avoid special characters and whitespace). Always start a class name with an uppercase letter.
- `models.Model`은 Post가 장고 모델임을 의미합니다. 이 코드 때문에 장고는 Post가 데이터베이스에 저장되어야 된다고 알게 됩니다.

Now we define the properties we were talking about: `title`, `text`, `created_date`, `published_date` and `author`. To do that we need to define the type of each field (Is it text? A number? A date? A relation to another object, like a User?)

- `models.CharField` – this is how you define text with a limited number of characters.
- `models.TextField` – this is for long text without a limit. Sounds ideal for blog post content, right?
- `models.DateTimeField` – this is a date and time.
- `models.ForeignKey` – this is a link to another model.

시간 관계상 모든 코드를 하나하나 다 설명하지는 않을 거예요. You should take a look at Django's documentation if you want to know more about Model fields and how to define things other than those described above (https://docs.djangoproject.com/en/2.2/ref/models/fields/#field-types).

What about `def publish(self):`? This is exactly the `publish` method we were talking about before. `def` means that this is a function/method and `publish` is the name of the method. You can change the name of the method if you want. The naming rule is that we use lowercase and underscores instead of spaces. For example, a method that calculates average price could be called `calculate_average_price`.

Methods often `return` something. There is an example of that in the `__str__` method. In this scenario, when we call `__str__()` we will get a text (**string**) with a Post title.

Also notice that both `def publish(self):` and `def __str__(self):` are indented inside our class. Because Python is sensitive to whitespace, we need to indent our methods inside the class. Otherwise, the methods won't belong to the class, and you can get some unexpected behavior.

If something is still not clear about models, feel free to ask your coach! We know it is complicated, especially when you learn what objects and functions are at the same time. But hopefully it looks slightly less magic for you now!

### 데이터베이스에 모델을 위한 테이블 만들기

The last step here is to add our new model to our database. First we have to make Django know that we have some changes in our model. (We have just created it!) Go to your console window and type `python manage.py makemigrations blog`. It will look like this:

{% filename %}command-line{% endfilename %}

    (myvenv) ~/djangogirls$ python manage.py makemigrations blog
    Migrations for 'blog':
      blog/migrations/0001_initial.py:
    
      - Create model Post
    

주의: 수정한 파일들을 저장하는것을 잊지 마세요. 만약 그렇지 않으면 에러 메시지가 보이는 이전 코드가 실행될거에요.

Django prepared a migration file for us that we now have to apply to our database. Type `python manage.py migrate blog` and the output should be as follows:

{% filename %}command-line{% endfilename %}

    (myvenv) ~/djangogirls$ python manage.py migrate blog
    Operations to perform:
      Apply all migrations: blog
    Running migrations:
      Applying blog.0001_initial... OK
    

Hurray! Our Post model is now in our database! It would be nice to see it, right? Jump to the next chapter to see what your Post looks like!