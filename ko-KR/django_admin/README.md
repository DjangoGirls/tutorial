# Django 관리자

우리가 모델링한 포스트를 더하거나 고치거나 삭제하기 위해서는, Django의 admin기능을 사용해야 합니다.

코드 에디터에서 `blog/admin.py`파일을 열고 이것으로 교체하세요:

{% filename %}blog/admin.py{% endfilename %}

```python
from django.contrib import admin
from .models import Post

admin.site.register(Post)
```

코드에서 알 수 있듯이 앞 챕터에서 정의했던 Post 모델을 가져오고(import) 있어요. 관리자 페이지에서 만든 모델을 보려면 `admin.site.register(Post)`로 모델을 등록해야해요.

자, 이제 Post 모델을 볼까요? 웹 서버를 실행하려면 콘솔창에서 `python manage.py runserver`를 실행하는걸 잊지마세요. 웹브라우저로 가서 http://127.0.0.1:8000/admin/ 을 입력하세요. 다음과 같은 로그인 화면이 보일거에요.

![로그인 페이지](images/login_page2.png)

로그인을 하기 위해서는, 모든 권한을 가지는 *슈퍼유저(superuser)*를 생성해야해요. 콘솔창에서 `python manage.py createsuperuser`을 입력하고 엔터를 누르세요.

> 웹 서버가 실행중에 새로운 명령을 입력하기 위해서 새 터미널창을 열고 당신의 virtualenv를 활성화해야 하는것을 잊지마세요. We reviewed how to write new commands in the **Your first Django project!** chapter, in the **Starting the web server** section.

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

Posts로 가서 약간의 실험을 해봅시다. 5 ~ 6개의 블로그 글을 작성해보세요. Don't worry about the content –- it's only visible to you on your local computer -- you can copy-paste some text from this tutorial to save time. :)

Make sure that at least two or three posts (but not all) have the publish date set. It will be helpful later.

![Django admin](images/edit_post3.png)

If you want to know more about Django admin, you should check Django's documentation: https://docs.djangoproject.com/en/2.2/ref/contrib/admin/

This is probably a good moment to grab a coffee (or tea) or something to eat to re-energize yourself. You created your first Django model – you deserve a little break!