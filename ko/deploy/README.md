# 배포하기!

> **Note** 이번 장은 조금 따라 하기 어려울 수도 있습니다. 하지만 끝까지 따라와 주세요. 배포는 웹 사이트 개발의 가장 중요한 부분이에요. 튜토리얼 중간에 배포 내용이 있는 이유는 코치가 웹사이트를 온라인으로 배포하는 까다로운 과정을 도와줄 수 있기 때문이에요. 시간이 부족하면 혼자서 해볼 수 있을 겁니다.

지금까지는 웹사이트를 내 컴퓨터에서만 볼 수 있었어요. 지금부터 웹사이트를 배포방법을 배워봅시다! 배포(deployment)는 애플리케이션을 인터넷에 올려놓아 다른 사람들도 볼 수 있게 해주는 것 말해요. :)

앞에서 배웠듯이, 웹사이트는 서버라는 곳에 들어갑니다. 인터넷 상에 서버를 제공하는 업체들은 참 많습니다. 우리는 이 중에 비교적 배포 과정이 간단한 [PythonAnywhere](https://www.pythonanywhere.com/)을 사용할 거에요. PythonAnywhere는 방문자가 아주 많지 않은 소규모 애플리케이션을 위한 무료 서비스를 제공하고 있습니다. 지금 우리가 만드는 웹사이트도 해당됩니다. 

우리가 사용할 다른 외부 서비스는 [GitHub](https://github.com/)이라는 코드 호스팅 서비스입니다. 요즘에는 모든 프로그래머들은 GitHub 계정을 가지고 있으니, 여러분도 GitHub 계정을 만들어봐요!

로컬컴퓨터, GitHub, Pythonanywhere 이 세 곳은 모두 중요해요. 로컬 컴퓨터는 개발 및 테스트를 수행하는 곳이 될 것입니다. 개발이 완료되면 프로그램 복사본을 GitHub에 저장합니다. 웹사이트는 PythonAnywhere에 있고 GitHub에서 코드 사본을 업데이트할 거에요.

# Git 설치하기
> **Note** 이미 설치가 완료되었다면, 다시 할 필요가 없어요. 다음 장으로 넘어가서 Git 저장소를 만드는 것부터 시작하세요.

{% include "/deploy/install_git.md" %}

## Git 저장소 만들기

Git은 코드 저장소(repository: 줄여서 "repo"라고 합니다)에 특정한 파일들 집합의 변화를 추적하여 관리합니다. 이제 프로젝트를 시작해 볼까요? 콘솔 창을 열고 `djangogirls` 디렉터리에서 아래 명령어들을 실행하세요.

> **Note** 저장소를 초기화하기 전에 여러분의 현재 작업 디렉터리가 어디인지 꼭 확인하세요. 맥OS나 Linux라면 `pwd` 명령으로, 윈도우라면 `cd` 명령어를 실행하면 알 수 있을 거예요. 반드시 `djangogirls` 폴더에서 해야 합니다.

{% filename %}command-line{% endfilename %}
```
$ git init
Initialized empty Git repository in ~/djangogirls/.git/
$ git config --global user.name "Your Name"
$ git config --global user.email you@example.com
```

git 저장소 초기화는 프로젝트를 시작할 때 딱 한 번만 필요합니다. (username과 email 등록 명령은 계속 적용되기 때문에 이 계정에서는 다시 입력할 필요가 없습니다)

git은 이 디렉터리에 모든 파일과 폴더들의 변경 점을 추적할 것인데, 특정 파일들을 무시(ignore)하여 추적하지 않게 할 수 있습니다. 기본 디렉터리에 `.gitignore`라는 파일을 만들면 됩니다. 에디터를 열어 아래 내용을 넣어주세요. :

{% filename %}.gitignore{% endfilename %}
```
*.pyc
*~
__pycache__
myvenv
db.sqlite3
/static
.DS_Store
```

그리고 `djangogirls` 폴더의 맨 위에다 `.gitignore` 라는 파일로 저장하세요.

> **Note** 파일명 앞에 마침표로 시작하는 것이 중요합니다! 만약 파일을 만드는 것이 어렵다면 (예를 들어 맥은 파인더에서 마침표로 시작하는 파일을 생성하는 걸 좋아하지 않아요) `다른 이름으로 저장(Save As)` 기능을 사용하세요.

> **Note** `.gitignore` 파일에 있는 `db.sqlite3`이라는 파일은 모든 게시물이 저장된 로컬 데이터베이스입니다. PythonAnywhere는 다른 데이터베이스를 사용하기 때문에 저장소에 추가될 필요가 없습니다. 다른 데이터베이스로는 SQLite로도 사용하지만 보통은 SQLite보다 훨씬 많은 방문자를 보유한 웹사이트일 경우 MySQL을 사용합니다. GitHub 저장소에 SQLite 데이터베이스를 제외하고 저장하면, 지금까지 작성한 모든 게시물을 로컬에서만 사용할 수 있으므로 실제 운영하는 프로덕션 환경에서는 다시 새 데이터베이스를 추가해야합니다. 로컬 데이터베이스는 데이터가 삭제돼도 괜찮은 테스트 공간으로만 사용하세요.

`git add`하기 전이나 변경된 것이 있는지 잘 모를 때마다 `git status`명령어를 사용하는 것은 좋은 방법이에요. 잘못된 파일이 추가되거나 커민된 경우, 이를 복구할 수 있습니다. `git status`명령은 미추적/수정된/스테이지된 파일, 브랜치 상태와 그 외 많은 정보를 보여줍니다. 실행하면 아래와 비슷하게 나타날 거에요.


{% filename %}command-line{% endfilename %}
```
$ git status
On branch master

No commits yet

Untracked files:
  (use "git add <file>..." to include in what will be committed)

        .gitignore
        blog/
        manage.py
        mysite/

nothing added to commit but untracked files present (use "git add" to track)
```

자 이제 우리가 만든 코드들을 저장소에 넣어봅시다. 콘솔 창에 가서 다음 명령어를 실행하세요.

{% filename %}command-line{% endfilename %}
```
$ git add --all .
$ git commit -m "My Django Girls app, first commit"
 [...]
 13 files changed, 200 insertions(+)
 create mode 100644 .gitignore
 [...]
 create mode 100644 mysite/wsgi.py
 ```

## GitHub에 코드 배포하기

[GitHub.com](https://github.com/)에서 새 무료 계정을 만드세요. (워크샵 전에 미리 가입했다면 더 좋죠!)

그 다음 새 저장소(new repository)를 "my-first-blog"라는 이름으로 생성하세요. "README 파일과 초기화 하기(initialize with a README)" 체크박스는 체크안 한 상태로 두세요. .gitignore 옵션도 비어있는 상태(위에서 만들었죠?)로 두세요. 라이센스도 비워두세요.

<img src="images/new_github_repo.png" />

> **Note** 저장소 이름 `my-first-blog`는 중요합니다. - 물론 내가 원하는 이름으로 바꿀 수 있지만, 매번 변경해서 사용해야 하니 정말 불편할 거에요. 되도록 `my-first-blog`라는 저장소 이름을 그대로 사용하는 것을 권장합니다.

다음 화면에서 저장소 복제 URL(repo's clon URL)을 볼 수 있을 거예요. "HTTPS" 버전을 선택해서 그 주소를 복사하세요. 그리고 터미널에다 붙여넣으세요.

<img src="images/github_get_repo_url_screenshot.png" />

이제 내 컴퓨터의 Git 저장소를 GitHub에 있는 저장소로 연결해야합니다.

콘솔에 다음과 같이 입력하세요. (`<your-github-username>`에 꺽쇠괄호(<>)를 떼고 내 GitHub 사용자이름을 입력하세요)

{% filename %}command-line{% endfilename %}
```
$ git remote add origin https://github.com/<your-github-username>/my-first-blog.git
$ git push -u origin master
```

아래와 같은 화면이 나오면 GitHub 사용자이름과 암호를 입력하세요. :

{% filename %}command-line{% endfilename %}
```
Username for 'https://github.com': hjwp
Password for 'https://hjwp@github.com':
Counting objects: 6, done.
Writing objects: 100% (6/6), 200 bytes | 0 bytes/s, done.
Total 3 (delta 0), reused 0 (delta 0)
To https://github.com/hjwp/my-first-blog.git
 * [new branch]      master -> master
Branch master set up to track remote branch master from origin.
```


<!--TODO: maybe do ssh keys installs in install party, and point ppl who dont have it to an extension -->

이제 여러분의 코드가 gitHub에 저장됐어요! 가서 확인해보세요! [Django](https://github.com/django/django), [장고걸스 튜토리얼](https://github.com/DjangoGirls/tutorial)뿐만 아니라 수많은 훌륭한 오픈소스 소프트웨어 프로젝트들이 gitHub에서 호스팅하고 있어요. 방금 여러분이 한 것처럼 말이죠. :)


# PythonAnywhere에 블로그 설정하기

> **Note** 설치하기 장에서 PythonAnywhere 계정을 만들었다면 이 부분을 건너뛰세요.

{% include "/deploy/signup_pythonanywhere.md" %}


## GitHub에서 PythonAnywhere로 코드 가져오기

PythonAnywhere에 가입하면 대시보드 또는 "콘솔(Consoles)" 페이지를 볼 수 있을 거예요. "배시(Bash)" 콘솔로 시작하는 옵션을 선택하세요. - PythonAnywhere 버전의 콘솔로 PC에 있는 커맨드라인 같은 것으로 생각해도 됩니다.

> **Note** PythonAnywhere는 리눅스 기반으로 윈도우의 커맨드라인 창과 조금 다르게 보일 수 있어요.

gitHub에 있는 코드를 끌어와 저장소를 "복제"해 PythonAnywhere로 탑재해 볼게요. PythonAnywhere 콘솔에 다음과 같이 입력하세요. (`<your-github-username>`대신 내 GitHub 사용자 이름을 입력하는 것을 잊지 마세요) :

{% filename %}PythonAnywhere command-line{% endfilename %}
```
$ git clone https://github.com/<your-github-username>/my-first-blog.git
```

PythonAnywhere에 코드 복사본을 올릴 거에요. `tree my-first-blog` 명령어를 입력해 확인해보세요. :

{% filename %}PythonAnywhere command-line{% endfilename %}
```
$ tree my-first-blog
my-first-blog/
├── blog
│   ├── __init__.py
│   ├── admin.py
│   ├── migrations
│   │   ├── 0001_initial.py
│   │   └── __init__.py
│   ├── models.py
│   ├── tests.py
│   └── views.py
├── manage.py
└── mysite
    ├── __init__.py
    ├── settings.py
    ├── urls.py
    └── wsgi.py
```

### PythonAnywhere에서 가상환경(virtualenv) 생성하기

PythonAnywhere에서도 내 컴퓨터에 있는 것과 같이 작동할 수 있게 가상환경(virtualenv)을 생성할 수 있어요. 배시 콘솔(Bash console)에 다음과 같이 입력하세요. :

{% filename %}PythonAnywhere command-line{% endfilename %}
```
$ cd my-first-blog

$ virtualenv --python=python3.6 myvenv
Running virtualenv with interpreter /usr/bin/python3.6
[...]
Installing setuptools, pip...done.

$ source myvenv/bin/activate

(myvenv) $  pip install django~=2.0
Collecting django
[...]
Successfully installed django-2.0.6
```

> **Note** `pip install`은 설치가 될 때까지 인내심이 조금 필요해요. 하지만 몇 분 안에 완료될 거니 조금만 기다려보세요. 만약 5분 이상 시간이 지났다면, 무엇인가 잘못된 거니 코치에게 물어보세요.

<!--TODO: think about using requirements.txt instead of pip install.-->

### PythonAnywhere에서 데이터베이스 생성하기

컴퓨터와 서버가 다른 점이 또 하나 있어요. 바로 다른 데이터베이스를 사용한다는 점이에요. 그래서 사용자 계정과 글은 서버와 여러분의 컴퓨터와 다를 수 있어요.

지난번 내 컴퓨터에서 했던 것과 같이 서버에서도 데이터베이스를 초기화 할 거예요. `migrate`와 `createsuperuser`를 사용하세요. :

{% filename %}PythonAnywhere command-line{% endfilename %}
```
(mvenv) $ python manage.py migrate
Operations to perform:
[...]
  Applying sessions.0001_initial... OK
(mvenv) $ python manage.py createsuperuser
```

## web app으로 블로그 배포하기

이제 코드는 PythonAnywhere에 있고 우리의 가상환경(virtualenv)도 준비가 되었으며, 정적 파일들도 모여 있고, 데이터베이스도 초기화되었네요. 이제 우리는 웹 앱으로 배포할 준비가 되었어요.

로고를 클릭해 PythonAnywhere 대시보드로 와서 **Web**을 클릭하고 **Add a new web app**를 선택하세요.

도메인 이름을 확정한 후, 대화창에 **수동설정(manual configuration)** ("Django"옵션이 *아니에요*) 을 클릭하세요. 다음, **Python 3.6**을 선택하고 다음(Next)을 클릭하면 마법사가 종료됩니다.

> **Note** "Django"가 아니라 꼭 "수동설정(Manual configuration)"을 선택하세요. 기본 PythonAnywhere Django 설정을 위해서는 이렇게 하는 것이 더 좋아요. ;-)

### 가상환경(virtualenv) 설정하기

PythonAnywhere 설정 화면으로 이동할 거에요. 서버 앱에 변경사항이 있을 때 이 설정 화면으로 들어가야 합니다.

<img src="images/pythonanywhere_web_tab_virtualenv.png" />

"가상환경(Virtualenv)" 섹션에서 `가상환경 경로를 입력해주세요(Enter the path to a virtualenv)`라고 쓰여 있는 빨간색 글자를 클릭하고 `/home/<your-username>/my-first-blog/myvenv/` 라고 입력합니다. 이동 경로 저장을 하려면 파란색 박스에 체크 표시를 하고 클릭하세요.

> **Note** PythonAnywhere 사용자 이름을 변경하세요. 실수하면 PythonAnywhere는 경고 메시지를 보여줄 거에요.


### WSGI 파일 설정하기

장고는 "WSGI 프로토콜(WSGI protocol"을 사용해 작동합니다. 이 프로토콜은 파이썬을 이용한 웹사이트를 서비스하기 위한 표준으로 PythonAnywhere에서도 지원합니다. WSGI 설정을 파일을 수정해 우리가 만든 장고 블로그를 PythonAnywhere에서 인식하게 해봅시다.

"WSGI 설정 파일(WSGI configuration file)" 링크(페이지 상단에 있는 "코드(Code)" 섹션 내 `/var/www/<your-username>_pythonanywhere_com_wsgi.py`부분)를 클릭하면 에디터를 볼 수 있을 것입니다.

모든 내용을 삭제하고 아래 내용을 넣으세요. :

{% filename %}&lt;your-username&gt;_pythonanywhere_com_wsgi.py{% endfilename %}
```python
import os
import sys

path = '/home/<your-PythonAnywhere-username>/my-first-blog'  # PythonAnywhere 계정으로 바꾸세요.
if path not in sys.path:
    sys.path.append(path)

os.environ['DJANGO_SETTINGS_MODULE'] = 'mysite.settings'

from django.core.wsgi import get_wsgi_application
from django.contrib.staticfiles.handlers import StaticFilesHandler
application = StaticFilesHandler(get_wsgi_application())
```

> **Note** `<your-PythonAnywhere-username>`을 PythonAnywhere 사용자 이름으로 바꾸는 것을 잊지 마세요.
> **Note** 4번째 라인은 파이썬이 어디서나 응용 프로그램을 찾는 방법을 알고 있는지 확인합니다. 경로명은 공백없이 정확하게 작성해야합니다. 그렇지 않으면 "ImportError"라는 오류 로그가 발생합니다.

이 파일은 PythonAnywhere에게 웹 애플리케이션의 위치와 Django 설정 파일명을 알려주는 역할을 합니다.

`StaticFilesHandler`는 CSS를 다루기 위한 것입니다. `runserver` 명령으로 로컬 개발 중에 자동으로 처리됩니다. 튜토리얼의 뒷부분에서 CSS를 작성할 때 정적 파일에 대해 좀 더 알아볼 것입니다.

**저장(Save)**을 누르고 **웹(Web)** 탭을 누릅니다.

다 되었어요! 큰 녹색 **다시 불러오기(Reload)** 버튼을 누르면 여러분은 여러분의 애플리케이션을 볼 수 있을 거예요. 여러분은 페이지 최상단에 가는 링크를 발견할 수 있을 거예요.

## 디버깅 팁

본인의 사이트에 접속할 때 오류가 보이면, 제일 먼저 **error log(오류 로그)**에서 디버깅 정보를 찾아보세요. PythonAnywhere [Web tab](https://www.pythonanywhere.com/web_app_setup/)에서 이 링크를 찾을 수 있어요. 여기서 오류 메시지가 있는지 확인하세요. 대부분의 가장 최근의 오류 메시지는 맨 하단에 있어요. 일반적으로 많이 일어나는 문제들은 아래와 같습니다.:

*   virtualenv를 생성하고 활성화할 때, Django를 설치할 때, Collestac을 돌릴 때, 데이터베이스를 설치할 때 같은 각 단계를 위한 콘솔 작업을 할 때 한 단계를 빼먹는 경우

*   web tab에서 virtualenv 경로를 쓸 때 오타가 났을 때 - 이런 경우 빨간 작은 에러 메시지가 뜰 것입니다.

*   WSGI 설정 파일에 실수가 있을 때 -- my-first-blog-folder 폴더의 경로를 올바르게 입력했었나요?

*   Web app에서 그랬듯이 virtualenv에도 같은 파이썬 버전을 선택했나요? 둘 다 모두 3.4 버전이어야 해요 위키에서 [일반적인 디버깅 팁](https://www.pythonanywhere.com/wiki/DebuggingImportError)을 확인할 수 있어요.

*   만약 `Invalid HTTP_HOST header: <your-site-name> . You may need to add <your-site-name> to ALLOWED_HOSTS.` 라는 오류메세지가 나온다면 `/mysite/settings.py`의 마지막 줄에 `ALLOWED_HOSTS = ['localhost', '127.0.0.1', '[::1]', '.pythonanywhere.com']` 를 추가 한 뒤에 다시 **Web** 탭에서 `Reload <your-site-name`이라는 녹색 버튼을 눌러 주세요.

[PythonAnywhere wiki에 있는 일반적인 디버깅 방법](https://www.pythonanywhere.com/wiki/DebuggingImportError)도 있습니다.

코치들은 여러분들에게 도움을 주기 위해 여기 있다는 것을 기억하세요!

# 내 웹사이트가 나왔어요!

사이트의 기본 페이지는 로컬 컴퓨터에서와 마찬가지로 "It worked(작동했습니다)"라고 보여줍니다. URL 끝에 `/admin/`을 추가하면 관리자 사이트로 이동합니다. 사용자 이름과 암호로 로그인하여 서버에 새 게시물을 추가 할 수 있어요.

몇 개의 게시물을 작성하고 나면 PythonAnywhere가 아닌 로컬 설정으로 돌아갈 수 있어요. 여기에서 로컬 설정을 변경해야합니다. 이 것이 바로 공통적인 웹 개발의 작업 과정 입니다. 로컬에서 변경하고, 변경 사항을 GitHub에 적용하고, 변경 사항을 실제 웹 서버로 가져옵니다. 이를 통해 실제 웹 사이트를 손상시키지 않고 작업하고 테스트 해볼 수 있어요. 멋지지 않나요?

지금까지 잘했다고 내 자신에게 *크게* 칭찬해주세요! 서버 배포는 웹 개발의 가장 까다로운 부분 중 하나로 작업 기간이 몇 일씩 걸리는 경우가 많아요. 하지만 여러분이 만든 사이트는 인터넷에서 라이브되고 있어요!
