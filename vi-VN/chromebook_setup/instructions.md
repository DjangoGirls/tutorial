Bạn có thể [bỏ qua phần này](http://tutorial.djangogirls.org/en/installation/#install-python) nếu bạn không sử dụng Chromebook. Nếu có thì việc cài đặt của bạn có thể có một chút khác biệt. Bạn có thể bỏ qua phần còn lại của hướng dẫn cài đặt này.

### Cloud IDE (PaizaCloud Cloud IDE, AWS Cloud9)

Cloud IDE là một công cụ hỗ trợ viết code và giúp bạn truy cập vào máy tính đang chạy trên Internet, nơi mà bạn có thể cài đặt, viết và chạy chương trình trên đó. Trong suốt bài hướng dẫn này, cloud IDE sẽ hoạt động như *local machine*. Bạn vẫn sẽ chạy lệnh trên terminal như trên OS X, Ubuntu, hay Windows, chỉ khác là terminal của bạn được kết nối với một máy tính đang nằm trên cloud của IDE và đã được cloud IDE sắp xếp cho bạn. running commands in a terminal interface just like your classmates on OS X, Ubuntu, or Windows, but your terminal will be connected to a computer running somewhere else that cloud IDE sets up for you. Đây là hướng dẫn cho cloud IDEs (PaizaCloud Cloud IDE, AWS Cloud9). Bạn có thể chọn 1 trong số các IDE này, hướng dẫn như sau.

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

### Môi trường ảo (Virtual Environment)

Một môi trường ảo (thường gọi là một virtualenv) là giống như một môi trường riêng, các tác động vào môi trường này không bị ảnh hưởng bởi môi trường của hệ thống. Chúng ta sử dụng chúng để giữ cho sự khác nhau về mã nguồn của từng dự án trên cùng một môi trường.

Chạy:

{% filename %}Cloud 9{% endfilename %}

    mkdir djangogirls 
    cd djangogirls 
    python3.6 - mvenv myvenv 
    source myvenv/bin/activate
    pip install django ~ = 1.11.0
    

(Chú ý dòng cuối cùng chúng tôi sử dụng một dấu ngã theo sau là một dấu bằng: ~ =).

### GitHub

Tạo một tài khoản [Github](https://github.com).

### PythonAnywhere

Các bài hướng dẫn Django Girls bao gồm một phần được gọi là triển khai (deploy), đó là quá trình của việc đưa mã nguồn ứng dụng web của bạn đến một máy tính truy cập công cộng (gọi là một máy chủ) để mọi người có thể thấy công việc của bạn.

Phần này là một chút ngoài lề khi thực hiện các hướng dẫn trên Chromebook kể từ khi chúng tôi sử dụng một máy tính trên Internet (thay vi một chiếc laptop).. Tuy nhiên, đó là vẫn rất hữu ích, như chúng ta có thể coi Cloud 9 như là một môi trường phát triển và Python Anywhere như là nơi để triển khai các công cụ của chúng ta khi nó trở nên hoàn chỉnh hơn.

Vì vậy, đăng ký cho một tài khoản Python Anywhere mới tại [www.pythonanywhere.com](https://www.pythonanywhere.com).