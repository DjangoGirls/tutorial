Git عباره عن "نظام تحكم في الإصدار" مستخدم من قبل الكثير من المبرمجين. هذا النظام يمكنه تعقب التغييرات في الملفات مع مرور الوقت حتى أنه يمكنك استرجاع إصدارات محددة في وقت لاحق. يشبع قليلاً ميزة "تعقب التغييرات" في Microsoft Word، لكن أقوى بكثير.

## تثبيت Git

<!--sec data-title="Installing Git: Windows" data-id="git_install_windows"
data-collapse=true ces-->

يمكنك تحميل Git من [ git-scm.com](https://git-scm.com/). يمكنك الضغط على "التالي" في جميع الخطوات باستثناء خطوة واحدة؛ في الخطوة الخامسة بعنوان "ضبط بيئة المسار الخاص بك"، اختر "تشغيل Git وأدوات يونيكس المرتبطة بها من سطر الأوامر في ويندوز" (الخيار الأسفل). بخلاف ذلك، الإعدادات الافتراضية كافيه. راجع نهايات السطور في نمط ويندوز ، و ارتكاب نمط يونكس.

لا تنس إعادة تشغيل موجه الأوامر أو powershell بعد انتهاء عملية التثبيت بنجاح. <!--endsec-->

<!--sec data-title="Installing Git: OS X" data-id="git_install_OSX"
data-collapse=true ces-->

Download Git from [git-scm.com](https://git-scm.com/) and follow the instructions.

> **ملاحضة** إذا كنت تستخدم نضام ماك بهذه الإصدارات OS X 10.6, 10.7, or 10.8, يجب عليك تنصيب نسخة جيت من هذا الرابط [Git installer for OS X Snow Leopard](https://sourceforge.net/projects/git-osx-installer/files/git-2.3.5-intel-universal-snow-leopard.dmg/download)

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