# டான்ஜோ நிர்வாகி

நாங்கள் மாதிரியுள்ள பதில்களைச் சேர்க்க, திருத்த மற்றும் நீக்க, நாங்கள் டிஜாங்கோ நிர்வாகியைப் பயன்படுத்துவோம்.

குறியீட்டு ஆசிரியர் உள்ள`வலைப்பதிவு/ admin.py`கோப்பைத் திறந்து, அதனுடன் அதன் உள்ளடக்கங்களை மாற்றலாம்:

{% filename%}வலைப்பதிவு/admin.py {%endfilename%}

```python
django.contrib இறக்குமதி நிர்வாகி இருந்து
இருந்து. மோடல்கள் இறக்குமதி போஸ்ட்

admin.site.register (போஸ்ட்)
```

நீங்கள் பார்க்க முடியும் என, நாம் முந்தைய அத்தியாயத்தில் வரையறுக்கப்பட்ட போஸ்ட் மாதிரி (அடங்கும்) இறக்குமதி. நிர்வாகி பக்கத்தில் எங்கள் மாதிரி தெரியும், நாங்கள்`admin.site.register`உடன் மாதிரி பதிவு செய்ய வேண்டும்.

சரி, எங்கள் போஸ்ட் மாதிரி பார்க்க நேரம். Remember to run `python manage.py runserver` in the console to run the web server. உங்கள் உலாவிக்கு சென்று, முகவரி http://127.0.0.1.100000/admin/. You will see a login page like this:

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

If you want to know more about Django admin, you should check Django's documentation: https://docs.djangoproject.com/en/2.0/ref/contrib/admin/

This is probably a good moment to grab a coffee (or tea) or something to eat to re-energize yourself. You created your first Django model – you deserve a little break!