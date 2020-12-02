> 집에서 학습하시는 분을 위해: 이번 장은 [파이썬 및 코드 편집기 설치 ](https://www.youtube.com/watch?v=pVTaqzKZCdA)비디오를 이용해 다룰 거에요.
> 
> 위 내용은 Geek Girls Carrots (http://django.carrots.pl)을 바탕으로 작성되었습니다.

장고는 파이썬으로 만들어졌습니다. 장고로 무언가를 해보려면 파이썬이 있어야합니다. 우선 설치부터 해볼까요! 우리는 파이썬 3를 사용할 거예요. 그보다 낮은 버전을 사용하고 있다면, 업그레이드해야 합니다. {{ book.py_min_version }} 버전이나 높은 버전을 가지고 있다면 괜찮아요.

Anaconda가 컴퓨터에 이미 설치되어 있더라도, 아래와같이 일반 파이썬을 설치해주세요.

<!--sec data-title="Install Python: Windows" data-id="python_windows" data-collapse=true ces-->

먼저 "시스템 종류" 시스템 정보 페이지를 통해 컴퓨터의 윈도우가 32비트 버전인지 64비트 버전인지 확인해 보아요. 아래 명령을 통해 페이지에 접근할 수 있어요:

* 윈도우키와 Pasue/Break 키를 동시에 눌러요
* 윈도우 메뉴에 제어판을 열어요, 그리고 시스템 및 보안의 시스템으로 이동해요.
* 윈도우 버튼을 누르고, 설정 > 시스템 > 정보 를 클릭해요
* 윈도우 시작메뉴에서 "시스템 정보"를 검색해요. 이를 위해서, 시작 버튼을 누르거나 윈도우 키를 누르고, `시스템 정보`를 입력해요. 당신이 입력한것에 따른 추천제안을 보여줘요. 보여진 것중에 선택할 수 있답니다.

윈도우용 파이썬은 https://www.python.org/downloads/windows/ 에서 다운로드 받을 수 있어요. "Latest Python 3 Release - Python x.x.x" 링크를 클릭해요. 만약 당신의 컴퓨터의 윈도우가 **64-bit**라면 **Windows x86-64 executable installer**를 다운로드 해요. 아닐경우 **Windows x86 executable installer**를 다운로드 해요. 설치파일을 파일을 다운로드 받고나서, 실행(더블클릭으로)한 다음, 지시사항을 따라하세요.

설치를 진행하기 시작하면 "Setup"이라고 적혀진 창을 발견 할 수 있을거에요. 여기 보이는것처럼 "Add Python {{ book.py_version }} to PATH" or 'Add Python to your environment variables" 에 체크가 되어있는지 확인하고 "Install Now"를 클릭하세요.(설치되는 버전에 따라 조금 다르게 보일 수 있어요):

![Don't forget to add Python to the Path](../python_installation/images/python-installation-options.png)

설치가 완료되면 파이썬 혹은 설치된 버전에 대한 정보를 알아볼 수 있는 링크가 표시된 안내창이 보입니다. 해당 창을 Close 혹은 cancel 하세요 - 당신은 이 튜토리얼에서 더 배우게 될거에요.

주의: 만약 오래된 윈도우(7, 비스타, 혹은 더 오래된 버전)를 사용하고 있다면 파이썬 {{ book.py_version }} 인스톨러가 실페 에러를 나타낼 거에요, 그러면 윈도우 업데이트를 설치하고 파이썬 설치를 다시 해보세요. 만약 계속 에러를 나타낸다면, [Python.org](https://www.python.org/downloads/windows/)에서 파이썬 {{ book.py_min_release }} 버전을 설치해 보세요.

> 장고 {{ book.django_version }}는 Windows XP나 이전버전을 지원하지 않는 파이썬 {{ book.py_min_version }} 혹은 이상의 버전을 필요로해요

<!--endsec-->

<!--sec data-title="Install Python: OS X" data-id="python_OSX"
data-collapse=true ces-->

> **주의** OS X에 파이썬을 설치하기 전, 맥 설정이 앱스토어에서 받지않은 패키지가 설치될 수 있도록 허용되어 있는지 확인하세요. 시스템 설정(어플리케이션 폴더에 있어요), "보안 및 개인정보보호", 그리고 "일반" 탭으로 이동해요. "다음에서 다운로드한 앱 허용:"이 "Mac App Store"로 되어있다면, "Mac App Store 및 확인된 개발자" 로 변경해요.

https://www.python.org/downloads/mac-osx/ 에서 파이썬 설치프로그램을 다운로드 받아야 합니다.

* *Mac OS X 64-bit/32-bit installer* 파일을 다운 받으세요.
* *python-{{ book.py_release }}-macosx10.9.pkg*을 더블 클릭해 설치 프로그램을 시작하세요. 

<!--endsec-->

<!--sec data-title="Install Python: Linux" data-id="python_linux"
data-collapse=true ces-->

아마도 이미 파이썬이 설치되어있을 거에요. 설치되어있는지 (그리고 어떤 버전인지) 확인하려면, 콘솔을 열어서 다음 명령을 실행하세요.

{% filename %}명령줄{% endfilename %}

    $ python3 --version
    Python {{ book.py_release }}
    

만약 다른버전의 파이썬이 깔려 있다면, 최소 {{ book.py_min_version }} (예를 들어 {{ book.py_min_release }})이어야 해요, 그렇지 않다면 업그레이드 해요. 파이썬이 설치되어 있지 않다면, 혹은 다른 버전을 원한다면, 먼저 어떤 리눅스 배포판을 사용하고 있는지 아래 명령으로 확인해요:

{% filename %}명령줄{% endfilename %}

    $ grep '^NAME=' /etc/os-release
    

그리고나서, 결과에 따라, 아래 섹션의 설치 가이드를 따라해보세요.

<!--endsec-->

<!--sec data-title="Install Python: Debian or Ubuntu" data-id="python_debian" data-collapse=true ces-->

콘솔에서 다음 명령을 실행하세요.

{% filename %}명령줄{% endfilename %}

    $ sudo apt install python3
    

<!--endsec-->

<!--sec data-title="Install Python: Fedora" data-id="python_fedora"
data-collapse=true ces-->

콘솔에서 다음 명령을 실행하세요.

{% filename %}명령줄{% endfilename %}

    $ sudo dnf install python3
    

만약 오래된 페도라 버전을 사용하고 있다면 `dnf`명령을 찾을 수 없을거에요. 그런 경우 `yum` 명령을 대신 사용해요.

<!--endsec-->

<!--sec data-title="Install Python: openSUSE" data-id="python_openSUSE"
data-collapse=true ces-->

콘솔에서 다음 명령을 실행하세요.

{% filename %}명령줄{% endfilename %}

    $ sudo zypper install python3
    

<!--endsec-->

명령창을 열고 `python3` 명령을 실행해서 잘 설치되었는지 확인하세요.

{% filename %}명령줄{% endfilename %}

    $ python3 --version
    Python {{ book.py_release }}
    

만약 {{ book.py_release }} 버전과 다르게 보일거에요 -- 이것은 당신이 설치한 버전과 일치해요.

**주의:** 만약 윈도우에서 `python3` 를 찾을수 없다는 에러메시지가 발생하면, `python` (`3`을 제외하고)을 입력해보고 {{ book.py_min_version }} 버전 이상인지 확인하세요. If that doesn't work either, you may open a new command prompt and try again; this happens if you use a command prompt left open from before the Python installation.

* * *

If you have any doubts, or if something went wrong and you have no idea what to do next, please ask your coach! Sometimes things don't go smoothly and it's better to ask for help from someone with more experience.