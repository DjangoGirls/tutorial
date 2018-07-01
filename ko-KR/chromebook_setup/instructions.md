만약 크롬북을 사용하고 있지 않다면, [이 섹션은 바로 넘어가도 됩니다.](http://tutorial.djangogirls.org/en/installation/#install-python) 사용하고 있다면, 여러분의 설치 경험은 약간 다를 것입니다. 여러분은 설치 안내의 나머지 부분을 무시하셔도 됩니다.

### Cloud 9

Cloud 9는 코드 편집기를 제공하며, 인터넷상에서 작동하는 가상의 컴퓨터를 사용할 수 있도록 도와줍니다. 이러한 컴퓨터에서 소프트웨어를 설치하고, 만들고, 작동시킬 수 있습니다. 이 튜토리얼에서는, Cloud 9가 당신의 *로컬 컴퓨터* 역할을 합니다. 이번에도 OS X, Ubuntu, Windows 등에서 했던 것과 같이 터미널 화면에 명령어를 입력할 것입니다. 그러나 이번에는 터미널이, Cloud 9에서 당신을 위해 어디선가 돌리고 있는 가상의 컴퓨터에 연결됩니다.

1. [크롬 웹 스토어](https://chrome.google.com/webstore/detail/cloud9/nbdmccoknlfggadpfkmcpnamfnbkmkcp)에서 Cloud 9 설치하기
2. [c9.io](https://c9.io)로 들어가기
3. 계정 만들기
4. *Create a New Workspace* 클릭하기
5. *django-girls*라고 이름 붙이기
6. *Blank* 선택하기(맨 밑 줄, 오른쪽에서 두 번째에 있는 오랜지색 로고)

이제 다음과 같이 사이드바와, 텍스트가 있는 큰 메인 창, 그리고 하단에 작은 창이 있는 화면이 보일 겁니다.

{% filename %}Cloud 9{% endfilename %}

    유저이름:~/workspace $
    

하단의 영역은 Cloud 9가 당신을 위해 준비한 컴퓨터에게 명령을 내리는 *터미널*입니다. 크기를 좀 더 키우려면 창의 크기를 조절할 수 있습니다.

### 가상 환경

가상 환경 (virtualenv라고도 부름) 은 우리가 작업하는 프로젝트에 유용한 코드를 저장해놓는 개인 상자와도 같습니다. 가상 환경은 여러 코드의 일부분이 프로젝트간에 섞이지 않도록 따로 저장하는 데에 사용됩니다.

Cloud 9 화면 하단의 터미널에, 다음의 명령어를 실행합니다:

{% filename %}Cloud 9{% endfilename %}

    sudo apt update
    sudo apt install python3.6-venv
    

만약 작동하지 않는다면, 코치에게 도움을 요청하세요.

그 다음엔, 다음과 같이 실행합니다:

{% filename %}Cloud 9{% endfilename %}

    mkdir djangogirls
    cd djangogirls
    python3.6 -mvenv myvenv
    source myvenv/bin/activate
    pip install django~=1.11.0
    

(마지막 줄에서 물결표 다음에 등호를 사용한다는 것을 참고하길 바랍니다: ~=)

### GitHub

Make a [GitHub](https://github.com) account.

### PythonAnywhere

장고걸스 튜토리얼에는 배포라는 섹션이 있습니다. 여기서는 다른 사람이 여러분의 작업물을 볼 수 있도록, 여러분이 만든 새로운 웹 어플리케이션을 구성하는 코드를 (서버라고 불리는) 공개적으로 접근할 수 있는 컴퓨터로 옮기는 과정을 설명합니다.

크롬북에서 튜토리얼을 따라하고 있다면, (예를 들면, 일반적인 노트북과 달리) 이미 인터넷상에서 작동하는 컴퓨터를 사용하고 있기 때문에 이상할 수 있습니다. However, it's still useful, as we can think of our Cloud 9 workspace as a place for our "in progress" work and Python Anywhere as a place to show off our stuff as it becomes more complete.

따라서, [www.pythonanywhere.com](https://www.pythonanywhere.com)에서 새로운 Python Anywhere 계정을 만드시길 바랍니다.