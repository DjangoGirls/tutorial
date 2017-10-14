크롬북 미사용자는 이번 장을 건너뛰고 [파이썬 설치하기](http://tutorial.djangogirls.org/ko/installation/#install-python) 장으로 넘어가세요. 

### Cloud 9

Cloud 9는 소프트웨어를 설치, 작성 및 실행할 수 있는 인터넷이 실행되는 컴퓨터에 대한 접근과 코드 에디터를 제공하는 도구입니다. 튜토리얼 실습하는 동안 Cloud 9은 _로컬 머신_ 이라 생각하면 됩니다. OS X, 우분투, 윈도우 사용자 처럼 터미널에서 명령어를 입력할 수 있지만, Cloud 9가 설정된 다른 곳에서 실행 중인 컴퓨터의 터미널에 연결됩니다.

1. [크롬 웹 스토어](https://chrome.google.com/webstore/detail/cloud9/nbdmccoknlfggadpfkmcpnamfnbkmkcp)에서 Cloud 9를 설치하세요.
2. [c9.io](https://c9.io)에 접속하세요.
3. 새 계정을 만드세요.
4. _Create a New Workspace_ 를 클릭하세요.
5. _django-girls_ 라고 쓰세요.
6. _Blank_(오렌지색 로고가있는 맨 아래 줄 오른쪽에서 두 번째)를 선택하세요.

이제 메인 창 아래쪽에 다음과 같은 작은 창이 보일 거에요. :

{% filename %}Cloud 9{% endfilename %}
```
yourusername:~/workspace $
```

이 하단 부분이 명령어를 입력할 Cloud9 _터미널_입니다. 창 크기를 조금 크게 조절할 수도 있어요.

### 가상환경

가상환경(virtual environment, 줄여서 virtualenv)은 작업하고 있는 프로젝트의 코드를 넣을 수 있는 일종의 전용 상자와 같아요. 가상환경을 사용해 서로 다른 프로젝트마다 코드가 섞이지 않도록 유지할 수 있습니다.

Cloud 9 터미널에서 아래 명령어를 따라 입력하세요. :

{% filename %}Cloud 9{% endfilename %}
```
sudo apt install python3.6-venv
```

작동하지 않다면, 코치에게 도움을 구하세요.

그리고, 실행해보세요. :

{% filename %}Cloud 9{% endfilename %}
```
mkdir djangogirls
cd djangogirls
python3.6 -mvenv myvenv
source myvenv/bin/activate
pip install django~=1.11.0
```

(마지막 줄에는 물결표 뒤에 등호(~=) 기호를 사용합니다)

### Github

[Github](https://github.com) 계정을 만드세요.

### PythonAnywhere

장고걸스 튜토리얼 중 배포하기 장에서 웹 애플리케이션을 구동하는 코드를 공개적으로 액세스 가능한 컴퓨터(서버라고 합니다)로 옮겨, 다른 사람들이 웹 사이트를 볼 수 있도록 실습할 거에요.

크롬북은 이미 인터넷에 연결된 컴퓨터(노트북과는 반대)이기 때문에 배포하기 장을 따라하면서 조금 이상하다고 생각할 수 있는데요. cloud 9을 현재 "개발 진행 중"인 공간으로 생각하면서 실습한 후, 맨 마지막에 PythonAnywhere에서 결과물을 배포한다고 생각하면 도움이 될 거에요.

[www.pythonanywhere.com](https://www.pythonanywhere.com) 에서 새 계정을 만드세요.
