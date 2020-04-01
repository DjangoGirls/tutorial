আপনি [এই বিভাগটি বাদ দিয় যেতে](http://tutorial.djangogirls.org/en/installation/#install-python) পারেন যদি আপনি ক্রোমবুক ব্যবহার না করে থাকেন। আর যদি আপনি করতে চান, তবে আপনা ক্রোমবুক স্থাপনের প্রক্রিয়াটির অভিজ্ঞনা একটু ভিন্ন হয়ে পারে। আপনি চাইলে বাকি স্থাপন নির্দেশনাবলী এড়িয়ে যেতে পারেন। 

### ক্লাউড আইডিই (PaizaCloud Cloud IDE, AWS Cloud9)

ক্লাউড আইডিই হচ্ছে এমন একটি টুল যটি আপনাকে ইন্টারনেটে কোড এডিটর এবং একটি কমিউটারের এক্সেস দিবে যেখানে আপনি সফটওয়্য্যার স্থাপন (install) , লিখতে ও পরিচালনা করতে পারবেন। টিউটোরিয়ালের সময় জুড়ে, ক্লাউড আইডিই আপনার *লোকাল মেশিন* এর মত ভূমিক পালন করবে। You'll still be running commands in a terminal interface just like your classmates on OS X, Ubuntu, or Windows, but your terminal will be connected to a computer running somewhere else that cloud IDE sets up for you. Here is the instructions for cloud IDEs (PaizaCloud Cloud IDE, AWS Cloud9). You can choose one of the cloud IDEs, and follow the instruction of the cloud IDE.

#### PaizaCloud Cloud IDE

1. Go to [PaizaCloud Cloud IDE](https://paiza.cloud/)
2. Sign up for an account
3. Click *New Server* and choose the Django app
4. Click Terminal button(on the left side of the window)

Now you should see an interface with a sidebar, buttons at the left. Click "Terminal" button to open terminal window with prompt like this:

{% filename %}Terminal{% endfilename %}

    $
    

The terminal on the PaizaCloud Cloud IDE is prepared for your instructions. You can resize or maximize that window to make it a bit bigger.

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

### ভার্চুয়াল পরিবেশ

A virtual environment (also called a virtualenv) is like a private box we can stuff useful computer code into for a project we're working on. We use them to keep the various bits of code we want for our various projects separate so things don't get mixed up between projects.

চালনা করুনঃ

{% filename %}Cloud 9{% endfilename %}

    mkdir djangogirls
    cd djangogirls
    python3.6 -mvenv myvenv
    source myvenv/bin/activate
    pip install django~={{ book.django_version }}
    

(লক্ষণীয় যে শেষের লাইনে আমরা একটি বিশেষ চিহ্ন ব্যবহার করেছি যা অনেকটা সমান চিহ্নের মতঃ `~=`).

### গিটহাব

একটি [গিটহাব](https://github.com) একাউন্ট তৈরি করুন। 

### PythonAnywhere

The Django Girls tutorial includes a section on what is called Deployment, which is the process of taking the code that powers your new web application and moving it to a publicly accessible computer (called a server) so other people can see your work.

This part is a little odd when doing the tutorial on a Chromebook since we're already using a computer that is on the Internet (as opposed to, say, a laptop). However, it's still useful, as we can think of our Cloud 9 workspace as a place for our "in progress" work and Python Anywhere as a place to show off our stuff as it becomes more complete.

Thus, sign up for a new Python Anywhere account at [www.pythonanywhere.com](https://www.pythonanywhere.com).