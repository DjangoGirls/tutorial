# Introduksyon sa command-line na interface

> Para sa mga magbabasa sa bahay: ang kabanatang ito ay kalakip sa [Your new friend: Command Line](https://www.youtube.com/watch?v=jvZLWhkzX-8) na video.

Ito ay kapanapanabik, hindi ba?! Magsusulat ka ng pinakauna mong linya ng code sa loob lamang ng ilang minuto! :)

**Ipapakilala ka namin sa iyong kauna-una at bagong kaibigan: ang command line!**

The sumusunod na mga hakbang ay magpapakita sa iyo ng isang black na window na ginagamit ng lahat ng mga hacker. Maaring itong nakakatakot sa simula pero ito ay isang prompt lang na naghahantay ng mga utos galing sa iyon.

> **Paalala** Tandaan na sa kabuuan ng aklat na ito gagamit tayo ng mga termino na minsan napagpalit, ang 'directory' at 'folder', ngunit sila ay iisa at pareho lang.

## Ano ang command line?

Ang window, na kadalasang tinatawag na **command line** o **command-line na interface**, ay isang text-based na aplikasyon para makita, makontrol, at mamanipula ang mga file sa iyong kompyuter. Kagaya lang ito ng Windows Explorer o Finder sa Mac, ngunit walang graphical na interface. Ang ibang pangalan ng command line ay: *cmd*, *CLI*, *prompt*, *console* o *terminal*.

## Buksan ang command-line na interface

Para makasimulang mag-eksperimento, kailangan muna nating buksan ang command-line na interface.

<!--sec data-title="Opening: Windows" data-id="windows_prompt" data-collapse=true ces-->

Pumunta sa Start menu → Windows System → Command Prompt.

> Sa mga lumang bersyon ng Windows, hanapin sa Start menu → All Programs → Accessories → Command Prompt.

<!--endsec-->

<!--sec data-title="Opening: OS X" data-id="OSX_prompt" data-collapse=true ces-->

Pumunta sa Applications → Utilities → Terminal.

<!--endsec-->

<!--sec data-title="Opening: Linux" data-id="linux_prompt" data-collapse=true ces-->

It's probably under Applications → Accessories → Terminal, but that may depend on your system. If it's not there, you can try to Google it. :)

<!--endsec-->

## Prompt

Dapat makakita ka ng isang white o black na window na naghihintay isa iyong mga commands.

<!--sec data-title="Prompt: OS X and Linux" data-id="OSX_Linux_prompt" data-collapse=true ces-->

If you're on Mac or Linux, you probably see `$`, like this:

{% filename %}command-line{% endfilename %}

    $
    

<!--endsec-->

<!--sec data-title="Prompt: Windows" data-id="windows_prompt2" data-collapse=true ces-->

Sa windows, ito ay `>` na sign, gaya nito:

{% filename %}command-line{% endfilename %}

    >
    

<!--endsec-->

Bawat command ay nakaprepend nang sign na ito at isang space, ngunit hindi mo na kailangang itype ito. Ang kompyuter na ang gagawa nito para sa iyo. :)

> Isang maliit na paalala: sa kaso mo maaring may makikita kang `C:\Users\ola>` o `Olas-Macbook-Air:~ ola$` bago ang prompt na sign, at ito 100% OK lang.

Ang parte hanggang at kasali ang `$` o ang `>` ay tinatawag na *command line prompt*, o *prompt* kung pinaikli. Ito ay magprompt sa iyo na mag-input dito.

Sa tutorial, kung gusto namin na magtype ka ng command, isasali na namin ang `$` o `>`, at minsan may nadagdag pa sa kaliwa. Ignore the left part and only type in the command, which starts after the prompt.

## Ang una mong command (YAY!)

Let's start by typing this command:

<!--sec data-title="Your first command: OS X and Linux" data-id="OSX_Linux_whoami" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    $ whoami
    

<!--endsec-->

<!--sec data-title="Your first command: Windows" data-id="windows_whoami" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    > whoami
    

<!--endsec-->

At pindutin ang `enter`. Ito ang ating resulta:

{% filename %}command-line{% endfilename %}

    $ whoami
    olasitarska
    

Gaya ng makikita mo, ang kompyuter ay nagprinta sa iyong bansag. Malinis, di ba? :)

> Subukan mong magtype ng bawat command; huwag mag copy-paste. Mas matandaan mo ito sa ganitong paraan!

## Mga Basic

Bawat operating system ay may medyo iba-ibang set ng mga commands para sa command line, kaya siguradihing sumunod sa mga instruksyon para sa iyong operating system. Subukan natin ito, tara na?

### Kasalukuyang directory

Mas maganda kapag alam natin kung saan tayo, di ba? Tingnan natin. I-type ang command na ito at pindutin ang `enter`:

<!--sec data-title="Current directory: OS X and Linux" data-id="OSX_Linux_pwd" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    $ pwd
    /Users/olasitarska
    

> Paala: 'print working directory' ang kahulugan ng 'pwd'.

<!--endsec-->

<!--sec data-title="Current directory: Windows" data-id="windows_cd" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    > cd
    C:\Users\olasitarska
    

> Tandaan: ang 'cd' ay kumakatawan sa 'change directory'. Gamit ang powershell maaari kang gumamit ng pwd gaya ng sa Linux o Mac OS X.

<!--endsec-->

Maaring nakakita ka ng kagaya nito sa iyong makina. Kapag nabuksan mo na ang command line, kadalasang magsisimula ka iyong home directory ng user.

* * *

### Lista ng mga file at mga directory

Ano ang dapat nasa loob ito. Maganda kung ating makita ito. Tingnan natin:

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
    

> Tandaan: Sa powershell, maaari kang gumamit ng 'ls' gaya ng sa Linux at Mac OS X. <!--endsec-->

* * *

### Magpalit ng kasalukuyang directory

Ngayon, puntahan nating ang ating Desktop na directory:

<!--sec data-title="Change current directory: OS X and Linux" data-id="OSX_Linux_move_to" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    $ cd Desktop
    

<!--endsec-->

<!--sec data-title="Change current directory: Windows" data-id="windows_move_to" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    > cd Desktop
    

<!--endsec-->

Tingnan kung nabago ba talaga ito:

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

Nandito na!

> PRO tip: kung mag type ka ng `cd D` at magpindut ng `tab` sa iyong keyboard, ang command line ay awtomatikong maglagay ng buong pangalan para mabilis mo itong manavigate. Kung mayroong higit sa isang folder na nagsisimula sa "D", pindutin ang `tab` na key ng dalawang beses para makuha mo ang lista ng mga options.

* * *

### Maglikha ng directory

Paano kaya kung maglikha ka ng practice directory sa iyong desktop? Maari mo itong gawin sa ganitong paraan:

<!--sec data-title="Create directory: OS X and Linux" data-id="OSX_Linux_mkdir" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    $ mkdir practice
    

<!--endsec-->

<!--sec data-title="Create directory: Windows" data-id="windows_mkdir" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    > mkdir practice
    

<!--endsec-->

Ang maliit na command na ito ay maglikha ng folder na may pangalang `practice` sa iyong desktop. You can check if it's there by looking on your Desktop or by running a `ls` or `dir` command! Subukan ninyo ito. :)

> PRO tip: kung hindi mo gustong magtype ng parehong mga command ng paulit-ulit, subukang pindutin ang `up arrow` at `down arrow` sa iyong keyboard para maikot ang mga kakagamit lang na mga command.

* * *

### Mag-ehersisyo!

May maliit na pagsusubok para sa iyo: sa iyong kakalikha na `practice` na directory, maglikha ng directory na tatawaging `test`. (Gamitin ang `cd` at `mkdir` na mga command.)

#### Solusyon:

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

Maligayang bati! :)

* * *

### Maglinis

Hindi natin gustong mag-iwan ng kalat, kaya burahin natin ang lahat ng nagawa natin hanggang sa puntong ito.

Una, kailangan nating makabalik sa Desktop:

<!--sec data-title="Clean up: OS X and Linux" data-id="OSX_Linux_back" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    $ cd ..
    

<!--endsec-->

<!--sec data-title="Clean up: Windows" data-id="windows_back" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    > cd ..
    

<!--endsec-->

Gamit ang `..` kasabay ng `cd` na command ay magbabago sa iyong kasalukuyang directory sa magulang na directory (ito ay and directory na naglalaman ng iyong kasalukuyang directory).

Suriin kung nasaan ka na:

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

Ngayon ay oras na para burahin ang `practice` na directory:

> **Bigyang pansin>**: Ang pagbura ng file gamit ang `del`, `rmdir` o `rm` ay hindi na marecover ulit, ibig sabihin na *ang mga naburang file ay mawala na magpakailanman*! Dapat maging maingat sa command na ito.

<!--sec data-title="Delete directory: Windows Powershell, OS X and Linux" data-id="OSX_Linux_rm" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    $ rm -r practice
    

<!--endsec-->

<!--sec data-title="Delete directory: Windows Command Prompt" data-id="windows_rmdir" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    > rmdir /S practice
    practice, Are you sure <Y/N>? Y
    

<!--endsec-->

Tapos na! Para masiguro na nabura talaga ito, tingnan natin ito:

<!--sec data-title="Check deletion: OS X and Linux" data-id="OSX_Linux_ls2" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    $ ls
    

<!--endsec-->

<!--sec data-title="Check deletion: Windows" data-id="windows_dir2" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    > dir
    

<!--endsec-->

### Exit

Iyan na sa ngayon. Maari mo nang isara ang command line ngayon. Gagawin natin ito sa hacker na paraan, okay ba? :)

<!--sec data-title="Exit: OS X and Linux" data-id="OSX_Linux_exit" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    $ exit
    

<!--endsec-->

<!--sec data-title="Exit: Windows" data-id="windows_exit" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    > exit
    

<!--endsec-->

Cool, di ba? :)

## Buod

Ito ang buod ng iilang mga command:

| Command (Windows) | Command (Mac OS / Linux) | Paglalarawan                       | Halimbawa                                         |
| ----------------- | ------------------------ | ---------------------------------- | ------------------------------------------------- |
| exit              | exit                     | isara ang window                   | **exit**                                          |
| cd                | cd                       | baguhin ang directory              | **cd tesr**                                       |
| cd                | pwd                      | ipakita ang kasalukuyang directory | **cd** (Windows) o **pwd** (Mac OS / Linux)       |
| dir               | ls                       | lista ng mga directory/files       | **dir**                                           |
| kopya             | cp                       | kopyahin ang file                  | **copy c:\test\test.txt c:\windows\test.txt** |
| ilipat            | mv                       | maglipat ng file                   | **move c:\test\test.txt c:\windows\test.txt** |
| mkdir             | mkdir                    | maglikha ng bagong directory       | **mkdir testdirectory**                           |
| rmdir (or del)    | rm                       | burahin ang file                   | **del c:\test\test.txt**                        |
| rmdir /S          | rm -r                    | magbura ng directory               | **rm -r testdirectory**                           |

Ang mga ito ay iilan lang sa mga command na maari mong mapatakbo sa iyong command line, ngunit hindi ka gagamit ng higit pa dito sa ngayon.

Kung ikaw ay curious, ang [ss64.com](http://ss64.com) ay naglalaman ng kompletong lista ng mga command para sa lahat ng operating systems.

## Handa ka na ba?

Pumunta na tayo sa Python!