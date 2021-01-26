Git은 많은 프로그래머들이 사용하고 있는 "버전 제어 시스템(version control system)"이에요. 이 소프트웨어는 변경 내용을 추적할 수 있어 나중에 특정 버전을 다시 호출 할 수 있어요. 워드 프로세서 프로그램들 (마이크로소프트 워드나 리브레오피스 라이터 등)의 "변경 내용 추적" 기능과 같지만 훨씬 강력합니다.

## Git 설치하기

<!--sec data-title="Installing Git: Windows" data-id="git_install_windows"
data-collapse=true ces-->

Git은 [git-scm.com](https://git-scm.com/)에서 다운로드 할 수 있어요. 두가지 단계만 빼고 "다음"을 누르실수 있답니다: 에디터 선택을 요구하는 단계에서 Nano를 선택하시고, "PATH 환경 조정" 단계에서 "윈도우 명령 프롬프트에서 Git과 Unix 도구 사용" (하단 옵션)을 선택해 주세요. 나머지는 모두 기본 설정대로 해도 됩니다. 윈도우 스타일, 유닉스 스타일로 라인엔딩 커밋하기(commit Unix-style line endings) 를 체크하는 것도 좋습니다.

Do not forget to restart the command prompt or PowerShell after the installation finished successfully. <!--endsec-->

<!--sec data-title="Installing Git: OS X" data-id="git_install_OSX"
data-collapse=true ces-->

[git-scm.com](https://git-scm.com/)에서 맥용 설치파일을 다운받은 다음 실행해 나오는 지시사항에 따라 설치합니다.

> **참고** 만약 OS X 10.6, 10.7, 10.8을 사용중이시면, 여기에 있는 git 버전을 설치하셔야 합니다: [ OS X Snow Leopard를 위한 Git 인스톨러 ](https://sourceforge.net/projects/git-osx-installer/files/git-2.3.5-intel-universal-snow-leopard.dmg/download)

<!--endsec-->

<!--sec data-title="Installing Git: Debian or Ubuntu" data-id="git_install_debian_ubuntu"
data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

```bash
$ sudo apt install git
```

<!--endsec-->

<!--sec data-title="Installing Git: Fedora" data-id="git_install_fedora"
data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

```bash
$ sudo dnf install git
```

<!--endsec-->

<!--sec data-title="Installing Git: openSUSE" data-id="git_install_openSUSE"
data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

```bash
$ sudo zypper install git
```

<!--endsec-->