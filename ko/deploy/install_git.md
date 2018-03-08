Git이란 "버전 관리 시스템(version control system)"으로 많은 프로그래머들이 사용하고 있습니다. 이 소프트웨어는 시간 경과에 따른 파일 변경을 추적이 가능해 나중에라도 특정 버전을 다시 불러올 수 있습니다. Microsoft Word의 "변경 사항 추적"기능과 비슷하지만 훨씬 강력합니다.

## Git 설치하기

<!--sec data-title="Windows" data-id="git_install_windows"
data-collapse=true ces-->

Git은 [git-scm.com](https://git-scm.com/)에서 내려받을 수 있습니다. 설치는 쉽답니다. 딱 한 단계만 빼고 기본 설정대로 `다음 다음 다음`을 계속 눌러주면 쉽게 설치할 수 있어요. 다섯 번째 `PATH 환경 설정(Adjusting your PATH environment)`화면에서 주의하세요. `윈도우 커맨드라인에서 Git과 유닉스 도구를 사용(Use Git and optional Unix tools from the Windows Command Prompt)`을 선택하세요. 나머지는 모두 기본 설정대로 해도 됩니다. `윈도우 스타일로 체크아웃, 유닉스 스타일로 라인엔딩 커밋하기(Checkout Windows-style, commit Unix-style line endings)`를 체크하는 것도 좋습니다.

<!--endsec-->

<!--sec data-title="OS X" data-id="git_install_OSX"
data-collapse=true ces-->

[git-scm.com](https://git-scm.com/)에서 다운받아 설치하세요. 

> **Note** OS X 10.6, 10.7 또는 10.8을 사용하는 경우 다음 링크에서 git 버전을 설치해야합니다. : [Git installer for OS X Snow Leopard](https://sourceforge.net/projects/git-osx-installer/files/git-2.3.5-intel-universal-snow-leopard.dmg/download)


<!--endsec-->

<!--sec data-title="Debian / Ubuntu" data-id="git_install_debian_ubuntu"
data-collapse=true ces-->

{% filename %}command-line{% endfilename %}
```bash
$ sudo apt install git
```

<!--endsec-->

<!--sec data-title="Fedora" data-id="git_install_fedora"
data-collapse=true ces-->

{% filename %}command-line{% endfilename %}
```bash
$ sudo dnf install git
```

<!--endsec-->

<!--sec data-title="openSUSE" data-id="git_install_openSUSE"
data-collapse=true ces-->

{% filename %}command-line{% endfilename %}
```bash
$ sudo zypper install git
```

<!--endsec-->
