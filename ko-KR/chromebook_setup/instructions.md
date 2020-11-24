크롬북 유저가 아니라면 [이번 섹션은 넘어가도 상관없습니다.](http://tutorial.djangogirls.org/en/installation/#install-python) 유저가 맞다면, 여러분의 설치 과정은 약간 다를 것입니다. 여러분은 설치 안내의 나머지 부분을 무시하셔도 됩니다.

### 클라우드 IDE (PaizaCloud Cloud IDE, AWS Cloud9)

클라우드 IDE는 당신에게 코드 에디터와 인터넷에 연결되어있어 당신이 프로그램을 깔고, 작성하고 실행할 수 있는 컴퓨터의 접근 권한을 주는 도구입니다. 이 튜토리얼이 진행되는 동안, 클라우드 IDE는 *당신의 집 컴퓨터*처럼 사용될 것입니다. 당신은 여전히 OS X, Ubuntu, Windows 등에서 했던 것 처럼 터미널 화면에 명령어를 입력할 겁니다. 하지만 이번에는 그 터미널이 어딘가에서 당신을 위해 돌아가는 클라우드 IDE 컴퓨터에 연결되죠. 이제부터 저희는 클라우드 IDE를 사용하는 가이드를 설명드릴겁니다. (PaizaCloud Cloud IDE, AWS Cloud9) 당신은 이 클라우드 IDE들 중에 한개를 골라 가이드를 따라하면 되요!

#### PaizaCloud Cloud IDE

1. [PaizaCloud Cloud IDE](https://paiza.cloud/) 사이트에 접속합니다.
2. 새 계정을 생성합니다.
3. *새 서버* 선택후 Django 앱을 선택합니다.
4. Terminal 버튼(왼쪽 창에 있습니다) 버튼을 클릭합니다.

이제 당신은 버튼이 왼쪽에 있는 사이드바 형태의 인터페이스를 볼 수 있을 겁니다. "Terminal" 버튼을 눌러 터미널 창을 연 뒤 해당 명령어를 입력하세요:

{% filename %}Terminal{% endfilename %}

    $
    

PaizaCloud Cloud IDE 의 터미널은 당신의 명령어를 기다리고 있습니다. 당신은 윈도우의 크기를 조절하거나 최대로 할 수 있습니다.

#### AWS Cloud9

현재 Cloud9은 AWS 계정 등록과 신용카드 정보 등록을 필요로합니다

1. [ 크롬 웹스토어](https://chrome.google.com/webstore/detail/cloud9/nbdmccoknlfggadpfkmcpnamfnbkmkcp)에서 Cloud9을 설치합니다.
2. [c9.io](https://c9.io) 접속후 *AWS Cloud9 시작하기*를 선택합니다.
3. AWS 계정 등록을합니다 (신용카드 정보 등록하셔야 하지만 무료로 사용하실수 있습니다).
4. AWS 대쉬보드에서 *Cloud9*을 서치창에 입력후 클릭합니다.
5. Cloud9 대쉬보드에서 *환경 만들기*를 클릭합니다.
6. *django-girls*라고 이름 짓습니다.
7. 세팅 설정중, "환경 속성"에서 * 환경에 새 인스턴스 만들기 (EC2)*와 *t2.micro* "인스턴스 속성"을 선택합니다 ("무료사용자등급 가능"이라 표시 되어야합니다). 기본 비용절약 설정과 다른 기본설정으로 괜찮습니다.
8. *다음 단계*를 선택합니다.
9. * 환경 만들기*를 선택합니다.

이제 다음과 같이 사이드바, 텍스트가 있는 큰 메인 창, 그리고 하단에 작은 창이 있는 화면이 보이실 겁니다.

{% filename %}bash{% endfilename %}

    yourusername:~/workspace $
    

이 하단영역은 귀하의 터미널입니다. 이 터미널을 이용해 원격 Cloud9 컴퓨터에 커맨드에 커맨드를 보낼 수 있습니다. 창을 더 크게 조절하실수 있습니다.

### 가상 환경

가상환경 (virtualenv라고도 부름)은 우리가 진행하고 있는 프로젝트를 위해 유용한 컴퓨터 코드를 담아놓을 수 있는 개인 상자와도 같습니다. 다양한 프로젝트들을 위한 여러 코드를 분할 정장하여 프로제트들간 섞이지 않게 사용됩니다.

실행:

{% filename %}Cloud 9{% endfilename %}

    mkdir djangogirls
    cd djangogirls
    python3. -mvenv myvenv
    source myvenv/bin/activate
    pip install django~={{ book.django_version }}
    

(마지막 줄에서 물결표 다음 등호를 사용한 것을 주목하세요. `~=`)

### GitHub

[Github](https://github.com) 계정을 만드세요.

### PythonAnywhere

장고걸스 튜토리얼에는 배포라는 섹션이 있습니다. 여기서는 다른 사람이 여러분의 작업물을 볼 수 있도록, 여러분이 만든 새로운 웹 어플리케이션을 구성하는 코드를 (서버라고 불리는) 공개적으로 접근할 수 있는 컴퓨터로 옮기는 과정을 설명합니다.

크롬북에서 튜토리얼을 따라하고 있다면, (예를 들면, 일반적인 노트북과 달리) 이미 인터넷상에서 작동하는 컴퓨터를 사용하고 있기 때문에 이상할 수 있습니다. 그러나 우리가 만든 Cloud 9 작업 공간을 "진행 중인" 작업 공간이라고 생각하고, Python Anywhere가 좀 더 완성된 작업물을 보여주는 공간이라고 생각하면 여전히 유용할 것입니다.

따라서, [www.pythonanywhere.com](https://www.pythonanywhere.com)에서 새로운 Python Anywhere 계정을 만드시길 바랍니다.