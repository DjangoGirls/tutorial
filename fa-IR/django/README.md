# جنگو چیست؟

جنگو (جَنگو) یک فریم ورک تحت وب رایگان و open source است که با زبان پایتون نوشته شده است. یک فریم ورک تحت وب, دارای مجموعه ای است که به شما کمک می کنند تا یک وب سایت را سریع تر و راحت تر توسعه دهید.

هنگامی که در حال ساخت یک وب سایت هستید، شما همیشه به مجموعه ای از اجزای مشابه نیاز دارید. به شرح زیر: یک روش برای کنترل کردن احراز هویت کاربر (ثبت نام ، ورود به حساب کاربری ، خروج از حساب کاربری) ، یک پنل مدیریت برای وب سایت خود ، فرم ها ، روشی برای آپلود فایل ها و غیره.

خوشبختانه خیلی وقت پیش، افرادی متوجه این موضوع شدند که هنگام ساختن یک سایت جدید، توسعه دهندگان وب با مشکلات مشابهی روبرو می شوند، بنابراین آن ها تیمی را تشکیل دادند که به راحتی اجزای کار را در اختیار شما قرار می دهد که شما بتوانید به راحتی از انها استفاده کنید ودر نهایت فریم ورک ها را ساختند (جنگو یکی از آن هاست).

فریم ورکها به این دلیل به وجود آمده اند که دیگر نیازی نباشد شما از اول چرخ را بسازید و به شما کمک می کند تا به راحتی سایت خود را بسازید.

## چرا شما به یک فریم ورک نیاز دارید?

برای درک بهترچگونگی عملکرد جنگو نگاه دقیق تری به سرور می اندازیم. اولین چیزی که سرور نیاز دارد که بداند این است که شما می خواهید سرور برای شما یک وب پیج را راه اندازی کند.

حالا میل باکس را تصور کنید که برای دریافت نامه ها ( requests) چه کارهایی را انجام می دهد. این کار توسط وب سرور انجام خواهد گرفت. وب سرور نامه را خوانده و پاسخ مربوطه را به وب پیج می فرستد. اما هنگامی که شما میخواهید چیزی را ارسال کنید, شما به برخی مطالب نیاز دارید. و جنگو همونی است که به شما برای ایجاد محتوا کمک می کند.

## زمانی که فردی یک درخواست از وب سایت به سرور شما می کند، چه اتفاقی می افتد؟

هنگامی که درخواست به وب سرور فرستاده می شود آن درخواست به جنگو انتقال داده می شود در این هنگام جنگو در تلاش برای فهمیدن درخواست می باشد. در ابتدا آدرس وب پیج را میگیرد و سعی در فهمیدن عملکرد می کند. این بخش توسط **urlresolver** جنگو انجام میگیرد (توجه داشته باشید که website address یوآرال را صدا میزند – Uniform Resource Locator– به این دلیل *urlresolver* نامیده می شود). یک لیست از الگوها را میگیرد و سعی برای مطابقت با آدرس می کند (خیلی منطقی نیست). Django checks patterns from top to bottom and if something is matched, then Django passes the request to the associated function (which is called *view*).

Imagine a mail carrier with a letter. She is walking down the street and checks each house number against the one on the letter. If it matches, she puts the letter there. This is how the urlresolver works!

In the *view* function, all the interesting things are done: we can look at a database to look for some information. Maybe the user asked to change something in the data? Like a letter saying, "Please change the description of my job." The *view* can check if you are allowed to do that, then update the job description for you and send back a message: "Done!" Then the *view* generates a response and Django can send it to the user's web browser.

Of course, the description above is a little bit simplified, but you don't need to know all the technical things yet. Having a general idea is enough.

So instead of diving too much into details, we will simply start creating something with Django and we will learn all the important parts along the way!