I nwere ike [ hapụ ebe a ](http://tutorial.djangogirls.org/en/installation/#install-python) ma ọ bụrụ na ị naghị eji Chromebook. Y’ọbụrụ na ị ji ya , nwụnye gị ga-abu obere ihe dị iche I nwere ike ileghara anya ndị fọdụrụ na ntuziaka nwụnye a.

### Cloud IDE (PaizaCloud Cloud IDE, AWS Cloud9)

Cloud IDE bu ngwaọrụ eji enyere gi aka ideputa koodu ma banye na kọmputa na aru oru na ntanetị ebe inwere ike iwunye, dee ihe ma ghazie ngwanro a. Maka oge n'ime nkuzi nkuzi a, cloud IDE ga-arụ ọrụ dị ka * Igwe mpaghara gị *. l ka ga-anọ na-agba n'ime otu ọnụ oru dika ụmụ klas ibe gị nọ na OS X, Ubuntu, ma ọ bụ Windows, mana a ga-ejikọ ọnụ oru gị na kọmputa na-agba ebe ozo cloud IDE wubere gi. Nke a bụ ntuziaka maka cloud IDE (PaizaCloud Cloud IDE, AWS Cloud9). I nwere ike ịhọrọ otu n’ime cloud IDE, ma soro kwa ntuziaka cloud IDE.

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

### Virtual Environment

A virtual environment (also called a virtualenv) is like a private box we can stuff useful computer code into for a project we're working on. We use them to keep the various bits of code we want for our various projects separate so things don't get mixed up between projects.

Run:

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