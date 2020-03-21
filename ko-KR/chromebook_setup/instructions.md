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
3. AWS 계정 등록을합니다 (신용카드 정보 등록이 필요하지만 무료로 사용하실수 있습니다).
4. AWS 대쉬보드에서 *Cloud9*을 서치창에 입력후 클릭합니다.
5. Cloud9 대쉬보드에서 *가상환경 만들기*를 클릭합니다.
6. *django-girls*라고 이름 짓습니다.
7. 세팅 설정중, "가상환경 속성"에서 * 가상환경에 새 인스턴스 만들기 (EC2)*와 *t2.micro* "인스턴스 속성"을 선택합니다 ("무료사용자등급 가능"이라 표시 되어야합니다). 기본 비용절약 설정과 다른 기본설정으로 괜찮습니다.
8. *다음 단계*를 선택합니다.
9. * 새 환경 만들기*를 선택합니다.

Now you should see an interface with a sidebar, a big main window with some text, and a small window at the bottom that looks something like this:

{% filename %}bash{% endfilename %}

    yourusername:~/workspace $
    

This bottom area is your terminal. You can use the terminal to send instructions to the remote Cloud 9 computer. You can resize that window to make it a bit bigger.

### 가상 환경

A virtual environment (also called a virtualenv) is like a private box we can stuff useful computer code into for a project we're working on. We use them to keep the various bits of code we want for our various projects separate so things don't get mixed up between projects.

Run:

{% filename %}Cloud 9{% endfilename %}

    mkdir djangogirls
    cd djangogirls
    python3.6 -mvenv myvenv
    source myvenv/bin/activate
    pip install django~={{ book.django_version }}
    

(note that on the last line we use a tilde followed by an equal sign: `~=`).

### GitHub

Make a [GitHub](https://github.com) account.

### PythonAnywhere

The Django Girls tutorial includes a section on what is called Deployment, which is the process of taking the code that powers your new web application and moving it to a publicly accessible computer (called a server) so other people can see your work.

This part is a little odd when doing the tutorial on a Chromebook since we're already using a computer that is on the Internet (as opposed to, say, a laptop). However, it's still useful, as we can think of our Cloud 9 workspace as a place for our "in progress" work and Python Anywhere as a place to show off our stuff as it becomes more complete.

Thus, sign up for a new Python Anywhere account at [www.pythonanywhere.com](https://www.pythonanywhere.com).