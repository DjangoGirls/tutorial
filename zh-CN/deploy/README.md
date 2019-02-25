# 部署！

> **注** 这一章可以有时有点难打通。 坚持并完成它 ；部署是在网站开发过程的重要组成部分。 这一章放在本教程的中部，因此你的指导者可以帮助你在使网站上线中的一些小困难。 这意味着如果您花大量的时间，你仍然能独立完成这个教程。

Until now, your website was only available on your computer. Now you will learn how to deploy it! 部署是在互联网上发布你的应用程序的一系列过程，因此人们最终可以一起去看看你的应用程序. :)

正如你所学习的，一个网站必须要放到一个服务器上。 There are a lot of server providers available on the internet, we're going to use [PythonAnywhere](https://www.pythonanywhere.com/). PythonAnywhere is free for small applications that don't have too many visitors so it'll definitely be enough for you now.

其它我们将使用到的外部服务是[GitHub](https://www.github.com)，它是一个代码托管服务。 还有其它的一些服务，但当今几乎所有的程序员都有 GitHub 帐户，并且现在你也会有的！

These three places will be important to you. Your local computer will be the place where you do development and testing. When you're happy with the changes, you will place a copy of your program on GitHub. Your website will be on PythonAnywhere and you will update it by getting a new copy of your code from GitHub.

# Git

> **Note** If you already did the Installation steps, there's no need to do this again – you can skip to the next section and start creating your Git repository.

{% include "/deploy/install_git.md" %}

## 开始我们自己的Git版本库

Git跟踪一组特定的在代码仓库（或简称“仓库”）中文件的更改。 我们开始用git管理自己的项目吧。 打开你的终端，进入 `djangogirls` 文件夹运行以下的命令：

> **Note** Check your current working directory with a `pwd` (Mac OS X/Linux) or `cd` (Windows) command before initializing the repository. 你应该是在 `djangogirls` 文件夹下运行命令。

{% filename %}command-line{% endfilename %}

    $ git init
    Initialized empty Git repository in ~/djangogirls/.git/
    $ git config --global user.name "Your Name"
    $ git config --global user.email you@example.com
    

Initializing the git repository is something we need to do only once per project (and you won't have to re-enter the username and email ever again).

Git会追踪这个目录下所有文件和文件夹的更改，但是有一些文件我们希望Git忽略它。 为此，我们可以在系统根目录下创建一个命名为 `.gitignore` 的文件。 打开编辑器，创建新文件并写入以下内容：

{% filename %}.gitignore{% endfilename %}

    *.pyc
    *~
    __pycache__
    myvenv
    db.sqlite3
    /static
    .DS_Store
    

And save it as `.gitignore` in the "djangogirls" folder.

> **注意** 在文件名最前面的"."很重要。 If you're having any difficulty creating it (Macs don't like you to create files that begin with a dot via the Finder, for example), then use the "Save As" feature in your editor; it's bulletproof. And be sure not to add `.txt`, `.py`, or any other extension to the file name -- it will only be recognized by Git if the name is just `.gitignore`.
> 
> **Note** One of the files you specified in your `.gitignore` file is `db.sqlite3`. That file is your local database, where all of your users and posts are stored. We'll follow standard web programming practice, meaning that we'll use separate databases for your local testing site and your live website on PythonAnywhere. The PythonAnywhere database could be SQLite, like your development machine, but usually you will use one called MySQL which can deal with a lot more site visitors than SQLite. Either way, by ignoring your SQLite database for the GitHub copy, it means that all of the posts and superuser you created so far are going to only be available locally, and you'll have to create new ones on production. You should think of your local database as a good playground where you can test different things and not be afraid that you're going to delete your real posts from your blog.

在执行git操作之前，最好使用 `git status` 命令查看一下当前的状态，尤其是在执行 `git add`或者在你不确定哪些文件被改动的情况下。 This will help prevent any surprises from happening, such as wrong files being added or committed. The `git status` command returns information about any untracked/modified/staged files, the branch status, and much more. The output should be similar to the following:

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
    

最后保存我们的更改。转到你的控制台并运行这些命令：

{% filename %}command-line{% endfilename %}

    $ git add --all .
    $ git commit -m "My Django Girls app, first commit"
     [...]
     13 files changed, 200 insertions(+)
     create mode 100644 .gitignore
     [...]
     create mode 100644 mysite/wsgi.py
    

## Pushing your code to GitHub

Go to [GitHub.com](https://www.github.com) and sign up for a new, free user account. (If you already did that in the workshop prep, that is great!) Be sure to remember your password (add it to your password manager, if you use one).

Then, create a new repository, giving it the name "my-first-blog". Leave the "initialize with a README" checkbox unchecked, leave the .gitignore option blank (we've done that manually) and leave the License as None.

![](images/new_github_repo.png)

> **Note** The name `my-first-blog` is important – you could choose something else, but it's going to occur lots of times in the instructions below, and you'd have to substitute it each time. It's probably easier to stick with the name `my-first-blog`.

On the next screen, you'll be shown your repo's clone URL, which you will use in some of the commands that follow:

![](images/github_get_repo_url_screenshot.png)

Now we need to hook up the Git repository on your computer to the one up on GitHub.

Type the following into your console (replace `<your-github-username>` with the username you entered when you created your GitHub account, but without the angle-brackets -- the URL should match the clone URL you just saw):

{% filename %}command-line{% endfilename %}

    $ git remote add origin https://github.com/<your-github-username>/my-first-blog.git
    $ git push -u origin master
    

When you push to GitHub, you'll be asked for your GitHub username and password (either right there in the command-line window or in a pop-up window), and after entering credentials you should see something like this:

{% filename %}command-line{% endfilename %}

    计数对象：6, 完成。
    Writing objects: 100% (6/6), 200 bytes | 0 bytes/s, done.
    Total 3 (delta 0), reused 0 (delta 0)
    To https://github.com/ola/my-first-blog.git
    
     * [new branch]      master -> master
    Branch master set up to track remote branch master from origin.
    

<!--TODO: maybe do ssh keys installs in install party, and point ppl who dont have it to an extension -->

现在你的代码已经在GitHub上了。 快去确认一下吧！ 你会发现这是一个很好的平台-[Django](https://github.com/django/django), the [Django Girls Tutorial](https://github.com/DjangoGirls/tutorial)，还有很多其他非常棒的开源软件项目也将他们的代码放在GitHub上。 :)

# 在 PythonAnywhere 设置我们的博客

## 注册一个 PythonAnywher 帐户

> **Note**您可能已经在安装步骤的早期创建了 pythonanywhere 帐户-如果是的话, 则无需重复。

{% include "/deploy/signup_pythonanywhere.md" %}

## 在 pythonanywhere 配置我们的网站

点击图标回到 [PythonAnywhere 主控制面板](https://www.pythonanywhere.com/) ，然后选着启动 "Bash" 控制台的选项-即PythonAnywhere版本的命令行，就像你的计算机的命令行一样。

![在 PythonAnywher 网页界面上 '新建控制台' 部分，按钮为 'bash'](images/pythonanywhere_bash_console.png)

> **注意** PythonAnywhere 基于 Linux系统，因此如果你使用 Windows系统，控制台将会和你本地电脑上的略有不同。

在 pythonanywhere 上部署 web 应用程序涉及从 github 中提取代码, 然后配置 pythonanywhere 以识别它并开始将其作为 web 应用程序提供。 There are manual ways of doing it, but PythonAnywhere provides a helper tool that will do it all for you. Let's install it first:

{% filename %}PythonAnywhere command-line{% endfilename %}

    $ pip3.6 install --user pythonanywhere
    

That should print out some things like `Collecting pythonanywhere`, and eventually end with a line saying `Successfully installed (...) pythonanywhere- (...)`.

Now we run the helper to automatically configure our app from GitHub. Type the following into the console on PythonAnywhere (don't forget to use your GitHub username in place of `<your-github-username>`, so that the URL matches the clone URL from GitHub):

{% filename %}PythonAnywhere command-line{% endfilename %}

    $ pa_autoconfigure_django.py https://github.com/<your-github-username>/my-first-blog.git
    

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

Now, if you like, you can also take a look at your code on PythonAnywhere using `ls`:

{% filename %}PythonAnywhere command-line{% endfilename %}

    (ola.pythonanywhere.com) $ ls
    blog  db.sqlite3  manage.py  mysite requirements.txt static
    (ola.pythonanywhere.com) $ ls blog/
    __init__.py  __pycache__  admin.py  apps.py  migrations  models.py
    tests.py  views.py
    

You can also go to the "Files" page and navigate around using PythonAnywhere's built-in file browser. (From the Console page, you can get to other PythonAnywhere pages from the menu button in the upper right corner. Once you're on one of the pages, there are links to the other ones near the top.)

## You are now live!

Your site should now be live on the public Internet! Click through to the PythonAnywhere "Web" page to get a link to it. You can share this with anyone you want :)

> **Note** This is a beginners' tutorial, and in deploying this site we've taken a few shortcuts which aren't ideal from a security point of view. If and when you decide to build on this project, or start a new project, you should review the [Django deployment checklist](https://docs.djangoproject.com/en/2.0/howto/deployment/checklist/) for some tips on securing your site.

## Debugging tips

If you see an error while running the `pa_autoconfigure_django.py` script, here are a few common causes:

- Forgetting to create your PythonAnywhere API token.
- Making a mistake in your GitHub URL
- If you see an error saying *"Could not find your settings.py"*, it's probably because you didn't manage to add all your files to Git, and/or you didn't push them up to GitHub successfully. Have another look at the Git section above

If you see an error when you try to visit your site, the first place to look for some debugging info is in your **error log**. You'll find a link to this on the PythonAnywhere ["Web" page](https://www.pythonanywhere.com/web_app_setup/). See if there are any error messages in there; the most recent ones are at the bottom.

There are also some [general debugging tips on the PythonAnywhere help site](http://help.pythonanywhere.com/pages/DebuggingImportError).

And remember, your coach is here to help!

# Check out your site!

The default page for your site should say "It worked!", just like it does on your local computer. Try adding `/admin/` to the end of the URL, and you'll be taken to the admin site. Log in with the username and password, and you'll see you can add new Posts on the server -- remember, the posts from your local test database were not sent to your live blog.

Once you have a few posts created, you can go back to your local setup (not PythonAnywhere). From here you should work on your local setup to make changes. This is a common workflow in web development – make changes locally, push those changes to GitHub, and pull your changes down to your live Web server. This allows you to work and experiment without breaking your live Web site. Pretty cool, huh?

Give yourself a *HUGE* pat on the back! Server deployments are one of the trickiest parts of web development and it often takes people several days before they get them working. But you've got your site live, on the real Internet!