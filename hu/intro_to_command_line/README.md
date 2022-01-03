# Bevezetés a parancssor használatába

Ez nagyon izgalmas, igaz?! Pár percen belül megírod az első kódsorodat :)

**Hadd mutassuk be neked az első új barátodat: a parancssort!**

A következő lépésekben megmutatjuk neked, hogyan használd azt a fekete ablakot úgy, ahogy az összes hacker használja. Első ránézésre kissé ijesztőnek tűnhet, de valójában csak egy egyszerű parancsot vár tőled.

> **Megjegyzés** A könyvben felváltva használjuk a 'könyvtár' és 'mappa' ('directory' és 'folder') szavakat, de ezek pont ugyanazt jelentik.

## Mi az a parancssor?

A **parancssor** (command line, vagy **command-line interface**) nevű ablak egy szöveges alapú alkalmazás, amit arra használhatsz, hogy fájlokat tekinthess meg, szerkeszthess, és különböző műveleteket végezhess rajtuk. Olyasmi, mint a Windows Explorer, vagy Mac gépeken a Finder, de a grafikus felület nélkül. Egyéb megnevezések a parancssorra: *konzol*, *terminál*, *cmd*, *CLI*, *prompt*.

## A parancssor megnyitása

Hogy belevághass a kísérletezésbe, először meg kell nyitnod a parancssort.

<!--sec data-title="Windows" data-id="windows_prompt" data-collapse=true ces-->

Start menu → All Programs → Accessories → Command Prompt.

<!--endsec-->


<!--sec data-title="OS X" data-id="OSX_prompt" data-collapse=true ces-->

Applications → Utilities → Terminal.

<!--endsec-->

<!--sec data-title="Linux" data-id="linux_prompt" data-collapse=true ces-->

Valószínűleg itt találod meg: Applications → Accessories → Terminal, de ez a rendszeredtől függ. Ha nincs ott, csak keress rá a Google-n :)

<!--endsec-->

## Parancssor

Egy fehér vagy fekete ablakot kell látnod, ami csak a te parancsaidra vár.

<!--sec data-title="OS X és Linux" data-id="OSX_Linux_prompt" data-collapse=true ces-->

Ha Mac-ed vagy Linux-od van, valószínűleg egy `$`-t kell látnod:

    $
    

<!--endsec-->

<!--sec data-title="Windows" data-id="windows_prompt2" data-collapse=true ces-->

A Windows-on ez egy `>` jel:

    >
    
<!--endsec-->


Minden sornak ezzel a jellel és az azt követő space-el kell kezdődnie, de ezt nem neked kell begépelned. A számítógéped megteszi helyetted :)

> Csak egy gyors megjegyzés: így is kinézhet a parancssorod: `C:\Users\ola>` vagy `Olas-MacBook-Air:~ ola$`, és ez teljesen jó így. Ebben az útmutatóban csak próbáljuk a lehető leginkább leegyszerűsíteni.

A sor elején lévő rész, a  `$` vagy `>` karakterig (azt is beleértve) a *parancssori prompt* vagy röviden *prompt* a neve. Azt jelzi, hogy a számítógép a te utasításodra vár.

A tutorial során, amikor egy parancsot kell beírnod, ki fogjuk írni a `$` vagy `>` karaktert, és olykor még bővebb promptot. Nyugodtan hagyd figyelmen kívül a baloldali részt, és csak a prompt után kezdődő parancsot gépeld be.

## Az első parancsod (YAY!)

Kezdjük valami egyszerűvel. Gépeld be ezt a parancsot:

<!--sec data-title="OS X és Linux" data-id="OSX_Linux_whoami" data-collapse=true ces-->

{% filename %}parancssor{% endfilename %}
```
$ whoami
```

<!--endsec-->


<!--sec data-title="Windows" data-id="windows_whoami" data-collapse=true ces-->

{% filename %}parancssor{% endfilename %}
```
> whoami
```

<!--endsec-->
    

Majd nyomj `enter`t. Ezt az eredményt kapod:

    $ whoami
    olasitarska
    

Amint láthatod, a számítógéped az előbb kiírta a felhasználónevedet. Jó, mi?:)

> Próbálj meg minden parancsot begépelni, ahelyett, hogy innen másolnád ki. Így többet fogsz megjegyezni!

## Az alapok

Minden operációs rendszer parancssora kissé különböző prancsokat igényel, ezért kérlek győzödj meg arról, hogy a te operációs rendszerednek megfelelő utasításokat követed. Próbáljuk ki, rendben?

### A jelenlegi mappa

Jó lenne tudni, hogy most hol vagyunk, nem? Nézzük. Írd be ezt a parancsot, és nyomj `enter`t:

<!--sec data-title="OS X és Linux" data-id="OSX_Linux_pwd" data-collapse=true ces-->

{% filename %}parancssor{% endfilename %}
```
$ pwd
/Users/olasitarska
```

> Megjegyzés: a 'pwd' jelentése: 'print working directory' ('munkakönyvtár kiírása').

<!--endsec-->


<!--sec data-title="Windows" data-id="windows_cd" data-collapse=true ces-->

{% filename %}parancssor{% endfilename %}
```
> cd
C:\Users\olasitarska
```
> Megjegyzés: a 'cd' jelentése: 'change directory' ('könyvtár váltása'). Ha PowerShell-t használsz, használhatod a pwd parancsot is, mint Linuxon vagy Mac OS X-en.

<!--endsec-->


Valószínűleg valami hasonlót fogsz látni a gépeden. Amikor megnyitod a parancssort, általában a felhasználó 'home' könyvtárába kerülsz.

* * *

### Fájlok és könyvtárak kilistázása
    
És mi van benne? Szuper lenne kideríteni. Nézzük meg:

<!--sec data-title="OS X és Linux" data-id="OSX_Linux_ls" data-collapse=true ces-->

    $ ls
    Applications
    Desktop
    Downloads
    Music
    ...
    
<!--endsec-->

<!--sec data-title="Windows" data-id="windows_dir" data-collapse=true ces-->

    > dir
     Directory of C:\Users\olasitarska
    05/08/2014 07:28 PM <DIR>      Applications
    05/08/2014 07:28 PM <DIR>      Desktop
    05/08/2014 07:28 PM <DIR>      Downloads
    05/08/2014 07:28 PM <DIR>      Music
    ...
    
<!--endsec-->

* * *

### Jelenlegi mappa megváltoztatása

Most pedig lépjünk be a Desktop (vagy Asztal) mappába:

<!--sec data-title="OS X és Linux" data-id="OSX_Linux_move_to" data-collapse=true ces-->

{% filename %}parancssor{% endfilename %}
```
$ cd Desktop
```
<!--endsec-->

<!--sec data-title="Windows" data-id="windows_move_to" data-collapse=true ces-->


{% filename %}parancssor{% endfilename %}
```
> cd Desktop
```
<!--endsec-->
    

Nézzük meg, hogy tényleg megváltozott-e:

<!--sec data-title="OS X és Linux" data-id="OSX_Linux_pwd2" data-collapse=true ces-->

{% filename %}parancssor{% endfilename %}
```
$ pwd
/Users/olasitarska/Desktop
```
<!--endsec-->

<!--sec data-title="Windows" data-id="windows_cd2" data-collapse=true ces-->

{% filename %}parancssor{% endfilename %}
```
> cd
C:\Users\olasitarska\Desktop
```
<!--endsec-->

Itt is van!

> PRO tipp: ha begépeled a `cd D`-t (vagy ha magyarul használod az operációs rendszeredet, és 'Asztal'-nak hívják a könyvtáradat, a `cd A`-t) és ezután megnyomod a <0>tab</0>-ot, a parancssor automatikusan kiegészíti a nevet, lehetővé téve számodra a gyorsabb navigálást. Amennyiben több mappa is kezdődik ugyanazzal a betűvel, nyomd meg kétszer a `tab`-ot, hogy kilistázza a több opciót.

* * *

### Könyvtár létrehozása

Mit szólnál, ha létrehoznánk egy gyakorló (practice) könyvtárat az asztalon? Így tudod megtenni:

<!--sec data-title="OS X és Linux" data-id="OSX_Linux_mkdir" data-collapse=true ces-->

{% filename %}parancssor{% endfilename %}
```
$ mkdir practice
```
<!--endsec-->

<!--sec data-title="Windows" data-id="windows_mkdir" data-collapse=true ces-->


{% filename %}parancssor{% endfilename %}
```
> mkdir practice
```
<!--endsec-->

Ez a parancs létre fog hozni egy `practice` nevű mappát az asztalodon. Ha megnézed az asztalt, meggyőződhetsz róla, hogy tényleg ott van-e, de a `ls` vagy `dir` paranccsal is megteheted! Próbáld ki :)

> PRO tipp: Ha nem szeretnéd újra és újra ugyanazt a parancsot begépelni, próbáld meg a `felfele` és `lefele nyilakkal` behívni a legutóbb futtatott parancsokat.

* * *

### Feladat!

Egy kis kihívás: hozz létre egy `test` nevű mappát a frissen elkészített `practice` könyvtáradban. Használd a `cd` és `mkdir` parancsokat.

#### Megoldás:

<!--sec data-title="OS X és Linux" data-id="OSX_Linux_test_dir" data-collapse=true ces-->

{% filename %}parancssor{% endfilename %}
```
$ cd practice
$ mkdir test
$ ls
test
```
<!--endsec-->

<!--sec data-title="Windows" data-id="windows_test_dir" data-collapse=true ces-->


{% filename %}parancssor{% endfilename %}
```
> cd practice
> mkdir test
> dir
05/08/2014 07:28 PM <DIR>      test
```
<!--endsec-->
    

Gratulálunk! :)

* * *

### Takarítás

Nem szeretnénk káoszt hagyni magunk után, szóval töröljünk le mindent, amit eddig csináltunk.

Először vissza kell mennünk az Asztal-ra:

<!--sec data-title="OS X és Linux" data-id="OSX_Linux_back" data-collapse=true ces-->

{% filename %}parancssor{% endfilename %}
```
$ cd ..
```
<!--endsec-->

<!--sec data-title="Windows" data-id="windows_back" data-collapse=true ces-->


{% filename %}parancssor{% endfilename %}
```
> cd ..
```
<!--endsec-->
    

Ha a `cd` parancsot `..`-tal használod, a jelenlegi könyvtárból a parent (szülő) könyvtárba jutsz (ez az a mappa, ami tartalmazza azt a mappát, ahol éppen vagy).

Ellenőrizzük le, hogy hol vagyunk:

<!--sec data-title="OS X és Linux" data-id="OSX_Linux_pwd3" data-collapse=true ces-->

{% filename %}parancssor{% endfilename %}
```
$ pwd
/Users/olasitarska/Desktop
```
<!--endsec-->

<!--sec data-title="Windows" data-id="windows_cd3" data-collapse=true ces-->


{% filename %}parancssor{% endfilename %}
```
> cd
C:\Users\olasitarska\Desktop
```
<!--endsec-->

Most pedig itt az ideje, hogy kitöröljük a `practice` könyvtárat:

> **Figyelem**: A fájlok törlése a `del`, `rmdir`, vagy a `rm` parancsokkal visszafordíthatatlan, tehát a *törölt fájlok örökre eltűnnek*! Legyél nagyon óvatos ezzel a paranccsal.

<!--sec data-title="OS X és Linux" data-id="OSX_Linux_rm" data-collapse=true ces-->

{% filename %}parancssor{% endfilename %}
```
$ rm -r practice
```
<!--endsec-->

<!--sec data-title="Windows" data-id="windows_rmdir" data-collapse=true ces-->


{% filename %}parancssor{% endfilename %}
```
> rmdir /S practice
practice, Are you sure <Y/N>? Y
```
<!--endsec-->
    

Kész! Ellenőrizzük le, hogy tényleg megtörtént-e:

<!--sec data-title="OS X és Linux" data-id="OSX_Linux_ls2" data-collapse=true ces-->

{% filename %}parancssor{% endfilename %}
```
$ ls
```
<!--endsec-->

<!--sec data-title="Windows" data-id="windows_dir2" data-collapse=true ces-->


{% filename %}parancssor{% endfilename %}
```
> dir
```
<!--endsec-->
    

### Kilépés

Ennyi volt! Most már biztonságosan kiléphetsz a parancssorból. Csináljuk hacker módra, jó?:)

<!--sec data-title="OS X és Linux" data-id="OSX_Linux_exit" data-collapse=true ces-->

{% filename %}parancssor{% endfilename %}
```
$ exit
```
<!--endsec-->

<!--sec data-title="Windows" data-id="windows_exit" data-collapse=true ces-->


{% filename %}parancssor{% endfilename %}
```
> exit
```
<!--endsec-->
    

Szuper, nem? :)

## Összefoglaló

Egy kis összefoglalás néhány hasznos parancsról:

| Parancs (Windows) | Parancs (Mac OS/Linux) | Leírás                        | Példa                                             |
| ----------------- | ---------------------- | ----------------------------- | ------------------------------------------------- |
| exit              | exit                   | az ablak bezárása             | **exit**                                          |
| cd                | cd                     | könyvtár megváltoztatása      | **cd test**                                       |
| dir               | ls                     | könyvtárak/fájlok kilistázása | **dir**                                           |
| copy              | cp                     | fájl másolása                 | **copy c:\test\test.txt c:\windows\test.txt** |
| move              | mv                     | fájl mozgatása                | **move c:\test\test.txt c:\windows\test.txt** |
| mkdir             | mkdir                  | új könyvtár létrehozása       | **mkdir testdirectory**                           |
| del               | rm                     | könyvtár/fájl törlése         | **del c:\test\test.txt**                        |

Ez csak néhány parancs, azok közül, amiket a parancssorban futtathatsz, de ma nem lesz szükséged ennél többre.

Ha kíváncsi vagy, a [ss64.com][1] oldalon megtalálod az összes parancsot bármelyik operációs rendszerre.

 [1]: http://ss64.com

## Kész vagy?

Merüljünk el a Python-ban!