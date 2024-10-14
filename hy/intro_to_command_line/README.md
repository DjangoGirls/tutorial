# Հրամանի տողի ինտերֆեյսի /command-line interface ներածություն

> Նրանց համար, ովքեր ձեռնարկն անցնում են տանը. Ձեր նոր ընկերը ՝ [հրամանի տողը/ Command Line](https://www.youtube.com/watch?v=jvZLWhkzX-8), խոսում է այս գլխի նյութի մասին:

Ցնցող է, չէ՞:Մի քանի րոպեից դուք կգրեք ձեր առաջին տողի ծածկագիրը: :)

**Թույլ տվեք ներկայացնել ձեր առաջին նոր ընկերոջը. Հրամանի տող/command line:**

Հաջորդ քայլերը ցույց կտան, թե ինչպես օգտագործել այն սև պատուհանը, որն օգտագործում են բոլոր հակերները: Սկզբում դա կարող է թվալ մի փոքր վախեցնող, բայց իրականում դա պարզապես պատուհան է, որը սպասում է ձեզանից հրահանգների:

> **Նշում** Խնդրում ենք նկատի ունենալ, որ այս ձեռնարկում մենք օգտագործում ենք «գրացուցակ/'directory'» և «թղթապանակ/'folder'» տերմինները փոխադարձաբար. Այս բառերը միևնույն բանն են նշանակում:

## Ի՞նչ է հրամանի տողը/command line: 

Պատուհանը, որը սովորաբար անվանում են **Հրամանի տող/ command line** կամ **«Հրամանի տողի միջերես»/command-line interface (CLI)** , տեքստի վրա հիմնված ծրագիր է ՝ ձեր համակարգչի վրա ֆայլերը դիտելու, մշակելու և շահարկելու համար: Դա անում է նույնը, ինչ Explorer- ը Windows- ում կամ Finder- ը macOS- ում, բայց այն չունի գրաֆիկական ինտերֆեյս: Հրամանի տողի այլ անուններն են ՝ *cmd*, *CLI*, *prompt*, *console* կամ *terminal*:

## Բացեք հրամանի տողի միջերեսը/command-line interface

Որոշ փորձեր սկսելու համար նախ պետք է բացենք հրամանի տողի միջերեսը/command-line interface:

{% include "/intro_to_command_line/open_instructions.md" %}

## Հուշում

Այժմ դուք պետք է տեսնեք սպիտակ կամ սև պատուհան, որը սպասում է ձեր հրամաններին:

<!--sec data-title="Prompt: macOS and Linux" data-id="OSX_Linux_prompt" data-collapse=true ces-->

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

> Մի փոքր հուշում. Նման մի բան կարող է գրվել հրամանի տողի կուրսորի դիմաց `C:\Users\ola>` կամ `Olas-MacBook-Air:~ ola$` և դա 100% -ով նորմալ է:

Ցանկացած հատված, ներառյալ այս `$` կամ այս `>` նշանները, հավաքականորեն կոչվում է *command line prompt/հրամանի տող հուշում * կամ ուղղակի *prompt/հուշում* : Սովորաբար, այն պարունակում է այն թղթապանակի հասցեն, որի մեջ դուք այժմ գտնվում եք: Այն հուշում է ձեզ հրաման մուտքագրել պատուհանի մեջ:

Հետագայում ձեռնարկում, յուրաքանչյուր հրամանից առաջ, որը դուք պետք է մուտքագրեք, մենք կգրենք `$` կամ `>` խորհրդանիշ: Երբեմն դրա ձախ կողմում կավելացնենք ևս մի քանի տեքստ: Անտեսեք ձախ կողմը և պարզապես մուտքագրեք հրահանգը. Այն սկսվում է հուշումից հետո:

## Ձեր առաջին հրամանը (YAY!)

Սկսենք մուտքագրել այս հրամանը.

<!--sec data-title="Your first command: macOS and Linux" data-id="OSX_Linux_whoami" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    $ whoami
    

<!--endsec-->

<!--sec data-title="Your first command: Windows" data-id="windows_whoami" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    > whoami
    

<!--endsec-->

Եվ ապա սեղմեք `enter`: Սա է մեր արդյունքը.

{% filename %}command-line{% endfilename %}

    $ whoami
    olasitarska
    

Ինչպես տեսնում եք, համակարգիչը նոր է տպել ձեր օգտվողի անունը: Կոկիկ է, այնպես չէ՞: :)

> Փորձեք մուտքագրել յուրաքանչյուր հրաման ձեռքով, այլ ոչ թե պատճենել և տեղադրել: Այսպիսով, դուք ավելի լավ կհիշեք:

## Հիմունքներ

Յուրաքանչյուր գործավար համակարգ ունի հրամանի տողի մի փոքր այլ հրամանների հավաքածու, այնպես որ համոզվեք, որ հետևում եք ձեր օպերացիոն համակարգի հրահանգներին: Փորձե՞նք սա:

### Ընթացիկ գրացուցակ/Current directory

Ցանկալի կլիներ իմանալ, թե որտեղ ենք մենք գտնվում, այնպես չէ՞: Եկեք տեսնենք: Մուտքագրեք այս հրամանը և սեղմեք `enter`.

<!--sec data-title="Current directory: macOS and Linux" data-id="OSX_Linux_pwd" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    $ pwd
    /Users/olasitarska
    

> Նշում. «Pwd» նշանակում է «տպել աշխատանքային գրացուցակ»/'print working directory:

<!--endsec-->

<!--sec data-title="Current directory: Windows" data-id="windows_cd" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    > cd
    C:\Users\olasitarska
    

> Նշում. «Cd» նշանակում է «փոփոխել գրացուցակը»/'change directory': PowerShell- ի միջոցով դուք կարող եք օգտագործել pwd այնպես, ինչպես Linux- ում կամ macOS- ում:

<!--endsec-->

Նման բան, հավանաբար, ձեր համակարգչում կտեսնեք: Հրամանի տող/command line բացելիս սովորաբար գտնվում եք ընթացիկ օգտվողի տնային գրացուցակում/user's home directory:

* * *

### Իմացիր ավելին հրամանի/command մասին

Հրամանի տողի շատ հրամաններ ներկառուցված օգնություն ունեն: Օրինակ ՝ ահա, թե ինչպես կարելի է ավելին իմանալ հրամանի մասին, որը ցույց է տալիս, թե որ թղթապանակում եք գտնվում ներկայումս.

<!--sec data-title="Command help: macOS and Linux" data-id="OSX_Linux_man" data-collapse=true ces-->

macOS- ը և Linux- ը ունեն `man` հրաման, որը ձեզ օգնում է հրամանների հարցում: Փորձեք `man pwd` -ը և տեսեք, թե ինչ է ասում, կամ `man` հրամանը այլ հրամանների առաջ դրեք, որպեսզի տեսնեք նրանց օգնությունը: Սովորաբար, `man`-ի էջերը ցուցադրվում են էջ առ էջ: Օգտագործեք space bar հաջորդ էջին անցնելու համար, և ` q ` - ը `օգնությունից դուրս գալու համար:

<!--endsec-->

<!--sec data-title="Command Help: Windows" data-id="windows_help" data-collapse=true ces-->

Օգնություն ցուցադրելու համար գրեթե ցանկացած հրամանին կարող եք ավելացնել ` /? `: Գուցե հարկ լինի ոլորել ներքև ՝ ամբողջ Օգնությունը կարդալու համար: Փորձեք մուտքագրել `cd /?`:

<!--endsec-->

### Նշեք ֆայլերը և գրացուցակները/directories

Այսպիսով ի՞նչ կա դրա մեջ: Լավ կլինի պարզել դա: Տեսնենք.

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
    

> Նշում. PowerShell- ում կարող եք նաև օգտագործել «ls» - ը, ինչպես Linux- ում և macOS- ում:<!--endsec-->

* * *

### Փոխել ընթացիկ գրացուցակը/current directory

Հիմա եկեք գնանք մեր աշխատասեղանի գրացուցակին/Desktop directory.

<!--sec data-title="Change current directory: macOS" data-id="OSX_move_to" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    $ cd Desktop
    

<!--endsec-->

<!--sec data-title="Change current directory: Linux" data-id="Linux_move_to" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    $ cd Desktop
    

Նկատի ունեցեք, որ գրացուցակի անունը «Desktop» կարող է թարգմանվել ձեր Linux հաշվի լեզվով: Եթե ​​դա այդպես է, դուք պետք է `Desktop` փոխարինեք թարգմանված անունով. օրինակ ՝ `Schreibtisch` գերմաներենի համար:

<!--endsec-->

<!--sec data-title="Change current directory: Windows" data-id="windows_move_to" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    > cd Desktop
    

<!--endsec-->

Ստուգեք, արդյոք այն իսկապես փոխվել է.

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

Ահա այն!

> PRO հուշում. Եթե ձեր ստեղնաշարի վրա մուտքագրեք ` cd D ` և այնուհետև սեղմեք ` tab (էջանիշը/ներդիրը) `, command line (հրամանի տողը) ավտոմատ կերպով լրացնում է անվան մնացած մասը, որպեսզի կարողանաք ավելի արագ նավարկել Եթե ​​«D» - ով սկսվող մեկից ավելի պանակներ կան, երկու անգամ սեղմեք ` tab (ներդիրը )` ստեղնին `ընտրանքների ցուցակ ստանալու համար:

* * *

### Ստեղծեք գրացուցակ

Ի՞նչ կասեք ձեր աշխատասեղանի վրա պրակտիկ գրացուցակ ստեղծելու մասին: Դուք կարող եք դա անել այս կերպ.

<!--sec data-title="Create directory: macOS and Linux" data-id="OSX_Linux_mkdir" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    $ mkdir practice
    

<!--endsec-->

<!--sec data-title="Create directory: Windows" data-id="windows_mkdir" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    > mkdir practice
    

<!--endsec-->

Այս փոքրիկ հրահանգը կստեղծի ձեր աշխատասեղանի վրա `practice` անունով պանակ: Կարող եք ստուգել, ​​արդյոք այնտեղ կա ՝ նայելով ձեր աշխատասեղանին կամ գործարկելով `ls` կամ `dir` հրամանը: Փորձիր. :)

> PRO հուշում. Եթե չեք ցանկանում անընդմեջ մուտքագրել նույն հրամանները, փորձեք սեղմել `վերին սլաքը/up arrow` և `ներքևի սլաքը/ down arrow` ձեր ստեղնաշարի վրա, որպեսզի շրջանցեք վերջերս օգտագործված հրամանները:

* * *

### Վարժություն

Մի փոքր առաջադրանք. Նորաստեղծ `practice/պրակտիկայի` թղթապանակում ստեղծեք պանակ, որը կոչվում է `test`: (Օգտագործեք `cd` և `mkdir` հրահանգները):

#### Լուծում.

<!--sec data-title="Exercise solution: macOS and Linux" data-id="OSX_Linux_test_dir" data-collapse=true ces-->

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

<!--sec data-title="Clean up: macOS and Linux" data-id="OSX_Linux_back" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    $ cd ..
    

<!--endsec-->

<!--sec data-title="Clean up: Windows" data-id="windows_back" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    > cd ..
    

<!--endsec-->

Օգտագործելով ` .. `-ի և ` cd ` - ի հրամանները միասին դուք կարող եք փոխել ընթացիկ գրացուցակը/current directory ծնող գրացուցակի/parent directory (այսինքն ՝ գրացուցակը, որը պարունակում է ձեր ընթացիկ գրացուցակը)

Ստուգեք, թե որտեղ եք դուք ՝

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

Հիմա ժամանակն է ջնջել `practice` գրացուցակը.

> ** Ուշադրություն **. `del`, `rmdir` կամ `rm`ֆայլերը ջնջելը անվերադարձ է, այսինքն ՝ *ջնջված ֆայլերը կվերանան ընդմիշտ*!: Այսպիսով, շատ զգույշ եղեք այս հրամանի հետ:

<!--sec data-title="Delete directory: Windows Powershell, macOS and Linux" data-id="OSX_Linux_rm" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    $ rm -r practice
    

<!--endsec-->

<!--sec data-title="Delete directory: Windows Command Prompt" data-id="windows_rmdir" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    > rmdir /S practice
    practice, Are you sure <Y/N>? Y
    

<!--endsec-->

Կատարած է! Համոզված լինելու համար, որ այն իրականում ջնջված է, եկեք ստուգենք այն.

<!--sec data-title="Check deletion: macOS and Linux" data-id="OSX_Linux_ls2" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    $ ls
    

<!--endsec-->

<!--sec data-title="Check deletion: Windows" data-id="windows_dir2" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    > dir
    

<!--endsec-->

### Ելք

Առայժմ վերջ: Այժմ կարող եք ապահով կերպով փակել հրամանի տողը: Եկեք դա անենք հակերային եղանակով, լա՞վ: :)

<!--sec data-title="Exit: macOS and Linux" data-id="OSX_Linux_exit" data-collapse=true ces-->

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