ކްރޯމްބުކް ބޭނުންނުކުރާނަމަ[މިސެކްޝަން ](http://tutorial.djangogirls.org/en/installation/#install-python)ދޫކޮށްލާ. ބޭނުންކުރާނަމަ، އިންސްޓޮލޭޝަންގެ ތަޖުރިބާ ތަންކޮޅެއް ތަފާތުވާނެ. ދެންބާކީހުރި އިންސްޓޮލޭޝަން އިރުޝާދުތައް ދޫކޮށްލެވިދާނެ.

### ކްލައުޑް އަޑީއީ ނުވަތަ ސޮފްޓްވެއަރ ތައްޔާރުކުރުމަށް ބޭނުންކުރާ އެޕްލިކޭޝަން ( ޕައިޒާކްލައުޑު ކްލައުޑު އައިޑީއީ، އެމޭޒަން ވެބް ސަރވިސް ކްލައުޑް 9)

ކްލައުޑް އައިޑީއީ ނުވަތަ ކްލައުޑުގައި ސޮްފްޓްވެއަރ ތައްޔާރުކުރުމަށް ބޭނުންކުރާ އެޕްލިކޭޝަން އަކީ ކޯޑު ލިޔެ އަދި އިންޓަރނެޓުގައިވާ ކޮމްޕިއުޓަރކަށް ވަދެ ، ސޮފްޓްވެއަރ އިންސްޓޯލްކޮށް، ލިޔެ އަދި ސޮފްޓްވެއަރ ރަން ކުރެވޭނެ ގޮތް ހަދާއެއްޗެއް. މިޓިއުޓޯރިއަލް ހަދާއިރު،*local machine* އަކީ ކްލައުޑް އައިޑީއީ. ކްލާހުގައިތިބި OS X, Ubuntu, or Windows ބޭނުންކުރާ އެހެންބައިވެރިންނެކޭ އެއްގޮތަށް ތިބާވެސް ކޮމާންޑުތައް ޖައްސާނީ ޓަރމިނަލް އިންޓަރފޭސްގައި. އެކަމަކު މިޓަރމިނަލް ގުޅިފައި އިންނާނީ ކްލައުޑް އަޑީއީއިން ހަމަޖައްސައިދޭ އެހެންތަނެއްގައި އިން ކޮމްޕިއުޓަރަކާއެވެ. Here is the instructions for cloud IDEs (PaizaCloud Cloud IDE, AWS Cloud9). You can choose one of the cloud IDEs, and follow the instruction of the cloud IDE.

#### PaizaCloud Cloud IDE

1. 1. paizaCloud Cloud IDE [](https://paiza.cloud/)ނަގާ
2. އެކައުންޓެއްހަދާ
3. *New Server* ނަގާ
4. ޓާރމިނަލް ބަޓަން( ވިންޑޯގެ ވާތްފަރާތުގައި) އަށް ފިތާލާ

މީހާރު ސައިޑްބާރ އާއެކު އިންޓަރފޭސްއެއް ފެންނާނެ، ބަޓަންތައް ވާތްފަރާތުގައި. މި މެސެޖް ފެންނަ ޓަރމިނަލް ހުޅުވުމަށް "Terminal" ބަޓަން އަށް ފިތާލާ:

{% filename %} ޓަރމިނަލް{% endfilename %}

    $
    

PaizaCloud Cloud IDE ގައިވާ ޓާރމިނަލްވަނީ ތިޔަފަރާތުގެ އިރުޝާދުތަކަށް ތައްޔާރުވެފައި. ވިންޑޯގެ ސައިޒުބޮޑުކޮށް ނުވަތަ ބަދަލުކުރެވޭނެ.

#### އެމޭޒަން ވެބްސަރަވިސް ކްލައުޑު 9

1. [AWS Cloud9](https://aws.amazon.com/cloud9/) ނަގާ
2. އެކައުންޓެއް ހަދާ
3. *Create Environment* އަށް ފިތާލާ

Now you should see an interface with a sidebar, a big main window with some text, and a small window at the bottom that looks something like this:

{% filename %}bash{% endfilename %}

    yourusername:~/workspace $
    

This bottom area is your terminal. You can use the terminal to send instructions to the remote Cloud 9 computer. You can resize that window to make it a bit bigger.

### Virtual Environment

A virtual environment (also called a virtualenv) is like a private box we can stuff useful computer code into for a project we're working on. We use them to keep the various bits of code we want for our various projects separate so things don't get mixed up between projects.

In your terminal at the bottom of the Cloud 9 interface, run the following:

{% filename %}Cloud 9{% endfilename %}

    sudo apt update
    sudo apt install python3.6-venv
    

If this still doesn't work, ask your coach for some help.

Next, run:

{% filename %}Cloud 9{% endfilename %}

    mkdir djangogirls
    cd djangogirls
    python3.6 -mvenv myvenv
    source myvenv/bin/activate
    pip install django~={{ book.django_version }}
    

(note that on the last line we use a tilde followed by an equal sign: `~=`).

### GitHub

Make a [GitHub](https://github.com) account.

### PythonAnywhere

The Django Girls tutorial includes a section on what is called Deployment, which is the process of taking the code that powers your new web application and moving it to a publicly accessible computer (called a server) so other people can see your work.

This part is a little odd when doing the tutorial on a Chromebook since we're already using a computer that is on the Internet (as opposed to, say, a laptop). However, it's still useful, as we can think of our Cloud 9 workspace as a place for our "in progress" work and Python Anywhere as a place to show off our stuff as it becomes more complete.

Thus, sign up for a new Python Anywhere account at [www.pythonanywhere.com](https://www.pythonanywhere.com).