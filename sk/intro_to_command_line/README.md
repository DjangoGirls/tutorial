# Úvod do rozhrania príkazového riadku

> Pre čitateľov doma: Táto kapitola je spracovaná v [Your new friend: Command Line](https://www.youtube.com/watch?v=jvZLWhkzX-8) videu.

Je to vzrušujúce, však? Už o pár minút napíšeš svoj prvý riadok kódu! :)

**Dovoľ nám predstaviť ti tvojho nového priateľa: príkazový riadok!**

Nasledujúce kroky ti ukážu ako používať tú čiernu obrzovku, čo používajú všetci hackeri. Zo začiatku môže vyzerať trochu desivo, ale je to naozaj len riadok, čo čaká na tvoje príkazy.

> **Poznámka** Prosím všimni si, že v knižke používame výrazy 'adresár' aj 'zložka' zameniteľne, no ich význam je rovnaký.

## Čo je to príkazový riadok?

Okno, ktoré sa zvyčajne nazýva **príkazový riadok** alebo **rozhranie príkazového riadku** je textová aplikácia na prehliadanie, spracovanie a manipuláciu so súbormi v tvojom počítači. V podstate je to ako Prieskumník vo Windowse alebo Finder na Macu, akurát bez grafického rozhrania. Ďalšie názvy pre príkazový riadok môžu byť: *cmd*, *CLI*, *prompt*, *konzola* alebo *terminál*.

## Otvor rozhranie príkazového riadku

Aby sme mohli trochu experimentovať, musíme najskôr rozhranie príkazového riadku otvoriť.

<!--sec data-title="Opening: Windows" data-id="windows_prompt" data-collapse=true ces-->

Prejdite na Štart menu → Systém Windows → Príkazový riadok.

> V starších verziách systému Windows, pozrite v Štart menu → Všetky programy → Príslušenstvo → Príkazový riadok.

<!--endsec-->

<!--sec data-title="Opening: OS X" data-id="OSX_prompt" data-collapse=true ces-->

Choď do Aplikácie → Nástroje → Terminál.

<!--endsec-->

<!--sec data-title="Opening: Linux" data-id="linux_prompt" data-collapse=true ces-->

Pravdepodobne ho nájdeš pod Aplikácie → Príslušenstvo → Terminál, ale to závisí na tvojom systéme. Ak to tam nie je, tak si to jednoducho vygoogli. :)

<!--endsec-->

## Príkazový riadok

Teraz by si už mala vidieť biele alebo čierne okno, ktoré čaká na tvoje príkazy.

<!--sec data-title="Prompt: OS X and Linux" data-id="OSX_Linux_prompt" data-collapse=true ces-->

Ak si na Macu alebo Linuxe, zrejme uvidíš `$`, presne takto:

{% filename %}command-line{% endfilename %}

    $


<!--endsec-->

<!--sec data-title="Prompt: Windows" data-id="windows_prompt2" data-collapse=true ces-->

Na Windowse je to znak `>`, takýto:

{% filename %}command-line{% endfilename %}

    >


<!--endsec-->

Každý príkaz budeš zadávať za tento znak a jednu medzeru. Ty to ale písať nemusíš, urobí to za teba tvoj počítač. :)

> Len krátka poznámka: v tvojom prípade môže tam byť pred niečo ako `C:\Users\ola>` alebo `Olas-MacBook-Air:~ ola$` a to je úplne v poriadku.

Časť po a vrátane `$` alebo `>` sa nazýva *príkazový riadok*, alebo *prompt* skrátene. Je to miesto kde zadávaš príkazy.

V tutoriále, keď chceme, aby si zadala príkaz, použijeme `$` alebo `>`, a občas aj väčšmej doľava. Môžeš ignorovať ľavú čast a zadaj príkaz, ktorý sa začína po prompte.

## Tvoj prvý príkaz (Hurá!)

Začnime tým, že zadáme nasledovný príkaz:

<!--sec data-title="Your first command: OS X and Linux" data-id="OSX_Linux_whoami" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    $ whoami


<!--endsec-->

<!--sec data-title="Your first command: Windows" data-id="windows_whoami" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    > whoami


<!--endsec-->

A stlač `enter`. Toto je výsledok:

{% filename %}command-line{% endfilename %}

    $ whoami
    olasitarska


Ako vidíš, počítač práve vypísal tvoje užívateľské meno. Milé, nie? :)

> Skús každý príkaz napísať, nielen kopírovať. Viac si tak zapamätáš!

## Základy

Každý operačný systém má trochu iné príkazy pre príkazový riadok, takže postupuj podľa inštrukcií pre tvoj operačný systém. Tak čo, vyskúšame to?

### Aktuálny adresár

Bolo by fajn vedieť, kde sa nachádzame, však? Zistime to. Napíš tento príkaz a stlač `enter`:

<!--sec data-title="Current directory: OS X and Linux" data-id="OSX_Linux_pwd" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    $ pwd
    /Users/olasitarska


> Poznámka: 'pwd' je skratka pre 'print working directory'.

<!--endsec-->

<!--sec data-title="Current directory: Windows" data-id="windows_cd" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    > cd
    C:\Users\olasitarska


> Poznámka: 'cd' znamená 'change directory', teda zmena priečinku. V PowerShell môžeš použiť pwd tak ako na Linuxe alebo Mac OS X.

<!--endsec-->

Na svojom stroji pravdepodobne uvidíš niečo takéto. Keď otvoríš príkazový riadok, zvyčajne začneš vo svojom domovskom adresári.

* * *

### Zoznam súborov a adresárov

Tak čo je v ňom? Bolo by super zistiť to. Pozrime sa na to:

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


> Poznámka: V powershelli môžeš použiť aj 'ls' ako na Linuxe alebo Mac OS X. <!--endsec-->

* * *

### Zmena aktuálneho adresára

Teraz prejdime do adresára Plochy:

<!--sec data-title="Change current directory: OS X and Linux" data-id="OSX_Linux_move_to" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    $ cd Desktop


<!--endsec-->

<!--sec data-title="Change current directory: Windows" data-id="windows_move_to" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    > cd Desktop


<!--endsec-->

Skontroluj, či sa adresár skutočne zmenil:

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

A je to!

> Profi tip: ak napíšeš `cd D` a potom stlačíš `tab`, príkazový riadok automaticky doplní zvyšok názvu, takže adresáre môžeš prechádzať rýchlejšie. Ak na "D" začína viac ako jeden adresár, stlač `tab` dvakrát a dostaneš zoznam možností.

* * *

### Vytvoriť adresár

Čo takto vytvoriť pokusný adresár na ploche? Urobíš to takto:

<!--sec data-title="Create directory: OS X and Linux" data-id="OSX_Linux_mkdir" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    $ mkdir pokus


<!--endsec-->

<!--sec data-title="Create directory: Windows" data-id="windows_mkdir" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    > mkdir practice


<!--endsec-->

Tento príkazík vytvorí adresár s názvom `pokus` na tvojej ploche. Či je adresár naozaj tam môžeš zistiť jednoducho pohľadom na Plochu alebo spustením príkazu `ls` alebo `dir`! Vyskúšaj to. :)

> Profi tip: ak sa ti nechce vypisovať stále dookola tie isté príkazy, skús sa stlačením `šípky hore` a `šípky dole` vrátiť k nedávno použitým príkazom.

* * *

### Cvičenie!

Malá výzva pre teba: v čerstvo vytvorenom adresári `pokus` vytvor adresár s názvom `test`. (Použi príkazy `cd` a `mkdir`.)

#### Riešenie:

<!--sec data-title="Exercise solution: OS X and Linux" data-id="OSX_Linux_test_dir" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    $ cd pokus
    $ mkdir test
    $ ls
    test


<!--endsec-->

<!--sec data-title="Exercise solution: Windows" data-id="windows_test_dir" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    > cd practice
    > mkdir test
    > dir
    03/20/2016 11:05 AM <DIR>      test


<!--endsec-->

Gratulujeme! :)

* * *

### Upratovanie

Nechceme po sebe nechať neporiadok, takže odstránime všetko, čo sme doteraz vytvorili.

Najkôr sa musíme vrátiť späť na Plochu:

<!--sec data-title="Clean up: OS X and Linux" data-id="OSX_Linux_back" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    $ cd ..


<!--endsec-->

<!--sec data-title="Clean up: Windows" data-id="windows_back" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    > cd ..


<!--endsec-->

Pomocou `..` s príkazom `cd` zmeníš svoj aktuálny adresár na rodičovský adresár (to je ten adresár, v ktorom sa nachádza tvoj aktuálny adresár).

Skontroluj, kde sa nachádzaš:

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

Je na čase zmazať adresár `pokus`:

> **Pozor**: mazanie súborov pomocou `del` `rmdir` alebo `rm` je neodvolateľné, teda *odstránené súbory budú navždy odtranené*! Takže s týmito príkazmi buď opatrná.

<!--sec data-title="Delete directory: Windows Powershell, OS X and Linux" data-id="OSX_Linux_rm" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    $ rm -r pokus


<!--endsec-->

<!--sec data-title="Delete directory: Windows Command Prompt" data-id="windows_rmdir" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    > rmdir /S pous
    pokus, Are you sure <Y/N>? Y


<!--endsec-->

Hotovo! Uistime sa, či je to naozaj vymazané:

<!--sec data-title="Check deletion: OS X and Linux" data-id="OSX_Linux_ls2" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    $ ls


<!--endsec-->

<!--sec data-title="Check deletion: Windows" data-id="windows_dir2" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    > dir


<!--endsec-->

### Ukončenie

Nateraz je to všetko! Môžeš pokojne zatvoriť príkazový riadok. Urobme to hackersky, dobre? :)

<!--sec data-title="Exit: OS X and Linux" data-id="OSX_Linux_exit" data-collapse=true ces-->

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

| Príkaz (Windows) | Príkaz (Mac OS / Linux) | Popis                           | Príklad                                           |
| ---------------- | ----------------------- | ------------------------------- | ------------------------------------------------- |
| exit             | exit                    | zatvorí okno                    | **exit**                                     |
| cd               | cd                      | zmení adresár                   | **cd test**                                       |
| cd               | pwd                     | ukáž akutuálny adresár          | **cd** (Windows) alebo **pwd** (Mac OS / Linux)   |
| dir              | ls                      | vypíše zoznam adresárov/súborov | **dir**                                           |
| copy             | cp                      | kopíruje súbor                  | **copy c:\test\test.txt c:\windows\test.txt** |
| move             | mv                      | presunie súbor                  | **move c:\test\test.txt c:\windows\test.txt** |
| mkdir            | mkdir                   | vytvorí nový adresár            | **mkdir testdirectory**                           |
| del              | rm                      | vymazať súbor                   | **del c:\test\test.txt**                        |
| rmdir /S         | rm -r                   | odstráni adresár/súbor          | **rm -r testdirectory**                           |

Toto je len veľmi malá časť príkazov, ktoré môžeš spustiť vo svojom príkazovom riadku, ale dnes budeš potrebovať len tieto.

Ak ťa to zaujalo, na [ss64.com](http://ss64.com) nájdeš kompletný prehľad príkazov pre všetky operačné systémy.

## Pripravená?

Vrhnime sa na Python!
