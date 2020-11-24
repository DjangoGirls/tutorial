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

> 웹 서버가 실행중에 새로운 명령을 입력하기 위해서 새 터미널창을 열고 당신의 virtualenv를 활성화해야 하는것을 잊지마세요. 우리는 어떻게 새로운 명령을 입력하는지 **나의 첫 번째 장고 프로젝트!**장의 **웹 서버 시작하기** 챕터에서 복습했습니다.

{% filename %}Mac OS X or Linux:{% endfilename %}

    (myvenv) ~/djangogirls$ python manage.py createsuperuser
    

{% filename %}Windows:{% endfilename %}

    (myvenv) C:\Users\Name\djangogirls> python manage.py createsuperuser
    

메시지가 나타나면 사용자 이름 (소문자, 공백 없이), 이메일 주소 및 암호를 입력합니다. **비밀번호를 입력할때 입력하는 비밀번호를 볼 수 없어 걱정하지 마세요 – 원래 그렇게 되어있답니다.** 입력후 `enter` 키를 눌러 계속하세요. 실행화면은 아래와 같을 거에요. (슈퍼유저로 사용 될 username 과 email 주소는 본인 것이어야해요.)

    Username: ola
    Email address: ola@example.com
    Password:
    Password (again):
    Superuser created successfully.
    

브라우저로 돌아와서 장고 관리자 페이지에서 슈퍼유저로 로그인한 후 대시보드를 확인하세요.

![장고 관리자](images/django_admin3.png)

Posts로 가서 약간의 실험을 해봅시다. 5 ~ 6개의 블로그 글을 작성해보세요. 내용에 대해 걱정하지 마세요 - 오로지 당신의 컴퓨터에서만 보인답니다 - 당신은 이 튜토리얼에서 일부 텍스트를 복사 붙여넣기해 시간을 절약할 수 있어요. :)

최소한 2, 3개의 글들에 게시 날짜가 있는지 확인하세요. (모두 볼 필요는 없어요) 이건 나중에 도움이 될 거에요.

![장고 관리자](images/edit_post3.png)

장고 관리자에 대해서 좀 더 알고 싶다면 장고 공식 문서를 참고하세요. : https://docs.djangoproject.com/en/2.2/ref/contrib/admin/

자, 여러분은 내 첫 번째 장고 모델을 만들었어요! 잠깐 쉴 시간을 필요하죠. 열심히 했으니 재충전을 위해 커피 한 잔(또는 차 한 잔) 또는 뭔가 먹고 돌아오세요.