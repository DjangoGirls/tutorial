> 집에서 학습하시는 분들은 [파이썬 & 코드에디터 설치하기](https://www.youtube.com/watch?v=pVTaqzKZCdA) 영상을 보세요.

> 이 장은 Geek Girls Carrots (https://github.com/ggcarrots/django-carrots) 튜토리얼을 기초로 작성되었습니다.

장고는 파이썬 언어로 작성됐습니다. 파이썬이 있어야 장고를 할 수 있어요. 우선 설치부터 해볼까요! 우리는 파이썬 3.4를 사용할 거예요. 이보다 낮은 버전이 설치되었다면, 버전 업그레이드 하세요.


<!--sec data-title="Windows" data-id="python_windows" data-collapse=true ces-->

사용 중인 컴퓨터 윈도우 운영체제가 32비트인지 64비트인지 확인하려면 https://support.microsoft.com/en-au/kb/827218 에서 확인하세요. 윈도우 용 파이썬은 https://www.python.org/downloads/windows/ 웹 사이트에서 다운로드 할 수 있습니다. "Latest Python 3 Release - Python x.x.x"링크를 클릭하세요. **64 비트** 버전의 Windows인 경우 **Windows x86-64 executable installer**를 다운로드하세요. 이외에는 **Windows x86 executable installer**을 다운로드하십시오. 설치 프로그램을 다운로드 한 후에 실행(더블 클릭)하고 지시 사항을 따르세요.

> **Note** 설치하는 동안 "Setup"이라고 표시된 창이 나타납니다. 다음과 같이 "Add Python 3.5 to PATH"체크 박스를 체크하고 "Install Now"를 클릭하세요.

![Don't forget to add Python to the Path](../python_installation/images/python-installation-options.png)

다음 단계에서는 Windows 명령 프롬프트를 사용할 것입니다 (Windows 명령어도 알려드릴 거에요. 지금은 일부 명령을 입력해야하는 경우 시작 메뉴 → 모든 프로그램 → 보조 프로그램 → 명령 프롬프트로 이동하세요. Windows 키를 누르고 "실행"창이 팝업 될 때까지 "R"키를 누르면 됩니다. 명령어를 입력하려면 "cmd"를 입력하고 "실행"창에서 엔터키를 누르세요. (윈도우 최신 버전에서는 "명령 프롬프트"가 메뉴에 없을 수 있어 검색해 실행하면 됩니다)

![Don't forget to add Python to the Path](../python_installation/images/python-installation-options.png)

In upcoming steps, you'll be using the Windows Command Line (which we'll also tell you about). For now, if you need to type in some commands, go to Start menu → All Programs → Accessories → Command Prompt. You can also hold in the Windows key and press the "R"-key until the "Run" window pops up. To open the Command Line, type "cmd" and press enter in the "Run" window. (On newer versions of Windows, you might have to search for "Command Prompt" since it's sometimes hidden.)

![Type "cmd" in the "Run" window](../python_installation/images/windows-plus-r.png)

> **Note**: if you are using an older version of Windows (7, Vista, or any older version) and the Python 3.5.x installer fails with an error, you can try either:
1. install all Windows Updates and try to install Python 3.5 again; or
2. install an [older version of Python](https://www.python.org/downloads/windows/), e.g., [3.4.4](https://www.python.org/downloads/release/python-344/).

If you install an older version of Python, the installation screen may look a bit different than shown above. Make sure you scroll down to see "Add python.exe to Path", then click the button on the left and pick "Will be installed on local hard drive":

![Add Python to the Path, older versions](../python_installation/images/add_python_to_windows_path.png)

<!--endsec-->

<!--sec data-title="OS X" data-id="python_OSX"
data-collapse=true ces-->

> **Note** Before you install Python on OS X, you should ensure your Mac settings allow installing packages that aren't from the App Store. Go to System Preferences (it's in the Applications folder), click "Security & Privacy," and then the "General" tab. If your "Allow apps downloaded from:" is set to "Mac App Store," change it to "Mac App Store and identified developers."
