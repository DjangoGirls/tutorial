I nwere ike [ hapụ ebe a ](http://tutorial.djangogirls.org/en/installation/#install-python) ma ọ bụrụ na ị naghị eji Chromebook. Y’ọbụrụ na ị ji ya , nwụnye gị ga-abu obere ihe dị iche I nwere ike ileghara anya ndị fọdụrụ na ntuziaka nwụnye a.

### Cloud IDE (PaizaCloud Cloud IDE, AWS Cloud9, Glitch.com)

Cloud IDE bu ngwaọrụ eji enyere gi aka ideputa koodu ma banye na kọmputa na aru oru na ntanetị ebe inwere ike i tinye, dee ihe ma ghazie ngwanro a. Maka oge n'ime nkuzi nkuzi a, cloud IDE ga-arụ ọrụ dị ka * Igwe mpaghara gị *. l ka ga-anọ na-agba n'ime otu ọnụ oru dika ụmụ klas ibe gị nọ na OS X, Ubuntu, ma ọ bụ Windows, mana a ga-ejikọ ọnụ oru gị na kọmputa na-agba ebe ozo cloud IDE wubere gi. Here are the instructions for cloud IDEs (PaizaCloud Cloud IDE, AWS Cloud9, Glitch.com). I nwere ike ịhọrọ otu n’ime cloud IDE, ma soro kwa ntuziaka cloud IDE.

#### PaizaCloud Cloud IDE

1. Gaa na [PaizaCloud Cloud IDE](https://paiza.cloud/)
2. Debanye aha maka akaụntụ
3. Pịa * Server ọhụụ * ma họrọ Django App
4. Pịa bọtịnụ Terminal (n'akụkụ aka ekpe nke ihi oru ahụ)

Ugbu a ị ga - ahụ na obuputara ihe n’akuku ihu oru a, bọtịnụ n'aka ekpe. Pịa bọtịnụ "Terminal" ka imepee ọnụ ọrụ na-eji otu a:

{% filename %}Terminal{% endfilename %}

    $
    

A na-akwadebe ọnụ ọrụ na PaizaCloud Cloud IDE maka ntuziaka gị. I nwere ike igbubi ma ọ bụ bulie elu ihu oru ahụ iji mee ka ọ bukwuo ibu.

#### AWS Cloud9

Ugbu a Cloud 9 chọrọ ka ị debanye aha na AWS wee debanye ihe ogwugwa kaadị akwụmụgwọ.

1. Tinye Cloud 9 si na[ ụlọ ahịa weebụ Chrome](https://chrome.google.com/webstore/detail/cloud9/nbdmccoknlfggadpfkmcpnamfnbkmkcp)
2. Gaa na [ c9.io ](https://c9.io) wee pịa * Bido na AWS Cloud9 *
3. Debanye aha maka akaụntụ AWS (o na eji ihe ogwugwa kaadị akwụmụgwọ, mana ị nwere ike were ya n'efu)
4. N'ime AWS, tinye * Cloud9 * na ihe ochicho wee pịa ya
5. N’ime Cloud 9, pịa * Mepụta gburugburu *
6. Kpọọ ya * django-girls *
7. Mgbe ị na-ahazi ntọala, họrọ * Mepụta atụ ọhụụ maka gburugburu (EC2) * maka "Udị gburugburu" yana * t2.micro * "Na ụdị atu" (ọ kwesịrị kwu "Ntọpụta-aka ruru eru maka ya."). Etu echekwara iru-ego di nma ma gi nwere ike idowe nrụrụ nke ọzọ.
8. Pịa * Nzọụkwụ ọzọ *
9. Pịa * Mepụta gburugburu *

Ugbu a ị ga - ahụ ihi oru nwere ihe na akuku, nnukwu windo nwere ụfọdụ ihe ederede, na ihi oru obere na ala nke dị ka nke a:

{% filename %}bash{% endfilename %}

    aha njirimara gị: ~ / ebe ọrụ $
    

Ebe ala a bụ ọdụ oru gị. I nwere ike iji ọdụ oru a zipu ntuziaka na kọmputa Cloud 9. I nwere ike ịgbanwe ihu oru ahụ iji mee ya t'ọ bụru tu ibu.

#### Glitch.com Cloud IDE

1. Go to [Glitch.com](https://glitch.com/)
2. Sign up for an account (https://glitch.com/signup) or use your GitHub account if you have one. (See GitHub instructions below.)
3. Click *New Project* and choose *hello-webpage*
4. Click on the Tools dropdown list (at the bottom left side of the window), then on Terminal button to open terminal tab with a prompt like this:

{% filename %}Terminal{% endfilename %}

    app@name-of-your-glitch-project:~
    

When using Glitch.com as your Cloud IDE, you don't have to create a virtual environment. Instead, create the following files manually:

{% filename %}glitch.json{% endfilename %}

```json
{
  "install": "pip3 install -r requirements.txt --user",
  "start": "bash start.sh",
  "watch": {
    "throttle": 1000
  }
}
```

{% filename %}requirements.txt{% endfilename %}

    Django~={{ book.django_version }}
    

{% filename %}.bash_profile{% endfilename %}

```bash
alias python=python3
alias pip=pip3
```

{% filename %}start.sh{% endfilename %}

```bash
chmod 600 .bash_profile
pip3 install -r requirements.txt --user
python3 manage.py makemigrations
python3 manage.py migrate
python3 manage.py runserver $PORT
```

Once these files are created, go to the Terminal and execute the following commands to create your first Django project:

{% filename %}Terminal{% endfilename %}

    django-admin.py startproject mysite .
    refresh
    

In order to see detailed error messages, you can activate Django debug logs for your Glitch application. Simply add the following at the end of the `mysite/settings.py` file.

{% filename %}mysite/settings.py{% endfilename %}

```python
LOGGING = {
    'version': 1,
    'disable_existing_loggers': False,
    'handlers': {
        'file': {
            'level': 'DEBUG',
            'class': 'logging.FileHandler',
            'filename': 'debug.log',
        },
    },
    'loggers': {
        'django': {
            'handlers': ['file'],
            'level': 'DEBUG',
            'propagate': True,
        },
    },
}
```

This will create a `debug.log` file detailing Django operations and any error messages that might come up, making it much easier to fix if your website does not work.

The initial restarting of the Glitch project should fail. (If you click on the top dropdown button `Show` then click on `In a New Window`, you will receive a `DisallowedHost` error message.) Do not worry about it at this stage, the tutorial will fix this as soon as you update the Django settings of your project in the `mysite/settings.py` file.

### Gburugburu Mebere

A virtual environment (also called a virtualenv) is like a private box we can stuff useful computer code into for a project we're working on. We use them to keep the various bits of code we want for our various projects separate so things don't get mixed up between projects.

Run:

{% filename %}Cloud 9{% endfilename %}

    mkdir djangogirls
    cd djangogirls
    python3 -m venv myvenv
    source myvenv/bin/activate
    pip install django~={{ book.django_version }}
    

(note that on the last line we use a tilde followed by an equal sign: `~=`).

### GitHub

Make a [GitHub](https://github.com) account.

### PythonAnywhere

The Django Girls tutorial includes a section on what is called Deployment, which is the process of taking the code that powers your new web application and moving it to a publicly accessible computer (called a server) so other people can see your work.

This part is a little odd when doing the tutorial on a Chromebook since we're already using a computer that is on the Internet (as opposed to, say, a laptop). However, it's still useful, as we can think of our Cloud 9 workspace as a place for our "in progress" work and Python Anywhere as a place to show off our stuff as it becomes more complete.

Thus, sign up for a new Python Anywhere account at [www.pythonanywhere.com](https://www.pythonanywhere.com).