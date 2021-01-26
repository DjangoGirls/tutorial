> 이번 장의 일부는 Geek Girls Carrots (https://github.com/ggcarrots/django-carrots)의 튜토리얼을 바탕으로 작성되었습니다.
> 
> Creative Commons Attribution-ShareAlike 4.0 International License 에 따라 [django-marcador 튜토리얼](http://django-marcador.keimlink.de/)를 바탕으로 작성되었습니다. Django-marcador 튜토리얼은 Markus Zapke-Gründemann et al에게 저작권이 있습니다.

## 가상 환경

장고를 설치하기 전에, 개발 환경을 깔끔하게 관리하는데 아주 큰 도움이 되는 도구를 설치해보겠습니다. 이 단계를 건너뛸 수 있지만, 한번 직접 해보는 것을 추천합니다. 제대로 설치해야 나중에 문제가 발생하지 않거든요!

자, 이제부터 **가상 환경**(*virtualenv*라고 불러요)을 만들어보겠습니다. Virtualenv는 프로젝트 기초 전부를 Python/Django와 분리시켜줍니다. 다시 말해 웹사이트가 변경되어도 개발 중인 것에 영향을 미치지 않다는 것입니다. 어때요, 깔끔하죠?

`virtualenv`를 만드는 데 필요한 것은 생성할 곳을 정하는 것 뿐입니다. 예를 들면, home 디렉토리와 같은 곳이면 적당합니다. 윈도우 환경에서는 `C:\Users\Name` 일 거에요. (`Name` 이라는 것은 윈도우에 로그인할 때 사용한 아이디를 말합니다.)

> **주의:** 윈도우에서는 디렉토리에 악센트기호나 특수문자가 포함되어서는 안되요; 만약 사용자명에 악센트 기호가 예를 들어`C:\djangogirls`와 같은 다른 디렉토리를 사용하세요.

이 튜토리얼에서는 home 디렉토리 아래 `djangogirls`라는 디렉토리를 새로 만들어 사용하도록 할게요.

{% filename %}명령줄{% endfilename %}

    $ mkdir djangogirls
    $ cd djangogirls
    

이제 `myenv` 라는 이름의 가상 환경을 만들어볼게요. 아래와 같은 형식의 명령을 실행하세요.

{% filename %}명령줄{% endfilename %}

    $ python3 -m venv myvenv
    

<!--sec data-title="Virtual environment: Windows" data-id="virtualenv_installation_windows"
data-collapse=true ces-->

새 `virtualenv` 만들기 위해, 명령줄에 `python -m venv myvenv` 을 입력해서 실행해요. 화면에 이렇게 나타날 거에요:

{% filename %}명령줄{% endfilename %}

    C:\Users\Name\djangogirls> python -m venv myvenv
    

여기서 `myvenv` 는 `가상 환경`의 이름이예요. 이름은 마음대로 정할 수 있지만, 소문자여야하고 공백은 없어야하고 특수문자도 사용하면 안되요. 이름은 짧게 만드는게 좋아요. 자주 입력해야하니까요.

<!--endsec-->

<!--sec data-title="Virtual environment: Linux and OS X" data-id="virtualenv_installation_linuxosx"
data-collapse=true ces-->

리눅스와 맥에서 `virtualenv`를 생성하려면 간단하게 `python3 -m venv myvenv`를 실행하면 됩니다. 화면에 이렇게 나타날 거에요:

{% filename %}명령줄{% endfilename %}

    $ python3 -m venv myvenv
    

여기서 `myvenv` 는 `가상 환경`의 이름이예요. 이름은 마음대로 정할 수 있지만, 소문자여야하고 공백은 없어야해요. 이름은 짧게 만드는게 좋아요. 자주 입력해야하니까요.

> **참고:** 데비안/우분투 일부 버전에서 아래 오류가 나타날 수 있습니다:
> 
> {% filename %}명령줄{% endfilename %}
> 
>     The virtual environment was not created successfully because ensurepip is not available.  데비안/우분투 시스템에는, 다음 명령을 사용 하여 python3 venv 패키지를 설치 해야 합니다.
>        apt install python3-venv
>     You may need to use sudo with that command.  After installing the python3-venv package, recreate your virtual environment.
>     
> 
> 이 경우에는, 위에 `python3-venv` 패키지 설치 안내를 참고해요: {% filename %}명령줄{% endfilename %}
> 
>     $ sudo apt install python3-venv
>     
> 
> **주의:** 일부 데비안/우분투 버전의 경우 가상환경을 초기화할때 아래와 같은 에러가 발생할 수 있어요:
> 
> {% filename %}명령줄{% endfilename %}
> 
>     Error: Command '['/home/eddie/Slask/tmp/venv/bin/python3', '-Im', 'ensurepip', '--upgrade', '--default-pip']' returned non-zero exit status 1
>     
> 
> 이 문제를 해결하려면 `virtualenv` 명령을 사용해야해요.
> 
> {% filename %}명령줄{% endfilename %}
> 
>     $ sudo apt install python-virtualenv
>     $ virtualenv --python=python{{ book.py_version }} myvenv
>     
> 
> **주의:** 만약 아래와 같은 에러가 발생할 경우
> 
> {% filename %}명령줄{% endfilename %}
> 
>     E: Unable to locate package python3-venv
>     
> 
> 대신 아래와 같이 실행해요:
> 
> {% filename %}명령줄{% endfilename %}
> 
>     sudo apt install python{{ book.py_version }}-venv
>     

<!--endsec-->

## 가상환경 사용하기

앞의 명령을 사용하면 `myvenv`라는 디렉토리가 만들어져요. (이름을 다르게 했다면 그 이름의 디레토리가 만들어져요) 그리고 그 디렉토리에 우리가 사용할 가상 환경이 들어있어요 (디렉토리들이랑 파일들이 있어요).

<!--sec data-title="Working with virtualenv: Windows" data-id="virtualenv_windows"
data-collapse=true ces-->

다음과 같이 가상환경을 실행하세요.

{% filename %}명령줄{% endfilename %}

    C:\Users\Name\djangogirls> myvenv\Scripts\activate
    

> **주의:** 윈도우 10의 파워셸에서는 `execution of scripts is disabled on this system`와 같은 에러가 발생할 수 있어요. 이 경우 "관리자 권한으로 실행" 옵션을 사용해 새 윈도우 파워셸을 열어요. 가상환경을 시작하기 전에 그리고 아래 명령을 입력해요.
> 
> {% filename %}명령줄{% endfilename %}
> 
>     C:\WINDOWS\system32> Set-ExecutionPolicy -ExecutionPolicy RemoteSigned
>         Execution Policy Change
>         The execution policy helps protect you from scripts that you do not trust. Changing the execution policy might expose you to the security risks described in the about_Execution_Policies help topic at http://go.microsoft.com/fwlink/?LinkID=135170. Do you want to change the execution policy? [Y] Yes  [A] Yes to All  [N] No  [L] No to All  [S] Suspend  [?] Help (default is "N"): A
>     

<!-- (This comment separates the two blockquote blocks, so that GitBook and Crowdin don't merge them into a single block.) -->

> **NOTE:** For users of the popular editor VS Code, which come with an integrated terminal based off windows PowerShell, if you wish to stick with the integrated terminal, you may run the following command to activate your virtual environment:
> 
>     $ . myvenv\Scripts\activate.ps1
>     
> 
> 이것은 편집기창과 명령창을 전환하지 않아도 된다는 장점이 있어요.

<!--endsec-->

<!--sec data-title="Working with virtualenv: Linux and OS X" data-id="virtualenv_linuxosx"
data-collapse=true ces-->

가상환경을 실행해서 시작:

{% filename %}명령줄{% endfilename %}

    $ source myvenv/bin/activate
    

실행할 때 `myvenv` 부분에 자신이 선택한 `가상 환경`의 이름을 적어야해요!

> **주의:** 간혹 `source` 명령이 동작하지 않을 수도 있어요. 그럴 때는 이렇게 하세요.
> 
> {% filename %}명령줄{% endfilename %}
> 
>     $ . myvenv/bin/activate
>     

<!--endsec-->

콘솔에서 `(myvenv)`가 보이면 `virtualenv(가상환경)`이 실행되고 있다는 거에요.

가상 환경을 시작하고 나면 `python`이라고만 해도 지정한 버전의 파이썬이 실행되기 때문에 `python3` 대신 `python`이라고 입력해도 된답니다.

자, 이제 필요한 것들이 준비되었어요. 드디어 장고를 설치할 수 있어요!

## Django 설치하기 {#django}

`virtualenv`가 시작됐으니, `pip`으로 장고를 설치할 수 있어요.

하기전에 먼저, 장고를 설치하기 위한 스프트웨어인 `pip`가 최신버전인지 확인해요.

{% filename %}명령줄{% endfilename %}

    (myvenv) ~$ python -m pip install --upgrade pip
    

### 패키지와 requirement 설치

requirements는 `pip install`로 설치가 필요한 것들의 목록을 유지합니다.

먼저 이전에 설치한 코드편집기를 사용해 `djangogirls/` 폴더안에 `requirements.txt`파일을 생성해요. 코드 편집기에서 새 파일을 연 다음 `requirements.txt`을 `djangogirls/` 폴더에 저장해요. 디렉토리는 다음과 같을거에요:

    djangogirls
    ├── myvenv
    │   └── ...
    └───requirements.txt
    

`staticcss/requirements.txt`파일에 아래의 코드를 추가하세요:

{% filename %}djangogirls/requirements.txt{% endfilename %}

    Django~={{ book.django_version }}
    

이제 `pip install -r requirements.txt` 을 실행해 장고를 설치해요.

{% filename %}명령줄{% endfilename %}

    (myvenv) ~$ pip install -r requirements.txt
    Collecting Django~={{ book.django_version }} (from -r requirements.txt (line 1))
      Downloading Django-{{ book.django_version }}-py3-none-any.whl (7.1MB)
    Installing collected packages: Django
    Successfully installed Django-{{ book.django_version }}
    

<!--sec data-title="Installing Django: Windows" data-id="django_err_windows"
data-collapse=true ces-->

> 만약 윈도우에서 pip를 실행했는데 오류가 발생했다면 경로에 공백이나 특수문자가 없는지 (예를 들어 `C:\Users\User Name\djangogirls` 처럼요) 확인하세요. 만약 그렇다면 (`C:\djangogirls`처럼) 공백이나 특수문자가 없는 곳으로 옮겨보세요. 디렉토리에 새로운 가상환경을 만들고, 이전 가상환경을 삭제한 후 명령을 다시 시도해보세요. (가상환경은 절대 경로를 사용하기 때몬에 경로를 변경하면 작동하지 않습니다)

<!--endsec-->

<!--sec data-title="Installing Django: Windows 8 and Windows 10" data-id="django_err_windows8and10"
data-collapse=true ces-->

> 장고 설치 시, 커맨드 라인이 멈출 수 있습니다. 이 경우, 아래 명령어를 사용하세요:
> 
> {% filename %}명령줄{% endfilename %}
> 
>     C:\Users\Name\djangogirls> python -m pip install -r requirements.txt
>     

<!--endsec-->

<!--sec data-title="Installing Django: Linux" data-id="django_err_linux"
data-collapse=true ces-->

> 우분투 12.04에서 오류가 발생했다면 `python -m pip install -U --force-reinstall pip` 명령으로 가상환경 내의 pip를 고쳐주세요.

<!--endsec-->

잘했어요! 드디어 장고 어플리케이션을 만들 준비가 끝났습니다!