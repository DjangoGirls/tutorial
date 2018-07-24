# Deploy!

> **หมายเหตุ** บทนี้อาจจะไม่ง่ายนักที่จะผ่านไปได้ ขอให้อดทนและทำให้เสร็จ; deployment เป็นส่วนสำคัญในกระบวนการพัฒนาเว็บไซต์ บทนี้อยู่ในครึ่งทางของบทเรียนทั้งหมด ดังนั้นผู้ช่วยของคุณจะพาคุณนำเว็บไซต์ออนไลน์โดยจะมีขั้นตอนยุ่งยากเล็กน้อย ซึ่งหมายความว่า ถึงคุณมีเวลาไม่พอ ก็จะยังสามารถจบบทนี้ได้แน่นอน

จนถึงตอนนี้คุณสามารถเปิดดูเว็บไซต์ของคุณจากคอมพิวเตอร์ของคุณเท่านั้น Now you will learn how to deploy it! Deploying คือกระบวนการเผยแพร่โปรแกรมของคุณขึ้นสู่อินเทอร์เน็ต สุดท้ายแล้ว ทุกคนก็จะสามารถเห็นเว็บของคุณได. :)

อย่างที่คุณได้ทราบ เว็บไซต์นั้นอาศัยอยู่ในเครื่องเซิร์ฟเวอร์ มันมีผู้ให้บริการเซิร์ฟเวอร์จำนวนมากบนอินเทอร์เน็ต แต่เราจะใช้ [PythonAnywhere](https://www.pythonanywhere.com/) PythonAnywhere นั้นฟรีสำหรับแอปพลิเคชันขนาดเล็กที่มีผู้เข้าชมมีจำนวนไม่มาก ดังนั้นมันจึงเพียงพอสำหรับคุณในตอนนี้

มีบริการภายอื่นที่เราจะใช้เช่นกัน คือ [GitHub](https://www.github.com) ซึ่งเป็นบริการที่เก็บโค้ดของเรา จริงๆ ก็มีบริการจากที่อื่นเช่นกัน แต่โปรแกรมเมอร์เกือบทุกคนในตอนนี้มีบัญชี GitHub และคุณก็กำลังจะมีด้วยเช่นกัน!

These three places will be important to you. เครื่องคอมพิวเตอร์ของคุณจะเป็นที่ที่คุณพัฒนาและทดสอบ เมื่อคุณพอใจกับการเปลี่ยนแปลงแล้ว คุณจะทำสำเนาโปรแกรมของคุณไว้ใน GitHub เว็บไซต์ของคุณจะอยู่ใน PythonAnywhere และคุณจะอัพเดตมันได้ โดยคุณจะได้รับสำเนาของโค้ดของคุณจาก GitHub

# Git

> **หมายเหตุ** ถ้าคุณผ่านขั้นตอนในหัวข้อติดตั้งมาแล้ว คุณไม่จำเป็นต้องทำอีกครั้ง - คุณสามารถข้ามไปยังส่วนถัดไป และเริ่มสร้าง Git repository ได้เลย

{% include "/deploy/install_git.md" %}

## เริ่มต้นจาก Git repository

Git ติดตามการเปลี่ยนแปลงของไฟล์เป็นชุด โดยเรียกชุดไฟล์เหล่านี้ว่า โค้ด repository (หรือสั้นๆ ว่า "repo") เริ่มจากโครงการของเรา เปิดคอนโซลของคุณ และรันคำสั่งต่อไปนี้ในไดเรกทอรี `djangogirls`:

> **หมายเหตุ** ตรวจสอบไดเรกทอรีปัจจุบันโดยใช้คำสั่ง `pwd` (สำหรับ OSX/Linux) หรือ `cd` (สำหรับ Windows) ก่อนจะเริ่มสร้าง repository คุณควรอยู่ในโฟลเดอร์ `djangogirls`

{% filename %}command-line{% endfilename %}

    $ git init
    Initialized empty Git repository in ~/djangogirls/.git/
    $ git config --global user.name "Your Name"
    $ git config --global user.email you@example.com
    

การเริ่มต้น git repository เป็นสิ่งที่เราทำเพียงครั้งเดียวในแต่ละโปรเจค (และคุณไม่จำเป็นต้องป้อน username และ email อีกเลยหลังจากนี้)

Git จะติดตามการเปลี่ยนแปลงในทุกไฟล์และโฟลเดอร์ที่อยู่ภายในไดเรกทอรีนี้ แต่ก็จะมีบางไฟล์ที่เราไม่ต้องการให้ติดตาม สามารถทำได้โดยสร้างไฟล์ชื่อ `.gitignore` ในไดเรกทอรีบนสุด เปิดตัวแก้ไขไฟล์ และสร้างไฟล์ที่มีเนื้อหาดังนี้:

{% filename %}.gitignore{% endfilename %}

    *.pyc
    *~
    __pycache__
    myvenv
    db.sqlite3
    /static
    .DS_Store
    

จากนั้นจึงบันทึกไฟล์โดยใช้ชื่อว่า `.gitignore` ที่อยู่ในโฟลเดอร์ "djangogirls"

> **หมายเหตุ** เครื่องหมายจุดที่อยู่หน้าชื่อไฟล์นั้นสำคัญมาก! ถ้าคุณมีปัญหาในการสร้างไฟล์นี้ (เช่น Mac ไม่ชอบให้คุณสร้างไฟล์ที่เริ่มต้นด้วยเครื่องหมายจุดใน Finder) ดังนั้น คุณควรใช้ "Save As" จากตัวแก้ไขไฟล์แทน
> 
> **Note** One of the files you specified in your `.gitignore` file is `db.sqlite3`. That file is your local database, where all of your posts are stored. We don't want to add this to your repository because your website on PythonAnywhere is going to be using a different database. That database could be SQLite, like your development machine, but usually you will use one called MySQL which can deal with a lot more site visitors than SQLite. Either way, by ignoring your SQLite database for the GitHub copy, it means that all of the posts you created so far are going to stay and only be available locally, but you're going to have to add them again on production. You should think of your local database as a good playground where you can test different things and not be afraid that you're going to delete your real posts from your blog.

ควรใช้คำสั่ง `git status` ก่อนที่จะใช้คำสั่ง `git add` หรือเมื่อใดก็ตามที่คุณไม่แน่ใจว่า มีการเปลี่ยนแปลงอะไรไปบ้าง วิธีนี้จะช่วยให้คุณไม่เจอเหตุการณ์แปลกๆ เช่น คุณเพิ่มไฟล์ผิดไฟล์ หรือยืนยันการบันทึกไฟล์ผิดไฟล์ The `git status` command returns information about any untracked/modified/staged files, the branch status, and much more. ผลลัพธ์ควรมีหน้าตาเหมือนอย่างด้านล่างนี้:

{% filename %}command-line{% endfilename %}

    $ git status
    On branch master
    
    Initial commit
    
    Untracked files:
      (use "git add <file>..." to include in what will be committed)
    
            .gitignore
            blog/
            manage.py
            mysite/
            requirements.txt
    
    nothing added to commit but untracked files present (use "git add" to track)
    

และสุดท้าย เราบันทึกการเปลี่ยนแปลง เปิดคอนโซลของคุณและใช้คำสั่ง:

{% filename %}command-line{% endfilename %}

    $ git add --all .
    $ git commit -m "My Django Girls app, first commit"
     [...]
     13 files changed, 200 insertions(+)
     create mode 100644 .gitignore
     [...]
     create mode 100644 mysite/wsgi.py
    

## การส่งโค้ดของเราไปยัง GitHub

ไปที่ [GitHub.com](https://www.github.com) แล้วลงทะเบียนบัญชีผู้ใช้ใหม่ (ถ้าคุณทำแล้วเรียบร้อย ก็เจ๋งไปเลย!)

จากนั้นจึงสร้าง repository ใหม่ โดยใช้ชื่อว่า "my-first-blog" Leave the "initialize with a README" checkbox unchecked, leave the .gitignore option blank (we've done that manually) and leave the License as None.

![](images/new_github_repo.png)

> **หมายเหตุ** ชื่อ `my-first-blog` นั้นสำคัญ - คุณสามารถใช้ชื่ออื่นได้ แต่ชื่อนี้จะปรากฎตลอดทั้งหน้านี้ และคุณจำเป็นต้องเปลี่ยนชื่อตามทุกครั้ง เพราะงั้นมันจะเป็นการง่ายกว่าถ้าเราใช้ชื่อ `my-first-blog`

On the next screen, you'll be shown your repo's clone URL. Choose the "HTTPS" version, copy it, and we'll paste it into the terminal shortly:

![](images/github_get_repo_url_screenshot.png)

ตอนนี้เราจะทำการชี้ Git repository บนคอมพิวเตอร์ของเราไปยัง GitHub

ใช้คำสั่งต่อไปบนคอนโซลของคุณ (แทนที่ `<your-github-username>` ด้วย username ที่คุณสมัคร Github ไว้ แต่ไม่ต้องมีเครื่องหมายวงเล็บปีกกา):

{% filename %}command-line{% endfilename %}

    $ git remote add origin https://github.com/<your-github-username>/my-first-blog.git
    $ git push -u origin master
    

ใส่ GitHub username และ password ของคุณ จากนั้นคุณควรจะเห็นผลลัพธ์คล้ายๆ แบบนี้:

{% filename %}command-line{% endfilename %}

    Username for 'https://github.com': ola
    Password for 'https://ola@github.com':
    Counting objects: 6, done.
    Writing objects: 100% (6/6), 200 bytes | 0 bytes/s, done.
    Total 3 (delta 0), reused 0 (delta 0)
    To https://github.com/ola/my-first-blog.git
    
     * [new branch]      master -> master
    Branch master set up to track remote branch master from origin.
    

<!--TODO: maybe do ssh keys installs in install party, and point ppl who dont have it to an extension -->

ตอนนี้โค้ดของคุณได้อยู่บน GitHub แล้ว ลองไปดู ว่ามันอยู่บน GitHub แล้วจริงมั้ย! คุณจะเห็นว่ามีบริษัทเจ๋งๆ อย่าง - [Django](https://github.com/django/django), [Django Girls Tutorial](https://github.com/DjangoGirls/tutorial) และโครงการโอเพ่นซอร์สซอฟต์แวร์มากมาย ก็เก็บโค้ดไว้ที่ GitHub :)

# การติดตั้งบล็อกของเราใน PythonAnywhere

## สมัครใช้บัญชี PythonAnywhere

> **หมายเหตุ** คุณอาจจะได้สร้างบัญชีของ PythonAnywhere แล้ว - ถ้าเป็นเช่นนั้น คุณก็ไม่จำเป็นต้องทำมันอีกครั้ง

{% include "/deploy/signup_pythonanywhere.md" %}

## การกำหนดค่าเว็บไซต์ของเราใน PythonAnywhere

Go back to the main [PythonAnywhere Dashboard](https://www.pythonanywhere.com/) by clicking on the logo, and choose the option to start a "Bash" console – that's the PythonAnywhere version of a command line, just like the one on your computer.

![ส่วน 'New Console' บน PythonAnywhere เว็บอินเตอร์เฟส กับปุ่มสำหรับ 'bash'](images/pythonanywhere_bash_console.png)

> **หมายเหตุ** PythonAnywhere นั้นใช้ Linux เป็นฐาน หากคุณใช้ Windows คอนโซลที่คุณเห็นจะมีหน้าตาที่ต่างไปจากคอนโซลบนคอมพิวเตอร์ของคุณ

Deploying a web app on PythonAnywhere involves pulling down your code from GitHub, and then configuring PythonAnywhere to recognise it and start serving it as a web application. There are manual ways of doing it, but PythonAnywhere provides a helper tool that will do it all for you. Let's install it first:

{% filename %}PythonAnywhere command-line{% endfilename %}

    $ pip3.6 install --user pythonanywhere
    

That should print out some things like `Collecting pythonanywhere`, and eventually end with a line saying `Successfully installed (...) pythonanywhere- (...)`.

Now we run the helper to automatically configure our app from GitHub. พิมพ์คำสั่งต่อไปลงในคอนโซลบน PythonAnywhere (อย่าลืมใช้ username GitHub ของคุณ แทนที่ `<your-github-username>`):

{% filename %}PythonAnywhere command-line{% endfilename %}

    $ pa_autoconfigure_django.py https://github.com/<your-github-username>/my-first-blog.git
    

As you watch that running, you'll be able to see what it's doing:

- Downloading your code from GitHub
- Creating a virtualenv on PythonAnywhere, just like the one on your own PC
- Updating your settings file with some deployment settings
- Setting up a database on PythonAnywhere using the `manage.py migrate` command
- Setting up your static files (we'll learn about these later)
- And configuring PythonAnywhere to serve your web app via its API

On PythonAnywhere all those steps are automated, but they're the same steps you would have to go through with any other server provider. The main thing to notice right now is that your database on PythonAnywhere is actually totally separate from your database on your own PC—that means it can have different posts and admin accounts.

As a result, just as we did on your own computer, we need to initialize the admin account with `createsuperuser`. PythonAnywhere has automatically activated your virtualenv for you, so all you need to do is run:

{% filename %}PythonAnywhere command-line{% endfilename %}

    (ola.pythonanywhere.com) $ python manage.py createsuperuser
    

Type in the details for your admin user. Best to use the same ones as you're using on your own computer to avoid any confusion, unless you want to make the password on PythonAnywhere more secure.

ตอนนี้ ถ้าคุณต้องการ คุณยังสามารถดูโค้ดของคุณได้ใน PythonAnywhere โดยใช้ `ls`:

{% filename %}PythonAnywhere command-line{% endfilename %}

    (ola.pythonanywhere.com) $ ls
    blog  db.sqlite3  manage.py  mysite requirements.txt static
    (ola.pythonanywhere.com) $ ls blog/
    __init__.py  __pycache__  admin.py  forms.py  migrations  models.py  static
    templates  tests.py  urls.py  views.py
    

You can also go to the "Files" tab and navigate around using PythonAnywhere's built-in file browser.

## คุณกำลังออนไลน์แล้วนะตอนนี้!

Your site should now be live on the public Internet! Click through to the PythonAnywhere "Web" tab to get a link to it. You can share this with anyone you want :)

> **Note** This is a beginners' tutorial, and in deploying this site we've taken a few shortcuts which aren't ideal from a security point of view. If and when you decide to build on this project, or start a new project, you should review the [Django deployment checklist](https://docs.djangoproject.com/en/2.0/howto/deployment/checklist/) for some tips on securing your site.

## เคล็ดลับในการ Debugging

If you see an error while running the `pa_autoconfigure_django.py` script, here are a few common causes:

- Forgetting to create your PythonAnywhere API token.
- Making a mistake in your GitHub URL
- If you see an error saying *"Could not find your settings.py"*, it's probably because you didn't manage to add all your files to Git, and/or you didn't push them up to GitHub successfully. Have another look at the Git section above

ถ้าคุณเห็นข้อผิดพลาดเกิดขึ้นเมื่อคุณเข้าดูหน้าเว็บ ที่แรกที่คุณควรตรวจสอบก็คือใน **error log** คุณจะเห็นลิงค์นี้บน แท็บ [Web tab](https://www.pythonanywhere.com/web_app_setup/) ใน PythonAnywhere ลองหาดูว่ามันมีข้อความแสดงข้อผิดพลาดในนั้นมั้ย โดยข้อผิดพลาดล่าสุดจะปรากฎอยู่ด้านล่าง

There are also some [general debugging tips on the PythonAnywhere help site](http://help.pythonanywhere.com/pages/DebuggingImportError).

และอย่าลืม โค้ชของคุณอยู่ที่นี่เพื่อมาช่วยคุณนะ!

# มาดูเว๊บไซต์ของคุณกัน!

หน้าเริ่มต้นสำหรับเว็บไซต์ของคุณควรจะโชว์ "It worked!" แบบเดียวกับที่โชว์อยู่บนเครื่องคอมพิวเตอร์ของคุณ ลองเพิ่ม `/admin/` ต่อท้าย URL แล้วคุณจะได้หน้าเพจ admin ของคุณ เข้าระบบด้วย username และ password และคุณจะสามารถเพิ่มโพสต์ใหม่บนเซิร์ฟเวอร์ได้

Once you have a few posts created, you can go back to your local setup (not PythonAnywhere). From here you should work on your local setup to make changes. This is a common workflow in web development – make changes locally, push those changes to GitHub, and pull your changes down to your live Web server. This allows you to work and experiment without breaking your live Web site. มันเจ๋งใช่มะ?

Give yourself a *HUGE* pat on the back! การนำเว็บขึ้นบนเซิร์ฟเวอร์นั้นเป็นขั้นตอนที่ยุ่งยากในการพัฒนาเว็บไซต์ และคนส่วนมากใช้เวลาสองสามวันกว่าจะทำให้มันทำงานได้ แต่คุณมีเว็บไซต์ที่พร้อมใช้ บนอินเตอร์เน็ตจริงๆแล้วตอนนี้!