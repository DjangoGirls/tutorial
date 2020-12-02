# 커맨드라인 시작하기

> 집에서 공부하시는 분은: [새 친구: 커맨드라인](https://www.youtube.com/watch?v=jvZLWhkzX-8)영상을 참고하세요.

재미있을 것 같지 않아요? 몇분 내로 여러분은 코딩의 첫 줄을 쓸 수 있어요! :)

**여러분의 첫 번째 친구를 소개합니다: 바로, 커맨드라인(command line) 입니다!**

해커들이 사용하는 까만 윈도우 창을 어떻게 사용하는지 보여드릴 거에요. 처음에는 약간 무서워 보일 수도 있지만, 이녀석은 그저 여러분의 명령을 기다리는 메시지창일 뿐이에요!

> **참고** 이 설명서에서 '디렉토리'와 '폴더'라는 두가지 단어를 사용하지만 둘다 같은 뜻이랍니다.

## 커맨드라인은 무엇일까요?

흔히 **커맨드라인(command line)** 또는 **커맨드라인 대화창(command-line interface)**이라고도 불리는 이 윈도우는 컴퓨터에서의 파일을 보고, 처리하고, 조작하기 위한 텍스트 기반 응용 프로그램입니다. 그래픽 인터페이스가 없는 윈도우 익스플로러나 Mac의 Finder라고 봐도 되요. 커맨드라인은 *cmd*, *CLI*, *프롬프트(prompt)*, *콘솔(console)* 혹은 *터미널(terminal)*로 부르기도 해요.

## 커맨드라인 열기

몇가지 실험을 시작하기 전에 먼저 여러분의 커맨드라인 창을 열어봅시다.

{% include "/intro_to_command_line/open_instructions.md" %}

## 프롬프트

하얀색 혹은 까만색 배경 윈도우가 여러분의 명령을 기다리고 있는 것을 보실 수 있을 거에요

<!--sec data-title="Prompt: OS X and Linux" data-id="OSX_Linux_prompt" data-collapse=true ces-->

맥이나 리눅스의 경우, 아래와 같은 `$` 기호가 보일 거예요:

{% filename %}command-line{% endfilename %}

    $
    

<!--endsec-->

<!--sec data-title="Prompt: Windows" data-id="windows_prompt2" data-collapse=true ces-->

윈도우에서는 아래와 같은 `>` 기호가 보일 거에요:

{% filename %}command-line{% endfilename %}

    >
    

바로 위의 Linux 섹션을 살펴보세요. PythonAnywhere에 접속하면 이 튜토리얼과 비슷한 내용을 볼 수 있습니다.

<!--endsec-->

각 명령은 `$` 또는 `>` 그리고 한 개의 공백이 앞에 붙어요, 하지만 그것은 입력하면 안되요. 컴퓨터가 당신을 위해 알아서 넣어줄 거랍니다.

> 잠깐만요: 상황에 따라 프롬트 기호 앞에 `C:\Users\ola>` 혹은 `Olas-MacBook-Air:~ ola$` 같은 것이 보일 수 있는데, 그건 문제가 있는게 아니라 아주 잘 동작하는 거랍니다.

`$` 또는 `>` 포함 부분 짧게 *명령줄 프롬프트* 또는 *프롬프트*라고 합니다. 뭔가 입력하라는 표시입니다.

이 튜토리얼을 따라하면서, 커맨드 라인에 명령어를 입력할 때마다 왼쪽에 `$` 또는 `>`표시가 보일 거에요. 프롬프트를 실행하고 나서 왼쪽 표시 부분을 무시하고 명령어를 바로 입력하면 됩니다.

## 나의 첫 번째 명령 (야호!)

이 명령어를 입력하는 것부터 시작해보죠!

<!--sec data-title="Your first command: OS X and Linux" data-id="OSX_Linux_whoami" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    $ whoami
    

<!--endsec-->

<!--sec data-title="Your first command: Windows" data-id="windows_whoami" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    > whoami
    

<!--endsec-->

그리고 `Enter`를 누르세요. 다음과 같이 보일 거에요.

{% filename %}command-line{% endfilename %}

    $ whoami 
    olasitarska
    

컴퓨터가 여러분 컴퓨터 사용자이름을 보여주네요. 괜찮지 않아요? :) 

> 복사해서 붙여넣기 하지 말고, 직접 입력해 보세요. 더 잘 외워질 거예요!

## 기본 명령어

각각의 운영체제에 따라, 명령어들이 조금씩 다를 수도 있으니까, 여러분의 운영체제에 해당하는 설명을 따라주세요. 그럼 같이 해볼까요?

### 현재 디렉토리

우리가 지금 어느 폴더에 있는지 알면 좋겠죠? 아래의 명렁을 입력하고 `Enter`를 눌러보세요:

<!--sec data-title="Current directory: OS X and Linux" data-id="OSX_Linux_pwd" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    $ pwd
    /Users/olasitarska
    

> 참고: 'pwd' 는 'print working directory(작업중인 디렉토리 출력)'의 줄임말이에요.

<!--endsec-->

<!--sec data-title="Current directory: Windows" data-id="windows_cd" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    > cd 
    C:\Users\olasitarska
    

> 참고 'cd'는 'change directory(디렉토리 변경)'의 줄임말이에요. 'Powershell'을 사용하면 Linux나 Mac OS X 처럼 윈도우에서도 'pwd'명령어를 사용할 수 있어요.

<!--endsec-->

위와 비슷한 결과가 출력되었을 거예요. 커맨드라인을 열면, 항상 여러분의 '사용자 홈 디렉토리' 에서 시작하게 됩니다

* * *

### 명령에 대해 더 배워보기

명령창에 내장된 입력할 수 있는 많은 명령들은 표시하고 읽을 수 있는 많은 도움말이 내장되어 있어요. 예를 들어, 현재 디렉토리 명령에 대해 배워보아요:

<!--sec data-title="Command help: OS X and Linux" data-id="OSX_Linux_man" data-collapse=true ces-->

OS X 와 Linux 는 `man` 이라는 명령어가 도움을 줄거에요. `man pwd` 입력하고 어떻게 나오는지 보아요, 혹은 다른명령어 앞에 `man` 을 붙여 입력하면 해당명령어의 도움말을 볼 수 있어요. `man` 은 보통 페이징되어있어요. 스페이스바를 눌러 다음 장으로 이동하고 `q` 를 눌러 도움말을 종료할 수 있어요.

<!--endsec-->

<!--sec data-title="Command Help: Windows" data-id="windows_help" data-collapse=true ces-->

명령어에 `/?` 접미사를 붙여 도움말을 출력할 수 있어요. 아마 띄워진 화면을 스크롤 해야할 거에요. `cd /?`를 시도해 보세요.

<!--endsec-->

### 파일과 디렉토리 목록 보기

여기에는 뭐가 있는지 알아낼 수 있다면 좋겠지요? 그럼 같이 해봐요.

<!--sec data-title="List files and directories: OS X and Linux" data-id="OSX_Linux_ls" data-collapse=true ces-->

{% filename %}명령줄{% endfilename %}

    $ ls 
    Applications 
    Desktop 
    Downloads 
    Music 
    ...
    

<!--endsec-->

<!--sec data-title="List files and directories: Windows" data-id="windows_dir" data-collapse=true ces-->

{% filename %}명령줄{% endfilename %}

    > dir  
    Directory of C:\Users\olasitarska 
    05/08/2014 07:28 PM <DIR> Applications 
    05/08/2014 07:28 PM <DIR> Desktop 
    05/08/2014 07:28 PM <DIR> Downloads 
    05/08/2014 07:28 PM <DIR> Music 
    ...
    

> 주의: 파워셸에서는 Linux 와 Mac OS X처럼 'ls'명령을 사용할 수 있어요.<!--endsec-->

* * *

### 현재 디렉토리 변경

자, 바탕화면 디렉토리로 가볼까요:

<!--sec data-title="Change current directory: OS X" data-id="OSX_move_to" data-collapse=true ces-->

{% filename %}명령줄{% endfilename %}

    $ cd Desktop
    

<!--endsec-->

<!--sec data-title="Change current directory: Linux" data-id="Linux_move_to" data-collapse=true ces-->

{% filename %}명령줄{% endfilename %}

    $ cd Desktop
    

"Desktop" 이라는 디렉토리명은 당신의 Linux계정의 언어 설정에 따라 번역되어있을 수 있으니 주의하세요. 이런경우 `Desktop`을 번역된 이름으로 바꾸어야 해요. 예를 들어, 독일어의 경우 `Schreibtisch` 이에요.

<!--endsec-->

<!--sec data-title="Change current directory: Windows" data-id="windows_move_to" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    > cd Desktop
    

<!--endsec-->

정말 변경되었는지 볼까요:

<!--sec data-title="Check if changed: OS X and Linux" data-id="OSX_Linux_pwd2" data-collapse=true ces-->

{% filename %}명령줄{% endfilename %}

    $ pwd
    /Users/olasitarska/Desktop
    

<!--endsec-->

<!--sec data-title="Check if changed: Windows" data-id="windows_cd2" data-collapse=true ces-->

{% filename %}명령줄{% endfilename %}

    > cd
    C:\Users\olasitarska\Desktop
    

<!--endsec-->

맞군요!

> 전문가 팁: `cd D`까지 입력하고 `tab`(탭) 키를 누르면, 커맨드라인이 자동으로 나머지 부분을 완성해 주기 때문에, 시간을 절약할 수 있어요. "D"로 시작하는 폴더가 2개 이상일 경우, `tab`(탭) 키를 두 번 누르면, 해당하는 폴더들을 다 보여줍니다.

* * *

### 새 디렉토리 만들기

바탕 화면에 연습 디렉터리를 만들어 볼까요? 이렇게 하면 돼요:

<!--sec data-title="Create directory: OS X and Linux" data-id="OSX_Linux_mkdir" data-collapse=true ces-->

{% filename %}명령줄{% endfilename %}

    $ mkdir practice
    

<!--endsec-->

<!--sec data-title="Create directory: Windows" data-id="windows_mkdir" data-collapse=true ces-->

{% filename %}명령줄{% endfilename %}

    > mkdir practice
    

<!--endsec-->

이 간단한 명령어가, 바탕화면에 `practice` 라는 이름의 폴더를 만들어 줍니다. 바탕화면에서 직접 보거나, 명령어 `ls` 혹은 `dir`을 실행해서 확인할 수 있어요! 한 번 해보세요. :)

> 전문가 팁: 같은 명령어를 여러 번 반복해서 입력하고 싶지 않다면, 키보드의 `위 화살표`와 `아래 화살표`를 눌러서 최근 사용한 명령어들을 볼 수 있어요.

* * *

### 연습문제!

작은 도전 과제를 드릴게요: 새로 만든 `practice` 디렉토리 안에 `test` 라는 이름의 디렉토리를 만들어 보세요. 명령어 `cd` 와 `mkdir`을 사용하세요. 

#### 답:

<!--sec data-title="Exercise solution: OS X and Linux" data-id="OSX_Linux_test_dir" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    $ cd practice
    $ mkdir test
    $ ls
    test
    

<!--endsec-->

<!--sec data-title="Exercise solution: Windows" data-id="windows_test_dir" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    > cd practice
    > mkdir test
    > dir
    05/08/2014 07:28 PM <DIR>      test
    

<!--endsec-->

Congrats! :)

* * *

### 정리

어지럽힌 흔적은 남기고 싶지 않지요, 지금까지 한 것들을 모두 지워봅시다!

우선, 바탕화면으로 돌아가야해요.

<!--sec data-title="Clean up: OS X and Linux" data-id="OSX_Linux_back" data-collapse=true ces-->

{% filename %}명령줄{% endfilename %}

    $ cd ..
    

<!--endsec-->

<!--sec data-title="Clean up: Windows" data-id="windows_back" data-collapse=true ces-->

{% filename %}명령줄{% endfilename %}

    > cd ..
    

<!--endsec-->

`..`과 `cd` 명령은 현재 디렉토리에서 (현재 디렉토리보다 한수준 위인) 부모 디렉토리로 보내줄겁니다. 

현재 위치를 확인해 보세요:

<!--sec data-title="Check location: OS X and Linux" data-id="OSX_Linux_pwd3" data-collapse=true ces-->

{% filename %}명령줄{% endfilename %}

    $ pwd
    /Users/olasitarska/Desktop
    

<!--endsec-->

<!--sec data-title="Check location: Windows" data-id="windows_cd3" data-collapse=true ces-->

{% filename %}명령줄{% endfilename %}

    > cd
    C:\Users\olasitarska\Desktop
    

<!--endsec-->

이제 `practice` 디렉토리를 삭제할시간이에요:

> **주의**: `del`, `rmdir` 혹은 `rm` 을 사용하여 파일을 지울 경우, 복구할 수가 없습니다, *지워진 파일들을 영원히 사라지게 됩니다*! 그러니, 이 명령어들은 주의해서 사용하세요.

<!--sec data-title="Delete directory: Windows Powershell, OS X and Linux" data-id="OSX_Linux_rm" data-collapse=true ces-->

{% filename %}명령줄{% endfilename %}

    $ rm -r practice
    

<!--endsec-->

<!--sec data-title="Delete directory: Windows Command Prompt" data-id="windows_rmdir" data-collapse=true ces-->

{% filename %}명령줄{% endfilename %}

    > rmdir /S practice
    practice, Are you sure <Y/N>? Y
    

<!--endsec-->

완료! 실제로 삭제되었는지, 확인해 봅시다:

<!--sec data-title="Check deletion: OS X and Linux" data-id="OSX_Linux_ls2" data-collapse=true ces-->

{% filename %}명령줄{% endfilename %}

    $ ls
    

<!--endsec-->

<!--sec data-title="Check deletion: Windows" data-id="windows_dir2" data-collapse=true ces-->

{% filename %}명령줄{% endfilename %}

    > dir
    

<!--endsec-->

### 종료

여기까지입니다! 이제 안전하게 커맨드라인을 닫아볼게요. 해커 스타일로 해 보죠, 어때요? :)

<!--sec data-title="Exit: OS X and Linux" data-id="OSX_Linux_exit" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    $ exit
    

<!--endsec-->

<!--sec data-title="Exit: Windows" data-id="windows_exit" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    > exit
    

<!--endsec-->

멋지죠? :)

## 요역

유용한 명령어들을 모아봤어요:

| 명령어(윈도우)       | 명령어(맥 OS/리눅스) | 설명                  | 예시                                                 |
| -------------- | ------------- | ------------------- | -------------------------------------------------- |
| exit           | exit          | 창을 닫는다              | **exit**                                           |
| cd             | cd            | 디렉토리를 변경한다          | **cd test**                                        |
| cd             | pwd           | 현재 디렉토리를 보여준다       | **cd** (Windows) or **pwd** (Mac OS / Linux)       |
| dir            | ls            | 디렉토리 혹은 파일 목록을 보여준다 | **dir**                                            |
| copy           | cp            | 파일을 복사한다            | **copy c:\test\test.txt c:\windows\test.txt**  |
| move           | mv            | 파일을 이동한다            | **move c:\test\test.txt c:\windows\test.txt**  |
| mkdir          | mkdir         | 새 디렉토리를 만든다         | **mkdir testdirectory**                            |
| rmdir (or del) | rm            | 파일을 지운다             | **del c:\test\test.txt**                         |
| rmdir /S       | rm -r         | 디렉토리를 지운다           | **rm -r testdirectory**                            |
| [CMD] /?       | man [CMD]     | 명령에 대한 도움말을 표시한다    | **cd /?** (Windows) or **man cd** (Mac OS / Linux) |

커맨드라인에서 실행할 수 있는 명령어들 중에 아주 일부만 소개했지만, 오늘은 이정도만 알아도 충분할 거에요. 

하지만 더 많은 명령어가 궁금하신 분은 [ss64.com](http://ss64.com)에서 모든 운영체제별로 정리된 명령어 모음집을 확인하실 수 있어요.

## 준비되셨나요?

이제 파이썬의 세계로 빠져봅시다!