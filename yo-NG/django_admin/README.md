# Alábòójútó Django

Láti ṣàfikún, ṣàtúnṣe àti ṣe ìyọkúrò àwọn àròkọ tí a ṣẹ̀ṣẹ̀ ṣe àwòṣe rẹ̀, a máa lo alábòójútó Django.

Jẹ́ ká ṣí fáìlì `blog/admin.py` náà nínú olóòtú kóòdù náà kí a sì rọ́pò àwọn àkóónú rẹ̀ pẹ̀lú èyí:

{% filename %}blog/admin.py{% endfilename %}

```python
from django.contrib import admin
from .models import Post

admin.site.register(Post)
```

Gẹ́gẹ́ bó o ṣe ríi, a ṣàgbéwọlé (ṣàfikún) àwòṣe Post tí a ṣàlàyé nínú àkòrí tó ṣáájú náà. Láti mú àwòṣe wa fojú hàn lórí ojú-ìwé alábòójútó náà, a nílò láti ṣe àkọsílẹ̀ àwòṣe náà pẹ̀lú `admin.site.register(Post)`.

Ó dáa, àkókò láti ṣàyẹ̀wò àwòṣe Post wa. Rántí láti ṣe `python manage.py runserver` nínú console náà láti bẹ̀rẹ̀ server ayélujára náà. Lọ sí aṣàwákiri rẹ kí o tẹ àdírẹ́ẹ̀sì http://127.0.0.1:8000/admin/. Ìwọ yíò rí ojú-ìwé ìwọlé kan báyìí:

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