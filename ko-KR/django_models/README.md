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

블로그는 제목과 내용이 필요하죠? 그리고 누가 썼는지도 알 수 있게 작성자(author) 도 추가하면 좋을 것 같아요. 마지막으로, 그 글이 작성된 날짜와 게시된 날짜도 알면 좋겠어요.

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

{% filename %}Mac OS X 와 Linux:{% endfilename %}

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
    
    

어플리케이션을 생성한 후 장고에게 사용해야한다고 알려줘야 합니다. 코드편집기에서 `mysite/settings.py` 파일을 열어 진행할거에요. 이 파일 안에서 `INSTALLED_APPS`를 찾고 `]`바로 위 라인에`'blog.apps.BlogConfig'`을 추가하세요.. 최종 결과물은 아래와 다음과 같을 거에요.

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

모든 `Model` 객체는 `blog/models.py` 파일에 선언하여 모델을 만듭니다. 이 파일에 우리의 블로그 글 모델도 정의할 거에요.

`blog/models.py` 파일을 열어서 안에 모든 내용을 삭제한 후 아래 코드를 추가하세요:

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

으음... 코드가 좀 무서워졌죠? 걱정마세요. 각 줄마다 어떤 의미인지 설명해드릴거에요.

`from` 또는 `import`로 시작하는 부분은 다른 파일에 있는 것을 추가하라는 뜻입니다. 다시 말해, 매번 다른 파일에 있는 것을 복사&붙여넣기로 해야하는 작업을 `from</0>이 대신 불러와주는 거죠 import ...`.

`class Post(models.Model):`는 모델을 정의하는 코드입니다. (모델은 `객체(object)`라고 했죠?

- `class`는 특별한 키워드로, 객체를 정의한다는 것을 알려줍니다.
- `Post`는 모델의 이름입니다. (특수문자와 공백 제외한다면) 다른 이름을 붙일 수도 있습니다. 항상 클래스 이름의 첫 글자는 대문자로 써야 합니다.
- `models.Model`은 Post가 장고 모델임을 의미합니다. 이 코드 때문에 장고는 Post가 데이터베이스에 저장되어야 된다고 알게 됩니다.

이제 속성을 정의하는 것에 대해서 이야기해볼게요: `title`, `text`, `created_date`, `published_date`, `author`에 대해서 말할 거에요. 각 필드마다 어떤 종류의 데이터 타입을 가지는지를 정해야해요. (텍스트? 숫자? 날짜? 예를 들어, 유저와 같은 다른 객체와의 관계?)

- `models.CharField` - 글자 수가 제한된 텍스트를 정의할 때 사용합니다. 글 제목같이 대부분의 짧은 문자열 정보를 저장할 때 사용합니다.
- `models.TextField` - 글자 수에 제한이 없는 긴 텍스트를 위한 속성입니다. 블로그 콘텐츠를 담기 좋겠죠?
- `models.DateTimeField` - 이것은 날짜와 시간을 의미합니다.
- `models.ForeignKey` - 다른 모델이 대한 링크를 의미합니다.

시간 관계상 모든 코드를 하나하나 다 설명하지는 않을 거예요. 모델의 필드를 정의하는 방법에 궁금하거나 위에서 설명한 것 이외의 것이 알고 싶다면 아래 장고 공식 문서를 꼭 읽어보길 바랍니다. (https://docs.djangoproject.com/en/2.2/ref/models/fields/#field-types).

`def publish(self):`는 무슨 뜻일까요? 이 것이 바로 앞서 말했던 `publish`라는 메서드(method) 입니다. `def`는 이 것이 함수/메서드라는 뜻이고, `publish`는 메서드의 이름입니다. 원한다면 메서드 이름을 변경할 수도 있어요. 이름을 붙일 때는 공백 대신, 소문자와 언더스코어를 사용해야 합니다. 예를 들어, 평균 가격을 계산하는 메서드는 `calculate_average_price`라고 부를 수 있겠네요.

메서드는 자주 무언가를 되돌려주죠. (`return`) 그 예로 `__str__` 메서드를 봅시다. 이 시나리오대로라면, `__str__`를 호출하면 Post 모델의 제목 텍스트(**string**) 를 얻게 될 거에요.

클래스 내 `def publish(self):`, `def __str__(self):`는 들여쓰기가 되어 있습니다. 파이썬은 공백에 민감한 때문에, 클래스 내 메소드는 들여쓰기를 해줘야 합니다. 그렇지 않으면 메소드가 클래스안에 속하지 않아서 예기치 않은 동작이 발생할 수 있습니다.

아직 모델에 대해서 잘 모르는 부분이 있다면, 코치에게 자유롭게 물어보세요! 지금 배운 내용이 너무 복잡하게 느껴질 수 있어요. 객체와 함수를 배운 적이 없는 분들이 한꺼번에 배우게 된다면 특히 그렇겠죠. 그래도 해 볼 만한 마법이라고 생각했으면 좋겠어요!

### 데이터베이스에 모델을 위한 테이블 만들기

이 장의 마지막 단계입니다. 이제 데이터베이스에 우리의 새 모델을 추가할 거에요. 먼저 우리는 장고 모델에 (우리가 방금 만든!) 몇 가지 변화가 생겼다는 걸 알게 해줘야 합니다. (콘솔로 돌아가 `python manage.py makemigrations blog`를 입력하세요. 아마도 화면에 이렇게 보이겠죠?

{% filename %}명령줄{% endfilename %}

    (myvenv) ~/djangogirls$ python manage.py makemigrations blog
    Migrations for 'blog':
      blog/migrations/0001_initial.py:
    
      - Create model Post
    

주의: 수정한 파일들을 저장하는것을 잊지 마세요. 만약 그렇지 않으면 에러 메시지가 보이는 이전 코드가 실행될거에요.

장고는 데이터베이스에 바로 반영할 수 있도록 마이그레이션 파일(migration file)이라는 것을 준비해 두었답니다. 이제 `python manage.py migrate blog` 명령을 실행해, 실제 데이터베이스에 모델 추가를 반영하겠습니다. :

{% filename %}명령줄{% endfilename %}

    (myvenv) ~/djangogirls$ python manage.py migrate blog
    Operations to perform:
      Apply all migrations: blog
    Running migrations:
      Applying blog.0001_initial... OK
    

만세! 드디어 글 모델이 데이터베이스에 저장되었습니다. 너무 멋지 않나요? 빨리 다음 장으로 넘어가서 블로그 글을 확인하러 가요!