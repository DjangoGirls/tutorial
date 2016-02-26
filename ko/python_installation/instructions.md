> 위 내용은 Geek Girls Carrots (https://github.com/ggcarrots/django-carrots) 을 바탕으로 작성되었습니다.

장고는 파이썬으로 만들어졌습니다. 장고를 하기 위해서는 파이썬이 있어야 합니다. 우선 설치부터 해볼까요! 우리는 파이썬 3.4를 사용할 거예요. 그보다 낮은 버전이 설치되었다면, 업그레이드가 필요합니다.

### 윈도우

윈도우용 파이썬은 https://www.python.org/downloads/release/python-343/에서 다운 받을 수 있습니다. 사이트에서 ***.msi** 파일을 다운 받고, 실행(더블클릭으로)한 다음, 지시 사항을 따라가세요. 파이썬을 설치한 경로(디렉토리)를 기억해두어야 합니다. 나중에 필요하거든요!

한가지 주의할 것은 설치 마법사의 "Customize"라는 두 번째 화면입니다. 여기서 보이듯이 스크롤을 내려 아래쪽에 있는 "Add python.exe to the Path" 항목을 체크해주세요.

![파이썬을 패쓰(path)에 추가하는 것을 잊지 마세요!][9]

 [9]: ../python_installation/images/add_python_to_windows_path.png

### 리눅스

아마 이미 파이썬이 설치되었을 거에요. 설치되어있는지 (그리고 어떤 버전인지) 확인하려면, 콘솔을 열어 다음 명령을 실행하세요.

    $ python3 --version
    Python 3.4.3


파이썬이 설치되어 있지 않거나 버전이 다르면 이렇게 해보세요. :

#### Debian 또는 Ubuntu

콘솔에서 다음 명령을 실행하세요.

    $ sudo apt-get install python3.4


#### Fedora (21까지)

콘솔에서 다음 명령을 실행하세요.

    $ sudo yum install python3.4


#### Fedora (22부터)

콘솔에서 다음 명령을 실행합니다.

    $ sudo dnf install python3.4


### OS X

https://www.python.org/downloads/release/python-343/ 에서 파이썬 설치프로그램을 다운 받아야 합니다.

  * *Mac OS X 64-bit/32-bit installer* 파일을 다운 받으세요.
  * *python-3.4.3-macosx10.6.pkg* 을 더블 클릭해 설치 프로그램을 시작하세요.

*터미널*을 열고 `python3` 명령을 실행해 잘 설치되었는지 확인하세요.

    $ python3 --version
    Python 3.4.3


* * *

더 알고 싶은 것이 있거나, 설치가 잘 되지 않고 어찌 해야할지 모르겠다면 코치를 불러주세요! 잘 설치 되지 않는 경우도 있을 수 있습니다. 그럴 때는 경험이 있는 분에게 도움을 구해보세요.
