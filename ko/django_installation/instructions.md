> 이 장의 일부는 Geek Girls Carrots (https://github.com/ggcarrots/django-carrots)의 튜토리얼을 기반으로 작성되었습니다.
>
> Creative Commons Attribution-ShareAlike 4.0 International License 에 따라 [django-marcador 튜토리얼](http://django-marcador.keimlink.de/)를 바탕으로 작성되었습니다. django-marcador 튜토리얼은 Markus Zapke-Gründemann et al에게 저작권이 있습니다.

## 가상 환경

장고를 설치하기 전에, 개발 환경을 깔끔하게 관리하는데 큰 도움이 되는 도구를 설치해보겠습니다. 이 단계를 건너뛸 수 있지만, 한번 직접 해보는 것을 추천합니다. 제대로 설치해야 나중에 문제가 발생하지 않거든요!

자, 이제부터 **가상 환경**(*virtualenv*라고 불러요)을 만들어보겠습니다. Virtualenv는 프로젝트 기초 전부를 Python/Django와 분리시켜줍니다. 다시 말해 웹사이트가 변경되어도 개발 중인 것에 영향을 미치지 않다는 것입니다. 어때요, 깔끔하죠?

`virtualenv`를 만드는 데 필요한 것은 생성할 곳을 정하는 것 뿐입니다. 예를 들면, home 디렉토리와 같은 곳이면 적당합니다. 윈도우 환경에서는 `C:\Users\Name` 일 거에요. (`Name` 이라는 것은 윈도우에 로그인할 때 사용한 아이디를 말합니다.)

이 튜토리얼에서는 home 디렉토리 아래 `djangogirls`라는 디렉토리를 새로 만들어 사용하도록 할게요.

    mkdir djangogirls
    cd djangogirls


이제 `myenv` 라는 이름의 가상 환경을 만들어 볼게요. 아래와 같은 형식의 명령을 실행하세요.

    python3 -m venv myvenv


### 윈도우

`virtualenv`를 생성하려면 console창을 열고, (앞쪽 챕터에서 얘기했는데, 기억나죠?) 그리고 `C:\Python34\python -m venv myvenv`를 실행해야해요. 아마도 화면에는 이런 것들이 보이겠죠?

    C:\Users\Name\djangogirls> C:\Python34\python -m venv myvenv



여기서 `C:\Python34\python` 은 파이썬이 설치된 디렉토리이고, `myvenv` 는 설치할 `가상 환경`의 이름이예요. 이름은 마음대로 정할 수 있지만, 소문자여야하고 공백은 없어야하고 특수문자도 사용하면 안돼요. 이름은 짧게 만드는 것이 좋아요. 자주 입력해야하니까요.

### 리눅스와 맥OS

리눅스와 맥에서 `virtualenv`를 생성하려면 간단하게 `python3 -m venv myvenv`를 실행하면 됩니다. 화면에 이렇게 나타날 거에요:

    ~/djangogirls$ python3 -m venv myvenv


여기서 `myvenv` 는 `가상 환경`의 이름이예요. 이름은 마음대로 정할 수 있지만, 소문자여야하고 공백은 없어야해요. 이름은 짧게 만드는게 좋아요. 자주 입력해야하니까요.

> **주의:** 우분투 14.04 에서는 이런 오류가 뜰 수 있어요.
>
>     Error: Command '['/home/eddie/Slask/tmp/venv/bin/python3', '-Im', 'ensurepip', '--upgrade', '--default-pip']' returned non-zero exit status 1
>     
>
> 이 문제를 해결하려면 `virtualenv` 명령을 사용해야해요.
>
>     ~/djangogirls$ sudo apt-get install python-virtualenv
>     ~/djangogirls$ virtualenv --python=python3.4 myvenv
>     

## 가상환경 사용하기

앞의 명령을 사용하면 `myvenv`라는 디렉토리가 만들어져요. (이름을 다르게 했다면 그 이름의 디레토리가 만들어집니다.) 그리고 그 디렉토리에 우리가 사용할 가상 환경이 들어있어요. (디렉토리와 파일들이 있어요.)

#### 윈도우

다음과 같이 가상환경을 실행하세요.

    C:\Users\Name\djangogirls> myvenv\Scripts\activate


#### 리눅스와 맥OS

다음과 같이 가상환경을 실행하세요.

    ~/djangogirls$ source myvenv/bin/activate


실행할 때 `myvenv` 부분에 자신이 선택한 `가상 환경`의 이름을 적어야 해요!

> **주의:** 간혹 `source` 명령이 동작하지 않을 수도 있어요. 그럴 때는 이렇게 하세요.
>
>     ~/djangogirls$ . myvenv/bin/activate
>     

`가상환경`이 실행되었는지는 콘솔의 프롬프트를 보면 알 수 있어요.

    (myvenv) C:\Users\Name\djangogirls>


또는

    (myvenv) ~/djangogirls$


앞쪽에 `(myvenv)`가 보이지요?

가상 환경을 시작하고 나면 `python`이라고만 해도 지정한 버전의 파이썬이 실행되기 때문에 `python3` 대신 `python`이라고 입력해도 된답니다.

자, 이제 필요한 것들이 준비되었어요. 드디어 장고를 설치할 수 있어요!

## 장고 설치하기

이제 `virtualenv` 가 시작되었으니, `pip`를 이용해 장고를 설치할 수 있어요. 콘솔에서 `pip install django==1.8`를 실행해보세요. (조심하세요. 이퀄기호가 두 개예요: `==`).

    (myvenv) ~$ pip install django==1.8
    Downloading/unpacking django==1.8
    Installing collected packages: django
    Successfully installed django
    Cleaning up...


윈도우에서는

> 만약 윈도우에서 pip를 실행했는데 오류가 발생했다면 경로에 공백이나 특수문자가 없는지 (`C:\Users\User Name\djangogirls` 처럼요) 확인하세요. 만약 그렇다면 (`C:\djangogirls` 처럼) 공백이나 특수문자가 없는 곳으로 옮겨보세요. 옮긴 후에 다시 한 번 시도해보세요.

리눅스에서는

> 우분투 12.04에서 오류가 발생했다면 `python -m pip install -U --force-reinstall pip` 명령으로 가상환경 내의 pip를 고쳐주세요.

잘했어요! 드디어 장고 어플리케이션을 만들 준비가 끝났습니다!
