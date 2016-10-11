# Django admin 管理后台

我们将使用 Django admin 添加，编辑和删除我们刚刚创建的帖子。

让我们打开`blog/admin.py`文件，并替换其中的文件像这样：

```python
from django.contrib import admin
from .models import Post

admin.site.register(Post)
```

如你所见，我们导入（包括）了前一章定义的Post模型。 为了让我们的模型在admin页面上可见，我们需要使用`admin.site.register(Post)`来注册模型.

OK, 现在来看看我们的 Post 模型。 记得先在控制台输入`python manage.py runserver`启动服务器。 然后打开浏览器，输入地址http://127.0.0.1:8000/admin/你会看到登录界面像这样:

![登录页面][1]

 [1]: images/login_page2.png

为了登录, 你需要创建一个掌控整个网站所有东西的*超级用户*。 回到刚才的命令行，输入`python manage.py createsuperuser`，按下Enter。 然后输入你的用户名(英文小写，不保护空格), 邮箱和密码。 你输密码的时候看不见输入？别担心，它就是这样的。 你就输入要输得到然后按`Enter`继续就好了。 输出应该长得像这样（用户名和邮箱应该是你自己的）：

    (myvenv) ~/djangogirls$ python manage.py createsuperuser
    Username: admin
    Email address: admin@admin.com
    Password:
    Password (again):
    Superuser created successfully.


返回到你的浏览器，用你刚才的超级用户来登录，然后你应该能看到Django admin的管理面板。

![Django管理][2]

 [2]: images/django_admin3.png

到 Posts 页面多试几次，发布5、6条博客文章，不用担心你的文章内容，你可以复制粘贴这个教程的一些文字，这样比较节约时间 :)。

请确保至少有两到三个帖子（但不是全部）具有设置的发布日期。它在以后会有用。

![Django管理][3]

 [3]: images/edit_post3.png

如果你想更多地了解Django admin模块，你可以查看Django 的官方文档:https://docs.djangoproject.com/en/1.8/ref/contrib/admin/

现在你可以来杯咖啡(或者是茶) 或吃点东西给自己充下电，你刚刚创建了你的第一个Django模型，你应该休息一下。
