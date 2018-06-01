> **Note** 이 장의 일부는 Geek Girls Carrots (http://django.carrots.pl/)의 튜토리얼을 기초로 작성되었습니다.

> **Note** 이 장의 일부는 Creative Commons Attribution-ShareAlike 4.0 International License에 준수하여 [django-marcador 튜토리얼](https://github.com/ggcarrots/django-carrots)를 기초로 작성되었습니다. django-marcador 튜토리얼 저작권은 Markus Zapke-Gründemann et al이 소유하고 있습니다.

## 가상환경(Virtual environment)

장고 설치 전, 개발 환경을 깔끔하게 관리하는 데 큰 도움이 되는 도구를 설치해보겠습니다. 이 단계를 건너뛸 수 있지만, 한번 직접 해보는 것을 추천합니다. 제대로 설치해야 나중에 문제가 발생하지 않거든요!

자, 이제부터 **가상환경(Virtual environment)**(*줄여서 virtualenv*라고 해요)을 만들어보겠습니다. Virtualenv는 프로젝트 기초 전부를 Python/Django와 분리해줍니다. 다시 말해 웹사이트가 변경되어도 개발 중인 것에 영향을 미치지 않는다는 것입니다. 어때요, 깔끔하죠?

`virtualenv`를 만드는 데 필요한 것은 생성할 곳을 정하는 것뿐입니다. 예를 들면, home 디렉토리와 같은 곳이면 적당합니다. 윈도우 환경에서는 `C:\Users\Name`일 거에요. (`Name`이라는 것은 윈도우에 로그인할 때 사용한 아이디를 말합니다)

> **Note** 윈도우에서 디렉토리 파일명에 악센트 또는 특수 문자가 포함되지 않도록 주의하세요. 사용자 이름에 악센트 부호가있는 문자가 들어 있으면 다른 디렉토리를 사용하세요. (예: `C:\djangogirls`)

이 튜토리얼에서는 home 디렉토리 아래 `djangogirls`라는 디렉토리를 새로 만들어 사용하도록 할게요.

{% filename %}command-line{% endfilename %}
```
$ mkdir djangogirls
$ cd djangogirls
```

이제 `myenv` 라는 이름의 가상환경을 만들어 볼게요. 아래와 같은 형식의 명령을 실행하세요.

{% filename %}command-line{% endfilename %}
```
$ python3 -m venv myvenv
```

<!--sec data-title="Windows" data-id="virtualenv_installation_windows" data-collapse=true ces-->

`virtualenv`를 생성하려면 콘솔 창을 열고, (이전 장에서 얘기했는데, 기억나죠?) 그리고 `C:\Python35\python -m venv myvenv`를 실행하세요. 아마도 화면에 이렇게 보일 거에요. :

{% filename %}command-line{% endfilename %}
```
C:\Users\Name\djangogirls> C:\Python35\python -m venv myvenv
```
여기서 `C:\Python35\python`은 이전에 파이썬을 설치 한 디렉토리이고 `myvenv`는`virtualenv`의 이름입니다. 다른 이름을 사용해도 되지만 알파벳 소문자를 사용하고 공백, 악센트 또는 특수 문자는 사용하지 마세요. 가상환경 이름을 짧게 쓰는 것도 좋은 생각입니다. 자주 입력해야 하니까요.

<!--endsec-->

<!--sec data-title="Linux / OS X" data-id="virtualenv_installation_linuxosx" data-collapse=true ces-->

리눅스와 맥에서 `virtualenv`를 생성하려면 간단하게 `python3 -m venv myvenv`를 입력하면 됩니다. 화면에 이렇게 나타날 거에요. :

{% filename %}command-line{% endfilename %}
```
$ python3 -m venv myvenv
```

여기서 `myvenv` 는 `가상환경`의 이름이에요. 이름은 마음대로 정할 수 있지만, 소문자여야 하고 공백은 없어야 해요. 이름은 짧게 만드는 게 좋아요. 자주 입력해야 하니까요.

> **Note** Debian/Ubuntu에서 아래와 같은 오류가 발생할 수 있습니다. :

{% filename %}command-line{% endfilename %}
```
The virtual environment was not created successfully because ensurepip is not available.  On Debian/Ubuntu systems, you need to install the python3-venv package using the following command.
    apt install python3-venv
You may need to use sudo with that command.  After installing the python3-venv package, recreate your virtual environment.
```

이 경우, 위의 지시에 따라 `python3-venv` 패키지를 설치하세요. :
{% filename %}command-line{% endfilename %}
```
$ sudo apt install python3-venv
```

> **Note** Debian/Ubuntu의 일부 버전에서 이와 같이 가상 환경을 초기화하면 현재 다음과 같은 오류가 발생합니다. :
{% filename %}command-line{% endfilename %}
```
Error: Command '['/home/eddie/Slask/tmp/venv/bin/python3', '-Im', 'ensurepip', '--upgrade', '--default-pip']' returned non-zero exit status 1
```

이 문제를 해결하려면 `virtualenv` 명령를 사용하세요. :

{% filename %}command-line{% endfilename %}
```
$ sudo apt install python-virtualenv
$ virtualenv --python=python3.6 myvenv
```

> **Note** 아래와 같은 오류가 발생한다면

{% filename %}command-line{% endfilename %}
```
E: Unable to locate package python3-venv
```

이 명령어를 실행하세요. :

{% filename %}command-line{% endfilename %}
```
sudo apt install python3.6-venv
```

<!--endsec-->

## 가상환경 사용하기

앞의 명령을 사용하면 `myvenv`라는 디렉토리가 만들어져요. (이름을 변경하면 그 이름의 디레토리가 만들어집니다) 그리고 그 디렉토리에 우리가 사용할 가상환경이 들어있어요. (디렉토리와 파일들이 있어요)

<!--sec data-title="Windows" data-id="virtualenv_windows" data-collapse=true ces-->

아래 명령어를 입력해 가상환경을 실행하세요. :

{% filename %}command-line{% endfilename %}
```
C:\Users\Name\djangogirls> myvenv\Scripts\activate
```

> **Note** Windows 10 사용할 경우, Windows PowerShell에서 '이 스크립트는 이 시스템에서 실행되지 않습니다.'라는 오류 메시지가 표시 될 수 있습니다. 이 경우 "관리자 권한으로 실행"옵션을 사용하여 다른 Windows PowerShell을 엽니다. 그런 다음 가상 환경을 시작하기 전에 다음 명령을 입력하세요.

{% filename %}command-line{% endfilename %}
```
C:\WINDOWS\system32> Set-ExecutionPolicy -ExecutionPolicy RemoteSigned
     Execution Policy Change
     The execution policy helps protect you from scripts that you do not trust. Changing the execution policy might expose you to the security risks described in the about_Execution_Policies help topic at http://go.microsoft.com/fwlink/?LinkID=135170. Do you want to change the execution policy? [Y] Yes  [A] Yes to All  [N] No  [L] No to All  [S] Suspend  [?] Help (default is "N"): A
```

<!--endsec-->

<!--sec data-title="Linux / OS X" data-id="virtualenv_linuxosx"
data-collapse=true ces-->

아래 명령어를 입력해 가상환경을 실행하세요. :

{% filename %}command-line{% endfilename %}
```
$ source myvenv/bin/activate
```

`myvenv`를 여러분이 선택한 `virtualenv` 이름으로 바꾸는 것을 잊지 마세요!

> **Note** 가끔씩 `source`가 사용할 수 없을 수도 있습니다. 이 경우에는 아래와 같이 입력하세요. :

{% filename %}command-line{% endfilename %}
```
$ . myvenv/bin/activate
```

<!--endsec-->

콘솔의 프롬프트 앞에`(myvenv)`접두어가 붙어있다면 `virtualenv`가 시작되었음을 알 수 있어요.

가상환경에서 작업 할 때,`python`은 자동으로 올바른 버전을 참조하므로 `python3` 대신`python`를 사용할 수 있습니다.

의존성 설치를 모두 마쳤으니, 지금부터 장고를 설치할 수 있습니다!

## 장고 설치하기

`virtualenv`를 실행하기 전, 장고를 설치합시다.

그전에 장고를 설치하는 데 필요한 `pip`이 최신 버전인지 확인합니다. :

{% filename %}command-line{% endfilename %}
```
(myvenv) ~$ python3 -m pip install --upgrade pip
```
그런 다음 `pip install django~=1.11.0`(Django를 설치하려면 물결표 뒤에 등호 :`~=`)를 입력해 장고를 설치하세요.

{% filename %}command-line{% endfilename %}
```
(myvenv) ~$ pip install django~=1.11.0
Collecting django~=1.11.0
  Downloading Django-1.11.3-py2.py3-none-any.whl (6.8MB)
Installing collected packages: django
Successfully installed django-1.11.3
```

<!--sec data-title="Windows" data-id="django_err_windows" data-collapse=true ces-->

> **Note** Windows에서 pip를 사용할 때 오류가 발생하면, 프로젝트 경로 이름(예: `C:\Users\User Name\djangogirls`)에 공백, 액센트 또는 특수 문자가 포함되어 있는지 확인하세요. 그렇다면 공백, 악센트 또는 특수 문자가 없는 다른 경로를 사용하세요. (제안: `C:\djangogirls`). 새 디렉토리에 새 virtualenv를 만든 다음, 이전 가상 디렉토리를 삭제하고 위의 명령을 다시 시도하세요. virtualenv는 절대 경로를 사용하기 때문에 virtualenv 폴더를 이동해도 작동하지 않습니다. 

<!--endsec-->

<!--sec data-title="Windows 8 / Windows 10" data-id="django_err_windows8and10" data-collapse=true ces-->

> Windows에서 pip를 사용할 때 오류가 발생하면, 프로젝트 경로 이름(예: `C:\Users\User Name\djangogirls`)에 공백, 액센트 또는 특수 문자가 포함되어 있는지 확인하세요. 그렇다면 공백, 악센트 또는 특수 문자가 없는 다른 경로를 사용하세요. (제안: `C:\djangogirls`). 새 디렉토리에 새 virtualenv를 만든 다음, 이전 가상 디렉토리를 삭제하고 위의 명령을 다시 시도하세요. virtualenv는 절대 경로를 사용하기 때문에 virtualenv 폴더를 이동해도 작동하지 않습니다. 

<!--endsec-->

<!--sec data-title="Linux" data-id="django_err_linux" data-collapse=true ces-->

> Ubuntu 12.04에서 pip를 사용하다 오류가 발생해 virtualenv에 pip를 재설치하려면 `python -m pip install -U --force-reinstall pip`를 실행하세요.
<!--endsec-->

여기까지 입니다! 이제 정말 장고 애플리케이션을 생성해봅시다!
