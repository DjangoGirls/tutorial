# 커맨드라인 시작하기

> For readers at home: this chapter is covered in the [Your new friend: Command Line](https://www.youtube.com/watch?v=jvZLWhkzX-8) video.

It's exciting, right?! You'll write your first line of code in just a few minutes! :)

**여러분에 첫 번째 친구를 소개합니다: 바로, 커맨드라인(command line) 입니다!**

해커들이 사용하는 까만 윈도우 창을 어떻게 사용하는지 보여드릴 거에요. 처음에는 약간 무서워 보일 수도 있지만, 여러분의 명령어를 기다리는 녀석일 뿐이에요.

> **Note** Please note that throughout this book we use the terms 'directory' and 'folder' interchangeably but they are one and the same thing.

## 커맨드라인은 무엇일까요?

**command line** 또는 **command-line interface**라고도 불리는 윈도우는 컴퓨터에서의 보기, 처리, 그리고 파일 조작을 위한 텍스트 기반 응용 프로그램입니다. It's much like Windows Explorer or Finder on the Mac, but without the graphical interface. Other names for the command line are: *cmd*, *CLI*, *prompt*, *console* or *terminal*.

## 커맨드라인 열기

커맨드라인을 열고 몇 가지 실험을 해봅시다.

<!--sec data-title="Windows" data-id="windows_prompt" data-collapse=true ces-->

Go to Start menu → Windows System → Command Prompt.

> On older versions of Windows, look in Start menu → All Programs → Accessories → Command Prompt.

<!--endsec-->

<!--sec data-title="OS X" data-id="OSX_prompt" data-collapse=true ces-->

Go to Applications → Utilities → Terminal.

<!--endsec-->

<!--sec data-title="Linux" data-id="linux_prompt" data-collapse=true ces-->

It's probably under Applications → Accessories → Terminal, but that may depend on your system. If it's not there, just Google it. :)

<!--endsec-->

## 프롬프트

이제 까만 배경이나 하얀 배경에 윈도우가 뭔가를 지시해주길 기다리고 있을 거에요.

<!--sec data-title="OS X and Linux" data-id="OSX_Linux_prompt" data-collapse=true ces-->

맥이나 리눅스의 경우, 이런 `$` 기호가 보일 거예요:

{% filename %}command-line{% endfilename %}

    $
    

<!--endsec-->

<!--sec data-title="Windows" data-id="windows_prompt2" data-collapse=true ces-->

윈도우의 경우, 이런 `>` 기호가 보일 겁니다:

{% filename %}command-line{% endfilename %}

    >
    

<!--endsec-->

Each command will be prepended by this sign and one space, but you don't have to type it. Your computer will do it for you. :)

> Just a small note: in your case there may be something like `C:\Users\ola>` or `Olas-MacBook-Air:~ ola$` before the prompt sign, and this is 100% OK.

The part up to and including the `$` or the `>` is called the *command line prompt*, or *prompt* for short. It prompts you to input something there.

In the tutorial, when we want you to type in a command, we will include the `$` or `>`, and occasionally more to the left. You can ignore the left part and just type in the command which starts after the prompt.

## 나의 첫 번째 명령 (야호!)

쉬운 것 부터 시작할게요. 아래 명령어를 입력해 보세요:

<!--sec data-title="OS X and Linux" data-id="OSX_Linux_whoami" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    $ whoami
    

<!--endsec-->

<!--sec data-title="Windows" data-id="windows_whoami" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    > whoami
    

<!--endsec-->

그리고 `enter`를 누르세요. 다음과 같이 보일 거에요.

{% filename %}command-line{% endfilename %}

    $ whoami 
    olasitarska
    

As you can see, the computer has just printed your username. Neat, huh? :)

> Try to type each command; do not copy-paste. You'll remember more this way!

## 기본 명령어

각각의 운영체제에 따라, 명령어들이 조금씩 다를 수도 있으니까, 여러분의 운영체제에 해당하는 설명을 따라주세요. 그럼 같이 해볼까요?

### 현재 디렉토리

우리가 어디쯤 있는지 알면 좋겠죠? 아래의 명렁을 입력하고 `enter`를 눌러보세요:

<!--sec data-title="OS X and Linux" data-id="OSX_Linux_pwd" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    $ pwd
    /Users/olasitarska
    

> 참고: 'pwd' 는 'print working directory' 의 줄임말임.

<!--endsec-->

<!--sec data-title="Windows" data-id="windows_cd" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    > cd 
    C:\Users\olasitarska
    

> Note: 'cd' stands for 'change directory'. With powershell you can use pwd just like on Linux or Mac OS X.

<!--endsec-->

위와 비슷한 결과가 출력되었을 거예요. 커맨드라인을 열면, 항상 '홈 디렉토리' 에서 시작합니다.

* * *

### 파일과 디렉토리 목록 보기

여기에는 뭐가 있는지 알아낼 수 있다면 좋겠지요? 그럼 같이 해봐요.

<!--sec data-title="OS X and Linux" data-id="OSX_Linux_ls" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    $ ls 
    Applications 
    Desktop 
    Downloads 
    Music 
    ...
    

<!--endsec-->

<!--sec data-title="Windows" data-id="windows_dir" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    > dir  
    Directory of C:\Users\olasitarska 
    05/08/2014 07:28 PM <DIR> Applications 
    05/08/2014 07:28 PM <DIR> Desktop 
    05/08/2014 07:28 PM <DIR> Downloads 
    05/08/2014 07:28 PM <DIR> Music 
    ...
    

> Note: In powershell you can also use 'ls' like on Linux and Mac OS X. <!--endsec-->

* * *

### 현재 디렉토리 변경

자, 바탕화면 디렉토리로 가볼까요:

<!--sec data-title="OS X and Linux" data-id="OSX_Linux_move_to" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    $ cd Desktop
    

<!--endsec-->

<!--sec data-title="Windows" data-id="windows_move_to" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    > cd Desktop
    

<!--endsec-->

정말 변경되었는지 볼까요:

<!--sec data-title="OS X and Linux" data-id="OSX_Linux_pwd2" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    $ pwd 
    /Users/olasitarska/Desktop
    

<!--endsec-->

<!--sec data-title="Windows" data-id="windows_cd2" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    > cd 
    C:\Users\olasitarska\Desktop
    

<!--endsec-->

맞군요!

> PRO tip: if you type `cd D` and then hit `tab` on your keyboard, the command line will automatically fill in the rest of the name so you can navigate faster. If there is more than one folder starting with "D", hit the `tab` key twice to get a list of options.

* * *

### 새 디렉토리 만들기

바탕 화면에 연습 디렉터리를 만들어 볼까요? 이렇게 하면 돼요:

<!--sec data-title="OS X and Linux" data-id="OSX_Linux_mkdir" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    $ mkdir practice
    

<!--endsec-->

<!--sec data-title="Windows" data-id="windows_mkdir" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    > mkdir practice
    

<!--endsec-->

이 간단한 명령어가, 바탕화면에 `practice` 라는 이름의 폴더를 만들어 줍니다. 바탕화면에서 직접 보거나, 명령어 `ls` 혹은 `dir`을 실행해서 확인할 수 있어요! Try it. :)

> 전문가 팁: 같은 명령어를 여러 번 반복해서 입력하고 싶지 않다면, 키보드의 `위 화살표`와 `아래 화살표`를 눌러서 최근 사용한 명령어들을 볼 수 있어요.

* * *

### 연습문제!

A small challenge for you: in your newly created `practice` directory, create a directory called `test`. (Use the `cd` and `mkdir` commands.)

#### 답:

<!--sec data-title="OS X and Linux" data-id="OSX_Linux_test_dir" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    $ cd practice
    $ mkdir test
    $ ls
    test
    

<!--endsec-->

<!--sec data-title="Windows" data-id="windows_test_dir" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    > cd practice
    > mkdir test
    > dir
    05/08/2014 07:28 PM <DIR>      test
    

<!--endsec-->

축하합니다 :)

* * *

### 정리

어지럽힌 흔적은 남기고 싶지 않지요, 지금까지 한 것들을 모두 지워봅시다!

우선, 바탕화면으로 돌아가야해요.

<!--sec data-title="OS X and Linux" data-id="OSX_Linux_back" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    $ cd ..
    

<!--endsec-->

<!--sec data-title="Windows" data-id="windows_back" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    > cd ..
    

<!--endsec-->

Using `..` with the `cd` command will change your current directory to the parent directory (that is, the directory that contains your current directory).

현재 위치를 확인해 보세요:

<!--sec data-title="OS X and Linux" data-id="OSX_Linux_pwd3" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    $ pwd 
    /Users/olasitarska/Desktop
    

<!--endsec-->

<!--sec data-title="Windows" data-id="windows_cd3" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    > cd 
    C:\Users\olasitarska\Desktop
    

<!--endsec-->

이제 `practice` 디렉토리를 삭제할시간이에요:

> **Attention**: Deleting files using `del`, `rmdir` or `rm` is irrecoverable, meaning *the deleted files will be gone forever*! So be very careful with this command.

<!--sec data-title="Windows Powershell, OS X and Linux" data-id="OSX_Linux_rm" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    $ rm -r practice
    

<!--endsec-->

<!--sec data-title="Windows Command Prompt" data-id="windows_rmdir" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    > rmdir /S practice
    practice, Are you sure <Y/N>? Y
    

<!--endsec-->

완료! 실제로 삭제되었는지, 확인해 봅시다:

<!--sec data-title="OS X and Linux" data-id="OSX_Linux_ls2" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    $ ls
    

<!--endsec-->

<!--sec data-title="Windows" data-id="windows_dir2" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    > dir
    

<!--endsec-->

### 종료

That's it for now! You can safely close the command line now. Let's do it the hacker way, alright? :)

<!--sec data-title="OS X and Linux" data-id="OSX_Linux_exit" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    $ exit
    

<!--endsec-->

<!--sec data-title="Windows" data-id="windows_exit" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    > exit
    

<!--endsec-->

Cool, huh? :)

## 목차

유용한 명령어들을 요약한 표입니다:

| 명령어(윈도우)       | 명령어(맥 OS/리눅스) | 설명                         | 예시                                                |
| -------------- | ------------- | -------------------------- | ------------------------------------------------- |
| exit           | exit          | 창을 닫는다                     | **exit**                                          |
| cd             | cd            | 디렉토리를 변경한다                 | **cd test**                                       |
| cd             | pwd           | show the current directory | **cd** (Windows) or **pwd** (Mac OS / Linux)      |
| dir            | ls            | 디렉토리 혹은 파일 목록을 보여준다        | **dir**                                           |
| copy           | cp            | 파일을 복사한다                   | **copy c:\test\test.txt c:\windows\test.txt** |
| move           | mv            | 파일을 이동한다                   | **move c:\test\test.txt c:\windows\test.txt** |
| mkdir          | mkdir         | 새 디렉토리를 만든다                | **mkdir testdirectory**                           |
| rmdir (or del) | rm            | delete a file              | **del c:\test\test.txt**                        |
| rmdir /S       | rm -r         | delete a directory         | **rm -r testdirectory**                           |

커맨드라인에서 실행할 수 있는 명령어들 중에, 아주 몇 가지만 소개했지만, 오늘은 이정도만 필요할 거에요. 

더 알고 싶다면, [ss64.com](http://ss64.com)에서 운영체제별로 정리된 명령어모음을 볼 수 있어요.

## 준비되셨나요?

이제 파이썬의 세계로 빠져봅시다!