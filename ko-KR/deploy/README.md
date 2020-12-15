# 배포하기!

> **참고**: 이번 장은 따라오기 조금 힘들 수도 있어요. 끝까지 따라와주세요. 배포는 웹사이트 개발의 가장 중요한 부분이에요. 튜토리얼 중간에 이번 장이 있는 이유는 여러분이 코치가 웹사이트를 온라인에서 볼 수 있게 도와주기 위해서에요. 시간이 모자르더라도 튜토리얼을 끝낼 수 있어요.

지금까지는 웹사이트를 내 컴퓨터에서만 볼 수 있었어요. 이제 어떻게 웹사이트를 배포하는지 배워봅시다. 배포(deploy) 는 애플리케이션을 인터넷에 올려놓아 다른 사람들도 볼 수 있게 해주는 것 말해요. :)

앞에서 배웠듯이, 웹사이트는 서버라는 곳에 들어가요. 인터넷상에 많은 서버 공급자들이 있지만, 우린 [PythonAnywhere](https://www.pythonanywhere.com/)을 사용할 겁니다. PythonAnywhere은 방문자가 많지 않은 소규모 어플리케이션은 무료로 사용가능하니 지금 우리에겐 충분하답니다.

우리가 사용할 다른 서비스는 [GitHub](https://www.github.com)라는 코드 호스팅 서비스입니다. 프로그래머들이 애용하는 곳들 중 하나로 대부분의 모든 프로그래머가 GitHub 계정을 가지고 있다고 봐도 될 거예요. 이제 여러분도 하나 만들 때가 되었어요!

이 세 가지는 매우 중요합니다. 로컬 컴퓨터에서는 개발 및 테스트를 수행할 거에요. 원하는 결과물을 얻게 되었다면, 그대로 GitHub에 복사본을 올려둘 거에요. PythonAnywhere에 웹 사이트가 올려질 거고, GitHub에서 새로운 복사본을 가져와 업데이트 될 거에요.

# Git

> **참고** 이미 [설치 단계](../installation/README.md)를 거쳤다면, 이 부분을 다시 하실 필요는 없습니다 - 바로 다음 장으로 넘어 가 Git 저장소 만들기를 시작하세요.

{% include "/deploy/install_git.md" %}

## Git 저장소(repository) 만들기

Git은 코드 저장소(줄여서 "repo"라고 합니다.)에 특정한 파일들 집합의 변화를 추적하여 관리합니다. 이제 프로젝트를 시작해볼까요? 콘솔창을 열어서 `djangogirls` 디렉토리에서 아래 명령어들을 실행하세요. 아래 명령 중에서 Your Name 대신 여러분의 이름을, you@example.com 대신에 여러분의 이메일 주소를 입력하세요.

> **주의**: 저장소를 초기화 하기 전에 여러분의 현재 작업 디렉토리가 어디인지 꼭 확인하세요. 맥OS나 Linux라면 `pwd` 명령으로, 윈도우라면 `cd` 명령어를 실행하면 알 수 있을 거에요. 반드시 `djangogirls` 폴더에서 해야합니다.

{% filename %}command-line{% endfilename %}

    $ git init
    Initialized empty Git repository in ~/djangogirls/.git/
    $ git config --global user.name "Your Name"
    $ git config --global user.email you@example.com
    

git 저장소 초기화는 프로젝트를 시작할 때 딱 한번만 필요합니다 (username과 email 등록 명령은 다시 입력할 필요가 없습니다).

Git은 이 디렉토리에 모든 파일들과 폴더들의 변경점을 추적할 거에요. 무시(ignore) 하도록 지정한 파일들을 제외하고는 말이죠. 기본 디렉토리에다 `.gitignore`라는 파일을 만들어서 특정 파일이나 폴더를 추적하지 않도록 할 수 있습니다. 에디터를 열어서 아래 내용을 넣어주세요:

{% filename %}.gitignore{% endfilename %}

    # Python
    *.pyc
    *~
    __pycache__
    
    # Env
    .env
    myvenv/
    venv/
    
    # Database
    db.sqlite3
    
    # Static folder at project root
    /static/
    
    # macOS
    ._*
    .DS_Store
    .fseventsd
    .Spotlight-V100
    
    # Windows
    Thumbs.db*
    ehthumbs*.db
    [Dd]esktop.ini
    $RECYCLE.BIN/
    
    # Visual Studio
    .vscode/
    .history/
    *.code-workspace
    

"djangogirls"폴더에 `.gitignore`파일을 저장하세요.

> **주의**: 파일명 앞에 마침표로 시작하는 것이 중요합니다! 꼭 붙여주세요. 만약 여러분이 파일을 만드는 것이 어렵다면 (예를 들어 맥에서는 파인더에서 마침표로 시작하는 파일을 생성하는걸 좋아하지 않아요.) "다른 이름으로 저장(Save As)" 기능을 사용하세요. 대부분 이 것으로 충분할거에요. 그리고 `.txt`나 `.py`등 다른 파일 이름 익스텐션을 붙이지 마세요 -- 명칭이 `.gitignore` 이여야 git이 인식할수 있답니다. 리눅스와 MacOS는 `.` 으로 시작하는 파일명을 지닌 파일을 (`.gitignore` 같은) 숨김파일로 다루며 일반 `ls` 명령은 이러한 파일을 보여주지 않아요 `.gitignore` 파일을 보기위해서는 대신 `ls -a` 명령을 사용하세요
> 
> **주목** `.gitignore` 파일에 있는 `db.sqlite3`이라는 파일은 모든 사용자와 게시물이 저장된 로컬 데이터베이스입니다. 우리는 표준 웹 개발 방법을 수행할 거에요. 로컬 테스트 사이트와 PythonAnywhere에서 실제 서비스되는 웹사이트에서 분리된 데이터베이스를 사용하는걸 의미해요. PythonAnywhere 의 데이터베이스는 당신의 개발환경 처럼 SQLite에요. 하지만 보통은 많은 방문자를 처리하기 위해 SQLite보다는 MySQL 이라는 데이터베이스를 사용할 거에요. GitHub 저장소 복사본에 SQLite 데이터베이스를 제외하면, 지금까지 작성한 모든 게시물과 슈퍼유저는 로컬에서만 사용할 수 있으므로 실제 운영하는 프로덕션 환경에서는 다시 새 데이터베이스를 추가해야합니다. 로컬 데이터베이스를 놀이터처럼 생각하고 이것저것 테스트해보세요. 실제 블로그 내 게시글이 삭제되지 않으니 걱정하지 마세요.

`git add`하기 전이나 변경된 것이 있는지 잘 모를 때마다 `git status` 명령어를 사용하는 것은 좋은 방법이에요. 잘못된 파일이 추가될 경우 이를 멈출 수 있게 도움을 주어요. `git status` 명령은 미추적/수정/스테이지된 파일들, 브랜치 상태와 그 외 많은 정보들을 보여줍니다. 출력 결과는 다음과 비슷합니다:

{% filename %}command-line{% endfilename %}

    $ git status
    On branch master
    
    No commits yet
    
    Untracked files:
      (use "git add <file>..." to include in what will be committed)
    
            .gitignore
            blog/
            manage.py
            mysite/
            requirements.txt
    
    nothing added to commit but untracked files present (use "git add" to track)
    

자 이제 우리가 만든 코드들을 저장소에 넣어봅시다. 콘솔창에 가서 다음 명령어를 실행하세요:

{% filename %}command-line{% endfilename %}

    $ git add --all .
    $ git commit -m "My Django Girls app, first commit"
     [...]
     13 files changed, 200 insertions(+)
     create mode 100644 .gitignore
     [...]
     create mode 100644 mysite/wsgi.py
    

## GitHub에 코드 넣기

[GitHub.com](https://www.github.com)에 가서 무료 사용자 계정으로 회원가입을 하세요. (만약 워크샵 준비과정에서 하셨다면 훌륭하십니다!) 비밀번호 관리를 꼭 해주세요 (만약 사용하신다면 비밀번호 관리자에 추가해 주세요). 

그 다음 새 저장소(new repository)를 "my-first-blog"라는 이름으로 생성하세요. 'initialize with a README' 와 '.gitignore' 옵션은 체크하지 말고 빈칸으로 놔두세요. (이미 직접 만들어 봤습니다) Liscense 부분도 None으로 놔두세요. 

![](images/new_github_repo.png)

> 꼭 이름을 my-first-name으로 지정해 주세요. 나중에야 얼마든지 다른 이름으로 바꿀수 있습니다만, 이 안내문에서는 이 제목이 앞으로 많이 등장할겁니다. 만약 다른 이름이라면, (지시를) 하나씩 따라할때마다 이름을 매번 바꿔줘야 하잖아요. 가급적이면 `my-first-blog`라는 저장소 이름을 그대로 사용하는게 편할거에요.

다음 화면에서 이 레포지토리를 클론(clone)할때 쓸 url이 보일텐데요, 이 뒤에 나오는 명령어에서 사용될 예정입니다. 

![](images/github_get_repo_url_screenshot.png)

이제 내 컴퓨터의 Git 저장소를 GitHub에 있는 저장소로 연결해 보겠습니다. 

이제 콘솔에 다음과 같이 입력하세요 (Github 계정을 만들때 입력한 username을 `<your-github-username>`꺾쇠(<>)를 떼고 입력해 주세요.. URL은 방금 보신 clone URL과 반드시 일치해야 합니다.):

{% filename %}command-line{% endfilename %}

    $ git remote add origin https://github.com/<your-github-username>/my-first-blog.git
    $ git push -u origin master
    

Github에 push를 하면, Github 유저네임과 비밀번호를 입력하라고 할 겁니다(지금 열려있는 터미널창 아니면 새로운 팝업창), 이 정보를 입력하고 나면 다음과 같은 장면이 보여야 합니다. 

{% filename %}command-line{% endfilename %}

    Counting objects: 6, done.
    Writing objects: 100% (6/6), 200 bytes | 0 bytes/s, done.
    Total 3 (delta 0), reused 0 (delta 0)
    To https://github.com/ola/my-first-blog.git
    
     * [new branch]      master -> master
    Branch master set up to track remote branch master from origin.
    

<!--TODO: maybe do ssh keys installs in install party, and point ppl who dont have it to an extension -->

이제 코드가 Github에 업로드 되었습니다. 가서 확인해보세요! [Django](https://github.com/django/django), [Django Girls Tutorial](https://github.com/DjangoGirls/tutorial)뿐만 아니라 수많은 훌륭한 오픈소스 소프트웨어 프로젝트들이 GitHub에서 코드를 호스팅하고 있어요. 방금 여러분이 한 것처럼 말이죠. :) :)

# PythonAnywhere에서 블로그 설정하기

## PythonAnywhere에 가서 회원가입을 하세요. 

> **참고** 여러분은 아마 앞부분에서 PythonAnywhere 계정을 생성했을겁니다. 이미 PythonAnywhere 계정이 있으면, 이 부분을 다시 할 필요가 없어요.

{% include "/deploy/signup_pythonanywhere.md" %}

## PythonAnywhere에 우리의 사이트 등록하기

로고를 클릭해서 메인의 [PythonAnywhere Dashboard](https://www.pythonanywhere.com/)로 돌아간다음, "Bash" 콘솔 시작하기 옵션을 선택합니다 - 이건 PythonAnywhere 버전의 터미널 창이예요. 내컴퓨터에 있는것과 마찬가지입니다. 

![PythonAnywhere 웹 인터페이스의 'New console'부분, 'bash'버튼과 함께](images/pythonanywhere_bash_console.png)

> **알림**PythonAnywhere는 리눅스를 기반으로 합니다. 만약 Windows를 사용중이시라면 내컴퓨터의 커맨드라인과 약간 모양이 다를수도 있습니다.

PythonAnywhere에 웹앱을 배포하는 과정은 Github에서 코드를 받아온 다음, PythonAnywhere이 이 app을 알아보도록 등록해주고, 웹앱 서비스를 시작하는 것입니다. 이런 과정을 직접 하나하나 할 수도 있습니다. 하지만 PythonAnywhere은 우리에게 이 과정을 대신 해주는 도움을 제공합니다. 이제 설치부터 해봅시다. 

{% filename %}command-line{% endfilename %}

    $ pip3.8 install --user pythonanywhere
    

이 명령을 실행하면 `Collecting pythonanywhere`같은 글씨가 나와야 합니다. 그리고 마지막에는 `Successfully installed (...) pythonanywhere-(...)`라는 문장과 함께 설치가 완료됩니다. 

이제 helper를 실행하여 Github에 있는 app을 자동으로 등록하겠습니다. PythonAnywhere 콘솔에 다음과 같이 입력하세요.(`<your-github-username>`자리에 잊지말고 Github username을 입력해 주세요, URL이 Github의 clone url과 일치되도록 말입니다.)

{% filename %}command-line{% endfilename %}

    $ pa_autoconfigure_django.py --python=3.8 https://github.com/<your-github-username>/my-first-blog.git
    

이 실행 과정을 지켜보면, 어떤 일이 일어나는지 보일겁니다. 

- Github에서 코드를 다운로드합니다
- 내컴퓨터에서 하는것과 마찬가지로, PythonAnywhere에 가상환경을 생성합니다. 
- settings 파일을 배포 관련 설정과 함께 업데이트 합니다. 
- `manage.py migrate` 명령어를 사용해서 PythonAnywhere에 데이터베이스를 설정합니다
- 정적 파일을 세팅합니다(이에 대해서는 나중에 배웁니다)
- PythonAnywhere를 등록해서 API를 통해 웹앱을 서빙합니다. 

PythonAnywhere에서는 위의 과정들이 모두 자동화되어 있습니다. 하지만 다른 서버 제공자를 사용하면 이같은 과정들을 하나하나 직접 수행해야 합니다. 

여기서 기억해야 할 중요한 점은, PythonAnywhere에 있는 데이터베이스가 내컴퓨터의 데이터베이스와는 아무런 연결고리가 없다는 점입니다. 그래서 각자의 게시물 현황과 관리자 계정이 다릅니다. 따라서, 내컴퓨터에서 했던것과 마찬가지로, `createsuperuser`명령어를 이용해 관리자 계정을 세팅해야 합니다. PythonAnywhere가 이미 자동으로 가상환경을 생성해줬기때문에, 우리는 실행만 하면 됩니다:

{% filename %}command-line{% endfilename %}

    (ola.pythonanywhere.com) $ python manage.py createsuperuser
    

관리자 계정에 필요한 세부 설정을 입력해 주세요. 특별히 PythonAnywhere 비밀번호의 보안을 강화할 생각이 아니라면, 헷갈림을 방지하기 위해서 내컴퓨터에서 사용하고있는 설정과 똑같이 해줍니다. 

지금부터는 `ls` 명령어를 사용해 PythonAnywhere에 있는 코드를 검토하는게 가능합니다.

{% filename %}command-line{% endfilename %}

    (ola.pythonanywhere.com) $ ls
    blog  db.sqlite3  manage.py  mysite requirements.txt static
    (ola.pythonanywhere.com) $ ls blog/
    __init__.py  __pycache__  admin.py  apps.py  migrations  models.pytests.py  static
    templates  views.py
    

이제 "Files" 페이지로 이동해서 PythonAnywhre의 내장 브라우저를 사용해 파일들을 둘러볼수도 있습니다. (콘솔 페이지에서 오른쪽 상단의 메뉴 버튼을 통해 PythonAnywhere의 다른 페이지로 이동할수도 있습니다. ) 일단 어떤 페이지에 접속하면, 상단에 다른 페이지로 이동할 수 있는 링크가 있습니다. 

## 이제 세상에 공개되었습니다!

이제 귀하의 사이트는 internet상에 공개되었습니다. PythonAnywhere의 "Web" 페이지를 클릭해 링크를 받아오세요. 이 링크는 귀하가 원하는 모든 사람에게 공유될 수 있습니다. 

> **알림**이 안내서는 초보자를 위한 튜토리얼입니다. 쉬운 안내를 위해서 보안상 권장되지 않는 방법도 몇개 사용했습니다. 이 프로젝트를 기반으로 하거나 혹은 아예 새로운 프로젝트를 실행하려면, 사이트 보안을 위해 [Django deployment checklist](https://docs.djangoproject.com/en/2.2/howto/deployment/checklist/)를 살펴보세요.

## 디버깅 팁

만일 `pa_autoconfigure_django.py` 스크립트를 실행하다가 에러가 발생한다면, 아래에 제시된 자주 나타나는 문제 원인들을 참고해 보세요. 

- PythonAnywhere의 API 토큰 생성을 잊어버림
- Github URL을 잘못 입력함
- 만약 *"Could not find your settings.py"* 라는 오류가 보인다면, Git에 업로드할때 파일을 빼먹었던지 Github에 push가 제대로 되지 않은 것입니다. 위의 Git 부분을 한번 더 살펴보세요. 
- 과거에 이미 PythonAnywhere에 가입된 상태였는데 collectstatic 에러가 발생한다면, 해당 계정의 SQLite 버전(eg 3.8.2)이 오래되어서 그럴수도 있습니다. 이럴때는 새로운 계정을 생성하고 위에 나와있는 PythonAnywhere 부분 명령어를 다시 실행해 보세요. 

본인의 사이트에 접속할 때 오류가 보이면, 제일 먼저 **error log(오류 로그)**에서 디버깅 정보를 찾아보세요. PythonAnywhere [Web tab](https://www.pythonanywhere.com/web_app_setup/)에서 이 사이트로 가는 링크를 찾을 수 있습니다. 혹시 거기에 오류 메세지가 있는지 확인하세요. 가장 최근의 오류 메세지는 맨 하단에 있습니다. 

[PythonAnywhere help site에서 일반적인 디버깅 팁](http://help.pythonanywhere.com/pages/DebuggingImportError)을 확인할 수 있어요.

그리고 기억하세요, 코치들이 여러분을 도와주려고 기다리고 있습니다. 

# 사이트 확인하기!

여러분 사이트의 기본 페이지(default page)가 로컬과 같이 "It worked!"라는 메시지를 보여줘야 합니다. URL 뒤에 `/admin/`를 붙여서 다시 접속해 보세요. 이제 관리자 사이트를 볼 수 있어요. username과 비밀번호를 쳐서 로그인하면, 서버에 새로운 게시물들을 추가할 수 있습니다. - 기억하세요, 로컬에 있는 테스트 데이터베이스의 게시물들은 배포된 블로그로 옮겨지지 않습니다. 

게시물 몇개를 생성했다면, 로컬의 설정으로 들어가세요. (PythonAnywhre에 있는거 말고요) 이제부터 로컬의 설정에 변경사항 몇개를 생성하겠습니다. 그리고 이것은 웹개발에서 흔한 작업 흐름입니다 - 로컬에서 변경사항을 만들고, Github에 푸시하고, 공개된 웹서버에 변경사항을 내려받으세요. 이렇게 하면 이미 공개된 사이트를 부수지 않고 여러가지 작업을 하고, 실험할 수 있습니다. 좀 멋지죠 ㅎㅎ?

이제까지 고생한 자기 자신을 *격려*해주세요! 서버 배포는 웹 개발 단계 중 가장 까다로운 부분 중 하나이고, 어떨때는 제대로 돌아갈때까지 몇 일이 걸리기도 합니다. 하지만 당신은 진짜로 인터넷에 사이트 배포를 마쳤습니다!