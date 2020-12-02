# 나의 첫 번째 Django 프로젝트!

> 이번 장의 일부는 Geek Girls Carrots (https://github.com/ggcarrots/django-carrots)의 튜토리얼을 바탕으로 작성되었습니다.
> 
> 이번 장의 일부는 Creative Commons Attribution-ShareAlike 4.0 International License가 있는 [django-marcador tutorial](http://django-marcador.keimlink.de/)을 기초로 작성되었습니다. Django-marcador 튜토리얼은 Markus Zapke-Gründemann et al에게 저작권이 있습니다.

이제 우리는 아주 간단한 블로그를 만들어 볼 거에요!

첫 단계는 장고 프로젝트를 시작하는 거에요. 다시 말해 장고의 기본 골격을 만들어주는 스크립트를 실행할 거에요. 이 디렉토리와 파일 묶음은 나중에 사용할 것입니다.

장고에서는 디렉토리나 파일 이름이 매우 중요하답니다. 우리가 생성할 그 파일들의 이름을 마음대로 변경해서는 안됩니다. 또한 그 파일들을 다른 곳으로 옮겨도 안됩니다. 장고는 중요한 것들을 찾을 수 있게 특정한 구조를 유지해야합니다.

> 모든 것은 가상환경(virtualenv) 안에서 해야한다는 것을 기억하세요. 현재 콘솔창에서 접두어로 `(myvenv)`가 안보인다면 먼저 virtualenv를 활성화해야 합니다. **Django 설치하기**장의 **virtualenv 작동법**에서 이미 다루었던 내용입니다. 윈도우에서는 `myvenv\Scripts\activate`를 타이핑하고 Mac OS 또는 Linux에서는 `source myvenv/bin/activate`을 입력하세요.

<!--sec data-title="Create project: OS X or Linux" data-id="django_start_project_OSX_Linux" data-collapse=true ces-->

맥과 리눅스 콘솔에서는 다음과 같이 명령을 실행해야해요. **명령어 끝에 `.`(점, 마침표) 을 입력하는 것을 잊지마세요.** :

{% filename %}명령줄{% endfilename %}

    (myvenv) ~/djangogirls$ django-admin startproject mysite .
    

> 점 `.`은 현재 디렉토리에 장고를 설치하라고 스크립트에 알려주기 때문에 중요해요. (축약된 표시이죠).
> 
> **참고** 위 명령을 입력할 때 `django-admin`로 시작하는 부분만 입력하세요. 여기에 보이는 `(myvenv) ~/djangogirls$` 부분은 커맨드라인에 입력을 가져오게 하는 프롬트프(prompt)의 예시에요.

<!--endsec-->

<!--sec data-title="Create project: Windows" data-id="django_start_project_windows" data-collapse=true ces-->

윈도우에서는 다음과 같이 명령을 실행해야 해요. **명령어 끝에 `.`(점, 마침표) 을 입력하는 것을 잊지마세요.** :

{% filename %}명령줄{% endfilename %}

    (myvenv) C:\Users\Name\djangogirls> django-admin.exe startproject mysite .
    

> 점 `.`은 현재 디렉토리에 장고를 설치하라고 스크립트에 알려주기 때문에 중요해요. (축약된 표시이죠).
> 
> **참고** 위 명령을 입력할 때 `django-admin.exe`로 시작하는 부분만 입력하세요. 여기에 보이는 `(myvenv) C:\Users\Name\djangogirls>` 부분은 커맨드라인에 입력을 가져오게 하는 프롬트프(prompt)의 예시에요.

<!--endsec-->

`django-admin.py`은 스크립트로 디렉토리와 파일들을 생성해줍니다. 스크립트 실행 후에는 아래와 같이 새로 만들어진 디렉토리 구조를 볼 수 있을 거에요.

    djangogirls
    ├── manage.py
    ├── mysite
    │   ├── __init__.py
    │   ├── settings.py
    │   ├── urls.py
    │   └── wsgi.py
    ├── myvenv
    │   └── ...
    └── requirements.txt
    

> **주의**: 디렉토리 구조안에, `venv` 디렉토리가 보인다면, 이미 이전에 만들어 놓은 것이에요.

`manage.py` 파일 또한 스크립트인데, 사이트 관리를 도와주는 역할을 합니다. 이 스크립트로 다른 설치 작업 없이, 컴퓨터에서 웹 서버를 시작할 수 있습니다.

`settings.py`는 웹사이트 설정이 있는 파일입니다.

앞에 우편 배달부는 어느 곳으로 편지를 배달해야하는지 판단해야한다고 말했던 것을 기억하고 있나요? `urls.py` 파일은 `urlresolver`가 사용하는 패턴 목록을 포함하고 있습니다.

지금 그 파일들을 수정하지 않을 거니 무시하세요. 실수로 파일을 지우지 않게 조심하세요!

## 설정 변경

`mysite/settings.py`을 조금 고쳐 볼게요. 설치한 코드 에디터를 열어 파일을 열어주세요.

**주의**: `settings.py` 은 다른파일과 마찬가지로 일반 파일임을 명심하세요. 코드편집기에서 "파일 -> 열기"메뉴를 통해 열 수 있어요. `settings.py` 파일을 찾고 선택할 수 있는 일반적인 창이 나타난답니다. 또는, 바탕화면의 djangogirs폴더로 이동해서 마우스 우클릭후 파일을 열 수 있어요. 그리고 목록에서 코드편집기를 선택하세요. 파일을 열 수는 있지만 편집할 수는 없는 다른 프로그램이 설치되어 있을 수 있으므로 편집기를 선택하는 것이 중요해요.

웹사이트에 정확한 현재 시간을 넣으면 좋겠죠. [위키피디아의 타임존 목록](https://en.wikipedia.org/wiki/List_of_tz_database_time_zones)으로 이동해서 연관된 타임존(TZ) (예를 들어`Europe/Berlin`).

Settings.py에서 `TIME_ZONE`있는 줄을 찾으세요. 그리고 이를 해당 시간대로 변경하세요.

{% filename %}mysite/settings.py{% endfilename %}

```python
TIME_ZONE = 'Europe/Berlin'
```

A language code consist of the language, e.g. `en` for English or `de` for German, and the country code, e.g. `de` for Germany or `ch` for Switzerland. If English is not your native language, you can add this to change the default buttons and notifications from Django to be in your language. So you would have "Cancel" button translated into the language you defined here. [Django comes with a lot of prepared translations](https://docs.djangoproject.com/en/2.2/ref/settings/#language-code).

If you want a different language, change the language code by changing the following line:

{% filename %}mysite/settings.py{% endfilename %}

```python
LANGUAGE_CODE = 'de-ch'
```

We'll also need to add a path for static files. (We'll find out all about static files and CSS later in the tutorial.) Go down to the *end* of the file, and just underneath the `STATIC_URL` entry, add a new one called `STATIC_ROOT`:

{% filename %}mysite/settings.py{% endfilename %}

```python
STATIC_URL = '/static/'
STATIC_ROOT = os.path.join(BASE_DIR, 'static')
```

When `DEBUG` is `True` and `ALLOWED_HOSTS` is empty, the host is validated against `['localhost', '127.0.0.1', '[::1]']`. This won't match our hostname on PythonAnywhere once we deploy our application so we will change the following setting:

{% filename %}mysite/settings.py{% endfilename %}

```python
ALLOWED_HOSTS = ['127.0.0.1', '.pythonanywhere.com']
```

> **Note**: If you're using a Chromebook, add this line at the bottom of your settings.py file: `MESSAGE_STORAGE = 'django.contrib.messages.storage.session.SessionStorage'`
> 
> Also add `.amazonaws.com` to the `ALLOWED_HOSTS` if you are using cloud9

## Set up a database

사이트 내 데이터를 저장하기 위한 많은 다양한 데이터베이스 소프트웨어들이 있습니다. 그 중에서 우리는 `sqlite3`을 사용할 거에요.

사실 이미 `mysite/settings.py` 파일 안에 설치가 되어있어요. :

{% filename %}mysite/settings.py{% endfilename %}

```python
DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.sqlite3',
        'NAME': os.path.join(BASE_DIR, 'db.sqlite3'),
    }
}
```

블로그에 데이터베이스를 생성하기 위해서 콘솔창에서 아래 코드를 실행하세요: `python manage.py migrate` (이 명령을 실행하기 위해서는 `djangogirls`디렉토리 안에 있는 `manage.py` 필요합니다.) 잘 작동되면, 아래와 같은 내용이 나옵니다. :

{% filename %}command-line{% endfilename %}

    (myvenv) ~/djangogirls$ python manage.py migrate
    Operations to perform:
      Apply all migrations: auth, admin, contenttypes, sessions
    Running migrations:
      Rendering model states... DONE
      Applying contenttypes.0001_initial... OK
      Applying auth.0001_initial... OK
      Applying admin.0001_initial... OK
      Applying admin.0002_logentry_remove_auto_add... OK
      Applying contenttypes.0002_remove_content_type_name... OK
      Applying auth.0002_alter_permission_name_max_length... OK
      Applying auth.0003_alter_user_email_max_length... OK
      Applying auth.0004_alter_user_username_opts... OK
      Applying auth.0005_alter_user_last_login_null... OK
      Applying auth.0006_require_contenttypes_0002... OK
      Applying auth.0007_alter_validators_add_error_messages... OK
      Applying auth.0008_alter_user_username_max_length... OK
      Applying auth.0009_alter_user_last_name_max_length... OK
      Applying sessions.0001_initial... OK
    

잘했네요! 이제 웹 서버를 시작해 웹사이트가 잘 작동하는지 확인해봐요!

## Starting the web server

프로젝트 디렉토리(the `djangogirls` directory)에 `manage.py` 파일이 있어야 합니다. 콘솔에서는 `python manage.py runserver` 명령을 실행해, 웹서버를 바로 시작할 수 있습니다. :

{% filename %}command-line{% endfilename %}

    (myvenv) ~/djangogirls$ python manage.py runserver
    

If you are on a Chromebook, use this command instead:

{% filename %}Cloud 9{% endfilename %}

    (myvenv) ~/djangogirls$ python manage.py runserver 0.0.0.0:8080
    

윈도우에서 `UnicodeDecodeError`를 썼는데 오류가 난다면 아래 명령을 대신 써보세요. :

{% filename %}command-line{% endfilename %}

    (myvenv) ~/djangogirls$ python manage.py runserver 0:8000
    

Now you need to check that your website is running. Open your browser (Firefox, Chrome, Safari, Internet Explorer or whatever you use) and enter this address:

{% filename %}browser{% endfilename %}

    http://127.0.0.1:8000/
    

If you're using a Chromebook and Cloud9, instead click the URL in the pop-up window that should have appeared in the upper right corner of the command window where the web server is running. The URL will look something like:

{% filename %}browser{% endfilename %}

    https://<a bunch of letters and numbers>.vfs.cloud9.us-west-2.amazonaws.com
    

축하해요! 여러분은 방금 웹 서버를 활용한 첫 웹사이트를 만들었어요! 정말 멋지죠?

![Install worked!](images/install_worked.png)

Note that a command window can only run one thing at a time, and the command window you opened earlier is running the web server. As long as the web server is running and waiting for additional incoming requests, the terminal will accept new text but will not execute new commands.

> We reviewed how web servers work in the **How the Internet works** chapter.

To type additional commands while the web server is running, open a new terminal window and activate your virtualenv -- to review instructions on how to open a second terminal window, see [Introduction to the command line](../intro_to_command_line/README.md). To stop the web server, switch back to the window in which it's running and press CTRL+C - Control and C keys together (on Windows, you might have to press Ctrl+Break).

다음 단계로 넘어갈 준비가 되셨나요? 이제는 새로운 내용을 만들어 볼 시간이에요!