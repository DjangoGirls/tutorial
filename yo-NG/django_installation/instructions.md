> Apá kan lára abala yìí dá lórí àwọn àlàyé ti Geek Girls Carrots (https://github.com/ggcarrots/django-carrots).
> 
> Apá kan lára abala yìí dá lórí [àlàyé django-marcador](http://django-marcador.keimlink.de/) náà tó ní ìwé-àṣẹ lábẹ́ Creative Commons Attribution-ShareAlike 4.0 International License. Àlàyé django-marcador náà ni ẹ̀tọ́ rẹ̀ jẹ́ ti Markus Zapke-Gründemann et al.

## Àyíká àìrí

Ṣáájú kí a tó ṣàgbékalẹ̀ Django, a ó mú ọ ṣàgbékalẹ̀ irinṣẹ́ kan tó wúlò púpọ̀ láti ṣe ìrànlọ́wọ́ mímú kí àyíká kóòdù kíkọ rẹ wà létòlétò lórí kọ̀mpútà rẹ. Ó ṣeéṣe láti fo ìgbésẹ̀ yìí, ṣùgbọ́n òhun ló dáa jù. Bíbẹ̀rẹ̀ pẹ̀lú àgbékalẹ̀-ètò tó dára jù lọ yíò gbà ọ́ sílẹ̀ lọ́wọ́ ọ̀pọ̀lọpọ̀ wàhálà lọ́jọ́ iwájú!

Nítorí náà, jẹ́ ká ṣẹ̀dá **àyíká àìrí** kan (tí a tún pè ní *virtualenv* kan). Virtualenv yíò ṣe ìpínyà àgbékalẹ̀-ètò Python/Django rẹ lọ́tọ̀ọ̀tọ̀ lórí ìpìlẹ̀ iṣẹ́ kọ̀ọ̀kan. Èyí túmọ̀ sí pé èyíkéyìí ìyípadà tí o bá ṣe sí ààyè ayélujára kan kò ní nípa lórí àwọn mìíràn tí o bá tún n gbé jáde. Ó dáa, àbí bẹ́ẹ̀ kọ?

Gbogbo ohun tí o nílò láti ṣe ni láti wá àkójọpọ̀ fáìlì kan tí o ti fẹ́ ṣẹ̀dá `virtualenv` náà; àkójọpọ̀ fáìlì ìpìlẹ̀ rẹ, fún àpẹẹrẹ. Lórí Windows, ó lè rí bíi `C:\Users\Name` (níbi tí `Name` jẹ́ orúkọ ìwọlé rẹ).

> **ÀKÍYÈSÍ:** Lórí Windows, ri dájú pé àkójọpọ̀ fáìlì yìí kò ní àmì ohùn tàbí àkànṣe ẹyọ ọ̀rọ̀; tí orúkọ aṣàmúlò rẹ bá ní àwọn àmì ohùn, lo àkójọpọ̀ fáìlì mìíràn, fún àpẹẹrẹ, `C:\djangogirls`.

Fún àlàyé yìí, a ó máa lo àkójọpọ̀ fáìlì `djangogirls` tuntun kan láti àkójọpọ̀ fáìlì ìpìlẹ̀ rẹ:

{% filename %}command-line{% endfilename %}

    $ mkdir djangogirls
    $ cd djangogirls
    

A ó ṣẹ̀dá virtualenv kan tí a n pè ní `myvenv`. Àṣẹ tí a sábà náà yíò rí báyìí:

{% filename %}command-line{% endfilename %}

    $ python3 -m venv myvenv
    

<!--sec data-title="Virtual environment: Windows" data-id="virtualenv_installation_windows"
data-collapse=true ces-->

Láti ṣẹ̀dá `virtualenv` tuntun kan, o nílò láti ṣí command prompt náà kí o sì ṣe `python -m venv myvenv`. Yíò rí báyìí:

{% filename %}command-line{% endfilename %}

    C:\Users\Name\djangogirls> python -m venv myvenv
    

Níbi tí `myvenv` jẹ́ orúkọ `virtualenv` rẹ. O lè lo èyíkéyìí orúkọ mìíràn, ṣùgbọ́n dúró lórí lílo lẹ́tà kékeré láìsí àwọn àlàfo, àmì ohùn tàbí àkànṣe ẹyọ ọ̀rọ̀. Ó tún jẹ́ èrò tó dára kan láti mú kí orúkọ náà kéré – ìwọ yíò ma tọ́ka rẹ̀ lọ́pọ̀ ìgbà!

<!--endsec-->

<!--sec data-title="Virtual environment: Linux and OS X" data-id="virtualenv_installation_linuxosx"
data-collapse=true ces-->

A lè ṣẹ̀dá `virtualenv` kan lórí Linux àti OS X nípasẹ̀ lílo `python3 -m venv myvenv`. Yíò rí báyìí:

{% filename %}command-line{% endfilename %}

    $ python3 -m venv myvenv
    

`myvenv` ni orúkọ `virtualenv` rẹ. O lè lo èyíkéyìí orúkọ mìíràn, ṣùgbọ́n dúró lórí lílo lẹ́tà kékeré láìsí àwọn àlàfo. Ó tún jẹ́ èrò tó dára kan láti mú kí orúkọ náà kéré nítorí pé ìwọ yíò ma tọ́ka rẹ̀ lọ́pọ̀ ìgbà!

> **ÀKÍYÈSÍ:** Lórí àwọn ẹyà Debian/Ubuntu kan, o lè rí àṣìṣe tó tẹ̀lé yìí:
> 
> {% filename %}command-line{% endfilename %}
> 
>     The virtual environment was not created successfully because ensurepip is not available.  On Debian/Ubuntu systems, you need to install the python3-venv package using the following command.
>        apt install python3-venv
>     You may need to use sudo with that command.  After installing the python3-venv package, recreate your virtual environment.
>     
> 
> Ní irú ìṣẹ̀lẹ̀ yìí, tẹ̀lé àwọn ìtọ́sọ́nà tó wà lókè kí o sì ṣàgbékalẹ̀ ètò `python3-venv` náà: {% filename %}command-line{% endfilename %}
> 
>     $ sudo apt install python3-venv
>     
> 
> **ÀKÍYÈSÍ:** Lórí àwọn ẹyà Debian/Ubuntu kan, bíbẹ̀rẹ̀ àyíká àìrí náà báyìí yíò fúnni ní àṣìṣe tó tẹ̀lé yìí:
> 
> {% filename %}command-line{% endfilename %}
> 
>     Error: Command '['/home/eddie/Slask/tmp/venv/bin/python3', '-Im', 'ensurepip', '--upgrade', '--default-pip']' returned non-zero exit status 1
>     
> 
> Láti borí àṣìṣe yìí, lo àṣẹ `virtualenv` náà dípò.
> 
> {% filename %}command-line{% endfilename %}
> 
>     $ sudo apt install python-virtualenv
>     $ virtualenv --python=python3.6 myvenv
>     
> 
> **ÀKÍYÈSÍ:** Tí o bá rí àṣìṣe kan bíi
> 
> {% filename %}command-line{% endfilename %}
> 
>     E: Unable to locate package python3-venv
>     
> 
> ṣe èyí dípò:
> 
> {% filename %}command-line{% endfilename %}
> 
>     sudo apt install python3.6-venv
>     

<!--endsec-->

## Ìṣiṣẹ́ pẹ̀lú virtualenv

Àṣẹ tó wà lókè náà yíò ṣẹ̀dá àkójọpọ̀ fáìlì kan tí a n pè ní `myvenv` (tàbí orúkọ yòówù tí o yàn) tí yíò kó àyíká àìrí wa sínú (ní pàtàkì àpapọ̀ àkójọpọ̀ fáìlì àti àwọn fáìlì kan).

<!--sec data-title="Working with virtualenv: Windows" data-id="virtualenv_windows"
data-collapse=true ces-->

Bẹ̀rẹ̀ àyíká àìrí rẹ nípasẹ̀ ṣíṣe:

{% filename %}command-line{% endfilename %}

    C:\Users\Name\djangogirls> myvenv\Scripts\activate
    

> **ÀKÍYÈSÍ:** lórí Windows 10, o lè rí àṣìṣe kan nínú Windows PowerShell náà tó sọ pé `execution of scripts is disabled on this system`. Ní irú ìṣẹ̀lẹ̀ yìí, ṣí Windows PowerShell mìíràn pẹ̀lú àṣàyàn "Run as Administrator" (Ṣiṣẹ́ gẹ́gẹ́ bí Alákòóso) náà. Lẹ́yìn náà gbìyànjú títẹ àṣẹ tó tẹ̀le yìí ṣáájú kí o tó bẹ̀rẹ̀ àyíká àìrí rẹ:
> 
> {% filename %}command-line{% endfilename %}
> 
>     C:\WINDOWS\system32> Set-ExecutionPolicy -ExecutionPolicy RemoteSigned
>         Execution Policy Change
>         The execution policy helps protect you from scripts that you do not trust. Changing the execution policy might expose you to the security risks described in the about_Execution_Policies help topic at http://go.microsoft.com/fwlink/?LinkID=135170. Do you want to change the execution policy? [Y] Yes  [A] Yes to All  [N] No  [L] No to All  [S] Suspend  [?] Help (default is "N"): A
>     
> 
> **NOTE:** For users of the popular editor VS Code, which come with an integrated terminal based off windows powershell, if you wish to stick with the integrated terminal, you may run the following command to activate your virtual environment:
> 
>     $ . myvenv\Scripts\activate.ps1
>     
> 
> The advantage is that you don't have to switch between editor windows and command-line windows

<!--endsec-->

<!--sec data-title="Working with virtualenv: Linux and OS X" data-id="virtualenv_linuxosx"
data-collapse=true ces-->

Bẹ̀rẹ̀ àyíká àìrí rẹ nípasẹ̀ ṣíṣe:

{% filename %}command-line{% endfilename %}

    $ source myvenv/bin/activate
    

Rántí láti rọ́pò `myvenv` pẹ̀lú orúkọ `virtualenv` rẹ tó o yàn!

> **ÀKÍYÈSÍ:** nígbà míì `source` lè má wà lárọ̀ọ́wọ́tó. Ní irú àwọn ìṣẹ̀lẹ̀ yẹn, gbìyànjú ṣíṣe èyí dípò:
> 
> {% filename %}command-line{% endfilename %}
> 
>     $ . myvenv/bin/activate
>     

<!--endsec-->

Ìwọ yíò mọ̀ pé o ti bẹ̀rẹ̀ `virtualenv` nígbà tí o bá rí `(myvenv)` níwájú prompt náà nínú console rẹ.

Nígbà tí o bá n ṣiṣẹ́ nínú àyíká àìrí kan, `python` fúnra rẹ̀ yíò tọ́ka sí ẹyà tó yẹ, nítorí náà o lè lo `python` dípò `python3`.

Ó dáa, a ti ní gbogbo ohun pàtàkì tí a nílò. A lè wá ṣàgbékalẹ̀ Django!

## Ṣíṣe àgbékalẹ̀ Django

Ní báyìí tí o ti bẹ̀rẹ̀ `virtualenv` rẹ, o lè ṣàgbékalẹ̀ Django.

Ṣáájú kí a tó ṣe ìyẹn, ó yẹ kí a ri dájú pé a ní ẹyà `pip` tó jáde gbẹ̀yìn náà, ètò tí a n lò láti ṣàgbékalẹ̀ Django:

{% filename %}command-line{% endfilename %}

    (myvenv) ~$ python -m pip install --upgrade pip
    

### Ṣíṣe àgbékalẹ̀ àwọn ètò pẹ̀lú àwọn ohun tí a béèrè fún (requirements)

Fáìlì àwọn ohun tí a béèrè fún (requirements) kan máa ṣàkọsílẹ̀ àwọn ohun tí a nílò láti ṣàgbékalẹ̀ pẹ̀lú lílo `pip install`:

Kọ́kọ́ ṣẹ̀dá fáìlì `requirements.txt` kan sínú fódà `djangogirls/` náà, pẹ̀lú lílo olóòtú kóòdù tí o ti ṣàgbékalẹ̀ ṣáájú. O lè ṣe èyí nípasẹ̀ ṣíṣí fáìlì tuntun kan nínú olóòtú kóòdù náà àti títọ́jú rẹ gẹ́gẹ́ bí `requirements.txt` sínú fódà `djangogirls/` náà. Àkójọpọ̀ fáìlì rẹ yíò rí báyìí:

    djangogirls
    └───requirements.txt
    

Nínú fáìlì `djangogirls/requirements.txt` rẹ, ó yẹ kí o ṣàfikún ọ̀rọ̀ tó tẹ̀le yìí:

{% filename %}djangogirls/requirements.txt{% endfilename %}

    Django~={{ book.django_version }}
    

Ní báyìí, ṣe `pip install -r requirements.txt` láti ṣàgbékalẹ̀ Django.

{% filename %}command-line{% endfilename %}

    (myvenv) ~$ pip install -r requirements.txt
    Collecting Django~={{ book.django_version }} (from -r requirements.txt (line 1))
      Downloading Django-{{ book.django_version }}-py3-none-any.whl (7.1MB)
    Installing collected packages: Django
    Successfully installed Django-{{ book.django_version }}
    

<!--sec data-title="Installing Django: Windows" data-id="django_err_windows"
data-collapse=true ces-->

> If you get an error when calling pip on Windows platform, please check if your project pathname contains spaces, accents or special characters (for example, `C:\Users\User Name\djangogirls`). If it does, please consider using another place without spaces, accents or special characters (suggestion: `C:\djangogirls`). Create a new virtualenv in the new directory, then delete the old one and try the above command again. (Moving the virtualenv directory won't work since virtualenv uses absolute paths.)

<!--endsec-->

<!--sec data-title="Installing Django: Windows 8 and Windows 10" data-id="django_err_windows8and10"
data-collapse=true ces-->

> Your command line might freeze after when you try to install Django. If this happens, instead of the above command use:
> 
> {% filename %}command-line{% endfilename %}
> 
>     C:\Users\Name\djangogirls> python -m pip install -r requirements.txt
>     

<!--endsec-->

<!--sec data-title="Installing Django: Linux" data-id="django_err_linux"
data-collapse=true ces-->

> If you get an error when calling pip on Ubuntu 12.04 please run `python -m pip install -U --force-reinstall pip` to fix the pip installation in the virtualenv.

<!--endsec-->

Ó parí! O ti ṣetán báyìí láti ṣẹ̀dá ètò Django kan!