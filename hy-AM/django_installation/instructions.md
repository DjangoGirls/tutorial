> Այս բաժնի մի մասը հիմնված է Geek Girls Carrots- ի (https://github.com/ggcarrots/django-carrots) ձեռնարկների վրա:
> 
> Այս բաժնի մի մասը հիմնված է  django-marcador- ի վրա ձեռնարկ </ 0> լիցենզավորված Creative Commons- ի ներքո Attribution-ShareAlike 4.0 միջազգային լիցենզիա: Django-marcador ձեռնարկի հեղինակային իրավունքի պաշտպանն են Markus Zapke-Gründemann et al.</p> </blockquote> 
> 
> ## Վիրտուալ միջավայր
> 
> Նախքան Django- ն տեղադրելը, մենք ձեզ կառաջարկենք տեղադրել չափազանց օգտակար գործիք, որը կօգնի ձեր կոդավորման միջավայրը կոկիկ պահել ձեր համակարգչում: Հնարավոր է բաց թողնել այս քայլը, բայց խորհուրդ է տրվում իրականացնել: Հնարավոր լավագույն կարգավորումից սկսելը ապագայում ձեզ շատ դժվարություններ կփրկի:
> 
> Այսպիսով, եկեք ստեղծենք ** վիրտուալ միջավայր/virtual environment** (կոչվում է նաև *virtualenv* ): Virtualenv- ը մեկուսացնելու է ձեր Python / Django- ի տեղադրումը ՝ ըստ նախագծի: Սա նշանակում է, որ որևէ փոփոխություն, որ կատարեք մեկ կայքում, չի ազդի որևէ այլ կայքի վրա, որը դուք նույնպես զարգացնում եք: Կոկիկ է, այնպես չէ՞:
> 
> Դուք պետք է ընդամենը գտնեք գրացուցակ, որում ցանկանում եք ստեղծել `virtualenv`; ձեր տան գրացուցակը, օրինակ. Windows- ում այն ​​կարող է նման լինել `C:\Users\Name` (որտեղ ` Name ` - ը ձեր մուտքի անունն է):
> 
> > ** ՆՇՈՒՄ. ** Windows- ում համոզվեք, որ այս գրացուցակը չի պարունակում շեշտադրված կամ հատուկ նիշեր. եթե ձեր օգտանունը պարունակում է ընդգծված նիշեր, օգտագործեք այլ գրացուցակ, օրինակ ՝ `C:\djangogirls`:
> 
> Այս ձեռնարկի համար մենք կօգտագործենք նոր գրացուցակ ` djangogirls ` ձեր տան գրացուցակից.
> 
> {% filename %}command-line{% endfilename %}
> 
>     $ mkdir djangogirls
>     $ cd djangogirls
>     
> 
> Մենք պատրաստելու ենք մի վիրտուալ անուն, որը կոչվում է ` myvenv `: Ընդհանուր հրամանը կլինի ձևաչափով/format.
> 
> {% filename %}command-line{% endfilename %}
> 
>     $ python3 -m venv myvenv
>     
> 
> <!--sec data-title="Virtual environment: Windows" data-id="virtualenv_installation_windows"
data-collapse=true ces-->
> 
> Նոր `virtualenv` ստեղծելու համար հարկավոր է բացել հրամանի տողը և գործարկել `python -m venv myvenv`: Դա կունենա այսպիսի տեսք.
> 
> {% filename %}command-line{% endfilename %}
> 
>     C:\Users\Name\djangogirls> python -m venv myvenv
>     
> 
> Որտեղ ` myvenv ` - ը ձեր `virtualenv` անունն է: Կարող եք օգտագործել ցանկացած այլ անուն, բայց հավատարիմ մնացեք փոքրատառերին և մի օգտագործեք բացատներ, շեշտադրումներ կամ հատուկ նիշեր: Լավ է նաև, որ անունը կարճ մնա. Դուք դեռ շատ կանդրադառնաք դրան:
> 
> <!--endsec-->
> 
> <!--sec data-title="Virtual environment: Linux and OS X" data-id="virtualenv_installation_linuxosx"
data-collapse=true ces-->
> 
> Մենք կարող ենք ստեղծել ` virtualenv ` ինչպես Linux- ի, այնպես էլ OS X- ի վրա ՝ գործարկելով `python3 -m venv myvenv`: Դա կունենա այսպիսի տեսք.
> 
> {% filename %}command-line{% endfilename %}
> 
>     $ python3 -m venv myvenv
>     
> 
> ` myvenv ` - ը ձեր `virtualenv` անունն է: Կարող եք օգտագործել ցանկացած այլ անուն, բայց հավատարիմ մնացեք փոքրատառերին և բացատներ մի օգտագործեք: Լավ է նաև, որ անունը կարճ մնա. Դուք դեռ շատ կանդրադառնաք դրան:
> 
> > ** ՆՇՈՒՄ. ** Debian / Ubuntu- ի որոշ տարբերակների վրա կարող եք ստանալ հետևյալ սխալը.
> > 
> > {% filename %}command-line{% endfilename %}
> > 
> >     The virtual environment was not created successfully because ensurepip is not available.  On Debian/Ubuntu systems, you need to install the python3-venv package using the following command.
> >        apt install python3-venv
> >     You may need to use sudo with that command.  After installing the python3-venv package, recreate your virtual environment.
> >     
> > 
> > Այս դեպքում հետևեք վերը նշված հրահանգներին և տեղադրեք ` python3-venv ` փաթեթը. {% filename %}command-line{% endfilename %}
> > 
> >     $ sudo apt install python3-venv
> >     
> > 
> > ** ՆՇՈՒՄ. ** Debian / Ubuntu- ի որոշ տարբերակներում վիրտուալ միջավայր նախաձեռնելիս այն տալիս է հետևյալ սխալը.
> > 
> > {% filename %}command-line{% endfilename %}
> > 
> >     Error: Command '['/home/eddie/Slask/tmp/venv/bin/python3', '-Im', 'ensurepip', '--upgrade', '--default-pip']' returned non-zero exit status 1
> >     
> > 
> > Այս խնդրը շրջանցելու համար օգտագործեք ` virtualenv ` հրամանը:
> > 
> > {% filename %}command-line{% endfilename %}
> > 
> >     $ sudo apt install python-virtualenv
> >     $ virtualenv --python=python{{ book.py_version }} myvenv
> >     
> > 
> > **Նշում** Եթե նման սխալ եք ստանում
> > 
> > {% filename %}command-line{% endfilename %}
> > 
> >     E: Unable to locate package python3-venv
> >     
> > 
> > փոխարենը բաց թող
> > 
> > {% filename %}command-line{% endfilename %}
> > 
> >     sudo apt install python{{ book.py_version }}-venv
> >     
> 
> <!--endsec-->
> 
> ## Վիրտուալենվի/virtualenv-ի հետ աշխատանք
> 
> Վերոնշյալ հրամանը կստեղծի ` myvenv ` գրացուցակ (կամ մեկ այլ ՝ ձեր ընտրած ցանկացած անուն), որը կպարունակի վիրտուալ միջավայր/ virtual environment (հիմնականում ֆայլերի և պանակների շարք):
> 
> <!--sec data-title="Working with virtualenv: Windows" data-id="virtualenv_windows"
data-collapse=true ces-->
> 
> Սկսեք ձեր վիրտուալ միջավայրը/virtual environment-ը `գործարկելով.
> 
> {% filename %}command-line{% endfilename %}
> 
>     C:\Users\Name\djangogirls> myvenv\Scripts\activate
>     
> 
> > ** Նշում. ** Windows 10-ի դեպքում Windows PowerShell- ում կարող է ստացվել սխալի հաղորդագրություն, որում ասվում է, որ `execution of scripts is disabled on this system/սցենարը անջատված է այս համակարգում` In this case, open another Windows PowerShell with the "Run as Administrator" option. Then try typing the following command before starting your virtual environment:
> > 
> > {% filename %}command-line{% endfilename %}
> > 
> >     C:\WINDOWS\system32> Set-ExecutionPolicy -ExecutionPolicy RemoteSigned
> >         Execution Policy Change
> >         The execution policy helps protect you from scripts that you do not trust. Changing the execution policy might expose you to the security risks described in the about_Execution_Policies help topic at http://go.microsoft.com/fwlink/?LinkID=135170. Do you want to change the execution policy? [Y] Yes  [A] Yes to All  [N] No  [L] No to All  [S] Suspend  [?] Help (default is "N"): A
> >     
> 
> <!-- (This comment separates the two blockquote blocks, so that GitBook and Crowdin don't merge them into a single block.) -->
> 
> > **NOTE:** For users of the popular editor VS Code, which come with an integrated terminal based off windows PowerShell, if you wish to stick with the integrated terminal, you may run the following command to activate your virtual environment:
> > 
> >     $ . myvenv\Scripts\activate.ps1
> >     
> > 
> > The advantage is that you don't have to switch between editor windows and command-line windows
> 
> <!--endsec-->
> 
> <!--sec data-title="Working with virtualenv: Linux and OS X" data-id="virtualenv_linuxosx"
data-collapse=true ces-->
> 
> Start your virtual environment by running:
> 
> {% filename %}command-line{% endfilename %}
> 
>     $ source myvenv/bin/activate
>     
> 
> Remember to replace `myvenv` with your chosen `virtualenv` name!
> 
> > **NOTE:** sometimes `source` might not be available. In those cases try doing this instead:
> > 
> > {% filename %}command-line{% endfilename %}
> > 
> >     $ . myvenv/bin/activate
> >     
> 
> <!--endsec-->
> 
> You will know that you have `virtualenv` started when you see that the prompt in your console is prefixed with `(myvenv)`.
> 
> When working within a virtual environment, `python` will automatically refer to the correct version so you can use `python` instead of `python3`.
> 
> OK, we have all important dependencies in place. We can finally install Django!
> 
> ## Installing Django {#django}
> 
> Now that you have your `virtualenv` started, you can install Django.
> 
> Before we do that, we should make sure we have the latest version of `pip`, the software that we use to install Django:
> 
> {% filename %}command-line{% endfilename %}
> 
>     (myvenv) ~$ python -m pip install --upgrade pip
>     
> 
> ### Installing packages with requirements
> 
> A requirements file keeps a list of dependencies to be installed using `pip install`:
> 
> First create a `requirements.txt` file inside of the `djangogirls/` folder, using the code editor that you installed earlier. You do this by opening a new file in the code editor and then saving it as `requirements.txt` in the `djangogirls/` folder. Your directory will look like this:
> 
>     djangogirls
>     ├── myvenv
>     │   └── ...
>     └───requirements.txt
>     
> 
> In your `djangogirls/requirements.txt` file you should add the following text:
> 
> {% filename %}djangogirls/requirements.txt{% endfilename %}
> 
>     Django~={{ book.django_version }}
>     
> 
> Now, run `pip install -r requirements.txt` to install Django.
> 
> {% filename %}command-line{% endfilename %}
> 
>     (myvenv) ~$ pip install -r requirements.txt
>     Collecting Django~={{ book.django_version }} (from -r requirements.txt (line 1))
>       Downloading Django-{{ book.django_version }}-py3-none-any.whl (7.1MB)
>     Installing collected packages: Django
>     Successfully installed Django-{{ book.django_version }}
>     
> 
> <!--sec data-title="Installing Django: Windows" data-id="django_err_windows"
data-collapse=true ces-->
> 
> > If you get an error when calling pip on Windows platform, please check if your project pathname contains spaces, accents or special characters (for example, `C:\Users\User Name\djangogirls`). If it does, please consider using another place without spaces, accents or special characters (suggestion: `C:\djangogirls`). Create a new virtualenv in the new directory, then delete the old one and try the above command again. (Moving the virtualenv directory won't work since virtualenv uses absolute paths.)
> 
> <!--endsec-->
> 
> <!--sec data-title="Installing Django: Windows 8 and Windows 10" data-id="django_err_windows8and10"
data-collapse=true ces-->
> 
> > Your command line might freeze after when you try to install Django. If this happens, instead of the above command use:
> > 
> > {% filename %}command-line{% endfilename %}
> > 
> >     C:\Users\Name\djangogirls> python -m pip install -r requirements.txt
> >     
> 
> <!--endsec-->
> 
> <!--sec data-title="Installing Django: Linux" data-id="django_err_linux"
data-collapse=true ces-->
> 
> > If you get an error when calling pip on Ubuntu 12.04 please run `python -m pip install -U --force-reinstall pip` to fix the pip installation in the virtualenv.
> 
> <!--endsec-->
> 
> That's it! You're now (finally) ready to create a Django application!