# 파이썬 시작하기!

장고는 파이썬으로 작성됐습니다. 따라서 파이썬이 있어야 장고를 할 수 있어요. 우선 설치부터 해볼까요! 우리는 파이썬 3.4를 사용할 거예요. 이보다 낮은 버전이 설치되었다면, 버전 업그레이드가 필요합니다.

### 윈도우

[[다운받기]](https://www.python.org/downloads/release/python-343/)

사이트에서 ***.msi** 파일을 내려받고, 실행(더블클릭으로)한 다음, 지시 사항을 그대로 따라가세요. 파이썬을 설치한 경로(디렉터리)를 기억해두어야 합니다. 나중에 필요하거든요!

설치 마법사의 "Customize"라는 두 번째 화면에서 주의하세요. 스크롤을 내려 아래 쪽에 있는 "Add python.exe to the Path" 항목을 체크해주세요.

![반드시 파이썬 경로(path)를 추가해야합니다!][9]

 [9]: ../python_installation/images/add_python_to_windows_path.png

### 리눅스

대부분 이미 파이썬이 설치되었을 거에요. 설치되어있는지(어떤 버전인지) 확인하려면, 콘솔을 열어 다음 명령을 실행하세요.

    $ python3 --version
    Python 3.4.3

파이썬이 설치되어 있지 않거나 버전이 다르면 이렇게 해보세요.

#### Debian 또는 Ubuntu

콘솔에서 다음 명령을 실행하세요.

    $ sudo apt-get install python3.4


#### Fedora (21까지)

콘솔에서 다음 명령을 실행하세요.

    $ sudo yum install python3.4


#### Fedora (22부터)

콘솔에서 다음 명령을 실행합니다.

    $ sudo dnf install python3.4


### 맥 OS

[[다운받기]](https://www.python.org/downloads/release/python-343/)
  * *Mac OS X 64-bit/32-bit installer* 파일을 다운 받으세요.
  * *python-3.4.3-macosx10.6.pkg*을 더블 클릭해 설치 프로그램을 시작하세요.

*터미널*을 열고 `python3`명령을 실행해 설치가 잘 되었는지 확인하세요.

    $ python3 --version
    Python 3.4.3


* * *

더 궁금한 것이나 설치가 잘 안된다면 코치를 불러주세요! 문제가 있을 때는 경험있는 분에게 조언을 구하세요.
