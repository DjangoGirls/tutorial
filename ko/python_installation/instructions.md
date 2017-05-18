<<<<<<< HEAD
> 집에서 학습하시는 분들은 [파이썬 & 코드에디터 설치하기](https://www.youtube.com/watch?v=pVTaqzKZCdA) 영상을 보세요.

> 이 장은 Geek Girls Carrots (https://github.com/ggcarrots/django-carrots) 튜토리얼을 기초로 작성되었습니다.
=======
# 파이썬 시작하기!

장고는 파이썬으로 작성됐습니다. 따라서 파이썬이 있어야 장고를 할 수 있어요. 우선 설치부터 해볼까요! 우리는 파이썬 3.4를 사용할 거예요. 이보다 낮은 버전이 설치되었다면, 버전 업그레이드가 필요합니다.
>>>>>>> translation-2017

장고는 파이썬 언어로 작성됐습니다. 파이썬이 있어야 장고를 할 수 있어요. 우선 설치부터 해볼까요! 우리는 파이썬 3.4를 사용할 거예요. 이보다 낮은 버전이 설치되었다면, 버전 업그레이드 하세요.

<<<<<<< HEAD

<!--sec data-title="Windows" data-id="python_windows" data-collapse=true ces-->

사용 중인 컴퓨터 윈도우 운영체제가 32비트인지 64비트인지 확인하려면 https://support.microsoft.com/en-au/kb/827218 에서 확인하세요. 윈도우 용 파이썬은 https://www.python.org/downloads/windows/ 웹 사이트에서 다운로드 할 수 있습니다. "Latest Python 3 Release - Python x.x.x"링크를 클릭하세요. **64 비트** 버전의 Windows인 경우 **Windows x86-64 executable installer**를 다운로드하세요. 이외에는 **Windows x86 executable installer**을 다운로드하십시오. 설치 프로그램을 다운로드 한 후에 실행(더블 클릭)하고 지시 사항을 따르세요.
=======
[[다운받기]](https://www.python.org/downloads/release/python-343/)

사이트에서 ***.msi** 파일을 내려받고, 실행(더블클릭으로)한 다음, 지시 사항을 그대로 따라가세요. 파이썬을 설치한 경로(디렉터리)를 기억해두어야 합니다. 나중에 필요하거든요!

설치 마법사의 "Customize"라는 두 번째 화면에서 주의하세요. 스크롤을 내려 아래 쪽에 있는 "Add python.exe to the Path" 항목을 체크해주세요.

![반드시 파이썬 경로(path)를 추가해야합니다!][9]
>>>>>>> translation-2017

> **Note** 설치하는 동안 "Setup"이라고 표시된 창이 나타납니다. 다음과 같이 "Add Python 3.5 to PATH"체크 박스를 체크하고 "Install Now"를 클릭하세요.

![Don't forget to add Python to the Path](../python_installation/images/python-installation-options.png)

<<<<<<< HEAD
다음 단계에서는 Windows 명령 프롬프트를 사용할 것입니다 (Windows 명령어도 알려드릴 거에요. 지금은 일부 명령을 입력해야하는 경우 시작 메뉴 → 모든 프로그램 → 보조 프로그램 → 명령 프롬프트로 이동하세요. Windows 키를 누르고 "실행"창이 팝업 될 때까지 "R"키를 누르면 됩니다. 명령어를 입력하려면 "cmd"를 입력하고 "실행"창에서 엔터키를 누르세요. (윈도우 최신 버전에서는 "명령 프롬프트"가 메뉴에 없을 수 있어 검색해 실행하면 됩니다)
=======
대부분 이미 파이썬이 설치되었을 거에요. 설치되어있는지(어떤 버전인지) 확인하려면, 콘솔을 열어 다음 명령을 실행하세요.
>>>>>>> translation-2017

![Type "cmd" in the "Run" window](../python_installation/images/windows-plus-r.png)

<<<<<<< HEAD
> **Note**: 윈도우 이전 버전(윈도우7, Vista, or any older version)에서 파이썬 3.5.x 설치오류가 생기면, 다음과 같이 해보세요. :
1. 모든 윈도우 업데이트 후 파이썬 3.5를 다시 설치해보세요.
2. 또는 [파이썬 이전 버전](https://www.python.org/downloads/windows/)을 설치하세요. 

이전 버전 파이썬 설치 시 설치 화면이 위에 표시된 것과 약간 다르게 보일 수 있습니다. "python.exe를 경로에 추가"를 보려면 아래로 스크롤 한 다음 왼쪽의 버튼을 클릭하고 "로컬 하드 드라이브에 설치"를 선택하세요.
=======
파이썬이 설치되어 있지 않거나 버전이 다르면 이렇게 해보세요.
>>>>>>> translation-2017

![Add Python to the Path, older versions](../python_installation/images/add_python_to_windows_path.png)

<!--endsec-->

<!--sec data-title="OS X" data-id="python_OSX"
data-collapse=true ces-->

<<<<<<< HEAD
> **Note** OS X에 Python을 설치하기 전에 Mac 설정에서 App Store가 아닌 패키지를 설치할 수 있도록 해야합니다. 시스템 환경 설정 (응용 프로그램 폴더에 있음)으로 이동하여 "보안 및 개인 정보"를 클릭 한 다음 "일반"탭을 클릭하세요. "다운로드 한 응용 프로그램 허용"이 "Mac App Store"로 설정된 경우 "Mac App Store 및 확인된 개발자"로 변경하세요.
=======

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
>>>>>>> translation-2017
