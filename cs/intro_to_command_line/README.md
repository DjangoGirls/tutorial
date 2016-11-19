# Úvod k příkazové řádce

Hm, to je vzrušující, že? Napíšeš svůj první řádek kódu za pouhých pár minut :)

**Dovol nám, abychom ti představili tvého prvního nového přítele: příkazovou řádku! **

Následující kroky ti ukážou, jak používat černé okno, které všichni počítačoví odborníci používají. Může to na první pohled vypadat trochu děsivě, ale opravdu je to jen okno, které čeká na tvé příkazy.

> **Poznáma** Ber, prosím, na vědomí, že v tomto tutoriálu používáme termíny 'adresář' a 'složka', ale je to jedna a ta samá věc.

## Co je příkazová řádka?

Okno, které se obvykle nazývá **příkazová řádka** nebo **rozhraní příkazové řádky**, je textová aplikace pro zobrazování, zpracovávání a manipulaci se soubory na tvém počítači. Docela jako Windows Explorer nebo Finder na Mac, ale bez grafického rozhraní. Další jména pro příkazovou řádku jsou: *cmd*, *prompt*, *command line*, *konzole* nebo *terminál*.

## Otevři rozhraní příkazové řádky

Chceš-li začít experimentovat, je třeba nejprve otevřít naše rozhraní příkazové řádky.

### Windows

Jdi na menu Start → Všechny programy → Příslušenství → Příkazová řádka.

### Mac OS X

Aplikace → Nástroje → Terminál.

### Linux

Pravděpodobně ji nalezneš pod Aplikace → Příslušenství → Terminál, ale závisí to na tvém systému. Pokud to tam není, prostě to vygoogli :)

## Příkazová řádka

Nyní bys měla vidět bílé nebo černé okno, které čeká na tvé příkazy.

Pokud jsi na Mac nebo na Linuxu, pravděpodobně uvidíš výzvu začínající tímto znakem `$`, právě takhle:

```
    $
```  

V systému Windows je to tento znak `>`:

```
    >
```  

Každý příkaz budeš psát za tento znak a jednu mezeru, ale není nutné to zadávat. Tvůj počítač to udělá za tebe :)

> Jen malá Poznámka: někteří mohou vidět něco jako `C:\Users\ola >` nebo `Olas-MacBook-Air: ~ ola$` před znakem $. To je naprosto v pořádku. V tomto kurzu se jen snažíme vše zjednodušit na minimum.

## Tvůj první příkaz (hurá!)

Pojďme začít s něčím jednoduchým. Zadej tento příkaz:

```
    $ whoami
```  

nebo

```
    > whoami
```  

A zmáčkni `enter`. Tohle je výsledek:

```
    $ whoami
    olasitarska
```  

Jak vidíš, počítač právě vypsal tvé uživatelské jméno. Pěkný, co?:)

> Zkus každý příkaz zadat, nekopíruj ho prostým vyjmout/vložit. Zapamatuješ si tak více!

## Základy

Každý operační systém má mírně odlišnou sadu příkazů na příkazové řádce, takže se ujisti, že sleduješ pokyny pro tvůj operační systém. Zkusme to, ano?

### Aktuální složka

Bylo by hezké vědět, kde právě jsme, ne? Podívejme se. Zadej následující příkaz a stiskni `enter`:

```
    $ pwd
    /Users/olasitarska
```  

Pokud jsi v systému Windows:

```
    > cd
    C:\Users\olasitarska
```  

Pravděpodobně se ti zobrazí něco podobného. Jakmile otevřeš příkazovou řádku, obvykle začínáš ve svém domovském adresáři.

> Poznámka: 'pwd' je zkratka pro "print working directory / zobrazení cesty pro pracovní adresář".

* * *

### Seznam souborů a adresářů

Tak co je v něm? Bylo by fajn zjistit, co je v našem adresáři. Podívejme se:

```
    $ ls
    Aplikace
    Desktop
    Stažené soubory
    Hudba...
```  

Windows:

```
    > dir  
    Directory of C:\Users\olasitarska
    05/08/2014 07:28 PM <DIR> Applications
    05/08/2014 07:28 PM <DIR> Desktop
    05/08/2014 07:28 PM <DIR> Downloads
    05/08/2014 07:28 PM <DIR> Music
    ...
```  

* * *

### Změna aktuálního adresáře

Teď pojďme do adresáře plochy:

```
    $ cd Desktop
```  

Windows:

```
    > cd Desktop
```  

Zkontroluj, zda-li se adresář skutečně změnil:

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

> PRO tip: Pokud zadáš `cd D` a poté stiskneš klávesu `tab` na klávesnici, příkazová řádka automaticky předvyplní zbytek názvu, tak můžeš adresáře procházet rychleji. Pokud existuje více než jedna složka od "D", musíš tlačítko `tab` zmáčknout dvakrát a zobrazí se ti seznam dostupných možností.

* * *

### Jak vytvořit složku

Co si vytvořit pokusnou složku na ploše? Můžeš to udělat tímto způsobem:

```
    $ mkdir pokus
```  

Windows:

```
    > mkdir pokus
```  

Tento malý příkaz vytvoří složku s názvem `pokus` na ploše. Zda se na ploše složka vytvořila můžeš zkontrolovat pouhým pohledem na pracovní plochu nebo spuštěním příkazu `ls` nebo `dir`! Zkus to :)

> PRO tip: Pokud nechceš znovu a znovu zadávat stejné příkazy, zkus stisknutím `šipka nahoru` a `šipka dolů` na klávesnici přepínat mezi nedávno použitými příkazy.

* * *

### Cvičení!

Malá výzva: v nově vytvořeném adresáři `pokus` vytvoř adresář s názvem `test`. Použij příkazy `cd` a `mkdir`.

#### Řešení:

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
    05/08/2014 07:28 PM <DIR>      test
```  

Gratulujeme! :)

* * *

### Jak odstranit složku

Nechceme si nechat nepořádek v počítači, takže musíme odstranit vše, co jsme až do tohoto okamžiku dělaly.

Za prvé se potřebujeme dostat zpátky na plochu:

```
    $ cd ..
```  

Windows:

```
    > cd ..
```  

Použití `..` s příkazem `cd` změní tvůj aktuální adresář na rodičovský adresář (adresář, který obsahuje tvůj aktuální adresář).

Zkontroluj, kde se nacházíš:

```
    $ pwd
    /Users/olasitarska/Desktop
```  

Windows:

```
    > cd
    C:\Users\olasitarska\Desktop
```  

Teď je čas vymazat adresář `pokus`:

> **Pozor**: odstraňování souborů pomocí `del`, `rmdir` nebo `rm` je nevratné, což znamená, *že odstraněné soubory budou navždy pryč*! Takže buď s tímto příkazem velmi opatrná.

```
    $ rm -r pokus
```  

Windows:

```
    > rmdir /S pokus
    Are you sure <Y/N>? Y
```  

Hotovo! Vše je skutečně odstraněno. Pojďme to zkontrolovat:

```
    $ ls
```  

Windows:

```
    > dir
```  

### Zavření příkazové řádky

To je pro tuto chvíli vše! Bezpečně můžeš nyní zavřít příkazovou řádku. Uděláme to hackerským stylem, ano? :)

```
    $ exit
```  

Windows:

```
    > exit
```  

Suprový, co? :)

## Shrnutí

Zde je přehled některých užitečných příkazů:

| Příkaz (Windows) | Příkaz (Mac OS / Linux) | Popis                    | Příklad                                           |
| ---------------- | ----------------------- | ------------------------ | ------------------------------------------------- |
| exit             | exit                    | Zavřít okno              | **exit**                                          |
| cd               | cd                      | změnit adresář           | **cd test**                                       |
| dir              | ls                      | seznam adresářů/souborů  | **dir**                                           |
| copy             | cp                      | kopírovat soubor         | **copy c:\test\test.txt c:\windows\test.txt** |
| move             | mv                      | přesunout soubor         | **move c:\test\test.txt c:\windows\test.txt** |
| mkdir            | mkdir                   | vytvořit nový adresář    | **mkdir testdirectory**                           |
| del              | rm                      | odstranit adresář/soubor | **del c:\test\test.txt**                        |

Toto je jen velmi malá část příkazů, které lze spustit v příkazovém řádku, ale pro dnešek to bude stačit.

Pokud jsi zvědavá, na [ss64.com][1] je úplný přehled příkazů pro všechny operační systémy.

 [1]: http://ss64.com

## Připravena?

Pojďme se ponořit do Pythonu!
