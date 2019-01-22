만약 크롬북을 사용하고 있지 않다면, [이 섹션은 바로 넘어가도 됩니다.](http://tutorial.djangogirls.org/en/installation/#install-python) 사용하고 있다면, 여러분의 설치 경험은 약간 다를 것입니다. 여러분은 설치 안내의 나머지 부분을 무시하셔도 됩니다.

### 클라우드 IDE (PaizaCloud Cloud IDE, AWS Cloud9)

클라우드 IDE는 당신에게 코드 에디터와 인터넷에 연결되어있어 당신이 프로그램을 깔고, 작성하고 실행할 수 있는 컴퓨터의 접근 권한을 주는 도구입니다. 이 튜토리얼이 진행되는 동안, 클라우드 IDE는 *당신의 집 컴퓨터*처럼 사용될 것입니다. 당신은 여전히 OS X, Ubuntu, Windows 등에서 했던 것 처럼 터미널 화면에 명령어를 입력할 겁니다. 하지만 이번에는 그 터미널이 어딘가에서 당신을 위해 돌아가는 클라우드 IDE 컴퓨터에 연결되죠. 이제부터 저희는 클라우드 IDE를 사용하는 가이드를 설명드릴겁니다. (PaizaCloud Cloud IDE, AWS Cloud9) 당신은 이 클라우드 IDE들 중에 한개를 골라 가이드를 따라하면 되요!

#### PaizaCloud Cloud IDE

1. [PaizaCloud Cloud IDE](https://paiza.cloud/) 사이트에 접속합니다.
2. 새 계정을 생성합니다.
3. *New Server* 버튼을 클릭합니다.
4. Terminal 버튼(왼쪽 창에 있습니다) 버튼을 클릭합니다.

이제 당신은 버튼이 왼쪽에 있는 사이드바 형태의 인터페이스를 볼 수 있을 겁니다. "Terminal" 버튼을 눌러 터미널 창을 연 뒤 해당 명령어를 입력하세요:

{% filename %}Terminal{% endfilename %}

    $
    

PaizaCloud Cloud IDE 의 터미널은 당신의 명령어를 기다리고 있습니다. 당신은 윈도우의 크기를 조절하거나 최대로 할 수 있습니다.

#### AWS Cloud9

1. [AWS Cloud9](https://aws.amazon.com/cloud9/) 사이트에 접속합니다.
2. 새 계정을 생성합니다.
3. *Create Environment*를 클릭 합니다

이제 당신은 다음과 같이 사이드바와 글자가 있는 큰 메인 창, 그리고 하단에 작은 창이 있는 인터페이스가 보일겁니다:

{% filename %}bash{% endfilename %}

    yourusername:~/workspace $
    

This bottom area is your terminal. You can use the terminal to send instructions to the remote Cloud 9 computer. You can resize that window to make it a bit bigger.

### 가상 환경

virtualenv라고도 불리는 가상환경은 우리가 진행하고 있는 프로젝트를 위해 유용한 컴퓨터 코드를 담아놓을 수 있는 개인 상자와도 같습니다. 우리는 여러 코드의 일부분이 프로젝트들 사이에서 섞이지 않을 수 있도록 다양한 프로젝트들을 분리하여 저장하는데에 사용합니다.

터미널에서 클라우드 9 인터페이스 아래에 다음의 명령어를 입력합니다:

{% filename %}Cloud 9{% endfilename %}

    sudo apt update
    sudo apt install python3.6-venv
    

만약 이래도 작동 되지 않는다면, 코치에게 도움을 요청하세요.

Next, run:

{% filename %}Cloud 9{% endfilename %}

    mkdir djangogirls
    cd djangogirls
    python3.6 -mvenv myvenv
    source myvenv/bin/activate
    pip install django~={{ book.django_version }}
    

(note that on the last line we use a tilde followed by an equal sign: `~=`).

### GitHub

[Github](https://github.com) 계정을 만드세요.

### PythonAnywhere

장고걸스 튜토리얼에는 배포라는 섹션이 있습니다. 여기서는 다른 사람이 여러분의 작업물을 볼 수 있도록, 여러분이 만든 새로운 서버라고 불리는 웹 어플리케이션에 공개적으로 접근할 수 있는 컴퓨터로 옮기는 과정을 설명합니다.

크롬북에서 튜토리얼을 진행하고 있다면 이 부분은 약간 이상할 수 도 있습니다. 왜냐하면 우리는 이미 인터넷 상에서 작동하는 일반적인 노트북과 다른 컴퓨터를 사용하고 있기 때문입니다. 그러나 우리가 만든 Cloud 9 작업 공간을 "진행 중인" 작업 공간이라고 생각하고, Python Anywhere가 좀 더 완성된 작업물을 보여주는 공간이라고 생각하면 여전히 유용할 것입니다.

그러므로, Python Anywhere의 새 계정을 [www.pythonanywhere.com](https://www.pythonanywhere.com) 에서 만들어 보세요.