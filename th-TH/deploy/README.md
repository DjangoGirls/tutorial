# Deploy!

> **หมายเหตุ** บทนี้อาจจะไม่ง่ายนักที่จะผ่านไปได้ ขอให้อดทนและทำให้เสร็จ; deployment เป็นส่วนสำคัญในกระบวนการพัฒนาเว็บไซต์ บทนี้อยู่ในครึ่งทางของบทเรียนทั้งหมด ดังนั้นผู้ช่วยของคุณจะพาคุณนำเว็บไซต์ออนไลน์โดยจะมีขั้นตอนยุ่งยากเล็กน้อย ซึ่งหมายความว่า ถึงคุณมีเวลาไม่พอ ก็จะยังสามารถจบบทนี้ได้แน่นอน

จนถึงตอนนี้คุณสามารถเปิดดูเว็บไซต์ของคุณจากคอมพิวเตอร์ของคุณเท่านั้น Now you will learn how to deploy it! Deploying คือกระบวนการเผยแพร่โปรแกรมของคุณขึ้นสู่อินเทอร์เน็ต สุดท้ายแล้ว ทุกคนก็จะสามารถเห็นเว็บของคุณได. :)

อย่างที่คุณได้ทราบ เว็บไซต์นั้นอาศัยอยู่ในเครื่องเซิร์ฟเวอร์ มันมีผู้ให้บริการเซิร์ฟเวอร์จำนวนมากบนอินเทอร์เน็ต แต่เราจะใช้ [PythonAnywhere](https://www.pythonanywhere.com/) PythonAnywhere นั้นฟรีสำหรับแอปพลิเคชันขนาดเล็กที่มีผู้เข้าชมมีจำนวนไม่มาก ดังนั้นมันจึงเพียงพอสำหรับคุณในตอนนี้

มีบริการภายอื่นที่เราจะใช้เช่นกัน คือ [GitHub](https://www.github.com) ซึ่งเป็นบริการที่เก็บโค้ดของเรา จริงๆ ก็มีบริการจากที่อื่นเช่นกัน แต่โปรแกรมเมอร์เกือบทุกคนในตอนนี้มีบัญชี GitHub และคุณก็กำลังจะมีด้วยเช่นกัน!

These three places will be important to you. เครื่องคอมพิวเตอร์ของคุณจะเป็นที่ที่คุณพัฒนาและทดสอบ เมื่อคุณพอใจกับการเปลี่ยนแปลงแล้ว คุณจะทำสำเนาโปรแกรมของคุณไว้ใน GitHub เว็บไซต์ของคุณจะอยู่ใน PythonAnywhere และคุณจะอัพเดตมันได้ โดยคุณจะได้รับสำเนาของโค้ดของคุณจาก GitHub

# Git

> **Note** If you already did the [installation steps](../installation/README.md), there's no need to do this again – you can skip to the next section and start creating your Git repository.

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

    # Python
    *.pyc
    *~
    __pycache__
    
    # Env
    .env
    myvenv/
    venv/
    
    # Database
    db.sqlite3
    
    # Static folder
    static/
    
    # macOS
    ._*
    .DS_Store
    .fseventsd
    .Spotlight-V100
    
    # Windows
    Thumbs.db*
    ehthumbs*.db
    [Dd]esktop.ini
    $RECYCLE.BIN/
    
    # Visual Studio
    .vscode/
    .history/
    *.code-workspace
    

จากนั้นจึงบันทึกไฟล์โดยใช้ชื่อว่า `.gitignore` ที่อยู่ในโฟลเดอร์ "djangogirls"

> **หมายเหตุ** เครื่องหมายจุดที่อยู่หน้าชื่อไฟล์นั้นสำคัญมาก! ถ้าคุณมีปัญหาในการสร้างไฟล์นี้ (เช่น Mac ไม่ชอบให้คุณสร้างไฟล์ที่เริ่มต้นด้วยเครื่องหมายจุดใน Finder) ดังนั้น คุณควรใช้ "Save As" จากตัวแก้ไขไฟล์แทน And be sure not to add `.txt`, `.py`, or any other extension to the file name -- it will only be recognized by Git if the name is just `.gitignore`. Linux and MacOS treat files with a name that starts with `.` (such as `.gitignore`) as hidden and the normal `ls` command won't show these files. Instead use `ls -a` to see the `.gitignore` file.
> 
> **Note** One of the files you specified in your `.gitignore` file is `db.sqlite3`. That file is your local database, where all of your users and posts are stored. We'll follow standard web programming practice, meaning that we'll use separate databases for your local testing site and your live website on PythonAnywhere. The PythonAnywhere database could be SQLite, like your development machine, but usually you will use one called MySQL which can deal with a lot more site visitors than SQLite. Either way, by ignoring your SQLite database for the GitHub copy, it means that all of the posts and superuser you created so far are going to only be available locally, and you'll have to create new ones on production. You should think of your local database as a good playground where you can test different things and not be afraid that you're going to delete your real posts from your blog.

ควรใช้คำสั่ง `git status` ก่อนที่จะใช้คำสั่ง `git add` หรือเมื่อใดก็ตามที่คุณไม่แน่ใจว่า มีการเปลี่ยนแปลงอะไรไปบ้าง วิธีนี้จะช่วยให้คุณไม่เจอเหตุการณ์แปลกๆ เช่น คุณเพิ่มไฟล์ผิดไฟล์ หรือยืนยันการบันทึกไฟล์ผิดไฟล์ คำสั่ง `git status` จะบอกข้อมูลเกี่ยวกับสถานะของไฟล์ที่ ไม่ได้ติดตาม/มีการแก้ไข/พร้อมบันทึกการแก้ไข และสถานะอื่นๆ ผลลัพธ์ควรมีหน้าตาเหมือนอย่างด้านล่างนี้:

{% filename %}command-line{% endfilename %}

    $ git status
    On branch master
    
    No commits yet
    
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

    $ git add .
    $ git commit -m "My Django Girls app, first commit"
     [...]
     13 files changed, 200 insertions(+)
     create mode 100644 .gitignore
     [...]
     create mode 100644 mysite/wsgi.py
    

## การส่งโค้ดของเราไปยัง GitHub

Go to [GitHub.com](https://www.github.com) and sign up for a new, free user account. (If you already did that in the workshop prep, that is great!) Be sure to remember your password (add it to your password manager, if you use one).

จากนั้นจึงสร้าง repository ใหม่ โดยใช้ชื่อว่า "my-first-blog" ยังไม่ต้องติ๊กที่ "initialise with a README" และไม่ต้องทำอะไรกับตัวเลือก .gitignore (เราทำไปแล้ว) และไม่ต้องแก้ไข License

![](images/new_github_repo.png)

> **หมายเหตุ** ชื่อ `my-first-blog` นั้นสำคัญ - คุณสามารถใช้ชื่ออื่นได้ แต่ชื่อนี้จะปรากฎตลอดทั้งหน้านี้ และคุณจำเป็นต้องเปลี่ยนชื่อตามทุกครั้ง It's probably easier to stick with the name `my-first-blog`.

On the next screen, you'll be shown your repo's clone URL, which you will use in some of the commands that follow:

![](images/github_get_repo_url_screenshot.png)

ตอนนี้เราจะทำการชี้ Git repository บนคอมพิวเตอร์ของเราไปยัง GitHub

Type the following into your console (replace `<your-github-username>` with the username you entered when you created your GitHub account, but without the angle-brackets -- the URL should match the clone URL you just saw):

{% filename %}command-line{% endfilename %}

    $ git remote add origin https://github.com/<your-github-username>/my-first-blog.git
    $ git push -u origin master
    

When you push to GitHub, you'll be asked for your GitHub username and password (either right there in the command-line window or in a pop-up window), and after entering credentials you should see something like this:

{% filename %}command-line{% endfilename %}

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

    $ pip3.8 install --user pythonanywhere
    

That should print out some things like `Collecting pythonanywhere`, and eventually end with a line saying `Successfully installed (...) pythonanywhere- (...)`.

Now we run the helper to automatically configure our app from GitHub. Type the following into the console on PythonAnywhere (don't forget to use your GitHub username in place of `<your-github-username>`, so that the URL matches the clone URL from GitHub):

{% filename %}PythonAnywhere command-line{% endfilename %}

    $ pa_autoconfigure_django.py --python=3.8 https://github.com/<your-github-username>/my-first-blog.git
    

As you watch that running, you'll be able to see what it's doing:

- Downloading your code from GitHub
- Creating a virtualenv on PythonAnywhere, just like the one on your own computer
- Updating your settings file with some deployment settings
- Setting up a database on PythonAnywhere using the `manage.py migrate` command
- Setting up your static files (we'll learn about these later)
- And configuring PythonAnywhere to serve your web app via its API

On PythonAnywhere all those steps are automated, but they're the same steps you would have to go through with any other server provider.

The main thing to notice right now is that your database on PythonAnywhere is actually totally separate from your database on your own computer, so it can have different posts and admin accounts. As a result, just as we did on your own computer, we need to initialize the admin account with `createsuperuser`. PythonAnywhere has automatically activated your virtualenv for you, so all you need to do is run:

{% filename %}PythonAnywhere command-line{% endfilename %}

    (ola.pythonanywhere.com) $ python manage.py createsuperuser
    

Type in the details for your admin user. Best to use the same ones as you're using on your own computer to avoid any confusion, unless you want to make the password on PythonAnywhere more secure.

ตอนนี้ ถ้าคุณต้องการ คุณยังสามารถดูโค้ดของคุณได้ใน PythonAnywhere โดยใช้ `ls`:

{% filename %}PythonAnywhere command-line{% endfilename %}

    (ola.pythonanywhere.com) $ ls
    blog  db.sqlite3  manage.py  mysite requirements.txt static
    (ola.pythonanywhere.com) $ ls blog/
    __init__.py  __pycache__  admin.py  apps.py  migrations  models.py
    tests.py  views.py
    

You can also go to the "Files" page and navigate around using PythonAnywhere's built-in file browser. (From the Console page, you can get to other PythonAnywhere pages from the menu button in the upper right corner. Once you're on one of the pages, there are links to the other ones near the top.)

## คุณกำลังออนไลน์แล้วนะตอนนี้!

Your site should now be live on the public Internet! Click through to the PythonAnywhere "Web" page to get a link to it. You can share this with anyone you want. :)

> **Note** This is a beginners' tutorial, and in deploying this site we've taken a few shortcuts which aren't ideal from a security point of view. If and when you decide to build on this project, or start a new project, you should review the [Django deployment checklist](https://docs.djangoproject.com/en/2.2/howto/deployment/checklist/) for some tips on securing your site.

## เคล็ดลับในการ Debugging

If you see an error while running the `pa_autoconfigure_django.py` script, here are a few common causes:

- Forgetting to create your PythonAnywhere API token.
- Making a mistake in your GitHub URL
- If you see an error saying *"Could not find your settings.py"*, it's probably because you didn't manage to add all your files to Git, and/or you didn't push them up to GitHub successfully. Have another look at the Git section above
- If you previously signed up for a PythonAnywhere account and had an error with collectstatic, you probably have an older version of SQLite (eg 3.8.2) for your account. In that case, sign up for a new account and try the commands in the PythonAnywhere section above.

ถ้าคุณเห็นข้อผิดพลาดเกิดขึ้นเมื่อคุณเข้าดูหน้าเว็บ ที่แรกที่คุณควรตรวจสอบก็คือใน **error log** You'll find a link to this on the PythonAnywhere ["Web" page](https://www.pythonanywhere.com/web_app_setup/). ลองหาดูว่ามันมีข้อความแสดงข้อผิดพลาดในนั้นมั้ย โดยข้อผิดพลาดล่าสุดจะปรากฎอยู่ด้านล่าง

There are also some [general debugging tips on the PythonAnywhere help site](http://help.pythonanywhere.com/pages/DebuggingImportError).

และอย่าลืม โค้ชของคุณอยู่ที่นี่เพื่อมาช่วยคุณนะ!

# มาดูเว๊บไซต์ของคุณกัน!

หน้าเริ่มต้นสำหรับเว็บไซต์ของคุณควรจะโชว์ "It worked!" แบบเดียวกับที่โชว์อยู่บนเครื่องคอมพิวเตอร์ของคุณ ลองเพิ่ม `/admin/` ต่อท้าย URL แล้วคุณจะได้หน้าเพจ admin ของคุณ Log in with the username and password, and you'll see you can add new Posts on the server -- remember, the posts from your local test database were not sent to your live blog.

Once you have a few posts created, you can go back to your local setup (not PythonAnywhere). From here you should work on your local setup to make changes. This is a common workflow in web development – make changes locally, push those changes to GitHub, and pull your changes down to your live Web server. This allows you to work and experiment without breaking your live Web site. มันเจ๋งใช่มะ?

ให้รางวัล *ใหญ่* กับตัวคุณเองหน่อย! การนำเว็บขึ้นบนเซิร์ฟเวอร์นั้นเป็นขั้นตอนที่ยุ่งยากในการพัฒนาเว็บไซต์ และคนส่วนมากใช้เวลาสองสามวันกว่าจะทำให้มันทำงานได้ But you've got your site live, on the real Internet!