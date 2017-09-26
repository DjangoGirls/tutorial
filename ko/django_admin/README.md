# Django 관리자

To add, edit and delete the posts we've just modeled, we will use Django admin.

Let's open the `blog/admin.py` file and replace its contents with this:

{% filename %}blog/admin.py{% endfilename %}

```python
from django.contrib import admin
from .models import Post

admin.site.register(Post)
```

코드에서 알 수 있듯이 앞 챕터에서 정의했던 Post 모델을 가져오고(import) 있어요. To make our model visible on the admin page, we need to register the model with `admin.site.register(Post)`.

자, 이제 Post 모델을 볼까요? 웹 서버를 실행하려면 콘솔창에서 `python manage.py runserver`를 실행하는걸 잊지마세요. Go to your browser and type the address http://127.0.0.1:8000/admin/. You will see a login page like this:

![로그인 페이지](images/login_page2.png)

To log in, you need to create a *superuser* - a user account that has control over everything on the site. Go back to the command line, type `python manage.py createsuperuser`, and press enter.

> Remember, to write new commands while the web server is running, open a new terminal window and activate your virtualenv. We reviewed how to write new commands in the **Your first Django project!** chapter, in the **Starting the web server** section.

메시지가 나타나면 사용자 이름 (소문자, 공백 없이), 이메일 주소 및 암호를 입력합니다. Don't worry that you can't see the password you're typing in – that's how it's supposed to be. 작성한 후에 `enter`를 누르세요. The output should look like this (where the username and email should be your own ones):

{% filename %}command-line{% endfilename %}

    (myvenv) ~/djangogirls$ python manage.py createsuperuser
    Username: admin
    Email address: admin@admin.com
    Password:
    Password (again):
    Superuser created successfully.
    

브라우저로 돌아와서 장고 관리자 페이지에서 슈퍼유저로 로그인한 후 대시보드를 확인하세요.

![Django 관리자](images/django_admin3.png)

Go to Posts and experiment a little bit with it. Add five or six blog posts. Don't worry about the content – you can simply copy-paste some text from this tutorial to save time. :)

최소한 2, 3개의 글들에 게시 날짜가 있는지 확인하세요. (모두 볼 필요는 없어요) 이건 나중에 도움이 될 거에요.

![Django 관리자](images/edit_post3.png)

If you want to know more about Django admin, you should check Django's documentation: https://docs.djangoproject.com/en/1.11/ref/contrib/admin/

This is probably a good moment to grab a coffee (or tea) or something to eat to re-energize yourself. You created your first Django model – you deserve a little break!