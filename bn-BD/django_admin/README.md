# জ্যাঙ্গো এডমিন ( Django admin) 

আমরা জ্যাঙ্গো এডমিন ব্যবহার করে মডেলকৃত পোষ্ট যোগ , সংযুক্ত বা সম্পাদন এবং ডিলিট করতে পারবো।

চলুন, তাহলে আমরা কোড এডিটরে `blog/admin.py` ফাইলটি ওপেন করি এবং ফাইলের বিষয়বস্তু পরিবর্তন করি ।

{% filename %}blog/admin.py{% endfilename %}

```python
from django.contrib import admin
from .models import Post

admin.site.register(Post)
```

আগের চ্যাপ্টারে যে পোষ্ট মডেলটি (Post model ) সংজ্ঞায়িত করেছিলাম সেটি এখানে আমরা ইম্পোর্ট(যুক্ত) করেছি। আমাদের এডমিন প্যানেলে যাতে আমাদের মডেল দেখতে পারি সেইজন্য আমাদেরকে `admin.site.register(Post)` এইভাবে নিবন্ধন করতে হবে ।

চলুন, এখন তাহলে আমাদের পোষ্ট মডেলটি খেয়াল করি দেখি । Remember to run `python manage.py runserver` in the console to run the web server. Go to your browser and type the address http://127.0.0.1:8000/admin/. You will see a login page like this:

![Login page](images/login_page2.png)

To log in, you need to create a *superuser* - a user account that has control over everything on the site. Go back to the command line, type `python manage.py createsuperuser`, and press enter.

> Remember, to write new commands while the web server is running, open a new terminal window and activate your virtualenv. We reviewed how to write new commands in the **Your first Django project!** chapter, in the **Starting the web server** section.

{% filename %}Mac OS X or Linux:{% endfilename %}

    (myvenv) ~/djangogirls$ python manage.py createsuperuser
    

{% filename %}Windows:{% endfilename %}

    (myvenv) C:\Users\Name\djangogirls> python manage.py createsuperuser
    

When prompted, type your username (lowercase, no spaces), email address, and password. **Don't worry that you can't see the password you're typing in – that's how it's supposed to be.** Type it in and press `enter` to continue. The output should look like this (where the username and email should be your own ones):

    Username: ola
    Email address: ola@example.com
    Password:
    Password (again):
    Superuser created successfully.
    

Return to your browser. Log in with the superuser's credentials you chose; you should see the Django admin dashboard.

![Django admin](images/django_admin3.png)

Go to Posts and experiment a little bit with it. Add five or six blog posts. Don't worry about the content –- it's only visible to you on your local computer -- you can copy-paste some text from this tutorial to save time. :)

Make sure that at least two or three posts (but not all) have the publish date set. It will be helpful later.

![Django admin](images/edit_post3.png)

If you want to know more about Django admin, you should check Django's documentation: https://docs.djangoproject.com/en/2.2/ref/contrib/admin/

This is probably a good moment to grab a coffee (or tea) or something to eat to re-energize yourself. You created your first Django model – you deserve a little break!