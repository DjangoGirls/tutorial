# Úvod do rozhrania príkazového riadku

Hm, je to vzrušujúce, však? Už o pár minút napíšeš svoj prvý riadok kódu :)

**Dovoľ nám predstaviť ti tvojho nového priateľa: príkazový riadok!**

Nasledujúce kroky ti ukážu ako používať tú čiernu obrzovku, čo používajú všetci hackeri. Zo začiatku môže vyzerať trochu desivo, ale je to naozaj len riadok, čo čaká na tvoje príkazy.

> **Poznámka** Prosím všimni si, že v knižke používame výrazy 'adresár' aj 'zložka' zameniteľne, no ich význam je rovnaký.

## Čo je to príkazový riadok?

Okno, ktoré sa zvyčajne nazýva **príkazový riadok** alebo **rozhranie príkazového riadku** je textová aplikácia na prehliadanie, spracovanie a manipuláciu so súbormi v tvojom počítači. V podstate ako Prieskumník vo Windowse alebo Finder na Macu, akurát bez grafického rozhrania. Ďalšie názvy pre príkazový riadok môžu byť: *cmd*, *CLI*, *prompt*, *konzola* alebo *terminál*.

## Otvor rozhranie príkazového riadku

Aby sme mohli trochu experimentovať, musíme najskôr rozhranie príkazového riadku otvoriť.

### Windows

Choď na menu Štart → Všetky programy → Príslušenstvo → Príkazový riadok.

### Mac OS X

Aplikácie → Nástroje → Terminál.

### Linux

Pravdepodobne to nájdeš pod Aplikácie → Príslušenstvo → Terminál, ale to závisí na tvojom systéme. Ak to tam nie je, tak si to jednoducho vygoogli :)

## Príkazový riadok

Teraz by si už mala vidieť biele alebo čierne okno, ktoré čaká na tvoje príkazy.

Ak si na Macu alebo Linuxe, zrejme uvidíš `$`, presne takto:

```
$
```

Na Windowse to je znak `>`, takýto:

```
>
```

Každý príkaz budeš zadávať za tento znak a jednu medzeru. Ty to ale písať nemusíš, urobí to za teba tvoj počítač :)

> Len malá poznámka: v tvojom prípade môže byť pred znakom $ niečo ako `C:\Users\ola>` alebo `Olas-MacBook-Air:~ ola$` a to je úplne v poriadku. V tomto tutoriale to ale zjednodušíme na úplné minimum.

## Tvoj prvý príkaz (Hurá!)

Začnime s niečím jednoduchým. Napíš tento príkaz:

```
$ whoami
```

alebo

```
> whoami
```

A stlač `enter`. Toto je výsledok:

```
$ whoami
olasitarska
```

Ako vidíš, počítač práve vypísal tvoje užívateľské meno. Milé, nie?:)

> Skús každý príkaz napísať, nielen kopírovať. Viac si tak zapamätáš!

## Základy

Každý operačný systém má trochu iné príkazy pre príkazový riadok, takže postupuj podľa inštrukcií pre tvoj operačný systém. Tak čo, vyskúšame to?

### Aktuálny adresár

Bolo by fajn vedieť, kde sa nachádzame, však? Zistime to. Napíš tento príkaz a stlač `enter`:

```
$ pwd
/Users/olasitarska
```

Ak si vo Windowse:

```
> cd
C:\Users\olasitarska
```

Na svojom stroji pravdepodobne uvidíš niečo takéto. Keď otvoríš príkazový riadok, zvyčajne začneš vo svojom domovskom adresári.

> Poznámka: 'pwd' je skratka pre 'print working directory'.

* * *

### Zoznam súborov a adresárov

Tak čo je v ňom? Bolo by super zistiť to. Pozrime sa na to:

```
$ ls
Applications
Desktop
Downloads
Music
...
```

Windows:

```
> dir
 Directory of C:\Users\olasitarska
05/08/2014 07:28 PM <DIR>      Applications
05/08/2014 07:28 PM <DIR>      Desktop
05/08/2014 07:28 PM <DIR>      Downloads
05/08/2014 07:28 PM <DIR>      Music
...
```

* * *

### Zmena aktuálneho adresára

Teraz prejdime do adresára Plochy:

```
$ cd Desktop
```

Windows:

```
> cd Desktop
```

Skontroluj, či sa adresár skutočne zmenil:

```
$ pwd
/Users/olasitarska/Desktop
```

Windows:

```
> cd
C:\Users\olasitarska\Desktop
```

A je to!

> Profi tip: ak napíšeš `cd D` a potom stlačíš `tab`, príkazový riadok automaticky doplní zvyšok názvu, takže sa môžeš adresáre prechádzať rýchlejšie. Ak na "D" začína viac ako jeden adresár, stlač `tab` dvakrát a dostaneš zoznam možností.

* * *

### Vytvoriť adresár

Čo takto vytvoriť pokusný adresár na ploche? Urobíš to takto:

```
$ mkdir pokus
```

Windows:

```
> mkdir practice
```

Tento príkazík vytvorí adresár s názvom `pokus` na tvojej ploche. Či je adresár naozaj tam môžeš zistiť jednoducho pohľadom na Plochu alebo spustením príkazu `ls` alebo `dir`! Vyskúšaj to :)

> Profi tip: ak sa ti nechce vypisovať stále dookola tie isté príkazy, skús sa stlačením `šípky hore` a `šípky dole` vrátiť k nedávno použitým príkazom.

* * *

### Cvičenie!

Malá výzva pre teba: v tvojom čerstvo vytvorenom adresári `pokus` vytvor adresár s názvom `test`. Použi príkazy `cd` a `mkdir`.

#### Riešenie:

```
$ cd pokus
$ mkdir test
$ ls
test
```

Windows:

```
> cd pokus
> mkdir test
> dir
03/20/2016 11:05 AM <DIR>      test
```

Gratulujeme! :)

* * *

### Upratovanie

Nechceme po sebe nechať neporiadok, takže odstránime všetko, čo sme doteraz vytvorili.

Najkôr sa musíme vrátiť späť na Plochu:

```
$ cd ..
```

Windows:

```
> cd ..
```

Pomocou `..` s príkazom `cd` zmeníš svoj aktuálny adresár na rodičovský adresár (to je ten adresár, v ktorom sa nachádza tvoj aktuálny adresár).

Skontroluj, kde sa nachádzaš:

```
$ pwd
/Users/olasitarska/Desktop
```

Windows:

```
> cd
C:\Users\olasitarska\Desktop
```

Je na čase zmazať adresár `pokus`:

> **Pozor**: mazanie súborov pomocou `del` `rmdir` alebo `rm` je neodvolateľné, teda *odstránené súbory budú navždy preč*! Takže s týmito príkazmi buď opatrná.

```
$ rm -r pokus
```

Windows:

```
> rmdir /S pous
pokus, Are you sure <Y/N>? Y
```

Hotovo! Uistime sa, či je to naozaj vymazané:

```
$ ls
```

Windows:

```
> dir
```

### Ukončenie

Nateraz je to všetko! Môžeš pokojne zatvoriť príkazový riadok. Urobme to hackersky, dobre?:)

```
$ exit
```

Windows:

```
> exit
```

Super, čo?:)

## Zhrnutie

Tu je prehľad niektorých užitočných príkazov:

| Príkaz (Windows) | Príkaz (Mac OS / Linux) | Popis                           | Príklad                                           |
| ---------------- | ----------------------- | ------------------------------- | ------------------------------------------------- |
| exit             | exit                    | zatvorí okno                    | **exit**                                          |
| cd               | cd                      | zmení adresár                   | **cd test**                                       |
| dir              | ls                      | vypíše zoznam adresárov/súborov | **dir**                                           |
| copy             | cp                      | kopíruje súbor                  | **copy c:\test\test.txt c:\windows\test.txt** |
| move             | mv                      | presunie súbor                  | **move c:\test\test.txt c:\windows\test.txt** |
| mkdir            | mkdir                   | vytvorí nový adresár            | **mkdir testdirectory**                           |
| del              | rm                      | odstráni adresár/súbor          | **del c:\test\test.txt**                        |

Toto je len veľmi malá časť príkazov, ktoré môžeš spustiť vo svojom príkazovom riadku, ale dnes budeš potrebovať len tieto.

Ak ťa to zaujalo, na [ss64.com][1] nájdeš kompletný prehľad príkazov pre všetky operačné systémy.

 [1]: http://ss64.com

## Pripravená?

Vrhnime sa na Python!
