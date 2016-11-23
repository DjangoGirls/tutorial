# 나의 첫 번째 Django 프로젝트!

> 이번 장은 Geek Girls Carrots (https://github.com/ggcarrots/django-carrots) 의 튜토리얼을 바탕으로 작성되었습니다.
>
> 이번 장의 일부는 Creative Commons Attribution-ShareAlike 4.0 International License를 준수하여 [django-marcador tutorial][1]을 바탕으로 작성되었습니다. Django-marcador 튜토리얼은 Markus Zapke-Gründemann et al에게 저작권이 있습니다.

 [1]: http://django-marcador.keimlink.de/

이제 우리는 아주 간단한 블로그를 만들어 볼 거에요!

첫 단계는 장고 프로젝트를 시작하는 거에요. 다시 말해 장고의 기본 골격을 만들어주는 스크립트를 실행할 거에요. 이 디렉토리와 파일 묶음은 나중에 사용할 것입니다.

장고에서는 디렉토리나 파일 이름이 매우 중요하답니다. 우리가 생성할 그 파일들의 이름을 마음대로 변경해서는 안됩니다. 또한 그 파일들을 다른 곳으로 옮겨도 안됩니다. 장고는 중요한 것들을 찾을 수 있게 특정한 구조를 유지해야합니다.

> 모든 것은 가상환경(virtualenv) 안에서 해야한다는 것을 기억하세요. 현재 콘솔창에서 접두어로 `(myvenv)`가 안보인다면 먼저 virtualenv를 활성화해야 합니다. **Django 설치하기**장의 **virtualenv 작동법**에서 이미 다루었던 내용입니다. 윈도우에서는 `myvenv\Scripts\activate`를 타이핑하고 Mac OS / Linux에서는 `source myvenv/bin/activate`을 입력하세요.

맥과 리눅스 콘솔에서는 다음과 같이 명령을 실행해야해요. **명령어 끝에 `.`(점, 마침표) 을 입력하는 것을 잊지마세요.** :

    (myvenv) ~/djangogirls$ django-admin startproject mysite .


윈도우에서도 **명령 끝에 `.`(점) 을 입력하는 것을 잊지마세요.**:

    (myvenv) C:\Users\Name\djangogirls> django-admin startproject mysite .


> 점 `.`은 현재 디렉토리에 장고를 설치하라고 스크립트에 알려주기 때문에 중요해요. (축약된 표시입니다)
>
> **Note** 위 명령을 입력할 때 `django-admin` 또는 `django-admin.py`로 시작하는 부분만 입력하세요. 여기에 보이는 `(myvenv) ~/djangogirls$`과 `(myvenv) C:\Users\Name\djangogirls>` 부분은 커맨드라인에 입력을 가져오게 하는 메세지(프롬트프 prompt) 입니다.

`django-admin.py`은 스크립트로 디렉토리와 파일들을 생성합니다. 스크립트 실행 후에는 아래와 같이 새로 만들어진 디렉토리 구조를 볼 수 있을 거에요.

    djangogirls
    ├───manage.py
    └───mysite
            settings.py
            urls.py
            wsgi.py
            __init__.py


`manage.py` 파일 또한 스크립트인데, 사이트 관리를 도와주는 역할을 합니다. 이 스크립트로 다른 설치 작업 없이, 컴퓨터에서 웹 서버를 시작할 수 있습니다.

`settings.py`는 웹사이트 설정이 있는 파일입니다.

앞에 우편 배달부는 어느 곳으로 편지를 배달해야하는지 판단해야한다고 말했던 것을 기억하고 있나요? `urls.py` 파일은 `urlresolver`가 사용하는 패턴 목록을 포함하고 있습니다.

지금 그 파일들을 수정하지 않을 거니 무시하세요. 실수로 파일을 지우지 않게 조심하세요!

## 설정 변경

`mysite/settings.py`을 조금 고쳐 볼게요. 설치한 코드 에디터를 열어 파일을 열어주세요.

웹사이트에 정확한 현재 시간을 넣으면 좋겠죠. [위키피디아 타임존 리스트][2]에 가서 해당 시간대(타임존) 를 복사하세요. (예: `Europe/Berlin`)

 [2]: https://en.wikipedia.org/wiki/List_of_tz_database_time_zones

Settings.py에서 `TIME_ZONE`있는 줄을 찾으세요. 그리고 이를 해당 시간대로 변경하세요.

```python
    TIME_ZONE = 'Asia/Seoul'
```

"Asia/Seoul"를 수정하세요.

다음으로 정적파일 경로를 추가할 거에요. (정적 파일은 튜토리얼 후반부에서 CSS와 함께 다룰 거에요) 파일의 *끝(end)*으로 내려가서, `STATIC_URL`항목 바로 아래에 `STATIC_ROOT`을 추가하세요. :

```python
    STATIC_URL = '/static/'
    STATIC_ROOT = os.path.join(BASE_DIR, 'static')
```

## 데이터베이스 설정하기

사이트 내 데이터를 저장하기 위한 많은 다양한 데이터베이스 소프트웨어들이 있습니다. 그 중에서 우리는 `sqlite3`을 사용할 거에요.

사실 이미 `mysite/settings.py` 파일 안에 설치가 되어있어요. :

```python
    DATABASES = {
        'default': {
            'ENGINE': 'django.db.backends.sqlite3',
            'NAME': os.path.join(BASE_DIR, 'db.sqlite3'),
        }
    }
```

블로그에 데이터베이스를 생성하기 위해서 콘솔창에서 아래 코드를 실행하세요: `python manage.py migrate` (이 명령을 실행하기 위해서는 `djangogirls`디렉토리 안에 있는 `manage.py` 필요합니다) 잘 작동되면, 아래와 같은 내용이 나옵니다. :

    (myvenv) ~/djangogirls$ python manage.py migrate
    Operations to perform:
      Synchronize unmigrated apps: messages, staticfiles
      Apply all migrations: contenttypes, sessions, admin, auth
    Synchronizing apps without migrations:
       Creating tables...
          Running deferred SQL...
       Installing custom SQL...
    Running migrations:
      Rendering model states... DONE
      Applying contenttypes.0001_initial... OK
      Applying auth.0001_initial... OK
      Applying admin.0001_initial... OK
      Applying contenttypes.0002_remove_content_type_name... OK
      Applying auth.0002_alter_permission_name_max_length... OK
      Applying auth.0003_alter_user_email_max_length... OK
      Applying auth.0004_alter_user_username_opts... OK
      Applying auth.0005_alter_user_last_login_null... OK
      Applying auth.0006_require_contenttypes_0002... OK
      Applying sessions.0001_initial... OK


잘했네요! 이제 웹 서버를 시작해 웹사이트가 잘 작동하는지 확인해봐요!

프로젝트 디렉토리(the `djangogirls` directory)에 `manage.py` 파일이 있어야 합니다. 콘솔에서는 `python manage.py runserver` 명령을 실행해, 웹서버를 바로 시작할 수 있습니다. :

    (myvenv) ~/djangogirls$ python manage.py runserver


윈도우에서 `UnicodeDecodeError`를 썼는데 오류가 난다면 아래 명령을 대신 써보세요. :

    (myvenv) ~/djangogirls$ python manage.py runserver 0:8000


웹 사이트가 모두 잘 작동하는지 확인해봐요. 사용하는 브라우져(파이어폭스, 크롬, 사파리, 인터넷 익스플로어 등 여러분의 원하는대로)를 열어서 주소를 입력하세요. :

    http://127.0.0.1:8000/


웹서버는 멈출 때까지 명령 프롬프를 실행할 거에요. 실행 중 다른 명령을 입력하려면 새로운 창을 열어 virtualenv를 활성화시키면 됩니다. 웹 서버를 중지하려면, 실행되고 있는 창으로 돌아가 CTRL+C를 동시에 누르세요. (윈도우라면, Ctrl+Break를 눌러야 할지도 모릅니다)

축하해요! 여러분은 방금 웹 서버를 활용한 첫 웹사이트를 만들었어요! 정말 멋지죠?

![잘 작동합니다!][3]

 [3]: images/it_worked2.png

다음 단계로 넘어갈 준비가 되셨나요? 이제는 새로운 내용을 만들어 볼 시간이에요!
