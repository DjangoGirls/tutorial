Bạn có thể [bỏ qua phần này](http://tutorial.djangogirls.org/en/installation/#install-python) nếu bạn không sử dụng Chromebook. Nếu có thì việc cài đặt của bạn có thể có một chút khác biệt. Bạn có thể bỏ qua phần còn lại của hướng dẫn cài đặt này.

### Cloud 9

Cloud 9 là một công cụ cung cấp cho bạn một trình soạn thảo mã nguồn và cho phép truy cập vào một máy tính chạy trên Internet, nơi bạn có thể cài đặt, viết, và chạy các chương trình. Trong suốt bài hướng dẫn này, Cloud 9 được coi là một *local machine*. Bạn sẽ vẫn chạy lệnh trong một giao diện thiết bị đầu cuối cũng giống như các thực hiện trên OS X, Ubuntu hay Windows, nhưng thiết bị đầu cuối (terminal) của bạn sẽ được kết nối với một máy tính đang chạy ở một nơi khác mà Cloud 9 thiết lập cho bạn.

1. Cài đặt Cloud 9 từ [Chrome web store](https://chrome.google.com/webstore/detail/cloud9/nbdmccoknlfggadpfkmcpnamfnbkmkcp)
2. Truy cập [c9.io](https://c9.io)
3. Đăng ký tài khoản
4. Bấm vào *tạo mới Workspace*
5. Đặt tên là *django-girls*
6. Chọn *blank* (thứ hai từ bên phải vào dòng dưới cùng với biểu tượng màu da cam)

Bây giờ bạn sẽ thấy một giao diện với một sidebar, một cửa sổ chính lớn với một số văn bản, và một cửa sổ nhỏ ở phía dưới trông giống như thế này:

{% filename %}Cloud 9{% endfilename %}

    yourusername: ~ / workspace $
    

Khu vực dưới cùng chính là *terminal* của bạn, nơi bạn sẽ thực hiện các bước theo hướng dẫn của Cloud 9. Bạn có thể thay đổi kích cỡ của cửa sổ để làm cho nó lớn hơn một chút.

### Môi trường ảo (Virtual Environment)

Một môi trường ảo (thường gọi là một virtualenv) là giống như một môi trường riêng, các tác động vào môi trường này không bị ảnh hưởng bởi môi trường của hệ thống. Chúng tôi sử dụng chúng để giữ cho sự khác nhau về mã nguồn của từng dự án trên cùng một môi trường.

Trong thiết bị đầu cuối của bạn ở phía dưới của giao diện Cloud 9, chạy lệnh sau đây:

{% filename %}Cloud 9{% endfilename %}

    sudo apt update 
    sudo apt install python3.6-venv
    

Nếu vẫn không hoạt động, bạn nên yêu cầu huấn luyện viên trợ giúp.

Tiếp theo, chạy:

{% filename %}Cloud 9{% endfilename %}

    mkdir djangogirls 
    cd djangogirls 
    python3.6 - mvenv myvenv 
    source myvenv/bin/activate
    pip install django ~ = 1.11.0
    

(Chú ý dòng cuối cùng chúng tôi sử dụng một dấu ngã theo sau là một dấu bằng: ~ =).

### GitHub

Make a [GitHub](https://github.com) account.

### PythonAnywhere

Các bài hướng dẫn Django Girls bao gồm một phần được gọi là triển khai, đó là quá trình của việc đưa mã nguồn ứng dụng web của bạn đến một máy tính truy cập công cộng (gọi là một máy chủ) để mọi người có thể thấy công việc của bạn.

Phần này là một chút ngoài lề khi thực hiện các hướng dẫn trên Chromebook kể từ khi chúng tôi đang sử dụng trên một máy chủ. However, it's still useful, as we can think of our Cloud 9 workspace as a place for our "in progress" work and Python Anywhere as a place to show off our stuff as it becomes more complete.

Vì vậy, đăng ký cho một tài khoản Python Anywhere mới tại [www.pythonanywhere.com](https://www.pythonanywhere.com).