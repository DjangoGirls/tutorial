# Ìfihàn sí atọ́kùn ìlà ìpàṣẹ náà

> Fún àwọn òǹkàwé ní ilé: a ti ṣàlàyé àkòrí yìí nínú fídíò [Your new friend: Command Line](https://www.youtube.com/watch?v=jvZLWhkzX-8).

Ó ń dùn mọ́ni, àbí bẹ́ẹ̀ kọ? Ìwọ yíò kọ ìlà kóòdù àkọ́kọ́ rẹ láàárín ìṣẹ́jú díẹ̀! :)

**Jẹ́ kí a mú ọ mọ ọ̀rẹ́ tuntun àkọ́kọ́ rẹ: ìlà ìpàṣẹ náà!**

Àwọn ìgbésẹ̀ wọ̀nyí yíò fihàn ọ́ bí o ṣe lè lo fèrèsé dúdú tí gbogbo àwọn hacker má n lò. Ó lè dẹ́rù bà ọ́ díẹ̀ lákọ̀ọ́kọ́ ṣùgbọ́n lóòótọ́ ó kàn jẹ́ ètò kan tó n dúró de àwọn àṣẹ láti ọ̀dọ̀ rẹ.

> **Àkíyèsí** Jọ̀wọ́ ṣàkíyèsí pé káàkiri ìwé yìí, a lo àwọn ọ̀rọ̀ 'àkójọpọ̀ fáìlì' (directory) àti 'fódà' (folder) ní pàṣípààrọ̀ ṣùgbọ́n wọn jẹ́ ohun kannáà.

## Kíni ìlà ìpàṣẹ náà?

Fèrèsé náà, èyí tí a sábà má n pè ní **ìlà ìpàṣẹ** tàbí **atọ́kùn ìlà ìpàṣẹ**, jẹ́ ètò kan tó dá lórí ọ̀rọ̀ fún wíwo, bíbójútó, àti dídarí àwọn fáìlì lórí kọ̀mpútà rẹ. Ó dà bíi Windows Explorer tàbí Finder lórí Mac, ṣùgbọ́n láìsí atọ́kùn aláwòrán náà. Àwọn orúkọ mìíràn fún ìlà ìpàṣẹ náà jẹ́: *cmd*, *CLI*, *prompt*, *console* tàbí *terminal*.

## Ṣí atọ́kùn ìlà ìpàṣẹ náà

Láti bẹ̀rẹ̀ àwọn ìdánrawò kan, a nílò láti kọ́kọ́ ṣí atọ́kùn ìlà ìpàṣẹ wa.

{% include "/intro_to_command_line/open_instructions.md" %}

## Prompt

Ní báyìí, ó yẹ kí o rí fèrèsé funfun tàbí dúdú kan tó n dúró de àwọn àṣẹ rẹ.

<!--sec data-title="Prompt: OS X and Linux" data-id="OSX_Linux_prompt" data-collapse=true ces-->

Tí o bá wà lórí Mac tàbí Linux, ó ṣeéṣe kí o rí `$` kan, báyìí:

{% filename %}command-line{% endfilename %}

    $
    

<!--endsec-->

<!--sec data-title="Prompt: Windows" data-id="windows_prompt2" data-collapse=true ces-->

Lórí Windows, ó ṣeéṣe kí o rí `>` kan, báyìí:

{% filename %}command-line{% endfilename %}

    >
    

Ṣàyẹ̀wò abala Linux tí a ṣẹ̀ṣẹ̀ kọjá sókè -- ìwọ yíò rí nnkan kan tó jọ bẹ́ẹ̀ nígbà tí o bá dé PythonAnywhere tó bá yá nínú àlàyé náà.

<!--endsec-->

Àṣẹ kọ̀ọ̀kan yíò bẹ̀rẹ̀ pẹ̀lú `$` tàbí `>` àti àlàfo kan, ṣùgbọ́n ìwọ kò gbọ́dọ̀ tẹ̀ ẹ́. Kọ̀mpútà rẹ yíò ṣe fún ọ. :)

> Àkíyèsí kékeré kan: ó ṣeéṣe kí o rí nnkan kan bíi `C:\Users\ola>` tàbí `Olas-MacBook-Air:~ ola$` ṣáájú àmì prompt náà, èyí dára 100%.

The part up to and including the `$` or the `>` is called the *command line prompt*, or *prompt* for short. It prompts you to input something there.

In the tutorial, when we want you to type in a command, we will include the `$` or `>`, and occasionally more to the left. Ignore the left part and only type in the command, which starts after the prompt.

## Àṣẹ àkọ́kọ́ rẹ (YAY!)

Jẹ́ ká bẹ̀rẹ̀ nípasẹ̀ títẹ̀ àṣẹ yìí:

<!--sec data-title="Your first command: OS X and Linux" data-id="OSX_Linux_whoami" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    $ whoami
    

<!--endsec-->

<!--sec data-title="Your first command: Windows" data-id="windows_whoami" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    > whoami
    

<!--endsec-->

Lẹ́yìn náà tẹ `enter`. Èyí ni èsì wa:

{% filename %}command-line{% endfilename %}

    $ whoami
    olasitarska
    

As you can see, the computer has just printed your username. Neat, huh? :)

> Gbìyànjú láti tẹ àṣẹ kọ̀ọ̀kan; má ṣàdàkọ rẹ̀. Ìwọ yíò rántí ní ìrọ̀rùn lọ́nà yìí!

## Àwọn ìpìlẹ̀

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
    

> Note: 'cd' stands for 'change directory'. With powershell you can use pwd just like on Linux or Mac OS X.

<!--endsec-->

You'll probably see something similar on your machine. Once you open the command line you usually start at your user's home directory.

* * *

### Learn more about a command

Many commands you can type at the command prompt have built-in help that you can display and read! For example, to learn more about the current directory command:

<!--sec data-title="Command help: OS X and Linux" data-id="OSX_Linux_man" data-collapse=true ces-->

OS X and Linux have a `man` command, which gives you help on commands. Try `man pwd` and see what it says, or put `man` before other commands to see their help. The output of `man` is normally paged. Use the space bar to move to the next page, and `q` to quit looking at the help.

<!--endsec-->

<!--sec data-title="Current directory: Windows" data-id="windows_help" data-collapse=true ces-->

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
    05/08/2014 07:28 PM <DIR>      Applications
    05/08/2014 07:28 PM <DIR>      Desktop
    05/08/2014 07:28 PM <DIR>      Downloads
    05/08/2014 07:28 PM <DIR>      Music
    ...
    

> Note: In powershell you can also use 'ls' like on Linux and Mac OS X. <!--endsec-->

* * *

### Change current directory

Ní báyìí, ẹ jẹ́ ká lọ sí àkójọpọ̀ fáìlì Desktop wa:

<!--sec data-title="Change current directory: OS X" data-id="OSX_move_to" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    $ cd Desktop
    

<!--endsec-->

<!--sec data-title="Change current directory: Linux" data-id="Linux_move_to" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    $ cd Desktop
    

Ṣàkíyèsí pé ó ṣeéṣe kí a túmọ̀ orúkọ àkójọpọ̀ fáìlì "Desktop" náà sí èdè account Linux rẹ. If that's the case, you'll need to replace `Desktop` with the translated name; for example, `Schreibtisch` for German.

<!--endsec-->

<!--sec data-title="Change current directory: Windows" data-id="windows_move_to" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    > cd Desktop
    

<!--endsec-->

Ṣàyẹ̀wò bóyá ó ti yípadà lóòótọ́:

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

Òhun nìyí!

> PRO tip: if you type `cd D` and then hit `tab` on your keyboard, the command line will automatically fill in the rest of the name so you can navigate faster. If there is more than one folder starting with "D", hit the `tab` key twice to get a list of options.

* * *

### Ṣẹ̀dá àkójọpọ̀ fáìlì

How about creating a practice directory on your desktop? You can do it this way:

<!--sec data-title="Create directory: OS X and Linux" data-id="OSX_Linux_mkdir" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    $ mkdir practice
    

<!--endsec-->

<!--sec data-title="Create directory: Windows" data-id="windows_mkdir" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    > mkdir practice
    

<!--endsec-->

Àṣẹ kékeré yìí yíò ṣẹ̀dá fódà kan pẹ̀lú orúkọ `practice` náà sórí desktop rẹ. You can check if it's there by looking on your Desktop or by running a `ls` or `dir` command! Try it. :)

> PRO tip: If you don't want to type the same commands over and over, try pressing the `up arrow` and `down arrow` on your keyboard to cycle through recently used commands.

* * *

### Exercise!

A small challenge for you: in your newly created `practice` directory, create a directory called `test`. (Use the `cd` and `mkdir` commands.)

#### Solution:

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

### Exit

That's it for now! You can safely close the command line now. Let's do it the hacker way, alright? :)

<!--sec data-title="Exit: OS X and Linux" data-id="OSX_Linux_exit" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    $ exit
    

<!--endsec-->

<!--sec data-title="Exit: Windows" data-id="windows_exit" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    > exit
    

<!--endsec-->

Cool, huh? :)

## Summary

Here is a summary of some useful commands:

| Àṣẹ (Windows)  | Àṣẹ (Mac OS / Linux) | Àpèjúwe                                    | Àpẹẹrẹ                                               |
| -------------- | -------------------- | ------------------------------------------ | ---------------------------------------------------- |
| exit           | exit                 | pa fèrèsé náà dé                           | **exit**                                             |
| cd             | cd                   | ṣàyípadà àkójọpọ̀ fáìlì                    | **cd test**                                          |
| cd             | pwd                  | ṣàfihàn àkójọpọ̀ fáìlì lọ́wọ́lọ́wọ́ náà    | **cd** (Windows) tàbí **pwd** (Mac OS / Linux)       |
| dir            | ls                   | ṣe àkọsílẹ̀ àwọn àkójọpọ̀ fáìlì/àwọn fáìlì | **dir**                                              |
| copy           | cp                   | ṣe àdàkọ fáìlì                             | **copy c:\test\test.txt c:\windows\test.txt**    |
| move           | mv                   | gbé fáìlì                                  | **move c:\test\test.txt c:\windows\test.txt**    |
| mkdir          | mkdir                | ṣẹ̀dá àkójọpọ̀ fáìlì tuntun kan            | **mkdir testdirectory**                              |
| rmdir (or del) | rm                   | yọ fáìlì kan kúrò                          | **del c:\test\test.txt**                           |
| rmdir /S       | rm -r                | yọ àkójọpọ̀ fáìlì kan kúrò                 | **rm -r testdirectory**                              |
| [CMD] /?       | man [CMD]            | gba ìrànlọ́wọ́ fún àṣẹ kan                 | **cd /?** (Windows) tàbí **man cd** (Mac OS / Linux) |

These are just a very few of the commands you can run in your command line, but you're not going to use anything more than that today.

If you're curious, [ss64.com](http://ss64.com) contains a complete reference of commands for all operating systems.

## Ṣé o ti ṣetán?

Jẹ́ ká wọ inú Python!