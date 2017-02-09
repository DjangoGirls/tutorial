> 이번 장의 내용은 Geek Girls Carrots (https://github.com/ggcarrots/django-carrots) 을 바탕으로 작성되었습니다.

장고는 파이썬으로 만들어졌습니다. 장고를 하기 위해서는 파이썬이 있어야 합니다. 우선 설치부터 해볼까요! 우리는 파이썬 3.5를 사용할 거예요. 그보다 낮은 버전이 설치되었다면, 업그레이드가 필요합니다.

### 윈도우

먼저 컴퓨터에서 작동하고 있는 윈도우가 32-bit 또는 64-bit 중 어느 것인지 확인해야 합니다. https://support.microsoft.com/en-au/kb/827218 윈도우용 파이썬은 https://www.python.org/downloads/release/python-351/에서 다운 받을 수 있습니다. 만약 윈도우 64-bit을 사용하고 있다면, **Windows x86-64 executable installer**을 다운로드 받으세요. 그렇지 않다면, **Windows x86 executable installer**를 다운로드 받으세요. 사이트에서 설치 파일을 다운 받고, 실행(더블클릭으로)한 다음, 지시사항을 따라가세요.

한 가지 주의할 것은 설치 과정중 Setup 화면에서 "Add Python 3.5 to PATH" 항목을 체크해주세요. 아래에 보이는 것처럼 되어야 합니다.:

![다음 이미지를 참고하세요][image] 

[image]: ../python_installation/images/python-installation-options.png

다음 단계로, Windows Command Line을 사용할 거에요. (이것에 대해서도 설명해드릴거에요.) 시작 버튼 -> Windows 검색 란에 명령 프롬프트라고 입력하세요. 또는 윈도우키 + R키를 입력하여 실행 화면을 띄울 수 있습니다. 실행 화면에서 cmd라고 입력하고 엔터를 누르세요. (최신 버전의 windows에서는 "명령 프롬프트"를 검색해야 할 수도 있습니다.)

![다음 이미지를 참고하세요][image2]

[image2]: ../python_installation/images/windows-plus-r.png

**Note**: 만약 최신 윈도우를 사용하고 있지 않다면 (7, Vista 등) 설치가 실패할 수도 있습니다. 그럴 경우 두 가지 중 하나를 시도해볼 수 있습니다.:

1. 윈도우 업데이트 후 설치를 다시 시도해보거나
2. [예전 버전](https://www.python.org/downloads/windows/)을 설치, 예시 [3.4.4](https://www.python.org/downloads/release/python-344/)

만약 예전 버전의 파이썬을 설치한다면, 설치화면이 조금 다를 수 있습니다. 여기서 보이듯이 스크롤을 내려 아래쪽에 있는 "Add python.exe to the Path" 항목의 버튼을 클릭하고 "Will be installed on local hard drive"를 선택해주세요.

### 리눅스

아마 이미 파이썬이 설치되었을 거에요. 설치되어있는지 (그리고 어떤 버전인지) 확인하려면, 콘솔을 열어 다음 명령을 실행하세요.

    $ python3 --version
    Python 3.5.1


파이썬이 설치되어 있지 않거나 버전이 다르면 이렇게 해보세요. :

#### Debian 또는 Ubuntu

콘솔에서 다음 명령을 실행하세요.

    $ sudo apt-get install python3.5


#### Fedora (21까지)

콘솔에서 다음 명령을 실행하세요.

    $ sudo yum install python3


#### Fedora (22부터)

콘솔에서 다음 명령을 실행합니다.

    $ sudo dnf install python3


#### openSUSE

콘솔에서 다음 명령을 실행합니다.

    $ sudo zypper install python3


### OS X

https://www.python.org/downloads/release/python-351/ 에서 파이썬 설치프로그램을 다운 받아야 합니다.

* *Mac OS X 64-bit/32-bit installer* 파일을 다운 받으세요.
* *python-3.5.1-macosx10.6.pkg* 을 더블 클릭해 설치 프로그램을 시작하세요.

*터미널*을 열고 `python3` 명령을 실행해 잘 설치되었는지 확인하세요.

    $ python3 --version
    Python 3.5.1


* * *

더 알고 싶은 것이 있거나, 설치가 잘 되지 않고 어찌 해야할지 모르겠다면 코치를 불러주세요! 잘 설치 되지 않는 경우도 있을 수 있습니다. 그럴 때는 경험이 있는 분에게 도움을 구해보세요.
