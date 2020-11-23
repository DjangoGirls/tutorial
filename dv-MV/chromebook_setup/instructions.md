ކްރޯމްބުކް ބޭނުންނުކުރާނަމަ[މިސެކްޝަން ](http://tutorial.djangogirls.org/en/installation/#install-python)ދޫކޮށްލާ. ބޭނުންކުރާނަމަ، އިންސްޓޮލޭޝަންގެ ތަޖުރިބާ ތަންކޮޅެއް ތަފާތުވާނެ. ދެންބާކީހުރި އިންސްޓޮލޭޝަން އިރުޝާދުތައް ދޫކޮށްލެވިދާނެ.

### ކްލައުޑް އަޑީއީ ނުވަތަ ސޮފްޓްވެއަރ ތައްޔާރުކުރުމަށް ބޭނުންކުރާ އެޕްލިކޭޝަން ( ޕައިޒާކްލައުޑު ކްލައުޑު އައިޑީއީ، އެމޭޒަން ވެބް ސަރވިސް ކްލައުޑް 9)

ކްލައުޑް އައިޑީއީ ނުވަތަ ކްލައުޑުގައި ސޮްފްޓްވެއަރ ތައްޔާރުކުރުމަށް ބޭނުންކުރާ އެޕްލިކޭޝަން އަކީ ކޯޑު ލިޔެ އަދި އިންޓަރނެޓުގައިވާ ކޮމްޕިއުޓަރކަށް ވަދެ ، ސޮފްޓްވެއަރ އިންސްޓޯލްކޮށް، ލިޔެ އަދި ސޮފްޓްވެއަރ ރަން ކުރެވޭނެ ގޮތް ހަދާއެއްޗެއް. މިޓިއުޓޯރިއަލް ހަދާއިރު،*local machine* އަކީ ކްލައުޑް އައިޑީއީ. ކްލާހުގައިތިބި OS X, Ubuntu, or Windows ބޭނުންކުރާ އެހެންބައިވެރިންނެކޭ އެއްގޮތަށް ތިބާވެސް ކޮމާންޑުތައް ޖައްސާނީ ޓަރމިނަލް އިންޓަރފޭސްގައި. އެކަމަކު މިޓަރމިނަލް ގުޅިފައި އިންނާނީ ކްލައުޑް އަޑީއީއިން ހަމަޖައްސައިދޭ އެހެންތަނެއްގައި އިން ކޮމްޕިއުޓަރަކާއެވެ. މިހިރީ ކްލައުޑު އައިޑީއީ (PaizaCloud Cloud IDE, AWS Cloud9) ގެ އިރުޝާދުތަކެވެ. ކޮންމެވެސް 1 ކްލައުޑު އައިޑީއީެއް ނަގާ، އަދި ނެގި ކްލައުޑު އައިޑީއީގެ އިރުޝާދުތައް ބަަލަމުންދޭ.

#### PaizaCloud Cloud IDE

1. 1. paizaCloud Cloud IDE [](https://paiza.cloud/)ނަގާ
2. އެކައުންޓެއްހަދާ
3. Click *New Server* and choose the Django app
4. ޓާރމިނަލް ބަޓަން( ވިންޑޯގެ ވާތްފަރާތުގައި) އަށް ފިތާލާ

މީހާރު ސައިޑްބާރ އާއެކު އިންޓަރފޭސްއެއް ފެންނާނެ، ބަޓަންތައް ވާތްފަރާތުގައި. މި މެސެޖް ފެންނަ ޓަރމިނަލް ހުޅުވުމަށް "Terminal" ބަޓަން އަށް ފިތާލާ:

{% filename %} ޓަރމިނަލް{% endfilename %}

    $
    

PaizaCloud Cloud IDE ގައިވާ ޓާރމިނަލްވަނީ ތިޔަފަރާތުގެ އިރުޝާދުތަކަށް ތައްޔާރުވެފައި. ވިންޑޯގެ ސައިޒުބޮޑުކޮށް ނުވަތަ ބަދަލުކުރެވޭނެ.

#### އެމޭޒަން ވެބްސަރަވިސް ކްލައުޑު 9

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

    $ yourusername:~/workspace
    

This bottom area is your terminal. You can use the terminal to send instructions to the remote Cloud 9 computer. You can resize that window to make it a bit bigger.

### ވާރޗުއަލް އެންވަރމަންޓް

A virtual environment (also called a virtualenv) is like a private box we can stuff useful computer code into for a project we're working on. We use them to keep the various bits of code we want for our various projects separate so things don't get mixed up between projects.

Run:

{% filename %}Cloud 9{% endfilename %}

    mkdir djangogirls
    cd djangogirls
    python3 -m venv myvenv
    source myvenv/bin/activate
    pip install django~={{ book.django_version }}
    

(note that on the last line we use a tilde followed by an equal sign: `~=`).

### ގިޓްހަބް

Make a [GitHub](https://github.com) account.

### ޕައިތަންއެނީވެއަރ

The Django Girls tutorial includes a section on what is called Deployment, which is the process of taking the code that powers your new web application and moving it to a publicly accessible computer (called a server) so other people can see your work.

This part is a little odd when doing the tutorial on a Chromebook since we're already using a computer that is on the Internet (as opposed to, say, a laptop). However, it's still useful, as we can think of our Cloud 9 workspace as a place for our "in progress" work and Python Anywhere as a place to show off our stuff as it becomes more complete.

Thus, sign up for a new Python Anywhere account at [www.pythonanywhere.com](https://www.pythonanywhere.com).