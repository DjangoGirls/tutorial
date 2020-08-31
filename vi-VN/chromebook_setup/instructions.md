Bạn có thể [bỏ qua phần này](http://tutorial.djangogirls.org/en/installation/#install-python) nếu bạn không sử dụng Chromebook. Nếu có thì việc cài đặt của bạn có thể có một chút khác biệt. Bạn có thể bỏ qua phần còn lại của hướng dẫn cài đặt này.

### Cloud IDE (PaizaCloud Cloud IDE, AWS Cloud9)

Cloud IDE là một công cụ hỗ trợ viết code và giúp bạn truy cập vào máy tính đang chạy trên Internet, nơi mà bạn có thể cài đặt, viết và chạy chương trình trên đó. Trong suốt bài hướng dẫn này, cloud IDE sẽ hoạt động như *local machine*. Bạn vẫn sẽ chạy lệnh trên terminal như trên OS X, Ubuntu, hay Windows, chỉ khác là terminal của bạn được kết nối với một máy tính đang nằm trên cloud của IDE và đã được cloud IDE sắp xếp cho bạn. running commands in a terminal interface just like your classmates on OS X, Ubuntu, or Windows, but your terminal will be connected to a computer running somewhere else that cloud IDE sets up for you. Đây là hướng dẫn cho cloud IDEs (PaizaCloud Cloud IDE, AWS Cloud9). Bạn có thể chọn 1 trong số các IDE này, hướng dẫn như sau.

#### PaizaCloud Cloud IDE

1. Nhấn [PaizaCloud Cloud IDE](https://paiza.cloud/)
2. Đăng ký một account
3. Nhấn *New Server* và chọn ứng dụng Django
4. Click vào nút Terminal ( nằm bên trái cửa sổ)

Now you should see an interface with a sidebar, buttons at the left. Click "Terminal" button to open terminal window with prompt like this:

{% filename %}Terminal{% endfilename %}

    $
    

The terminal on the PaizaCloud Cloud IDE is prepared for your instructions. You can resize or maximize that window to make it a bit bigger.

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

Now you should see an interface with a sidebar, a big main window with some text, and a small window at the bottom that looks something like this:

{% filename %}bash{% endfilename %}

    yourusername:~/workspace $
    

This bottom area is your terminal. You can use the terminal to send instructions to the remote Cloud 9 computer. You can resize that window to make it a bit bigger.

### Môi trường ảo (Virtual Environment)

A virtual environment (also called a virtualenv) is like a private box we can stuff useful computer code into for a project we're working on. We use them to keep the various bits of code we want for our various projects separate so things don't get mixed up between projects.

Run:

{% filename %}Cloud 9{% endfilename %}

    mkdir djangogirls
    cd djangogirls
    python3.6 -mvenv myvenv
    source myvenv/bin/activate
    pip install django~={{ book.django_version }}
    

(note that on the last line we use a tilde followed by an equal sign: `~=`).

### GitHub

Make a [GitHub](https://github.com) account.

### PythonAnywhere

The Django Girls tutorial includes a section on what is called Deployment, which is the process of taking the code that powers your new web application and moving it to a publicly accessible computer (called a server) so other people can see your work.

This part is a little odd when doing the tutorial on a Chromebook since we're already using a computer that is on the Internet (as opposed to, say, a laptop). Tuy nhiên, đó là vẫn rất hữu ích, như chúng ta có thể coi Cloud 9 như là một môi trường phát triển và Python Anywhere như là nơi để triển khai các công cụ của chúng ta khi nó trở nên hoàn chỉnh hơn.

Thus, sign up for a new Python Anywhere account at [www.pythonanywhere.com](https://www.pythonanywhere.com).