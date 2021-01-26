> Kasama sa tuntuning ito ay nakabase sa mga tutorial ng Geek Girls Carrots (https://github.com/ggcarrots/django-carrots).
> 
> Kasama sa tuntining ito ay nakabase sa [tutorial ng django-marcador](http://django-marcador.keimlink.de/) na lisensyado sa ilalim ng Creative Commons Attribution-ShareAlike 4.0 International License. Ang django-marcador na tutorial ay nakacopyright kay Markus Zapke-Gründemann et al.

## Virtual na Kaligiran

Bago tayo mag-install ng Django, mag-install muna tayo nang isa pang napakaimportanteng kagamitan na makakatulong na maging malinis ang ating coding environment sa iyong kompyuter. Maaring laktawan ang hakbang na ito, ngunit lubusan namin itong nirerekomenda. Ang pagsimula sa pinakamagandang setup na posible ay makaiwas sa napakaraming problema sa hinaharap!

Kaya, maglikha tayo ng **virtual na environment** (tinatawag din na *virtualenv*). Ang virtualenv ay magbubukod sa iyong Python/Django na setup sa bawat proyekto. Ibig sabihin nito, lahat ng iyong mga binago sa iyong website ay hindi makaapekto sa iba mong ginagawa. Malinis, di ba?

Ang kinakailangan mo lang gawin ay maghanap ng directory kung saan gusto mong maglikha ng `virtualenv`; ang iyong home directory, halimbawa. On Windows, it might look like `C:\Users\Name` (where `Name` is the name of your login).

> **NOTE:** On Windows, make sure that this directory does not contain accented or special characters; if your username contains accented characters, use a different directory, for example, `C:\djangogirls`.

Para sa tutorial na ito, gagamit tayo ng bagong directory na `djangogirls` mula sa iyong home na directory:

{% filename %}command-line{% endfilename %}

    $ mkdir djangogirls
    $ cd djangogirls
    

Gagawa tayo ng isang virtualevn na tinatawag na `myenv`. Ang general na command ay nasa ganitong format:

{% filename %}command-line{% endfilename %}

    $ python3 -m venv myvenv
    

<!--sec data-title="Virtual environment: Windows" data-id="virtualenv_installation_windows"
data-collapse=true ces-->

Para maglikha ng bagong `virtualenv`, kailangan mong buksan ang command prompt at patakbuhin ang `python -m venv myvenv`. Maging kagaya ito nito:

{% filename %}command-line{% endfilename %}

    C:\Users\Name\djangogirls> python -m venv myvenv
    

Kung saan ang `myvenv` ay ang pangalan ng iyong `virtualenv`. Maari kang gumamit ng ibang pangalan, pero mainam na gagamit ka ng maliliit na titik at walang mga agwat, tuldik o mga espesyal na letra. Maganda din na gagawin mong maikli ang iyong pangalan - gagamitin natin ito nang maraming beses!

<!--endsec-->

<!--sec data-title="Virtual environment: Linux and OS X" data-id="virtualenv_installation_linuxosx"
data-collapse=true ces-->

We can create a `virtualenv` on both Linux and OS X by running `python3 -m venv myvenv`. It will look like this:

{% filename %}command-line{% endfilename %}

    $ python3 -m venv myvenv
    

`myvenv` ang pangalan ng iyong `virtualenv`. Maari ka ring gumamit ng ibang pangalan, ngunit dapat maliit na titik at walang mga agwat. It is also a good idea to keep the name short as you'll be referencing it a lot!

> **PAALALA:** Sa ibang bersyon ng Debian/Ubuntu maaring magatanggap ka ng sumunod na mga error:
> 
> {% filename %}command-line{% endfilename %}
> 
>     The virtual environment was not created successfully because ensurepip is not available.  On Debian/Ubuntu systems, you need to install the python3-venv package using the following command.
>        apt install python3-venv
>     You may need to use sudo with that command.  After installing the python3-venv package, recreate your virtual environment.
>     
> 
> Para dito, sundin mo ang mga tagubilin sa taas at mag-install ng `python3-venv` na package: {% filename %}command-line{% endfilename %}
> 
>     $ sudo apt install python3-venv
>     
> 
> **PAALALA:** Sa ibang bersyon ng Debian/Ubuntu ang pagpatakbo ng virtual environment na ito ay kasalukuyang magbigay ng sumusunod na problema:
> 
> {% filename %}command-line{% endfilename %}
> 
>     Error: Command '['/home/eddie/Slask/tmp/venv/bin/python3', '-Im', 'ensurepip', '--upgrade', '--default-pip']' returned non-zero exit status 1
>     
> 
> Para maiwasan ito, gamitin mo ang `virtualenv` na ito.
> 
> {% filename %}command-line{% endfilename %}
> 
>     $ sudo apt install python-virtualenv
>     $ virtualenv --python=python{{ book.py_version }} myvenv
>     
> 
> **PAALALA:** Kung may error gaya nito
> 
> {% filename %}command-line{% endfilename %}
> 
>     E: Unable to locate package python3-venv
>     
> 
> sa halip patakbuhin ito:
> 
> {% filename %}command-line{% endfilename %}
> 
>     sudo apt install python{{ book.py_version }}-venv
>     

<!--endsec-->

## Paggamit ng virtualenv

Ang command sa taas ay maglikha ng directory na tinatawag na `myenv` (o kung ano mang pangalan ang napili mo) na naglalaman ng ating virtual environment (sa simpleng salita, mga directory at mga files).

<!--sec data-title="Working with virtualenv: Windows" data-id="virtualenv_windows"
data-collapse=true ces-->

Patakbuhin ang iyong virtual na environment sa pamamagitan ng pagpagpatakbo ng:

{% filename %}command-line{% endfilename %}

    C:\Users\Name\djangogirls> myvenv\Scripts\activate
    

> **PAALALA:** sa Windows 10 maaring makakatanggap ka ng error sa Windows PowerShell na nagsasabi na ang `pagpatakbo ng mga script ay nakadisable sa sistemang ito`. Kapag nangyari ito, magbukas ng isa pang Windows PowerShell gamit ang "Run as Administrator" na opsyon. Pagkatapos, subukang magtype ng sumusunod na mga command bago patakbuhin ang iyong virtual na environment:
> 
> {% filename %}command-line{% endfilename %}
> 
>     C:\WINDOWS\system32> Set-ExecutionPolicy -ExecutionPolicy RemoteSigned
>         Execution Policy Change
>         Ang execution policy ay nakakatulong para maprotektahan ka sa mga script na hindi mo pinagkatiwalaan. Ang pagbaago ng execution policy ay maaring maghantad sa iyong sa mga panganib sa seguridad na nalalarawan sa about_Execution_Poilicies na mga pangtulong na mga paksa sa http://go.microsoft.com/fwlink/?LinkID=135170. Gusto mo bang baguhin ang iyong execution policy? [Y] Oo  [A] Oo sa Lahat  [N] Hindi  [L] Hindi sa Lahat  [S] I-suspende  [?] Tulong ( ang default ay "N"): A
>     

<!-- (This comment separates the two blockquote blocks, so that GitBook and Crowdin don't merge them into a single block.) -->

> **NOTE:** For users of the popular editor VS Code, which come with an integrated terminal based off windows PowerShell, if you wish to stick with the integrated terminal, you may run the following command to activate your virtual environment:
> 
>     $ . myvenv\Scripts\activate.ps1
>     
> 
> The advantage is that you don't have to switch between editor windows and command-line windows

<!--endsec-->

<!--sec data-title="Working with virtualenv: Linux and OS X" data-id="virtualenv_linuxosx"
data-collapse=true ces-->

Start your virtual environment by running:

{% filename %}command-line{% endfilename %}

    $ source myvenv/bin/activate
    

Remember to replace `myvenv` with your chosen `virtualenv` name!

> **NOTE:** sometimes `source` might not be available. In those cases try doing this instead:
> 
> {% filename %}command-line{% endfilename %}
> 
>     $ . myvenv/bin/activate
>     

<!--endsec-->

You will know that you have `virtualenv` started when you see that the prompt in your console is prefixed with `(myvenv)`.

When working within a virtual environment, `python` will automatically refer to the correct version so you can use `python` instead of `python3`.

OK, we have all important dependencies in place. We can finally install Django!

## Installing Django {#django}

Now that you have your `virtualenv` started, you can install Django.

Before we do that, we should make sure we have the latest version of `pip`, the software that we use to install Django:

{% filename %}command-line{% endfilename %}

    (myvenv) ~$ python -m pip install --upgrade pip
    

### Installing packages with requirements

A requirements file keeps a list of dependencies to be installed using `pip install`:

First create a `requirements.txt` file inside of the `djangogirls/` folder, using the code editor that you installed earlier. You do this by opening a new file in the code editor and then saving it as `requirements.txt` in the `djangogirls/` folder. Your directory will look like this:

    djangogirls
    ├── myvenv
    │   └── ...
    └───requirements.txt
    

In your `djangogirls/requirements.txt` file you should add the following text:

{% filename %}djangogirls/requirements.txt{% endfilename %}

    Django~={{ book.django_version }}
    

Now, run `pip install -r requirements.txt` to install Django.

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

That's it! You're now (finally) ready to create a Django application!