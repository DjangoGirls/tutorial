گیت یک "سیستم کنترل نسخه" است که توسط بسیاری از برنامه‌نویسان مورد استفاده قرار می‌گیرد. این نرم‌افزار می‌تواند تغییرات روی فایل‌ها را در طول زمان دنبال کند بنابراین می‌توانید نسخه خاصی را بعداً بازیابی کنید. این قابلیت تقریباً شبیه ابزار "track changes" در برنامه‌های ویرایش متن (مانند Microsoft Word و LibreOffice Writer) است اما به مراتب از آن‌ها قویتر است.

## نصب گیت

<!--sec data-title="Installing Git: Windows" data-id="git_install_windows"
data-collapse=true ces-->

برای نصب گیت می‌توانید آن را از [git-scm.com](https://git-scm.com/) دانلود کنید. همه جا میتوانید کلید next را بزنید به غیر از دو جا: جایی که در مورد ویرایشگر متن از شما می‌پرسد شما باید ویرایشگر Nano را انتخاب کنید و در مرحله‌ای که عنوان آن "Adjusting your PATH environment" است، گزینه "Use Git and optional Unix tools from the Windows Command Prompt" (گزینه آخر) را انتخاب کنید. در بقیه موارد، پیش فرض‌ها مناسب هستند. گزینه "Checkout Windows-style, commit Unix-style line endings" را انتخاب کنید.

فراموش نکنید که بعد از اینکه نصب به پایان رسید command prompt یا PowerShell را از نو باز کنید. <!--endsec-->

<!--sec data-title="Installing Git: OS X" data-id="git_install_OSX"
data-collapse=true ces-->

گیت را از [git-scm.com](https://git-scm.com/) دانلود کنید و دستورالعمل‌ها را دنبال کنید.

> ** نکته **اگر شما از OS X نسخه 10.6، 10.7 یا 10.8 استفاده می‌کنید باید GIT را از اینجا نصب کنید: [ نصب Git برای OS X Snow Leopard ](https://sourceforge.net/projects/git-osx-installer/files/git-2.3.5-intel-universal-snow-leopard.dmg/download)

<!--endsec-->

<!--sec data-title="Installing Git: Debian or Ubuntu" data-id="git_install_debian_ubuntu"
data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

```bash
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