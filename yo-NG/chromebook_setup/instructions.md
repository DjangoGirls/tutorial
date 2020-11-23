O lè [fo abala yìí kọjá](http://tutorial.djangogirls.org/en/installation/#install-python) tí ìwọ kò bá lo Chromebook kan. Tí o bá n lo, ìrírí ìṣàgbékalẹ̀ rẹ yíò yàtọ̀ díẹ̀. O lè fojú fo àwọn ìtọ́sọ́nà ìṣàgbékalẹ̀ yòókù náà.

### Cloud IDE (PaizaCloud Cloud IDE, AWS Cloud9)

Cloud IDE jẹ́ irinṣẹ́ kan èyí tí yíò fún ẹ ní olóòtú kóòdù kan àti anfààní sí kọ̀mpútà kan tó n ṣiṣẹ́ lórí íntánẹ́ẹ̀tì níbi tí o ti lè ṣàgbékalẹ̀, kọ, àti mú ètò náà ṣiṣẹ́. Fún àkókò ti àlàyé náà, cloud IDE yíò ṣiṣẹ́ gẹ́gẹ́ bí *kọ̀mpútà agbègbè* rẹ. Yóò ṣeéṣe fún ẹ láti ma ṣiṣẹ́ pẹ̀lú àwọn àṣẹ nínú atọ́kùn èbúté kan gẹ́gẹ́ bí àwọn ọmọ kíláàsì rẹ lórí OS X, Ubuntu, tàbí Windows, ṣùgbọ́n èbúté rẹ yíò gba ìsopọ̀ mọ́ kọ̀mpútà kan tó n ṣiṣẹ́ ní ibòmíràn tí cloud IDE gbé kalẹ̀ fún ẹ. Àwọn ìtọ́sọ́nà náà rèé fún àwọn cloud IDE (PaizaCloud Cloud IDE, AWS Cloud9). O lè yan ẹyọkan nínú àwọn cloud IDE náà, kí o sì tẹ̀lé ìtọ́sọ́nà ti cloud IDE náà.

#### PaizaCloud Cloud IDE

1. Lọ sí [PaizaCloud Cloud IDE](https://paiza.cloud/)
2. Forúkọ sílẹ̀ fún account kan
3. Click *New Server* and choose the Django app
4. Tẹ bọ́tìnnì Terminal (ní apá òsì ti fèrèsé náà)

Ní báyìí ó yẹ ko rí atọ́kùn kan pẹ̀lú pẹpẹ-ẹ̀gbẹ́ kan, àwọn bọ́tìnnì ní apá òsì náà. Tẹ bọ́tìnnì "Terminal" láti ṣí fèrèsé èbúté pẹ̀lú ìṣítí bíi èyí:

{% filename %}Terminal{% endfilename %}

    $
    

Èbúté náà lórí PaizaCloud Cloud IDE ti ṣetán fún àwọn àṣẹ rẹ. O lè ṣàtúnṣe ìwọ̀n fèrèsé yẹn láti mu kó tóbi díẹ̀ si.

#### AWS Cloud9

Currently Cloud 9 requires you to sign up with AWS and enter credit card information.

1. Install Cloud 9 from the [Chrome web store](https://chrome.google.com/webstore/detail/cloud9/nbdmccoknlfggadpfkmcpnamfnbkmkcp)
2. Go to [c9.io](https://c9.io) and click *Get started with AWS Cloud9*
3. Sign up for an AWS account (requires credit card information, but you can use it for free)
4. In the AWS Dashboard, enter *Cloud9* in the search bar and click it
5. In the Cloud 9 dashboard, click *Create environment*
6. Name it *django-girls*
7. While configuring settings, select *Create a new instance for environment (EC2)* for "Environment Type" and the *t2.micro* "Instance type" (it should say "Free-tier eligible."). The default cost-saving setting is fine and you can keep the other defaults.
8. Click *Next step*
9. Click *Create environment*

Now you should see an interface with a sidebar, a big main window with some text, and a small window at the bottom that looks something like this:

{% filename %}bash{% endfilename %}

    yourusername:~/workspace $
    

This bottom area is your terminal. You can use the terminal to send instructions to the remote Cloud 9 computer. You can resize that window to make it a bit bigger.

### Àyíká Àìrí

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