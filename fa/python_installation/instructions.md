> برای خوانندگان در خانه: این فصل در ویدئو [نصب پایتون و ویرایشگر کد](https://www.youtube.com/watch?v=pVTaqzKZCdA) توضیح داده شده است.
> 
> این قسمت بر اساس دوره آموزشی Geek Girls Carrots نوشته شده است.(https://github.com/ggcarrots/django-carrots)

جنگو با پایتون نوشته شده است. برای انجام هر کاری در جنگو، به زبان پایتون احتیاج داریم. بیایید با نصب پایتون شروع کنیم! ما می‌خواهیم شما آخرین نسخه پایتون 3 را نصب کنید، بنابراین اگر هرنسخه قدیمی تری دارید باید آن را به روزرسانی کنید. اگر پایتون نسخه {{ book.py_min_version }} یا بالاتر دارید، خوب است.

حتی اگر بر روی کامپیوتر شما Anaconda نصب شده است، لطفاً پایتون معمولی را به روش زیر نصب کنید.

<!--sec data-title="Install Python: Windows" data-id="python_windows" data-collapse=true ces-->

ابتدا چک کنید که کامپیوتر شما دارای ویندوز 32-bit است یا 64-bit، در ردیف "System type" در صفحه System Info می‌توانید این را متوجه شوید. برای پیدا کردن این صفحه یکی از کارهای زیر را انجام دهید:

* دکمه Windows و دکمه Pause/Break را همزمان روی کیبورد فشار دهید
* Control Panel را از منو ویندوز باز کنید، سپس به System & Security بروید و بعد از آن به System بروید
* دکمه Windows را فشار دهید، سپس مسیر Settings > System > About را دنبال کنید
* منوی Start ویندوز را برای یافتن "System Information" جستجو کنید. برای این کار بر روی منوی Start کلیک کنید یا کلید Windows را بزنید، سپس شروع به تایپ کردن `System Information` کنید. این کار باعث خواهد شد پیشنهادهای مختلف در هنگام تایپ کردن به شما نشان داده شود. شما می‌توانید گزینه System Information‌ را به محض ظاهر شدن، انتخاب کنید.

می‌توانید پایتون برای ویندوز را از وبسایت https://www.python.org/downloads/windows/ دانلود کنید. بر روی لینک "Latest Python 3 Release - Python x.x.x" کلیک کنید. اگر کامپیوتر شما نسخه **64-bit** ویندوز را اجرا می‌کند، **Windows x86-64 executable installer** را دانلود کنید. در غیر اینصورت، **Windows x86 executable installer** را دانلود کنید. پس از دانلود کردن اینستالر، باید آن را اجرا کنید (بر روی آن دوبار کلیک کنید) و دستورالعمل‌ها را دنبال کنید.

نکته قابل توجه: در هنگام نصب پنجره‌ای را خواهید دید به نام "Setup". مطمئن شوید که گزینه "Add Python {{ book.py_version }} to PATH" یا "Add Python to your environment variables"را انتخاب کرده‌اید و سپس بر روی "Install Now" که اینجا می‌بینید، کلیک کنید (اگر نسخه‌‌های دیگری را نصب کنید ممکن است کمی با این متفاوت باشد):

![فراموش نکنید که پایتون را به Path اضافه کنید](../python_installation/images/python-installation-options.png)

وقتی که نصب کامل شد، یک پنجره خواهید دید که شما را به یک لینک برای آموزش بیشتر در مورد پایتون و نیز در مورد نسخه‌ای که نصب کرده‌اید ارجاع می‌دهد. این پنجره را کنسل کنید و یا ببندید - شما در همین دوره آموزشی بیشتر در مورد پایتون یاد خواهید گرفت!

نکته: اگر از نسخه‌های قدیمی‌تر ویندوز استفاده می‌کنید (7، Vista یا نسخه‌های قدیمی‌تر) و نصب پایتون نسخه {{ book.py_version }} با خطا مواجه شد، تمام آپدیت‌های ویندوز را نصب کنید و دوباره برای نصب پایتون تلاش کنید. اگر همچنان با خطا مواجه شدید، سعی کنید پایتون نسخه {{ book.py_min_release }} را از [Python.org](https://www.python.org/downloads/windows/) نصب کنید.

> جنگو {{ book.django_version }} به پایتون {{ book.py_min_version }} یا بالاتر نیاز دارد که ویندوز XP یا نسخه‌های قدیمی‌تر را پشتیبانی نمی‌کند.

<!--endsec-->

<!--sec data-title="Install Python: OS X" data-id="python_OSX"
data-collapse=true ces-->

> **نکته** قبل از نصب پایتون بر روی OS X، باید مطمئن شوید که تنظیمات Mac‌، اجازه نصب پکیج‌هایی را که در App Store‌ نیستند، می‌دهد. به System Preferences بروید (در پوشه Applications است)، بر روی "Security & Privacy," کلیک کنید و به تب "General" بروید. اگر "Allow apps downloaded from:" بر روی "Mac App Store" تنظیم شده بود آن را به گزینه "Mac App Store and identified developers" تغییر دهید.

شما باید به آدرس https://www.python.org/downloads/mac-osx/ بروید و آخرین نسخه پایتون را دانلود کنید: 

* فایل *Mac OS X 64-bit/32-bit installer* را دانلود کنید،
* بر روی *python-{{ book.py_release }}-macosx10.9.pkg* دوبار کلیک کنید تا نصب‌کننده نرم‌افزار فعال شود.

<!--endsec-->

<!--sec data-title="Install Python: Linux" data-id="python_linux"
data-collapse=true ces-->

احتمال زیادی دارد که شما بر روی کامپیوترتان پایتون داشته باشید. برای چک کردن آنکه آیا پایتون دارید (یا اینکه نسخه آن چیست)، یک کنسول باز کنید و دستورات زیر را تایپ کنید:

{% filename %}خط فرمان{% endfilename %}

    $ python3 --version
    Python {{ book.py_release }}
    

اگر نسخه نصب شده دیگری از پایتون دارید حداقل {{ book.py_min_version }} (یا مثلاً {{ book.py_min_release }})، نیازی به به‌‌روزرسانی ندارید. اگر پایتون نصب شده ندارید یا نسخه دیگری را می‌خواهید، اول باید به کمک دستورات زیر، کنترل کنید که از کدام توزیع لینوکس استفاده می‌کنید:

{% filename %}خط فرمان{% endfilename %}

    $ grep '^NAME=' /etc/os-release
    

سپس بسته به نتیجه، یکی از روش‌های نصب زیر را به کار ببرید.

<!--endsec-->

<!--sec data-title="Install Python: Debian or Ubuntu" data-id="python_debian" data-collapse=true ces-->

این دستور را در کنسول تایپ کنید:

{% filename %}خط فرمان{% endfilename %}

    $ sudo apt install python3
    

<!--endsec-->

<!--sec data-title="Install Python: Fedora" data-id="python_fedora"
data-collapse=true ces-->

این دستور را در کنسول تایپ کنید:

{% filename %}خط فرمان{% endfilename %}

    $ sudo dnf install python3
    

اگر بر روی نسخه‌های قدیمی Fedora کار می‌کنید ممکن است پیغام خطایی بگیرید که `dnf` پیدا نشد. در این مورد، باید به جای آن از `yum` استفاده کنید.

<!--endsec-->

<!--sec data-title="Install Python: openSUSE" data-id="python_openSUSE"
data-collapse=true ces-->

این دستور را در کنسول تایپ کنید:

{% filename %}خط فرمان{% endfilename %}

    $ sudo zypper install python3
    

<!--endsec-->

برای بررسی موفقیت‌آمیز بودن نصب، یک خط فرمان باز کنید و دستور `python3</0 را جرا کنید:</p>

<p>{% filename %}خط فرمان{% endfilename %}</p>

<pre><code>$ python3 --version
Python {{ book.py_release }}
`</pre> 

نسخه نمایش داده شده ممکن است با {{ book.py_release }} متفاوت باشد اما باید آن چیزی باشد که در موقع نصب انتخاب کرده‌اید.

**نکته:** اگر بر روی ویندوز کار می‌کنید و خطای `python3` wasn't found را گرفتید، از دستور `python` (بدون `3`) استفاده کنید و ببنید آیا ممکن است که نسخه پایتون {{ book.py_min_version }} یا بالاتر باشد. اگر این کار هم موثر نبود، یک خط فرمان جدید بازکنید و دوباره تلاش کنید؛ اگر خط فرمان شما از قبل از نصب پایتون باز مانده باشد ممکن است چنین خطایی دریافت کنید.

* * *

اگر جایی تردید داشتید یا مشکل دیگری بوجود آمد که نمی‌دانستید چه باید بکنید، لطفاً از مربی خود کمک بگیرید! گاهی وقت‌ها اوضاع به خوبی پیش نمی‌رود و بهتر است از فرد باتجربه‌تری کمک بگیرید.