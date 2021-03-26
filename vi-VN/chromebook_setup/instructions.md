Bạn có thể [bỏ qua phần này](http://tutorial.djangogirls.org/en/installation/#install-python) nếu bạn không sử dụng Chromebook. Nếu có thì việc cài đặt của bạn có thể có một chút khác biệt. Bạn có thể bỏ qua phần còn lại của hướng dẫn cài đặt này.

### Cloud IDE (PaizaCloud Cloud IDE, AWS Cloud9, Glitch.com)

Cloud IDE là một công cụ hỗ trợ viết code và giúp bạn truy cập vào máy tính đang chạy trên Internet, nơi mà bạn có thể cài đặt, viết và chạy chương trình trên đó. Trong suốt bài hướng dẫn này, cloud IDE sẽ hoạt động như *local machine*. Bạn vẫn sẽ chạy lệnh trên terminal như trên OS X, Ubuntu, hay Windows, chỉ khác là terminal của bạn được kết nối với một máy tính đang nằm trên cloud của IDE và đã được cloud IDE sắp xếp cho bạn. running commands in a terminal interface just like your classmates on OS X, Ubuntu, or Windows, but your terminal will be connected to a computer running somewhere else that cloud IDE sets up for you. Here are the instructions for cloud IDEs (PaizaCloud Cloud IDE, AWS Cloud9, Glitch.com). Bạn có thể chọn 1 trong số các IDE này, hướng dẫn như sau.

#### PaizaCloud Cloud IDE

1. Nhấn [PaizaCloud Cloud IDE](https://paiza.cloud/)
2. Đăng ký một account
3. Nhấn *New Server* và chọn ứng dụng Django
4. Click vào nút Terminal ( nằm bên trái cửa sổ)

Bây giờ bạn sẽ thấy giao diện với cây thư mục mà menu nút ở phía bên trái. Chọn "Terminal" để mở cửa sổ terminal

{% filename %}Terminal{% endfilename %}

    $
    

Terminal trên PaizaCloud Cloud IDE được chuẩn bị cho sự hướng dẫn của bạn. Bạn có thể thay đổi kích thước của sổ đó để làm nó to hơn.

#### AWS Cloud9

Hiện tại, Cloud 9 yêu cầu đăng ký với AWS và nhập thông tin thẻ tín dụng

1. Cài đặt Cloud 9 từ [Chrome web store](https://chrome.google.com/webstore/detail/cloud9/nbdmccoknlfggadpfkmcpnamfnbkmkcp)
2. Tới trang [c9.io](https://c9.io) và chọn *Get started with AWS Cloud9*
3. Đăng ký 1 tài khoản AWS (Yêu cầu thông tin thẻ tín dụng, nhưng bạn có thể sử dụng miễn phí)
4. Tại trang Dashboard của AWS, nhập *Cloud9* vào thanh tìm kiếm và chọn
5. Tại trang dashboard của Cloud 9, chọn *Create environment*
6. Đặt tên là *django-girls*
7. Trong khi thiết lập cài đặt, chọn *Create a new instance for environment (EC2)* cho "Environment Type" và *t2.micro* cho "Instance type" (được mô tả là "Free-tier eligible."). Cost-saving setting và các phần khác có thể để mặc định
8. Chọn *Next step*
9. Chọn *Create environment*

Bây giờ bạn sẽ thấy một giao diện với một sidebar, một cửa sổ chính lớn với một số văn bản, và một cửa sổ nhỏ ở phía dưới trông giống như thế này:

{% filename %}bash{% endfilename %}

    yourusername: ~ / workspace $
    

Phần dưới là terminal của bạn. Bạn có thể sử dụng terminal để gửi chỉ dẫn tới máy tính remote Cloud 9. Bạn có thể thay đổi kích thước để làm nó lớn hơn.

#### Glitch.com Cloud IDE

1. Go to [Glitch.com](https://glitch.com/)
2. Sign up for an account (https://glitch.com/signup) or use your GitHub account if you have one. (See GitHub instructions below.)
3. Click *New Project* and choose *hello-webpage*
4. Click on the Tools dropdown list (at the bottom left side of the window), then on Terminal button to open terminal tab with a prompt like this:

{% filename %}Terminal{% endfilename %}

    app@name-of-your-glitch-project:~
    

When using Glitch.com as your Cloud IDE, you don't have to create a virtual environment. Instead, create the following files manually:

{% filename %}glitch.json{% endfilename %}

```json
{
  "install": "pip3 install -r requirements.txt --user",
  "start": "bash start.sh",
  "watch": {
    "throttle": 1000
  }
}
```

{% filename %}requirements.txt{% endfilename %}

    Django~={{ book.django_version }}
    

{% filename %}.bash_profile{% endfilename %}

```bash
alias python=python3
alias pip=pip3
```

{% filename %}start.sh{% endfilename %}

```bash
chmod 600 .bash_profile
pip3 install -r requirements.txt --user
python3 manage.py makemigrations
python3 manage.py migrate
python3 manage.py runserver $PORT
```

Once these files are created, go to the Terminal and execute the following commands to create your first Django project:

{% filename %}Terminal{% endfilename %}

    django-admin.py startproject mysite .
    refresh
    

In order to see detailed error messages, you can activate Django debug logs for your Glitch application. Simply add the following at the end of the `mysite/settings.py` file.

{% filename %}mysite/settings.py{% endfilename %}

```python
LOGGING = {
    'version': 1,
    'disable_existing_loggers': False,
    'handlers': {
        'file': {
            'level': 'DEBUG',
            'class': 'logging.FileHandler',
            'filename': 'debug.log',
        },
    },
    'loggers': {
        'django': {
            'handlers': ['file'],
            'level': 'DEBUG',
            'propagate': True,
        },
    },
}
```

This will create a `debug.log` file detailing Django operations and any error messages that might come up, making it much easier to fix if your website does not work.

The initial restarting of the Glitch project should fail. (If you click on the top dropdown button `Show` then click on `In a New Window`, you will receive a `DisallowedHost` error message.) Do not worry about it at this stage, the tutorial will fix this as soon as you update the Django settings of your project in the `mysite/settings.py` file.

### Môi trường ảo (Virtual Environment)

A virtual environment (also called a virtualenv) is like a private box we can stuff useful computer code into for a project we're working on. We use them to keep the various bits of code we want for our various projects separate so things don't get mixed up between projects.

Run:

{% filename %}Cloud 9{% endfilename %}

    mkdir djangogirls
    cd djangogirls
    python3 -m venv myvenv
    source myvenv/bin/activate
    pip install django~={{ book.django_version }}
    

(note that on the last line we use a tilde followed by an equal sign: `~=`).

### GitHub

Make a [GitHub](https://github.com) account.

### PythonAnywhere

The Django Girls tutorial includes a section on what is called Deployment, which is the process of taking the code that powers your new web application and moving it to a publicly accessible computer (called a server) so other people can see your work.

This part is a little odd when doing the tutorial on a Chromebook since we're already using a computer that is on the Internet (as opposed to, say, a laptop). However, it's still useful, as we can think of our Cloud 9 workspace as a place for our "in progress" work and Python Anywhere as a place to show off our stuff as it becomes more complete.

Thus, sign up for a new Python Anywhere account at [www.pythonanywhere.com](https://www.pythonanywhere.com).