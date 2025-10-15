# Úvod do rozhrania príkazového riadku

> Pre čitateľky a čitateľov doma: Táto kapitola je spracovaná v [How the Internet Works](https://www.youtube.com/watch?v=jvZLWhkzX-8) videu.

Je to vzrušujúce, však?! Už o pár minút napíšeš svoj prvý riadok kódu! :)

**Dovoľ nám predstaviť ti tvojho nového kamaráta: príkazový riadok!**

Nasledujúce kroky ti ukážu, ako používať tú čiernu obrzovku, čo používajú všetci hackeri a hackerky. Zo začiatku môže vyzerať trochu desivo, ale je to naozaj len okno, čo čaká na tvoje príkazy.

> **Poznámka** Prosím, maj na pamäti, že v tomto texte používame výrazy "adresár", "zložka" a "priečinok" zameniteľne - ich význam je rovnaký.

## Čo je to príkazový riadok?

Okno, ktoré sa zvyčajne nazýva **príkazový riadok** (command line) alebo **rozhranie príkazového riadku** (command line interface) je textová aplikácia na prehliadanie, spracúvanie a manipuláciu so súbormi v tvojom počítači. V podstate je to ako Prieskumník vo Windowse alebo Finder na Macu, akurát bez grafického rozhrania. Ďalšie názvy pre príkazový riadok môžu byť: *cmd*, *CLI*, *prompt*, *konzola* alebo *terminál*.

## Otvorenie rozhranie príkazového riadku

Aby sme mohli trochu experimentovať, musíme najskôr rozhranie príkazového riadku otvoriť.

{% include "/intro_to_command_line/open_instructions.md" %}

## Príkazový riadok

Teraz by si už mala vidieť biele alebo čierne okno, ktoré čaká na tvoje príkazy.

<!--sec data-title="Prompt: macOS and Linux" data-id="OSX_Linux_prompt" data-collapse=true ces-->

Ak si na Macu alebo Linuxe, zrejme uvidíš `$`. Takto:

{% filename %}command-line{% endfilename %}

    $
    

<!--endsec-->

<!--sec data-title="Prompt: Windows" data-id="windows_prompt2" data-collapse=true ces-->

Na Windowse pravdepodobne vidíš `>`. Takto:

{% filename %}command-line{% endfilename %}

    >
    

Pozri na sekciu o Linuxe priamo nad touto - niečo také uvidíš neskôr, keď sa v tutoriáli dostaneme k časti o PythonAnywhere.

<!--endsec-->

Pred každým príkazom budeš vidieť `$` alebo `>` a jednu medzeru, ale tie nepíš. Tvoj počítač to spraví za teba. :)

> Len malá poznámka: možno máš pred znakom promptu niečo ako `C:\Users\ola>` alebo `Olas-MacBook-Air:~ ola$`. To je úplne v poriadku.

Časť od začiatku riadku po `$` alebo `>` (vrátane) sa nazýva *prompt*. Prompt ťa nabáda (angl. prompt), aby si niečo napísala.

Keď od teba budeme v tomto tutoriáli chcieť, aby si napísala príkaz, budeme v príkladoch písať aj `$` alebo `>`, alebo prípadne aj viac vecí na začiatku riadku. Túto celú ľavú časť ignoruj a napíš len príkaz, ktorý sa začína po prompte.

## Tvoj prvý príkaz (Hurá!)

Začnime tým, že zadáme nasledovný príkaz:

<!--sec data-title="Your first command: macOS and Linux" data-id="OSX_Linux_whoami" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    $ whoami
    

<!--endsec-->

<!--sec data-title="Your first command: Windows" data-id="windows_whoami" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    > whoami
    

<!--endsec-->

A potom stlač `enter`. Toto je výsledok:

{% filename %}command-line{% endfilename %}

    $ whoami
    olasitarska
    

Ako vidíš, počítač práve vypísal tvoje užívateľské meno. Milé, nie? :)

> Skús každý príkaz napísať, nielen skopírovať. Viac si tak zapamätáš!

## Základy

Každý operačný systém má trochu iné príkazy pre príkazový riadok, takže postupuj podľa inštrukcií pre tvoj operačný systém. Tak čo, vyskúšame to?

### Aktuálny priečinok

Bolo by fajn vedieť, kde sa nachádzame, však? Zistime to. Napíš tento príkaz a stlač `enter`:

<!--sec data-title="Current directory: macOS and Linux" data-id="OSX_Linux_pwd" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    $ pwd
    /Users/olasitarska
    

> Poznámka: 'pwd' je skratka pre 'print working directory' (vypíš pracovný adresár).

<!--endsec-->

<!--sec data-title="Current directory: Windows" data-id="windows_cd" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    > cd
    C:\Users\olasitarska
    

> Poznámka: 'cd' znamená 'change directory', teda zmeň priečinok. V PowerShelli môžeš použiť pwd rovnako ako na Linuxe alebo macOS.

<!--endsec-->

Na svojom stroji pravdepodobne uvidíš niečo takéto. Keď otvoríš príkazový riadok, zvyčajne začneš vo svojom domovskom priečinku.

* * *

### Ako sa dozvedieť viac o príkaze

Mnoho príkazov, ktoré píšeš do konzoly, má zabudovanú nápovedu (help), ktorú si môžeš nechať zobraziť! Napríklad, ak sa chceš dozvedieť viac o príkaze z predošlej časti:

<!--sec data-title="Command help: macOS and Linux" data-id="OSX_Linux_man" data-collapse=true ces-->

macOS a Linux majú príkaz `man`, ktorý ti zobrazí nápovedu k iným príkazom. Skús `man pwd` a pozri, čo ti vypíše, alebo napíš `man` v kombinácii s inými príkazmi, aby sa ti zobrazila ich nápoveda. Výstup príkazu `man` má zvyčajne niekoľko strán. Na listovanie použi medzerník a stlačením klávesy `q` nápovedu ukončíš.

<!--endsec-->

<!--sec data-title="Command Help: Windows" data-id="windows_help" data-collapse=true ces-->

Keď pripojíš `/?` na koniec príkazu, vo väčšine prípadov tiež dostaneš nápovedu. Je možné, že budeš musieť trochu poscrollovať vo svojom príkazovom okne, aby si si ju mohla celú prečítať. Skús `cd /?`.

<!--endsec-->

### Zoznam súborov a priečinkov

Bolo by zaujímavé zistiť, čo taký priečinok obsahuje. Pozrime sa na to:

<!--sec data-title="List files and directories: macOS and Linux" data-id="OSX_Linux_ls" data-collapse=true ces-->

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
    

> Poznámka: V PowerShelli môžeš použiť aj 'ls' rovnako ako na Linuxe alebo macOS.<!--endsec-->

* * *

### Zmena aktuálneho priečinku

Teraz prejdime do priečinku, kde je naša plocha:

<!--sec data-title="Change current directory: macOS" data-id="OSX_move_to" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    $ cd Desktop
    

<!--endsec-->

<!--sec data-title="Change current directory: Linux" data-id="Linux_move_to" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    $ cd Desktop
    

Tu je dobré poznamenať, že názov "Desktop" môže byť preložený do jazyka, ktorý máš nastavený vo svojom linuxovom konte. V takom prípade budeš musieť zmeniť `Desktop` na toto preložené meno, napríklad `Schreibtisch` v nemčine.

<!--endsec-->

<!--sec data-title="Change current directory: Windows" data-id="windows_move_to" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    > cd Desktop
    

<!--endsec-->

Skontroluj, či sa priečinok skutočne zmenil:

<!--sec data-title="Check if changed: macOS and Linux" data-id="OSX_Linux_pwd2" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    $ pwd
    /Users/olasitarska/Desktop
    

<!--endsec-->

<!--sec data-title="Check if changed: Windows" data-id="windows_cd2" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    > cd
    C:\Users\olasitarska\Desktop
    

<!--endsec-->

A je to!

> Profi tip: ak napíšeš `cd D` a potom stlačíš klávesu `Tab`, príkazový riadok automaticky doplní zvyšok názvu, takže priečinky môžeš prechádzať rýchlejšie. Ak na "D" začína viac ako jeden priečinok, stlač `Tab` dvakrát a dostaneš zoznam možností.

* * *

### Vytvorenie priečinku

Čo takto vytvoriť pokusný adresár na ploche? Urobíš to takto:

<!--sec data-title="Create directory: macOS and Linux" data-id="OSX_Linux_mkdir" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    $ mkdir pokus
    

<!--endsec-->

<!--sec data-title="Create directory: Windows" data-id="windows_mkdir" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    > mkdir pokus
    

<!--endsec-->

Tento príkazík vytvorí adresár s názvom `pokus` na tvojej ploche. Či je priečinok naozaj tam, môžeš zistiť jednoducho pohľadom na plochu alebo spustením príkazu `ls` alebo `dir`! Skús si to. :)

> Profi tip: ak sa ti nechce vypisovať stále dookola tie isté príkazy, skús sa stlačením `šípky hore` a `šípky dole` vrátiť k nedávno použitým príkazom.

* * *

### Cvičenie!

Malá výzva pre teba: v čerstvo vytvorenom adresári `pokus` vytvor adresár s názvom `test`. (Použi príkazy `cd` a `mkdir`.)

#### Riešenie:

<!--sec data-title="Exercise solution: macOS and Linux" data-id="OSX_Linux_test_dir" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    $ cd pokus
    $ mkdir test
    $ ls
    test
    

<!--endsec-->

<!--sec data-title="Exercise solution: Windows" data-id="windows_test_dir" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    > cd pokus
    > mkdir test
    > dir
    05/08/2020 07:28 PM <DIR>      test
    

<!--endsec-->

Gratulujeme! :)

* * *

### Upratovanie

Nechceme po sebe nechať neporiadok, tak poďme odstrániť všetko, čo sme doteraz vytvorili.

Najskôr sa musíme vrátiť späť na plochu:

<!--sec data-title="Clean up: macOS and Linux" data-id="OSX_Linux_back" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    $ cd ..
    

<!--endsec-->

<!--sec data-title="Clean up: Windows" data-id="windows_back" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    > cd ..
    

<!--endsec-->

Pomocou `..` s príkazom `cd` zmeníš svoj aktuálny priečinok na rodičovský priečinok (čiže priečinok, ktorý obsahuje tvoj súčasný priečinok).

Skontroluj, kde sa nachádzaš:

<!--sec data-title="Check location: macOS and Linux" data-id="OSX_Linux_pwd3" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    $ pwd
    /Users/olasitarska/Desktop
    

<!--endsec-->

<!--sec data-title="Check location: Windows" data-id="windows_cd3" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    > cd
    C:\Users\olasitarska\Desktop
    

<!--endsec-->

Je načase zmazať priečinok `pokus`:

> **Pozor**: mazanie súborov pomocou `del`, `rmdir` alebo `rm` je neodvolateľné, teda *odstránené súbory budú odstránené navždy*! Takže s týmito príkazmi buď opatrná.

<!--sec data-title="Delete directory: Windows Powershell, macOS and Linux" data-id="OSX_Linux_rm" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    $ rm -r pokus
    

<!--endsec-->

<!--sec data-title="Delete directory: Windows Command Prompt" data-id="windows_rmdir" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    > rmdir /S pokus
    pokus, Are you sure <Y/N>? Y
    

<!--endsec-->

Hotovo! Uistime sa, či je naozaj vymazaný:

<!--sec data-title="Check deletion: macOS and Linux" data-id="OSX_Linux_ls2" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    $ ls
    

<!--endsec-->

<!--sec data-title="Check deletion: Windows" data-id="windows_dir2" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    > dir
    

<!--endsec-->

### Ukončenie

Nateraz je to všetko! Môžeš pokojne zatvoriť príkazový riadok. Urobme to hackersky, čo povieš? :)

<!--sec data-title="Exit: macOS and Linux" data-id="OSX_Linux_exit" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    $ exit
    

<!--endsec-->

<!--sec data-title="Exit: Windows" data-id="windows_exit" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    > exit
    

<!--endsec-->

Super, čo? :)

## Zhrnutie

Tu je prehľad niektorých užitočných príkazov:

| Príkaz (Windows)  | Príkaz (Mac OS / Linux) | Popis                            | Príklad                                               |
| ----------------- | ----------------------- | -------------------------------- | ----------------------------------------------------- |
| exit              | exit                    | zatvorí okno                     | **exit**                                              |
| cd                | cd                      | zmení priečinok                  | **cd test**                                           |
| cd                | pwd                     | ukáže aktuálny priečinok         | **cd** (Windows) alebo **pwd** (Mac OS / Linux)       |
| dir               | ls                      | vypíše zoznam priečinkov/súborov | **dir**                                               |
| copy              | cp                      | skopíruje súbor                  | **copy c:\test\test.txt c:\windows\test.txt**     |
| move              | mv                      | presunie súbor                   | **move c:\test\test.txt c:\windows\test.txt**     |
| mkdir             | mkdir                   | vytvorí nový priečinok           | **mkdir testdirectory**                               |
| rmdir (alebo del) | rm                      | odstráni súbor                   | **del c:\test\test.txt**                            |
| rmdir /S          | rm -r                   | odstráni priečinok               | **rm -r testdirectory**                               |
| [CMD] /?          | man [CMD]               | ponúkne nápovedu k príkazu       | **cd /?** (Windows) alebo **man cd** (Mac OS / Linux) |

Toto je len veľmi malá časť príkazov, ktoré môžeš spustiť vo svojom príkazovom riadku, ale dnes budeš potrebovať len tieto.

Ak ťa to zaujalo, na [ss64.com](http://ss64.com) nájdeš kompletný prehľad príkazov pre všetky operačné systémy.

## Pripravená?

Vrhnime sa na Python!