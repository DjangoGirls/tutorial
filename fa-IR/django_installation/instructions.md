> بخشی از این بخش بر اساس آموزش های هویج دخترک گیک (https://github.com/ggcarrots/django-carrots) است.
> 
> بخشي از اين بخش بر پايه <d> 0> جنگجو -مارکادوراستوار است    آموزش </ 0> تحت مجوز خلاقیت مارکادورمجاز می باشد    مجوز-اشتراک پسندیده 4.0 مجوز بین المللی. آموزش جودو مارکادور    توسط مارکوس_زاپک-گروندمن و همکاران کپی رایت شده است.

## محیط مجازی

قبل از اینکه ما جنگجو را نصب کنیم، شما را برای نصب یک ابزار فوق العاده مفید برای کمک به نگه داشتن محیط برنامه نویسی خود در رایانه خود می گیریم. این امکان وجود دارد که این مرحله را بگذرانید اما بسیار توصیه می شود. شروع با بهترین تنظیم ممکن است در آینده شما را از مشکلات زیادی صرفه جویی خواهد کرد!

بنابراین، اجازه دهید یک محیط ** مجازی </ 0> ایجاد کنیم (همچنین یک * مجازی </ 1> نامیده می شود). مجازی راه اندازی پایتون / جانگو را بر اساس هر پروژه جدا خواهد کرد. این به این معنی است که هر گونه تغییری که شما به یک وبسایت انجام میدهید، بر روی دیگران که در حال توسعه هم نیستند تاثیر نخواهد گذاشت. خب، درست است؟</p> 

همه شما باید انجام دهید این است که یک دایرکتوری را پیدا کنید که در آن می خواهید ` مجازی</ 0> را ایجاد کنید. برای مثال، دایرکتوری خانه شما. در ویندوز، ممکن است مانند <code> C:\Users\Name\ </ 0> درایو (که در آن <code> نام </ 0> نام ورود شما است) ظاهر می شود.</p>

<blockquote>
  <p><strong> نکته: </ 0> در ویندوز اطمینان حاصل کنید که این پوشه حاوی کاراکترهای متمایز یا خاص نیست؛ اگر نام کاربری شما دارای کاراکترهای متمایز است، از یک دایرکتوری دیگر استفاده کنید، به عنوان مثال، <code> درایو سی: \ دختران جنگجو</ 1>.</p>
</blockquote>

<p>برای این آموزش ما از یک دایرکتوری جدید <>> دختران جنگجو</ 0> از دایرکتوری اصلی شما استفاده خواهیم کرد:</p>

<p>% filename %}}خط فرمان% endfilename %}}</p>

<pre><code>$ نمایش ام کا دختران جنگجو
$ سی دی دختران جنگجو
`</pre> 

ما مجازی را ` مای ون</ 0> ایجاد خواهیم کرد. فرمان کلی در قالب خواهد بود:</p>

<p>% filename %}}خط فرمان %endfilename %}}</p>

<pre><code>$ پایتون3-ام ون مایون
`</pre> <!--sec data-title="Virtual environment: Windows" data-id="virtualenv_installation_windows"
data-collapse=true ces-->

برای ایجاد یک <جدید> مجازی</ 0> جدید، باید دستور دستور را باز کنید و ` پایتون-ام ون مایون</ 0> را اجرا کنید. شبیه این خواهد شد:</p>

<p>% filename %}}خط فرمان% endfilename %}}</p>

<pre><code>C:\Users\Name\djangogirls> python -m venv myvenv
`</pre> 

Where `myvenv` is the name of your `virtualenv`. You can use any other name, but stick to lowercase and use no spaces, accents or special characters. It is also good idea to keep the name short – you'll be referencing it a lot!

<!--endsec-->

<!--sec data-title="Virtual environment: Linux and OS X" data-id="virtualenv_installation_linuxosx"
data-collapse=true ces-->

We can create a `virtualenv` on both Linux and OS X by running `python3 -m venv myvenv`. It will look like this:

{% filename %}command-line{% endfilename %}

    $ python3 -m venv myvenv
    

`myvenv` is the name of your `virtualenv`. You can use any other name, but stick to lowercase and use no spaces. It is also a good idea to keep the name short as you'll be referencing it a lot!

> **NOTE:** On some versions of Debian/Ubuntu you may receive the following error:
> 
> {% filename %}command-line{% endfilename %}
> 
>     The virtual environment was not created successfully because ensurepip is not available.  On Debian/Ubuntu systems, you need to install the python3-venv package using the following command.
>        apt install python3-venv
>     You may need to use sudo with that command.  After installing the python3-venv package, recreate your virtual environment.
>     
> 
> In this case, follow the instructions above and install the `python3-venv` package: {% filename %}command-line{% endfilename %}
> 
>     $ sudo apt install python3-venv
>     
> 
> **NOTE:** On some versions of Debian/Ubuntu initiating the virtual environment like this currently gives the following error:
> 
> {% filename %}command-line{% endfilename %}
> 
>     Error: Command '['/home/eddie/Slask/tmp/venv/bin/python3', '-Im', 'ensurepip', '--upgrade', '--default-pip']' returned non-zero exit status 1
>     
> 
> To get around this, use the `virtualenv` command instead.
> 
> {% filename %}command-line{% endfilename %}
> 
>     $ sudo apt install python-virtualenv
>     $ virtualenv --python=python3.6 myvenv
>     
> 
> **NOTE:** If you get an error like
> 
> {% filename %}command-line{% endfilename %}
> 
>     E: Unable to locate package python3-venv
>     
> 
> then instead run:
> 
> {% filename %}command-line{% endfilename %}
> 
>     sudo apt install python3.6-venv
>     

<!--endsec-->

## Working with virtualenv

The command above will create a directory called `myvenv` (or whatever name you chose) that contains our virtual environment (basically a bunch of directory and files).

<!--sec data-title="Working with virtualenv: Windows" data-id="virtualenv_windows"
data-collapse=true ces-->

Start your virtual environment by running:

{% filename %}command-line{% endfilename %}

    C:\Users\Name\djangogirls> myvenv\Scripts\activate
    

> **NOTE:** on Windows 10 you might get an error in the Windows PowerShell that says `execution of scripts is disabled on this system`. In this case, open another Windows PowerShell with the "Run as Administrator" option. Then try typing the following command before starting your virtual environment:
> 
> {% filename %}command-line{% endfilename %}
> 
>     C:\WINDOWS\system32> Set-ExecutionPolicy -ExecutionPolicy RemoteSigned
>         Execution Policy Change
>         The execution policy helps protect you from scripts that you do not trust. Changing the execution policy might expose you to the security risks described in the about_Execution_Policies help topic at http://go.microsoft.com/fwlink/?LinkID=135170. Do you want to change the execution policy? [Y] Yes  [A] Yes to All  [N] No  [L] No to All  [S] Suspend  [?] Help (default is "N"): A
>     

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

## Installing Django

Now that you have your `virtualenv` started, you can install Django.

Before we do that, we should make sure we have the latest version of `pip`, the software that we use to install Django:

{% filename %}command-line{% endfilename %}

    (myvenv) ~$ python3 -m pip install --upgrade pip
    

### Installing packages with requirements

A requirements file keeps a list of dependencies to be installed using `pip install`:

First create a `requirements.txt` file inside of `djangogirls/` folder:

    djangogirls
    └───requirements.txt
    

In your `djangogirls/requirements.txt` file you should add the following text:

{% filename %}djangogirls/requirements.txt{% endfilename %}

    Django=={{ book.django_version }}
    

Now, run `pip install -r requirements.txt` to install Django.

{% filename %}command-line{% endfilename %}

    (myvenv) ~$ pip install -r requirements.txt
    Collecting Django=={{ book.django_version }} (from -r requirements.txt (line 1))
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