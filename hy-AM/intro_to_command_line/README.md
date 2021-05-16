# Հրամանի տողի ինտերֆեյսի /command-line interface ներածություն

> Նրանց համար, ովքեր ձեռնարկն անցնում են տանը. Ձեր նոր ընկերը ՝ [հրամանի տողը/ Command Line](https://www.youtube.com/watch?v=jvZLWhkzX-8), խոսում է այս գլխի նյութի մասին:

Ցնցող է, չէ՞:Մի քանի րոպեից դուք կգրեք ձեր առաջին տողի ծածկագիրը: :)

**Թույլ տվեք ներկայացնել ձեր առաջին նոր ընկերոջը. Հրամանի տող/command line:**

Հաջորդ քայլերը ցույց կտան, թե ինչպես օգտագործել այն սև պատուհանը, որն օգտագործում են բոլոր հակերները: Սկզբում դա կարող է թվալ մի փոքր վախեցնող, բայց իրականում դա պարզապես պատուհան է, որը սպասում է ձեզանից հրահանգների:

> **Նշում** Խնդրում ենք նկատի ունենալ, որ այս ձեռնարկում մենք օգտագործում ենք «գրացուցակ/'directory'» և «թղթապանակ/'folder'» տերմինները փոխադարձաբար. Այս բառերը միևնույն բանն են նշանակում:

## Ի՞նչ է հրամանի տողը/command line: 

Պատուհանը, որը սովորաբար անվանում են **Հրամանի տող/ command line** կամ **«Հրամանի տողի միջերես»/command-line interface (CLI)** , տեքստի վրա հիմնված ծրագիր է ՝ ձեր համակարգչի վրա ֆայլերը դիտելու, մշակելու և շահարկելու համար: Դա անում է նույնը, ինչ Explorer- ը Windows- ում կամ Finder- ը Mac OS X- ում, բայց այն չունի գրաֆիկական ինտերֆեյս: Հրամանի տողի այլ անուններն են ՝ *cmd*, *CLI*, *prompt*, *console* կամ *terminal*:

## Բացեք հրամանի տողի միջերեսը/command-line interface

Որոշ փորձեր սկսելու համար նախ պետք է բացենք հրամանի տողի միջերեսը/command-line interface:

{% include "/intro_to_command_line/open_instructions.md" %}

## Հուշում

Այժմ դուք պետք է տեսնեք սպիտակ կամ սև պատուհան, որը սպասում է ձեր հրամաններին:

<!--sec data-title="Prompt: OS X and Linux" data-id="OSX_Linux_prompt" data-collapse=true ces-->

Եթե ​​ունեք Mac կամ Linux, ամենայն հավանականությամբ տողի վերջում կտեսնեք այս `$` նշանը.

{% filename %}command-line{% endfilename %}

    $
    

<!--endsec-->

<!--sec data-title="Prompt: Windows" data-id="windows_prompt2" data-collapse=true ces-->

Windows- ում, հավանաբար, տեսնում եք այս `>` նշանը. 

{% filename %}command-line{% endfilename %}

    >
    

Մի փոքր վերևում կարող եք աչքի անցկացնել Linux- ի օգտագործողների հրահանգները. Մենք նման բան կտեսնենք, երբ հասնենք ձեռնարկի PythonAnyplace- ին: 

<!--endsec-->

Յուրաքանչյուր հրամանին նախորդելու է `$` կամ `>` նշանը և տարածությունը/space: Բայց ձեզ հարկավոր չէ դրանք տպել: Համակարգիչը դա կանի ձեր փոխարեն :)

> Just a small note: in your case there may be something like `C:\Users\ola>` or `Olas-MacBook-Air:~ ola$` before the prompt sign, and this is 100% OK.

The part up to and including the `$` or the `>` is called the *command line prompt*, or *prompt* for short. It prompts you to input something there.

In the tutorial, when we want you to type in a command, we will include the `$` or `>`, and occasionally more to the left. Ignore the left part and only type in the command, which starts after the prompt.

## Your first command (YAY!)

Let's start by typing this command:

<!--sec data-title="Your first command: OS X and Linux" data-id="OSX_Linux_whoami" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    $ whoami
    

<!--endsec-->

<!--sec data-title="Your first command: Windows" data-id="windows_whoami" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    > whoami
    

<!--endsec-->

And then hit `enter`. This is our result:

{% filename %}command-line{% endfilename %}

    $ whoami
    olasitarska
    

As you can see, the computer has just printed your username. Neat, huh? :)

> Try to type each command; do not copy-paste. You'll remember more this way!

## Basics

Each operating system has a slightly different set of commands for the command line, so make sure to follow instructions for your operating system. Let's try this, shall we?

### Current directory

It'd be nice to know where are we now, right? Let's see. Type this command and hit `enter`:

<!--sec data-title="Current directory: OS X and Linux" data-id="OSX_Linux_pwd" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    $ pwd
    /Users/olasitarska
    

> Note: 'pwd' stands for 'print working directory'.

<!--endsec-->

<!--sec data-title="Current directory: Windows" data-id="windows_cd" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    > cd
    C:\Users\olasitarska
    

> Note: 'cd' stands for 'change directory'. With PowerShell you can use pwd just like on Linux or Mac OS X.

<!--endsec-->

You'll probably see something similar on your machine. Once you open the command line you usually start at your user's home directory.

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
    05/08/2020 07:28 PM <DIR>      Applications
    05/08/2020 07:28 PM <DIR>      Desktop
    05/08/2020 07:28 PM <DIR>      Downloads
    05/08/2020 07:28 PM <DIR>      Music
    ...
    

> Note: In PowerShell you can also use 'ls' like on Linux and Mac OS X. <!--endsec-->

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

### Վարժություն

Մի փոքր առաջադրանք. Նորաստեղծ `practice/պրակտիկայի` թղթապանակում ստեղծեք պանակ, որը կոչվում է `test`: (Օգտագործեք `cd` և `mkdir` հրահանգները):

#### Լուծում.

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
    05/08/2020 07:28 PM <DIR>      test
    

<!--endsec-->

Շնորհավորում ենք։

* * *

### Մաքրել

Մենք չենք ուզում խառնաշփոթ թողնել, ուստի եկեք ջնջենք այն ամենը, ինչ ստեղծել ենք մինչև այս պահը:

Նախ, մենք պետք է վերադառնանք Desktop / աշխատասեղան.

<!--sec data-title="Clean up: OS X and Linux" data-id="OSX_Linux_back" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    $ cd ..
    

<!--endsec-->

<!--sec data-title="Clean up: Windows" data-id="windows_back" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    > cd ..
    

<!--endsec-->

Օգտագործելով ` .. `-ի և ` cd ` - ի հրամանները միասին դուք կարող եք փոխել ընթացիկ գրացուցակը/current directory ծնող գրացուցակի/parent directory (այսինքն ՝ գրացուցակը, որը պարունակում է ձեր ընթացիկ գրացուցակը)

Ստուգեք, թե որտեղ եք դուք ՝

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

Հիմա ժամանակն է ջնջել `practice` գրացուցակը.

> ** Ուշադրություն **. `del`, `rmdir` կամ `rm`ֆայլերը ջնջելը անվերադարձ է, այսինքն ՝ *ջնջված ֆայլերը կվերանան ընդմիշտ*!: Այսպիսով, շատ զգույշ եղեք այս հրամանի հետ:

<!--sec data-title="Delete directory: Windows Powershell, OS X and Linux" data-id="OSX_Linux_rm" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    $ rm -r practice
    

<!--endsec-->

<!--sec data-title="Delete directory: Windows Command Prompt" data-id="windows_rmdir" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    > rmdir /S practice
    practice, Are you sure <Y/N>? Y
    

<!--endsec-->

Կատարած է! Համոզված լինելու համար, որ այն իրականում ջնջված է, եկեք ստուգենք այն.

<!--sec data-title="Check deletion: OS X and Linux" data-id="OSX_Linux_ls2" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    $ ls
    

<!--endsec-->

<!--sec data-title="Check deletion: Windows" data-id="windows_dir2" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    > dir
    

<!--endsec-->

### Ելք

Առայժմ վերջ: Այժմ կարող եք ապահով կերպով փակել հրամանի տողը: Եկեք դա անենք հակերային եղանակով, լա՞վ: :)

<!--sec data-title="Exit: OS X and Linux" data-id="OSX_Linux_exit" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    $ exit
    

<!--endsec-->

<!--sec data-title="Exit: Windows" data-id="windows_exit" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    > exit
    

<!--endsec-->

Հերիք է, հա՞: :)

## Ամփոփում

Ահա մի քանի օգտակար հրամանների ամփոփ նկարագրություն.

| Command (Windows) | Command (Mac OS / Linux) | Description                | Example                                            |
| ----------------- | ------------------------ | -------------------------- | -------------------------------------------------- |
| exit              | exit                     | close the window           | **exit**                                           |
| cd                | cd                       | change directory           | **cd test**                                        |
| cd                | pwd                      | show the current directory | **cd** (Windows) or **pwd** (Mac OS / Linux)       |
| dir               | ls                       | list directories/files     | **dir**                                            |
| copy              | cp                       | copy file                  | **copy c:\test\test.txt c:\windows\test.txt**  |
| move              | mv                       | move file                  | **move c:\test\test.txt c:\windows\test.txt**  |
| mkdir             | mkdir                    | create a new directory     | **mkdir testdirectory**                            |
| rmdir (or del)    | rm                       | delete a file              | **del c:\test\test.txt**                         |
| rmdir /S          | rm -r                    | delete a directory         | **rm -r testdirectory**                            |
| [CMD] /?          | man [CMD]                | get help for a command     | **cd /?** (Windows) or **man cd** (Mac OS / Linux) |

Սրանք ընդամենը հրամաններից մի քանիսն են, որոնք կարող եք գործարկել ձեր հրամանի տողում/command line, բայց այսօր դրանից ավելին չեք օգտագործելու:

Եթե ​​ձեզ հետաքրքրում է, [ss64.com](http://ss64.com) - ը պարունակում է հրամանի ամբողջական հղում բոլոր օպերացիոն համակարգերի համար:

## Պատրա՞ստ եք

Եկեք խորասուզվենք Python- ի մեջ: