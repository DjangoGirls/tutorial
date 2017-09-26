> Part of this section is based on tutorials by Geek Girls Carrots (https://github.com/ggcarrots/django-carrots).
> 
> Part of this section is based on the [django-marcador tutorial](http://django-marcador.keimlink.de/) licensed under the Creative Commons Attribution-ShareAlike 4.0 International License. Django-marcador 튜토리얼은 Markus Zapke-Gründemann et al에게 저작권이 있습니다.

## 가상 환경

장고를 설치하기 전에, 개발 환경을 깔끔하게 관리하는데 아주 큰 도움이 되는 도구를 설치해보겠습니다. 이 단계를 건너뛸 수 있지만, 한번 직접 해보는 것을 추천합니다. 제대로 설치해야 나중에 문제가 발생하지 않거든요!

자, 이제부터 **가상 환경**(*virtualenv*라고 불러요)을 만들어보겠습니다. Virtualenv는 프로젝트 기초 전부를 Python/Django와 분리시켜줍니다. 다시 말해 웹사이트가 변경되어도 개발 중인 것에 영향을 미치지 않다는 것입니다. 어때요, 깔끔하죠?

`virtualenv`를 만드는 데 필요한 것은 생성할 곳을 정하는 것 뿐입니다. 예를 들면, home 디렉토리와 같은 곳이면 적당합니다. 윈도우 환경에서는 `C:\Users\Name` 일 거에요. (`Name` 이라는 것은 윈도우에 로그인할 때 사용한 아이디를 말합니다.)

> **NOTE:** On Windows, make sure that this directory does not contain accented or special characters; if your username contains accented characters, use a different directory, for example `C:\djangogirls`.

이 튜토리얼에서는 home 디렉토리 아래 `djangogirls`라는 디렉토리를 새로 만들어 사용하도록 할게요.

{% filename %}command-line{% endfilename %}

    $ mkdir djangogirls
    $ cd djangogirls
    

이제 `myenv` 라는 이름의 가상 환경을 만들어볼게요. 아래와 같은 형식의 명령을 실행하세요.

{% filename %}command-line{% endfilename %}

    $ python3 -m venv myvenv
    

<!--sec data-title="Windows" data-id="virtualenv_installation_windows"
data-collapse=true ces-->

To create a new `virtualenv`, you need to open the command prompt and run `python -m venv myvenv`. It will look like this:

{% filename %}command-line{% endfilename %}

    C:\Users\Name\djangogirls> python -m venv myvenv
    

Where `myvenv` is the name of your `virtualenv`. 이름은 마음대로 정할 수 있지만, 소문자여야하고 공백은 없어야하고 특수문자도 사용하면 안되요. It is also good idea to keep the name short – you'll be referencing it a lot!

<!--endsec-->

<!--sec data-title="Linux and OS X" data-id="virtualenv_installation_linuxosx"
data-collapse=true ces-->

리눅스와 맥에서 `virtualenv`를 생성하려면 간단하게 `python3 -m venv myvenv`를 실행하면 됩니다. 화면에 이렇게 나타날 거에요:

{% filename %}command-line{% endfilename %}

    $ python3 -m venv myvenv
    

여기서 `myvenv` 는 `가상 환경`의 이름이예요. 이름은 마음대로 정할 수 있지만, 소문자여야하고 공백은 없어야해요. 이름은 짧게 만드는게 좋아요. 자주 입력해야하니까요.

> **NOTE:** On some versions of Debian/Ubuntu you may receive the following error:
> 
> {% filename %}command-line{% endfilename %}
> 
>     The virtual environment was not created successfully because ensurepip is not available.  On Debian/Ubuntu systems, you need to install the python3-venv package using the following command.
>        apt-get install python3-venv
>     You may need to use sudo with that command.  After installing the python3-venv package, recreate your virtual environment.
>     
> 
> In this case, follow the instructions above and install the `python3-venv` package: {% filename %}command-line{% endfilename %}
> 
>     $ sudo apt-get install python3-venv
>     
> 
> **NOTE:** On some versions of Debian/Ubuntu initiating the virtual environment like this currently gives the following error:
> 
> {% filename %}command-line{% endfilename %}
> 
>     Error: Command '['/home/eddie/Slask/tmp/venv/bin/python3', '-Im', 'ensurepip', '--upgrade', '--default-pip']' returned non-zero exit status 1
>     
> 
> 이 문제를 해결하려면 `virtualenv` 명령을 사용해야해요.
> 
> {% filename %}command-line{% endfilename %}
> 
>     $ sudo apt-get install python-virtualenv
>     $ virtualenv --python=python3.6 myvenv
>     
> 
> **NOTE:** If you get an error like
> 
> {% filename %}command-line{% endfilename %}
> 
>     E: Unable to locate package python3-venv
>     
> 
> then instead run:
> 
> {% filename %}command-line{% endfilename %}
> 
>     sudo apt install python3.6-venv
>     

<!--endsec-->

## 가상환경 사용하기

앞의 명령을 사용하면 `myvenv`라는 디렉토리가 만들어져요. (이름을 다르게 했다면 그 이름의 디레토리가 만들어져요) 그리고 그 디렉토리에 우리가 사용할 가상 환경이 들어있어요 (디렉토리들이랑 파일들이 있어요).

<!--sec data-title="Windows" data-id="virtualenv_windows"
data-collapse=true ces-->

다음과 같이 가상환경을 실행하세요.

{% filename %}command-line{% endfilename %}

    C:\Users\Name\djangogirls> myvenv\Scripts\activate
    

> **NOTE:** on Windows 10 you might get an error in the Windows PowerShell that says `execution of scripts is disabled on this system`. In this case, open another Windows PowerShell with the "Run as Administrator" option. Then try typing the following command before starting your virtual environment:
> 
> {% filename %}command-line{% endfilename %}
> 
>     C:\WINDOWS\system32> Set-ExecutionPolicy -ExecutionPolicy RemoteSigned
>         Execution Policy Change
>         The execution policy helps protect you from scripts that you do not trust. Changing the execution policy might expose you to the security risks described in the about_Execution_Policies help topic at http://go.microsoft.com/fwlink/?LinkID=135170. Do you want to change the execution policy? [Y] Yes  [A] Yes to All  [N] No  [L] No to All  [S] Suspend  [?] Help (default is "N"): A
>     

<!--endsec-->

<!--sec data-title="Linux and OS X" data-id="virtualenv_linuxosx"
data-collapse=true ces-->

다음과 같이 가상환경을 실행하세요.

{% filename %}command-line{% endfilename %}

    $ source myvenv/bin/activate
    

실행할 때 `myvenv` 부분에 자신이 선택한 `가상 환경`의 이름을 적어야 해요!

> **주의:** 간혹 `source` 명령이 동작하지 않을 수도 있어요. 그럴 때는 이렇게 하세요.
> 
> {% filename %}command-line{% endfilename %}
> 
>     $ . myvenv/bin/activate
>     

<!--endsec-->

You will know that you have `virtualenv` started when you see that the prompt in your console is prefixed with `(myvenv)`.

When working within a virtual environment, `python` will automatically refer to the correct version so you can use `python` instead of `python3`.

자, 이제 필요한 것들이 준비되었어요. 드디어 장고를 설치할 수 있어요!

## 장고 설치하기

Now that you have your `virtualenv` started, you can install Django.

Before we do that, we should make sure we have the latest version of `pip`, the software that we use to install Django:

{% filename %}command-line{% endfilename %}

    (myvenv) ~$ pip install --upgrade pip
    

Then run `pip install django~=1.11.0` (note that we use a tilde followed by an equal sign: `~=`) to install Django.

{% filename %}command-line{% endfilename %}

    (myvenv) ~$ pip install django~=1.11.0
    Collecting django~=1.11.0
      Downloading Django-1.11.3-py2.py3-none-any.whl (6.8MB)
    Installing collected packages: django
    Successfully installed django-1.11.3
    

<!--sec data-title="Windows" data-id="django_err_windows"
data-collapse=true ces-->

> If you get an error when calling pip on Windows platform, please check if your project pathname contains spaces, accents or special characters (for example, `C:\Users\User Name\djangogirls`). If it does, please consider using another place without spaces, accents or special characters (suggestion: `C:\djangogirls`). Create a new virtualenv in the new directory, then delete the old one and try the above command again. (Moving the virtualenv directory won't work since virtualenv uses absolute paths.)

<!--endsec-->

<!--sec data-title="Windows 8 and Windows 10" data-id="django_err_windows8and10"
data-collapse=true ces-->

> Your command line might freeze after when you try to install Django. If this happens, instead of the above command use:
> 
> {% filename %}command-line{% endfilename %}
> 
>     C:\Users\Name\djangogirls> python -m pip install django~=1.11.0
>     

<!--endsec-->

<!--sec data-title="Linux" data-id="django_err_linux"
data-collapse=true ces-->

> 우분투 12.04에서 오류가 발생했다면 `python -m pip install -U --force-reinstall pip` 명령으로 가상환경 내의 pip를 고쳐주세요.

<!--endsec-->

잘했어요! (드디어) 장고 어플리케이션을 만들 준비가 끝났습니다!