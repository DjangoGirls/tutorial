Git- ը «տարբերակների կառավարման համակարգ է» ("version control system"), որն օգտագործվում է շատ ծրագրավորողների կողմից: Այս ծրագիրը վերահսկում է փոփոխությունները, որոնք տեղի են ունենում ֆայլերում, որպեսզի հետագայում կարողանաք վերականգնել ծածկագրի վիճակը ցանկալի ժամանակահատվածում: Մի փոքր նման է բառ մշակող ("track changes" )ծրագրերի գործառույթին (օրինակ ՝ Microsoft Word կամ LibreOffice Writer) բայց շատ ավելի հզոր:

## Git-ի ներբեռնում

<!--sec data-title="Installing Git: Windows" data-id="git_install_windows"
data-collapse=true ces-->

Կարող ես ներբեռնել Git-ը այս հղումով [git-scm.com](https://git-scm.com/). "next" (հաջորդ) կարող եք ընտրել բոլոր քայլերին, բացառությամբ երկուսի. Քայլ որտեղ այն խնդրում է ընտրել ձեր խմբագրին (choose your editor), պետք է ընտրեք Nano- ն, իսկ «Ձեր PATH միջավայրի կարգավորումը»-("Adjusting your PATH environment") խորագրի ներքո ընտրեք "Use Git and optional Unix tools from the Windows Command Prompt"(«Օգտագործեք Git և ընտրովի Unix գործիքներ Windows հրամանի տողը»)(ներքևի տարբերակը): Մնացած բոլոր պարամետրերը կարող եք թողնել: "Checkout Windows-style, commit Unix-style line endings" տարբերակը լավ ընտրություն կլինի:

Տեղադրումը հաջող ավարտելուց հետո մի մոռացեք վերսկսել հրամանի տողը կամ PowerShell- ը:<!--endsec-->

<!--sec data-title="Installing Git: OS X" data-id="git_install_OSX"
data-collapse=true ces-->

Ներբեռնեք Git- ը [git-scm.com](https://git-scm.com/) կայքից և հետևեք հրահանգներին:

> ** Նշում ** Եթե դուք օգտագործում եք OS X 10.6, 10.7 կամ 10.8, ապա պետք է ներբեռնեք git- ի այս տարբերակը ՝ [Git installer for OS X Snow Leopard](https://sourceforge.net/projects/git-osx-installer/files/git-2.3.5-intel-universal-snow-leopard.dmg/download)

<!--endsec-->

<!--sec data-title="Installing Git: Debian or Ubuntu" data-id="git_install_debian_ubuntu"
data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

```bash
$ sudo apt install git
```

<!--endsec-->

<!--sec data-title="Installing Git: Fedora" data-id="git_install_fedora"
data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

```bash
$ sudo dnf install git
```

<!--endsec-->

<!--sec data-title="Installing Git: openSUSE" data-id="git_install_openSUSE"
data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

```bash
$ sudo zypper install git
```

<!--endsec-->