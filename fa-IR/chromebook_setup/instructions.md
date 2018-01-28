اگر از Chromebook استفاده نکنید، میتوانید  راست بالای این بخش </ 0> را جستوجو کنید. اگر شما هستند، تجربه نصب شما کمی متفاوت خواهد بود. شما می توانید آن را نادیده بگیرید بقیه دستورالعمل نصب.</p> 

### ابر 9

ابر 9 ابزار است که به شما یک ویرایشگر کد و دسترسی به کامپیوتر در حال اجرا است در اینترنت که در آن شما می توانید نصب، نوشتن و اجرای نرم افزار را انجام دهید. برای مدت زمان از آموزش، ابر9 به عنوان * دستگاه محلی شما </ 0> عمل خواهد کرد. شما هنوز هم هستی اجرای دستورات در یک رابط ترمینال درست مثل همکلاسی های شما در OS X، اوبونتو یا ویندوز، اما ترمینال شما به یک رایانه در حال اجرا متصل خواهد شد در جای دیگری ابر 9 برای شما تنظیم شده است.</p> 

1. ابر 9 را از  فروشگاه وب کروم</ 0> نصب کنید</li> 
    
    - به  c9.io و </ 0> بروید</li> 
        
        - برای یک حساب کار بری ثبت نام کنید
        - روی * ایجاد یک فضای کاری جدید کلیک کنید </ 0></li> 
            
            - نام ببرید * دختران جانگا </ 0></li> 
                
                - * خالی </ 0> را انتخاب کنید (دوم از سمت راست در ردیف پایین با آرم نارنجی)</li> </ol> 
                    
                    حالا شما باید یک رابط با یک نوار کناری، یک پنجره اصلی بزرگ با برخی از آنها را ببینید متن و یک پنجره کوچک در پایین که به نظر می رسد چیزی شبیه به این است:
                    
                    % filename %}}ابر9 و% endfilename %}}
                    
                        نام کاربری شما:~/فضای کاری $
                        
                    
                    این منطقه پایین * ترمینال </ 0> شما است، که در آن شما رایانه ابر9 را به شما ارائه می دهیم برای دستورالعمل های شما آماده شده است. شما می توانید این پنجره را تغییر دهید تا آن را کمی تغییر دهید بزرگتر.</p> 
                    
                    ### محیط مجازی
                    
                    محیط مجازی (همچنین مجازی نامیده می شود) مانند یک جعبه خصوصی است که می توانیم انجام دهیم برای کدام یک از پروژه هایی که در حال کار بر روی آنها هستیم، کد کامپیوتر مفیدی را وارد می کنیم. ما از آنها استفاده می کنیم بیت های مختلفی را که می خواهیم برای پروژه های مختلفمان بخواهیم جداگانه نگهداریم همه چیز بین پروژه ها مخلوط نیست.
                    
                    در ترمینال شما در پایین رابط ابر9، موارد زیر را اجرا کنید:
                    
                    % filename %}}ابر9 و% endfilename %}}
                    
                        sudo apt update
                        sudo apt install python3.6-venv
                        
                    
                    If this still doesn't work, ask your coach for some help.
                    
                    Next, run:
                    
                    {% filename %}Cloud 9{% endfilename %}
                    
                        mkdir djangogirls
                        cd djangogirls
                        python3.6 -mvenv myvenv
                        source myvenv/bin/activate
                        pip install django~=1.11.0
                        
                    
                    (note that on the last line we use a tilde followed by an equal sign: ~=).
                    
                    ### Github
                    
                    Make a [Github](https://github.com) account.
                    
                    ### PythonAnywhere
                    
                    The Django Girls tutorial includes a section on what is called Deployment, which is the process of taking the code that powers your new web application and moving it to a publicly accessible computer (called a server) so other people can see your work.
                    
                    This part is a little odd when doing the tutorial on a Chromebook since we're already using a computer that is on the Internet (as opposed to, say, a laptop). However, it's still useful, as we can think of our Cloud 9 workspace as a place or our "in progress" work and Python Anywhere as a place to show off our stuff as it becomes more complete.
                    
                    Thus, sign up for a new Python Anywhere account at [www.pythonanywhere.com](https://www.pythonanywhere.com).