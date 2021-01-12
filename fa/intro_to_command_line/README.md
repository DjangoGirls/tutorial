# آشنایی با خط فرمان

> برای خوانندگان در خانه: این فصل در ویدئو [دوست جدید شما: Command Line](https://www.youtube.com/watch?v=jvZLWhkzX-8) توضیح داده شده است.

هیجان انگیز است! شما تا چند دقیقه دیگر اولین خط کد خود را خواهید نوشت! :)

**بگذارید شما را به اولین دوست جدیدتان معرفی کنیم: خط فرمان!**

این مراحل به شما یاد می‌دهد که چطور از این پنجره سیاهی استفاده کنید که همه هکرها از آن استفاده می‌کنند. ممکن است در ابتدا کمی ترسناک به نظر بیاید ولی این فقط یک علامت است که نشان می‌دهد سیستم منتظر فرمان‌های شماست.

> **نکته** توجه داشته باشید که در این دوره آموزشی ما بارها از دایرکتوری یا پوشه صحبت کرده ایم هر دو این مفاهیم یکی هستند.

## خط فرمان چیست؟

این پنجره که معمولاً **command line** یا **صفحه خط فرمان** گفته می‌شود یک نرم افزار مبتنی بر متن است که برای مشاهده، مدیریت و تغییر فایل‌ها از آن استفاده می‌شود. شباهت زیادی به ویندوز اکسپلورر یا فایندر در مک دارد با این تفاوت که اینترفیس گرافیکی ندارد. نام های دیگر خط فرمان این‌ها هستند: *cmd*, *CLI*, *prompt*, *console* ، *terminal*.

## اینترفیس خط فرمان را باز کنید

برای اینکه کمی تجربه کنیم باید ابتدا اینترفیس خط فرمان را باز کنید.

{% include "/intro_to_command_line/open_instructions.md" %}

## Prompt

شما صفحه‌ای سیاه یا سفید خواهید دید که منتظر دستورات شماست.

<!--sec data-title="Prompt: OS X and Linux" data-id="OSX_Linux_prompt" data-collapse=true ces-->

اگر بر روی مک یا لینوکس کار می‌کنید، ممکن است یک علامت `$` ببینید:

{% filename %}خط فرمان{% endfilename %}

    $
    

<!--endsec-->

<!--sec data-title="Prompt: Windows" data-id="windows_prompt2" data-collapse=true ces-->

بر روی ویندوز، احتمالاً علامت `>` را خواهید دید:

{% filename %}خط فرمان{% endfilename %}

    >
    

به بخش لینوکس در بالا نگاه کنید، چیزی که در آنجا می‌بینید بسیار شبیه چیزی است که در وبسایت PythonAnywhere و در ادامه این دوره آموزشی خواهید دید.

<!--endsec-->

هر دستور با یک پیشوند `$` یا `>` و یک اسپیس نشان داده شده‌اند، ولی شما نباید آن‌ها را تایپ کنید کامپیوتر آن را قبل از هر دستور شما گذاشته است. :)

> یک نکته کوچک: ممکن است در کامپیوتر شما چیزهایی شبیه به `C:\Users\ola>` یا `Olas-MacBook-Air:~ ola$` قبل از علامت پرامت باشد که کاملاً طبیعی است.

به بخشی که از ابتدای خط تا علامت `$` یا `>` را شامل می‌شود *command line prompt* یا به طور خلاصه *prompt* گفته می‌شود (prompt به معنی تشویق کردن و برانگیختن است). این علامت شما را تشویق می‌کند تا جلوی آن چیزی بنویسید.

در این دوره آموزشی وقتی که از شما می‌خواهیم که دستوری را بنویسید، معمولاً در سمت چپ آن `$` یا `>` را گذاشته‌ایم. این تکه را در نظر نگیرید و فقط دستور را که بلافاصله بعد از پرامت قرار دارد تایپ کنید.

## اولین دستور شما (وای!)

بیایید با تایپ این دستور شروع کنیم:

<!--sec data-title="Your first command: OS X and Linux" data-id="OSX_Linux_whoami" data-collapse=true ces-->

{% filename %}خط فرمان{% endfilename %}

    $ whoami
    

<!--endsec-->

<!--sec data-title="Your first command: Windows" data-id="windows_whoami" data-collapse=true ces-->

{% filename %}خط فرمان{% endfilename %}

    > whoami
    

<!--endsec-->

و سپس کلید `enter` را بزنید. نتیجه این خواهد بود:

{% filename %}خط فرمان{% endfilename %}

    $ whoami
    olasitarska
    

همانطور که می‌بینید کامپیوتر نام کاربری شما را نشان می‌دهد. جالب نیست؟ :)

> برای امتحان کردن هر دستور آن را کپی نکیند. با تایپ کردن بهتر یاد خواهید گرفت!

## اصول اولیه

هر سیستم عامل، مجموعه دستورات کمی متفاوت برای خط فرمان، با دیگر سیستم عامل‌ها دارد، بنابراین مطمئن شوید که دستورالعمل‌های سیستم عامل خود را دنبال می‌کنید. حالا این را امتحان کنیم، آماده اید؟

### دایرکتوری جاری

بسیار خوب است که بفهمیم در کدام دایرکتوری هستیم. این دستور را تایپ کنید و کلید `enter` را بزنید:

<!--sec data-title="Current directory: OS X and Linux" data-id="OSX_Linux_pwd" data-collapse=true ces-->

{% filename %}خط فرمان{% endfilename %}

    $ pwd
    /Users/olasitarska
    

> نکته: 'pwd' مخفف 'print working directory' به معنی 'دایرکتوری در حال اجرا را چاپ کن' است.

<!--endsec-->

<!--sec data-title="Current directory: Windows" data-id="windows_cd" data-collapse=true ces-->

{% filename %}خط فرمان{% endfilename %}

    > cd
    C:\Users\olasitarska
    

> نکته: 'cd' مخفف 'change directory' به معنی 'دایرکتوری را عوض کن'. در نرم افزار PowerShell در ویندوز شما می‌توانید مانند لینوکس یا مک از دستور pwd استفاده کنید.

<!--endsec-->

احتمالاً چیزی شبیه به این را بر روی کامپیوتر خود دیده اید. وقتی پنچره خط فرمان را باز می‌کنید معمولاً در دایرکتوری home اکانت کاربری خود هستید.

* * *

### چیزهای بیشتر در مورد یک فرمان

بسیاری از فرمان‌هایی که شما می‌توانید در پرامت فرمان تایپ کنید یک راهنمای داخلی دارند که می‌توانید آن را ببینید و بخوانید! مثلاٌ برای آنکه در مورد فرمان دایرکتوری جاری بیشتر بدانید:

<!--sec data-title="Command help: OS X and Linux" data-id="OSX_Linux_man" data-collapse=true ces-->

OS X و لینوکس یک فرمان `man` دارند که در مورد فرمان‌ها کمک زیادی می‌کند. دستور `man pwd` را امتحان کنید و ببینید که چه می‌شود. یا دستور `man` را قبل از فرمان‌های دیگر قرار دهید تا راهنمای داخلی آن‌ها را ببینید. خروجی فرمان `man` صفحه بندی شده است. با کمک کلید اسپیس به صفحه بعد بروید و با زدن `q` از راهنما خارج شوید.

<!--endsec-->

<!--sec data-title="Command Help: Windows" data-id="windows_help" data-collapse=true ces-->

اضافه کردن یک پسوند `/?` به اکثر فرمان‌ها باعث می‌شود که صفحه راهنما نشان داده شود. لازم است صفحه را به سمت بالا اسکرول کنید تا تمام آن را ببینید. `cd /?` را امتحان کنید.

<!--endsec-->

### لیست کردن فایل‌ها و دایرکتوری‌ها

چی توش هست؟ خوبه که بفهمیم. نگاه کنید:

<!--sec data-title="List files and directories: OS X and Linux" data-id="OSX_Linux_ls" data-collapse=true ces-->

{% filename %}خط فرمان{% endfilename %}

    $ ls
    Applications
    Desktop
    Downloads
    Music
    ...
    

<!--endsec-->

<!--sec data-title="List files and directories: Windows" data-id="windows_dir" data-collapse=true ces-->

{% filename %}خط فرمان{% endfilename %}

    > dir
     Directory of C:\Users\olasitarska
    05/08/2014 07:28 PM <DIR>      Applications
    05/08/2014 07:28 PM <DIR>      Desktop
    05/08/2014 07:28 PM <DIR>      Downloads
    05/08/2014 07:28 PM <DIR>      Music
    ...
    

> نکته: در PowerShell شما می‌توانید مانند لینوکس یا Mac OS X از دستور 'ls' استفاده کنید.<!--endsec-->

* * *

### تغییر دایرکتوری جاری

حالا به دایرکتوری Desktop کامپیوترمان برویم:

<!--sec data-title="Change current directory: OS X" data-id="OSX_move_to" data-collapse=true ces-->

{% filename %}خط فرمان{% endfilename %}

    $ cd Desktop
    

<!--endsec-->

<!--sec data-title="Change current directory: Linux" data-id="Linux_move_to" data-collapse=true ces-->

{% filename %}خط فرمان{% endfilename %}

    $ cd Desktop
    

توجه داشته باشید که ممکن است دایرکتوری Desktop به زبان کاربری تعیین شده در لینوکس شما ترجمه شود. اگر چنین اتفاقی افتاد لازم است که شما `Desktop` را با نام ترجمه شده عوض کنید؛ مثلاً برای زبان آلمانی با `Schreibtisch` عوض کنید.

<!--endsec-->

<!--sec data-title="Change current directory: Windows" data-id="windows_move_to" data-collapse=true ces-->

{% filename %}خط فرمان{% endfilename %}

    > cd Desktop
    

<!--endsec-->

بررسی کنید که آیا واقعاً دایرکتوری جاری عوض شد:

<!--sec data-title="Check if changed: OS X and Linux" data-id="OSX_Linux_pwd2" data-collapse=true ces-->

{% filename %}خط فرمان{% endfilename %}

    $ pwd
    /Users/olasitarska/Desktop
    

<!--endsec-->

<!--sec data-title="Check if changed: Windows" data-id="windows_cd2" data-collapse=true ces-->

{% filename %}خط فرمان{% endfilename %}

    > cd
    C:\Users\olasitarska\Desktop
    

<!--endsec-->

بله درست شد!

> نکته حرفه‌ای: اگر شما تایپ کنید `cd D` و بعد کلید `tab` را بر روی کیبورد بزنید، خط فرمان ادامه فرمان شما را تایپ خواهد کرد بنابراین سریعتر می‌توانید حرکت کنید. اگر دایرکتوری هایی که با "D" شروع می‌شوند بیشتر از یکی باشند، با دوبار زدن کلید `tab` لیستی از آن‌ها را خواهید دید.

* * *

### ساختن دایرکتوری

چطور است که یک دایرکتوری آزمایشی بر روی دسکتاپ بسازیم؟ به این روش می‌توانید انجام دهید:

<!--sec data-title="Create directory: OS X and Linux" data-id="OSX_Linux_mkdir" data-collapse=true ces-->

{% filename %}خط فرمان{% endfilename %}

    $ mkdir practice
    

<!--endsec-->

<!--sec data-title="Create directory: Windows" data-id="windows_mkdir" data-collapse=true ces-->

{% filename %}خط فرمان{% endfilename %}

    > mkdir practice
    

<!--endsec-->

این دستور کوچک یک دایرکتوری به نام `practice` بر روی دسکتاپ شما خواهد ساخت. شما می‌توانید با اجرا کردن دستور `ls` یا `dir` بررسی کنید که آیا این دایرکتوری روی Desktop هست یا نه! آن را امتحان کنید. :)

> نکته حرفه‌ای: اگر دوست ندارید یک دستور را بارها و بارها تایپ کنید، کلید `up arrow` یا جهت بالا و `down arrow` یا جهت پایین را بر روی کیبورد بزنید تا فرمان‌هایی که اخیراً زده اید را ببینید.

* * *

### تمرین!

یک چالش کوچک برای شما: در این دایرکتوری `practice` که اخیراٌ ساخته اید، یک دایرکتوری به نام `test` بسازید. (از دستور `cd` و `mkdir` استفاده کنید.)

#### راه حل:

<!--sec data-title="Exercise solution: OS X and Linux" data-id="OSX_Linux_test_dir" data-collapse=true ces-->

{% filename %}خط فرمان{% endfilename %}

    $ cd practice
    $ mkdir test
    $ ls
    test
    

<!--endsec-->

<!--sec data-title="Exercise solution: Windows" data-id="windows_test_dir" data-collapse=true ces-->

{% filename %}خط فرمان{% endfilename %}

    > cd practice
    > mkdir test
    > dir
    05/08/2014 07:28 PM <DIR>      test
    

<!--endsec-->

تبریک! :)

* * *

### پاک‌سازی

نمی‌خواهیم همه جا را شلوغ کنیم، پس بیایید همه چیزهایی که ساخته ایم را پاک کنیم.

اول از همه باید به Desktop برویم:

<!--sec data-title="Clean up: OS X and Linux" data-id="OSX_Linux_back" data-collapse=true ces-->

{% filename %}خط فرمان{% endfilename %}

    $ cd ..
    

<!--endsec-->

<!--sec data-title="Clean up: Windows" data-id="windows_back" data-collapse=true ces-->

{% filename %}خط فرمان{% endfilename %}

    > cd ..
    

<!--endsec-->

استفاده کردن از `..` به همراه دستور `cd` باعث خواهد شد که به دایرکتوری parent بروید (parent دایرکتوری است که دایرکتوری جاری درون آن قرار دارد).

بررسی کنید که کجا هستید:

<!--sec data-title="Check location: OS X and Linux" data-id="OSX_Linux_pwd3" data-collapse=true ces-->

{% filename %}خط فرمان{% endfilename %}

    $ pwd
    /Users/olasitarska/Desktop
    

<!--endsec-->

<!--sec data-title="Check location: Windows" data-id="windows_cd3" data-collapse=true ces-->

{% filename %}خط فرمان{% endfilename %}

    > cd
    C:\Users\olasitarska\Desktop
    

<!--endsec-->

حالا وقت پاک کردن دایرکتوری `practice` است:

> **توجه**: پاک کردن فایل‌ها با `del` یا `rmdir` یا `rm` غیر قابل بازگشت است به این معنی که *فایل‌های پاک شده برای همیشه از بین می‌روند*! بنابراین هنگام کار با این دستورها بسیار احتیاط کنید.

<!--sec data-title="Delete directory: Windows Powershell, OS X and Linux" data-id="OSX_Linux_rm" data-collapse=true ces-->

{% filename %}خط فرمان{% endfilename %}

    $ rm -r practice
    

<!--endsec-->

<!--sec data-title="Delete directory: Windows Command Prompt" data-id="windows_rmdir" data-collapse=true ces-->

{% filename %}خط فرمان{% endfilename %}

    > rmdir /S practice
    practice, Are you sure <Y/N>? Y
    

<!--endsec-->

انجام شد! برای اینکه مطمئن شوید پاک شده است آن را چک کنید:

<!--sec data-title="Check deletion: OS X and Linux" data-id="OSX_Linux_ls2" data-collapse=true ces-->

{% filename %}خط فرمان{% endfilename %}

    $ ls
    

<!--endsec-->

<!--sec data-title="Check deletion: Windows" data-id="windows_dir2" data-collapse=true ces-->

{% filename %}خط فرمان{% endfilename %}

    > dir
    

<!--endsec-->

### خروج

برای الان کافی است! شما می‌توانید به راحتی خط فرمان را ببندید. بیایید به روش هکرها انجامش دهیم، باشه؟ :)

<!--sec data-title="Exit: OS X and Linux" data-id="OSX_Linux_exit" data-collapse=true ces-->

{% filename %}خط فرمان{% endfilename %}

    $ exit
    

<!--endsec-->

<!--sec data-title="Exit: Windows" data-id="windows_exit" data-collapse=true ces-->

{% filename %}خط فرمان{% endfilename %}

    > exit
    

<!--endsec-->

با حال بود، نه؟ :)

## چکیده

اینجا چکیده‌ای از دستورات مهم آورده شده:

| دستورات (Windows) | دستورات (Mac OS / Linux) | توضیحات                     | مثال                                               |
| ----------------- | ------------------------ | --------------------------- | -------------------------------------------------- |
| exit              | exit                     | بستن پنجره خط فرمان         | **exit**                                           |
| cd                | cd                       | تغییر دایرکتوری             | **cd test**                                        |
| cd                | pwd                      | نشان دادن دایرکتوری جاری    | **cd** (Windows) or **pwd** (Mac OS / Linux)       |
| dir               | ls                       | لیست کردن دایرکتوری/فایل ها | **dir**                                            |
| copy              | cp                       | کپی کردن فایل               | **copy c:\test\test.txt c:\windows\test.txt**  |
| move              | mv                       | جا به جا کردن فایل          | **move c:\test\test.txt c:\windows\test.txt**  |
| mkdir             | mkdir                    | ساختن یک دایرکتوری جدید     | **mkdir testdirectory**                            |
| rmdir (or del)    | rm                       | حذف کردن یک فایل            | **del c:\test\test.txt**                         |
| rmdir /S          | rm -r                    | حذف کردن یک دایرکتوری       | **rm -r testdirectory**                            |
| [CMD] /?          | man [CMD]                | دیدن راهنمای یک دستور       | **cd /?** (Windows) or **man cd** (Mac OS / Linux) |

این‌ها تعداد بسیار کمی از دستوراتی هستند که می‌توانید در خط فرمان اجرا کنید، اما امروز چیزی بیشتر از این‌ها لازم ندارید.

اگر علاقمند هستید، وبسایت [ss64.com](http://ss64.com) مرجع کاملی از انواع فرمان‌ها برای سیستم عامل‌های مختلف دارد.

## آماده هستید؟

حالا در پایتون شیرجه بزنیم!