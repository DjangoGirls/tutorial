# Django admin 管理后台

我们将使用 Django admin 添加，编辑和删除我们刚刚创建的帖子。

让我们在代码编辑器中打开`blog/admin.py`文件，并将其内容替换为此：

{% filename %}blog/admin.py{% endfilename %}

```python
from django.contrib import admin
from .models import Post

admin.site.register(Post)
```

如你所见，我们导入（包括）了前一章定义的Post模型。 为了让我们的模型在admin页面上可见，我们需要使用`admin.site.register(Post)`来注册模型.

OK, 现在来看看我们的 Post 模型。 记得先在控制台输入`python manage.py runserver`启动服务器。 转到您的浏览器并输入地址http://127.0.1:8000/admin/。 你将看到一个登陆页面，像这样：

![登录页面](images/login_page2.png)

为了登陆，您需要创建一个*超级用户* ——一个在站点里拥有控制一切的权利的用户。 返回到命令行, 输入 `python manage.py createsuperuser`, 然后按回车键。

> 记住，如果想在网页服务器运行时写入新命令，那就打开一个新的终端窗口并激活virtualenv。 我们在**启动Web服务器**部分的**Your first Django project!**章节中回顾了如何编写新的命令。

{% filename %}Mac OS X 或 Linux:{% endfilename %}

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