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

Apá náà títí dé àti pẹ̀lú `$` tàbí `>` náà ní a pè ní *command line prompt*, tàbí *prompt* ní kúkúrú. Yíò fún ọ ní ìṣítí láti tẹ nnkan kan síbẹ̀.

Nínú àlàyé náà, nígbà tí a bá fẹ́ kí o tẹ àṣẹ kan, a ó ṣàfikún `$` tàbí `>` náà, àti àwọn nnkan mìíràn sí apá òsì lẹ́ẹ̀kọ̀ọ̀kan. Fojú fo apá òsì náà kí o sì tẹ àṣẹ náà nìkan, èyí tí yíò bẹ̀rẹ̀ lẹ́yìn prompt náà.

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
    

Gẹ́gẹ́ bó o ṣe rí i, kọ̀mpútà náà ṣẹ̀ṣẹ̀ ṣàtẹ̀jáde orúkọ aṣàmúlò rẹ. Ó já fáfá, àbí bẹ́ẹ̀ kọ? :)

> Gbìyànjú láti tẹ àṣẹ kọ̀ọ̀kan; má ṣàdàkọ rẹ̀. Ìwọ yíò rántí ní ìrọ̀rùn lọ́nà yìí!

## Àwọn ìpìlẹ̀

Ètò ìṣiṣẹ́ kọ̀mpútà kọ̀ọ̀kan ló ní ìlànà àwọn àṣẹ tó yàtọ̀ síra fún ìlà ìpàṣẹ náà, nítorí náà ri dájú láti tẹ̀lé àwọn ìtọ́sọ́nà fún ètò ìṣiṣẹ́ rẹ. Jẹ́ ká gbìyànjú èyí, ṣé ká bẹ̀rẹ̀?

### Àkójọpọ̀ fáìlì lọ́wọ́lọ́wọ́

Yíò dára láti mọ ibi tí a wà ní báyìí, àbí bẹ́ẹ̀ kọ? Jẹ́ ká ri. Tẹ àṣẹ yìí kí o sì tẹ `enter`:

<!--sec data-title="Current directory: OS X and Linux" data-id="OSX_Linux_pwd" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    $ pwd
    /Users/olasitarska
    

> Àkíyèsí: 'pwd' dúró fún 'print working directory' (ṣàtẹ̀jáde àkójọpọ̀ fáìlì tó n ṣiṣẹ́).

<!--endsec-->

<!--sec data-title="Current directory: Windows" data-id="windows_cd" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    > cd
    C:\Users\olasitarska
    

> Note: 'cd' stands for 'change directory'. With PowerShell you can use pwd just like on Linux or Mac OS X.

<!--endsec-->

Ó ṣeéṣe kí o rí ohun tó jọ bẹ́ẹ̀ lórí ẹ̀rọ rẹ. Tó o bá ṣí ìlà ìpàṣẹ náà, o sábà máa ń bẹ̀rẹ̀ láti àkójọpọ̀ fáìlì ìpìlẹ̀ ti aṣàmúlò rẹ.

* * *

### Kẹ́kọ̀ọ́ sí i nípa àṣẹ kan

Ọ̀pọ̀lọpọ̀ àwọn àṣẹ tí o lè tẹ̀ ní command prompt náà ní ìrànlọ́wọ́ tó ba wá tí o lè ṣàfihàn àti kà! Fún àpẹẹrẹ, láti kẹ́kọ̀ọ́ sí i nípa àṣẹ àkójọpọ̀ fáìlì lọ́wọ́lọ́wọ́ náà:

<!--sec data-title="Command help: OS X and Linux" data-id="OSX_Linux_man" data-collapse=true ces-->

OS X àti Linux ní àṣẹ `man` kan, èyí tí yíò fún ọ ní ìrànlọ́wọ́ lórí àwọn àṣẹ. Gbìyànjú `man pwd` kí o sì rí ohun tí yíò sọ, tàbí tẹ `man` ṣáájú àwọn àṣẹ mìíràn láti rí ìrànlọ́wọ́ wọn. Èsì `man` náà má n sábà ní àwọn ojú-ìwé. Lo bọ́tìnnì àlàfo náà láti bọ́ sí ojú-ìwé tó kàn, àti `q` láti jáwọ́ nínú wíwo ìrànlọ́wọ́ náà.

<!--endsec-->

<!--sec data-title="Command Help: Windows" data-id="windows_help" data-collapse=true ces-->

Ṣíṣe àfikún `/?` kan sẹ́yìn ọ̀pọ̀lọpọ̀ àwọn àṣẹ yíò ṣàtẹ̀jáde ojú-ìwé ìrànlọ́wọ́ náà. O lè nílò láti sún fèrèsé ìpàṣẹ rẹ sókè láti rí gbogbo rẹ̀. Gbìyànjú `cd /?`.

<!--endsec-->

### Ṣe àkọsílẹ̀ àwọn fáìlì àti àwọn àkójọpọ̀ fáìlì

Nítorí náà kí ló wà nínú rẹ̀? Yíò dára láti rí ìdáhùn sí i. Jẹ́ ká ri:

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

### Ṣàyípadà àkójọpọ̀ fáìlì lọ́wọ́lọ́wọ́

Ní báyìí, ẹ jẹ́ ká lọ sí àkójọpọ̀ fáìlì Desktop wa:

<!--sec data-title="Change current directory: OS X" data-id="OSX_move_to" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    $ cd Desktop
    

<!--endsec-->

<!--sec data-title="Change current directory: Linux" data-id="Linux_move_to" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    $ cd Desktop
    

Ṣàkíyèsí pé ó ṣeéṣe kí a túmọ̀ orúkọ àkójọpọ̀ fáìlì "Desktop" náà sí èdè account Linux rẹ. Tó bá rí bẹ́ẹ̀, ìwọ yíò nílò láti rọ́pò `Desktop` pẹ̀lú orúkọ tí a túmọ̀ rẹ̀ sí; fún àpẹẹrẹ, `Schreibtisch` fún èdè Jẹ́mánì.

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

> Àmọ̀ràn akọ́ṣẹ́mọṣẹ́: tí o bá tẹ `cd D` tí o tún wá tẹ `tab` lórí pẹpẹ bọ́tìnnì rẹ, ìlà ìpàṣẹ náà yíò parí ìyókù orúkọ náà fúnra rẹ̀ kí o lè yàrá ṣiṣẹ́. Tí fódà tó ju ẹyọkan lọ bá wà tó n bẹ̀rẹ̀ pẹ̀lú "D", tẹ bọ́tìnnì `tab` náà lẹ́ẹ̀mejì láti rí àkójọ àwọn àṣàyàn kan.

* * *

### Ṣẹ̀dá àkójọpọ̀ fáìlì

Ṣíṣẹ̀dá àkójọpọ̀ fáìlì practice (ìdánrawò) kan lórí desktop rẹ ńkọ́? O lè ṣe é lọ́nà yìí:

<!--sec data-title="Create directory: OS X and Linux" data-id="OSX_Linux_mkdir" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    $ mkdir practice
    

<!--endsec-->

<!--sec data-title="Create directory: Windows" data-id="windows_mkdir" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    > mkdir practice
    

<!--endsec-->

Àṣẹ kékeré yìí yíò ṣẹ̀dá fódà kan pẹ̀lú orúkọ `practice` náà sórí desktop rẹ. O lè ṣàyẹ̀wò bóyá ó wà níbẹ̀ nípasẹ̀ wíwo orí Desktop rẹ tàbí nípasẹ̀ lílo àṣẹ `ls` tàbí `dir` kan! Gbìyànjú rẹ̀. :)

> Àmọ̀ràn akọ́ṣẹ́mọṣẹ́: Tí ìwọ kò bá fẹ́ tẹ àwọn àṣẹ kannáà léraléra, gbìyànjú títẹ `up arrow` àti `down arrow` lórí pẹpẹ bọ́tìnnì rẹ láti yípo àwọn àṣẹ tí o lò láìpẹ́.

* * *

### Ìdánrawò!

Ìdánrawò kékeré kan fún ẹ: nínú àkójọpọ̀ fáìlì `practice` tí o ṣẹ̀ṣẹ̀ ṣẹ̀dá, ṣẹ̀dá àkójọpọ̀ fáìlì kan tí a pè ní `test`. (Lo àwọn àṣẹ `cd` àti `mkdir` náà.)

#### Ojútùú:

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

Kú oríire! :)

* * *

### Ìpalẹ̀mọ́

A kò fẹ́ fi gbogbo rẹ̀ sílẹ̀ rádaràda, nítorí náà jẹ́ ká yọ gbogbo ohun tí a ti ṣe títí dìgbà yẹn kúrò.

Lákọ̀ọ́kọ́, a nílò láti padà sí Desktop:

<!--sec data-title="Clean up: OS X and Linux" data-id="OSX_Linux_back" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    $ cd ..
    

<!--endsec-->

<!--sec data-title="Clean up: Windows" data-id="windows_back" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    > cd ..
    

<!--endsec-->

Lílo `..` pẹ̀lú àṣẹ `cd` náà yíò ṣàyípadà àkójọpọ̀ fáìlì lọ́wọ́lọ́wọ́ rẹ sí àkójọpọ̀ fáìlì ìpìlẹ̀ (ìyẹn ni pé, àkójọpọ̀ fáìlì tó kó àkójọpọ̀ fáìlì lọ́wọ́lọ́wọ́ rẹ sínú).

Ṣàyẹ̀wò ibi tí o wà:

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

Àkókò láti yọ àkójọpọ̀ fáìlì `practice` náà kúrò:

> **Àkíyèsí**: Yíyọ àwọn fáìlì kúrò pẹ̀lú lílo `del`, `rmdir` tàbí `rm` kò sẹ́ rí gbà padà mọ́, tó túmọ̀sí pé *àwọn fáìlì tí o yọ kúrò náà máa di àwátì*! Nítorí náà, ṣọ́ra gidigidi pẹ̀lú àṣẹ yìí.

<!--sec data-title="Delete directory: Windows Powershell, OS X and Linux" data-id="OSX_Linux_rm" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    $ rm -r practice
    

<!--endsec-->

<!--sec data-title="Delete directory: Windows Command Prompt" data-id="windows_rmdir" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    > rmdir /S practice
    practice, Are you sure <Y/N>? Y
    

<!--endsec-->

Ó ti gba ṣíṣe! Láti rí dájú pé ó ti gba yíyọ kúrò lóòótọ́, jẹ́ ká ṣàyẹ̀wò rẹ̀:

<!--sec data-title="Check deletion: OS X and Linux" data-id="OSX_Linux_ls2" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    $ ls
    

<!--endsec-->

<!--sec data-title="Check deletion: Windows" data-id="windows_dir2" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    > dir
    

<!--endsec-->

### Jáde

A ó dúró síbí lásìkò yìí! O lè pa ìlà ìpàṣẹ náà dé ní báyìí láìséwu. Jẹ́ ká ṣé lọ́nà àwọn hacker, ó dára? :)

<!--sec data-title="Exit: OS X and Linux" data-id="OSX_Linux_exit" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    $ exit
    

<!--endsec-->

<!--sec data-title="Exit: Windows" data-id="windows_exit" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    > exit
    

<!--endsec-->

Ó dára, àbí bẹ́ẹ̀ kọ? :)

## Kókó pàtàkì

Kókó pàtàkì kan ti àwọn àṣẹ tó wúlò nìyí:

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

Àwọn wọ̀nyí jẹ́ díẹ̀ lára àwọn àṣẹ tí o lè lò nínú ìlà ìpàṣẹ rẹ, ṣùgbọ́n ìwọ kò ní lo ju ìyẹn lọ lónìí.

Tí o bá fẹ́ mọ síi, [ss64.com](http://ss64.com) ní ìtọ́kasí pípé kan tí àwọn àṣẹ fún gbogbo àwọn ètò ìṣiṣẹ́ kọ̀mpútà.

## Ṣé o ti ṣetán?

Jẹ́ ká wọ inú Python!