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
    

Take a look at the Linux section just above now -- you'll see something more like that when you get to PythonAnywhere later in the tutorial.

<!--endsec-->

Each command will be prepended by a `$` or `>` and one space, but you should not type it. Your computer will do it for you. :)

> Just a small note: in your case there may be something like `C:\Users\ola>` or `Olas-MacBook-Air:~ ola$` before the prompt sign, and this is 100% OK.

The part up to and including the `$` or the `>` is called the *command line prompt*, or *prompt* for short. It prompts you to input something there.

In the tutorial, when we want you to type in a command, we will include the `$` or `>`, and occasionally more to the left. Ignore the left part and only type in the command, which starts after the prompt.

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

### Learn more about a command

Many commands you can type at the command prompt have built-in help that you can display and read! For example, to learn more about the current directory command:

<!--sec data-title="Command help: OS X and Linux" data-id="OSX_Linux_man" data-collapse=true ces-->

OS X and Linux have a `man` command, which gives you help on commands. Try `man pwd` and see what it says, or put `man` before other commands to see their help. The output of `man` is normally paged. Use the space bar to move to the next page, and `q` to quit looking at the help.

<!--endsec-->

<!--sec data-title="Command Help: Windows" data-id="windows_help" data-collapse=true ces-->

Adding a `/?` suffix to most commands will print the help page. You may need to scroll your command window up to see it all. Try `cd /?`.

<!--endsec-->

### List files and directories

So what's in it? It'd be cool to find out. Let's see:

<!--sec data-title="List files and directories: OS X and Linux" data-id="OSX_Linux_ls" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    $ ls 
    Applications 
    Desktop 
    Downloads 
    Music 
    ...
    

<!--endsec-->

<!--sec data-title="List files and directories: Windows" data-id="windows_dir" data-collapse=true ces-->

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

### Change current directory

Now, let's go to our Desktop directory:

<!--sec data-title="Change current directory: OS X" data-id="OSX_move_to" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    $ cd Desktop
    

<!--endsec-->

<!--sec data-title="Change current directory: Linux" data-id="Linux_move_to" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    $ cd Desktop
    

Note that the directory name "Desktop" might be translated to the language of your Linux account. If that's the case, you'll need to replace `Desktop` with the translated name; for example, `Schreibtisch` for German.

<!--endsec-->

<!--sec data-title="Change current directory: Windows" data-id="windows_move_to" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    > cd Desktop
    

<!--endsec-->

Check if it's really changed:

<!--sec data-title="Check if changed: OS X and Linux" data-id="OSX_Linux_pwd2" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    $ pwd
    /Users/olasitarska/Desktop
    

<!--endsec-->

<!--sec data-title="Check if changed: Windows" data-id="windows_cd2" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    > cd
    C:\Users\olasitarska\Desktop
    

<!--endsec-->

Here it is!

> PRO tip: if you type `cd D` and then hit `tab` on your keyboard, the command line will automatically fill in the rest of the name so you can navigate faster. If there is more than one folder starting with "D", hit the `tab` key twice to get a list of options.

* * *

### Create directory

How about creating a practice directory on your desktop? You can do it this way:

<!--sec data-title="Create directory: OS X and Linux" data-id="OSX_Linux_mkdir" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    $ mkdir practice
    

<!--endsec-->

<!--sec data-title="Create directory: Windows" data-id="windows_mkdir" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    > mkdir practice
    

<!--endsec-->

This little command will create a folder with the name `practice` on your desktop. You can check if it's there by looking on your Desktop or by running a `ls` or `dir` command! Try it. :)

> PRO tip: If you don't want to type the same commands over and over, try pressing the `up arrow` and `down arrow` on your keyboard to cycle through recently used commands.

* * *

### Exercise!

A small challenge for you: in your newly created `practice` directory, create a directory called `test`. (Use the `cd` and `mkdir` commands.)

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

### Clean up

We don't want to leave a mess, so let's remove everything we did until that point.

First, we need to get back to Desktop:

<!--sec data-title="Clean up: OS X and Linux" data-id="OSX_Linux_back" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    $ cd ..
    

<!--endsec-->

<!--sec data-title="Clean up: Windows" data-id="windows_back" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    > cd ..
    

<!--endsec-->

Using `..` with the `cd` command will change your current directory to the parent directory (that is, the directory that contains your current directory).

Check where you are:

<!--sec data-title="Check location: OS X and Linux" data-id="OSX_Linux_pwd3" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    $ pwd
    /Users/olasitarska/Desktop
    

<!--endsec-->

<!--sec data-title="Check location: Windows" data-id="windows_cd3" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    > cd
    C:\Users\olasitarska\Desktop
    

<!--endsec-->

Now time to delete the `practice` directory:

> **Attention**: Deleting files using `del`, `rmdir` or `rm` is irrecoverable, meaning *the deleted files will be gone forever*! So be very careful with this command.

<!--sec data-title="Delete directory: Windows Powershell, OS X and Linux" data-id="OSX_Linux_rm" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    $ rm -r practice
    

<!--endsec-->

<!--sec data-title="Delete directory: Windows Command Prompt" data-id="windows_rmdir" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    > rmdir /S practice
    practice, Are you sure <Y/N>? Y
    

<!--endsec-->

Done! To be sure it's actually deleted, let's check it:

<!--sec data-title="Check deletion: OS X and Linux" data-id="OSX_Linux_ls2" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    $ ls
    

<!--endsec-->

<!--sec data-title="Check deletion: Windows" data-id="windows_dir2" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

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