# Django 모델

What we want to create now is something that will store all the posts in our blog. But to be able to do that we need to talk a little bit about things called `objects`.

## 객체(Object)

There is a concept in programming called `object-oriented programming`. The idea is that instead of writing everything as a boring sequence of programming instructions, we can model things and define how they interact with each other.

그렇다면 객체란 무엇일까요? 객체란 속성과 행동을 모아놓은 것이라고 할 수 있어요. 낯설게 느껴지지만 예를 들어보면 별 것 아님을 알게 될 거에요.

If we want to model a cat, we will create an object `Cat` that has some properties such as `color`, `age`, `mood` (like good, bad, or sleepy ;)), and `owner` (which could be assigned a `Person` object – or maybe, in case of a stray cat, this property could be empty).

Then the `Cat` has some actions: `purr`, `scratch`, or `feed` (in which case, we will give the cat some `CatFood`, which could be a separate object with properties, like `taste`).

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
    

So basically the idea is to describe real things in code with properties (called `object properties`) and actions (called `methods`).

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

A model in Django is a special kind of object – it is saved in the `database`. 데이터베이스란 데이터의 집합입니다. 데이터들이 모아져 있는 곳이지요. 이곳에 유저에 대한 정보나 여러분의 블로그 글 등등이 저장되어 있습니다. 우리는 데이터를 저장하기 위해서 여러가지 데이터베이스를 입맛에 맞게 고를 수 있는데요, 여기서는 SQLite 데이터베이스를 사용하겠습니다. This is the default Django database adapter – it'll be enough for us right now.

쉽게 말해 데이터베이스안의 모델이란 엑셀 스프레드시트와 같다고 말할 수 있어요. 엑셀 스프레드시트를 보면 열(필드) 와 행(데이터) 로 구성되어 있죠? 모델도 마찬가지입니다.

### 어플리케이션 제작하기

잘 정돈된 상태에서 시작하기 위해, 프로젝트 내부에 별도의 어플리케이션을 만들어볼 거에요. 처음부터 모든 것이 잘 준비되어있다면 훌륭하죠. 어플리케이션을 만들기 위해 콘솔창(`djangogirls` 디렉토리에서 `manage.py` 파일)에서 아래 명령어를 실행하세요.

{% filename %}command-line{% endfilename %}

    (myvenv) ~/djangogirls$ python manage.py startapp blog
    

You will notice that a new `blog` directory is created and it contains a number of files now. The directories and files in our project should look like this:

    djangogirls
    ├── blog
    │   ├── __init__.py
    │   ├── admin.py
    │   ├── apps.py
    │   ├── migrations
    │   │   └── __init__.py
    │   ├── models.py
    │   ├── tests.py
    │   └── views.py
    ├── db.sqlite3
    ├── manage.py
    └── mysite
        ├── __init__.py
        ├── settings.py
        ├── urls.py
        └── wsgi.py
    

After creating an application, we also need to tell Django that it should use it. 이 역할을 하는 파일이 `mysite/settings.py`입니다. We need to find `INSTALLED_APPS` and add a line containing `'blog',` just above `]`. 최종 결과물은 아래와 다음과 같을 거에요.

{% filename %}mysite/settings.py{% endfilename %}

```python
INSTALLED_APPS = [
    'django.contrib.admin',
    'django.contrib.auth',
    'django.contrib.contenttypes',
    'django.contrib.sessions',
    'django.contrib.messages',
    'django.contrib.staticfiles',
    'blog',
]
```

### 블로그 글 모델 만들기

In the `blog/models.py` file we define all objects called `Models` – this is a place in which we will define our blog post.

Let's open `blog/models.py`, remove everything from it, and write code like this:

{% filename %}blog/models.py{% endfilename %}

```python
from django.db import models
from django.utils import timezone


class Post(models.Model):
    author = models.ForeignKey('auth.User')
    title = models.CharField(max_length=200)
    text = models.TextField()
    created_date = models.DateTimeField(
            default=timezone.now)
    published_date = models.DateTimeField(
            blank=True, null=True)

    def publish(self):
        self.published_date = timezone.now()
        self.save()

    def __str__(self):
        return self.title
```

> Double-check that you use two underscore characters (`_`) on each side of `str`. 이건 관습은 파이썬에서 자주 사용되는데, "던더(dunder; 더블-언더스코어의 준말)"라고도 불려요.

It looks scary, right? But don't worry – we will explain what these lines mean!

`from` 또는 `import`로 시작하는 부분은 다른 파일에 있는 것을 추가하라는 뜻입니다. 다시 말해, 매번 다른 파일에 있는 것을 복사&붙여넣기로 해야하는 작업을 `from</0>이 대신 불러와주는 거죠 import ...`.

`class Post(models.Model):` – this line defines our model (it is an `object`).

- `class`는 특별한 키워드로, 객체를 정의한다는 것을 알려줍니다.
- `Post` is the name of our model. We can give it a different name (but we must avoid special characters and whitespace). Always start a class name with an uppercase letter.
- `models.Model`은 Post가 장고 모델임을 의미합니다. 이 코드 때문에 장고는 Post가 데이터베이스에 저장되어야 된다고 알게 됩니다.

이제 속성을 정의하는 것에 대해서 이야기해볼게요: `title`, `text`, `created_date`, `published_date`, `author`에 대해서 말할 거에요. To do that we need to define the type of each field (Is it text? A relation to another object, like a User?)

- `models.CharField` – this is how you define text with a limited number of characters.
- `models.TextField` – this is for long text without a limit. Sounds ideal for blog post content, right?
- `models.DateTimeField` – this is a date and time.
- `models.ForeignKey` – this is a link to another model.

시간 관계 상 모든 코드들을 하나하나 다 설명하지는 않을 거에요. You should take a look at Django's documentation if you want to know more about Model fields and how to define things other than those described above (https://docs.djangoproject.com/en/1.11/ref/models/fields/#field-types).

`def publish(self):`는 무슨 뜻일까요? This is exactly the `publish` method we were talking about before. `def`는 이 것이 함수/메서드라는 뜻이고, `publish`는 메서드의 이름입니다. You can change the name of the method if you want. The naming rule is that we use lowercase and underscores instead of spaces. For example, a method that calculates average price could be called `calculate_average_price`.

메서드는 자주 무언가를 되돌려주죠. (`return`) 그 예로 `__str__` 메서드를 봅시다. 이 시나리오대로라면, `__str__`를 호출하면 Post 모델의 제목 텍스트(**string**) 를 얻게 될 거에요.

Also notice that both `def publish(self):` and `def __str__(self):` are indented inside our class. Because Python is sensitive to whitespace, we need to indent our methods inside the class. Otherwise, the methods won't belong to the class, and you can get some unexpected behavior.

아직 모델에 대해서 잘 모르는 부분이 있다면, 코치에게 자유롭게 물어보세요! 지금 배운 내용이 너무 복잡하게 느껴질 수 있어요. 객체와 함수를 배운 적이 없는 분들이 한꺼번에 배우게 된다면 특히 그렇겠죠. 그래도 해 볼 만한 마법이라고 생각했으면 좋겠어요!

### 데이터베이스에 모델을 위한 테이블 만들기

이 장의 마지막 단계입니다. 이제 데이터베이스에 우리의 새 모델, Post 모델을 추가할 거에요. First we have to make Django know that we have some changes in our model. (We have just created it!) Go to your console window and type `python manage.py makemigrations blog`. 아마도 화면에 이렇게 보이겠죠?

{% filename %}command-line{% endfilename %}

    (myvenv) ~/djangogirls$ python manage.py makemigrations blog
    Migrations for 'blog':
      blog/migrations/0001_initial.py:
    
      - Create model Post
    

**Note:** Remember to save the files you edit. Otherwise, your computer will execute the previous version which might give you unexpected error messages.

Django prepared a migration file for us that we now have to apply to our database. Type `python manage.py migrate blog` and the output should be as follows:

{% filename %}command-line{% endfilename %}

    (myvenv) ~/djangogirls$ python manage.py migrate blog
    Operations to perform:
      Apply all migrations: blog
    Running migrations:
      Rendering model states... DONE
      Applying blog.0001_initial... OK
    

만세! 드디어 글 모델이 데이터베이스에 저장되었습니다. 너무 멋지 않나요? 빨리 다음 장으로 넘어가서 블로그 글을 확인하러 가요!