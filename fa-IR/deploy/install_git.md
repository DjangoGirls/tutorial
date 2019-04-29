گیت یک "سیستم کنترل نسخه" است که توسط بسیاری از برنامه‌نویسان مورد استفاده قرار می‌گیرد. این نرم افزار می تواند تغییرات روی فایل ها را در طول زمان دنبال کند بنابراین میتوانید نسخه خاصی را بعدا بازیابی کنید. این قابلیت تقریباً شبیه ابزار "track changes" در برنامه‌های ویرایش متن (مانند Microsoft Word و LibreOffice Writer) است اما به مراتب از آن‌ها قویتر است.

## نصب گیت

<!--sec data-title="Installing Git: Windows" data-id="git_install_windows"
data-collapse=true ces-->

برای نصب گیت می‌توانید آن را از [git-scm.com](https://git-scm.com/) دانلود کنید. همه جا میتوانید کلید next را بزنید به غیر از دو جا: جایی که در مورد ویرایشگر متن از شما می‌پرسد شما باید ویرایشگر Nano را انتخاب کنید و در مرحله‌ای که عنوان آن "Adjusting your PATH environment" است، گزینه "Use Git and optional Unix tools from the Windows Command Prompt" (گزینه آخر) را انتخاب کنید. در بقیه موارد، پیش فرض‌ها مناسب هستند. استایل ویندوز را مورد بررسی قرار دهید ولی استایل یونیکس تا انتها مناسب می باشد و تغییر ندهید.

فراموش نکنید که بعد از اینکه نصب به پایان رسید دوباره command prompt یا powershell را راه اندازی کنید. <!--endsec-->

<!--sec data-title="Installing Git: OS X" data-id="git_install_OSX"
data-collapse=true ces-->

Download Git from [git-scm.com](https://git-scm.com/) and follow the instructions.

> ** نکته </ 0> اگر شما OS X 10.6، 10.7 یا 10.8 را اجرا می کنید، باید نسخه GIT را از اینجا نصب کنید:  نصب Git برای OS X Snow Leopard </ 1></p> </blockquote> <!--endsec-->
> 
> <!--sec data-title="Installing Git: Debian or Ubuntu" data-id="git_install_debian_ubuntu"
data-collapse=true ces-->
> 
> {% filename %}command-line{% endfilename %}
> 
> ```bash
$ sudo apt install git
```

<!--endsec-->

<!--sec data-title="Installing Git: Fedora" data-id="git_install_fedora"
data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

```bash
$ sudo dnf install git
```

<!--endsec-->

<!--sec data-title="Installing Git: openSUSE" data-id="git_install_openSUSE"
data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

```bash
$ sudo zypper install git
```

<!--endsec-->