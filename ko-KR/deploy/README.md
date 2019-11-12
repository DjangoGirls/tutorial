# 배포하기!

> **참고**: 이번 장은 따라오기 조금 힘들 수도 있어요. 끝까지 따라와주세요. 배포는 웹사이트 개발의 가장 중요한 부분이에요. 튜토리얼 중간에 이번 장이 있는 이유는 여러분이 코치가 웹사이트를 온라인에서 볼 수 있게 도와주기 위해서에요. 시간이 모자르더라도 튜토리얼을 끝낼 수 있어요.

지금까지는 웹사이트를 내 컴퓨터에서만 볼 수 있었어요. 이제 어떻게 웹사이트를 배포하는지 배워봅시다. 배포(deploy) 는 애플리케이션을 인터넷에 올려놓아 다른 사람들도 볼 수 있게 해주는 것 말해요. :)

앞에서 배웠듯이, 웹사이트는 서버라는 곳에 들어가요. There are a lot of server providers available on the internet, we're going to use [PythonAnywhere](https://www.pythonanywhere.com/). PythonAnywhere is free for small applications that don't have too many visitors so it'll definitely be enough for you now.

우리가 사용할 다른 서비스는 [GitHub](https://www.github.com)라는 코드 호스팅 서비스입니다. 프로그래머들이 애용하는 곳들 중 하나로 대부분의 모든 프로그래머가 GitHub 계정을 가지고 있다고 봐도 될 거예요. 이제 여러분도 하나 만들 때가 되었어요!

이 세 가지는 매우 중요합니다. 로컬 컴퓨터에서는 개발 및 테스트를 수행할 거에요. 원하는 결과물을 얻게 되었다면, 그대로 GitHub에 복사본을 올려둘 거에요. PythonAnywhere에 웹 사이트가 올려질 거고, GitHub에서 새로운 복사본을 가져와 업데이트 될 거에요.

# Git

> **Note** If you already did the Installation steps, there's no need to do this again – you can skip to the next section and start creating your Git repository.

{% include "/deploy/install_git.md" %}

## Git 저장소(repository) 만들기

Git은 코드 저장소(줄여서 "repo"라고 합니다.)에 특정한 파일들 집합의 변화를 추적하여 관리합니다. 이제 프로젝트를 시작해볼까요? 콘솔창을 열어서 `djangogirls` 디렉토리에서 아래 명령어들을 실행하세요. 아래 명령 중에서 Your Name 대신 여러분의 이름을, you@example.com 대신에 여러분의 이메일 주소를 입력하세요.

> **Note** Check your current working directory with a `pwd` (Mac OS X/Linux) or `cd` (Windows) command before initializing the repository. 반드시 `djangogirls` 폴더에서 해야합니다.

{% filename %}command-line{% endfilename %}

    $ git init
    Initialized empty Git repository in ~/djangogirls/.git/
    $ git config --global user.name "Your Name"
    $ git config --global user.email you@example.com
    

Initializing the git repository is something we need to do only once per project (and you won't have to re-enter the username and email ever again).

Git은 이 디렉토리에 모든 파일들과 폴더들의 변경점을 추적할 거에요. 무시(ignore) 하도록 지정한 파일들을 제외하고는 말이죠. 기본 디렉토리에다 `.gitignore`라는 파일을 만들어서 특정 파일이나 폴더를 추적하지 않도록 할 수 있습니다. 에디터를 열어서 아래 내용을 넣어주세요:

{% filename %}.gitignore{% endfilename %}

    *.pyc
    *~
    /.vscode
    __pycache__
    myvenv
    db.sqlite3
    /static
    .DS_Store
    

"djangogirls"폴더에 `.gitignore`파일을 저장하세요.

> **주의**: 파일명 앞에 마침표로 시작하는 것이 중요합니다! 꼭 붙여주세요. If you're having any difficulty creating it (Macs don't like you to create files that begin with a dot via the Finder, for example), then use the "Save As" feature in your editor; it's bulletproof. And be sure not to add `.txt`, `.py`, or any other extension to the file name -- it will only be recognized by Git if the name is just `.gitignore`.
> 
> Note .gitignore 파일에 있는 db.sqlite3이라는 파일은 모든 게시물이 저장된 로컬 데이터베이스입니다. 로컬 테스트 사이트와 PythonAnywhere에서 실제 서비스되는 웹사이트는 분리된 데이터베이스를 사용할 것이다. 이것이 표준 웹 개발 방법이다. 다른 데이터베이스로는 SQLite로도 사용하지만 보통은 SQLite보다 훨씬 많은 방문자를 보유한 웹사이트일 경우 MySQL을 사용합니다. GitHub 저장소에 SQLite 데이터베이스를 제외하고 저장하면, 지금까지 작성한 모든 게시물을 로컬에서만 사용할 수 있으므로 실제 운영하는 프로덕션 환경에서는 다시 새 데이터베이스를 추가해야합니다. 로컬 데이터베이스를 놀이터처럼 생각하고 이것저것 테스트해보세요. 실제 블로그 내 게시글이 삭제되지 않으니 걱정하지 마세요.

`git add`하기 전이나 변경된 것이 있는지 잘 모를 때마다 `git status` 명령어를 사용하는 것은 좋은 방법이에요. This will help prevent any surprises from happening, such as wrong files being added or committed. The `git status` command returns information about any untracked/modified/staged files, the branch status, and much more. The output should be similar to the following:

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
    

자 이제 우리가 만든 코드들을 저장소에 넣어봅시다. 콘솔창에 가서 다음 명령어를 실행하세요:

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

    Counting objects: 6, done.
    Writing objects: 100% (6/6), 200 bytes | 0 bytes/s, done.
    Total 3 (delta 0), reused 0 (delta 0)
    To https://github.com/ola/my-first-blog.git
    
     * [new branch]      master -> master
    Branch master set up to track remote branch master from origin.
    

<!--TODO: maybe do ssh keys installs in install party, and point ppl who dont have it to an extension -->

Your code is now on GitHub. Go and check it out! You'll find it's in fine company – [Django](https://github.com/django/django), the [Django Girls Tutorial](https://github.com/DjangoGirls/tutorial), and many other great open source software projects also host their code on GitHub. :)

# Setting up our blog on PythonAnywhere

## Sign up for a PythonAnywhere account

> **Note** You might have already created a PythonAnywhere account earlier during the install steps – if so, no need to do it again.

{% include "/deploy/signup_pythonanywhere.md" %}

## Configuring our site on PythonAnywhere

Go back to the main [PythonAnywhere Dashboard](https://www.pythonanywhere.com/) by clicking on the logo, and choose the option to start a "Bash" console – that's the PythonAnywhere version of a command line, just like the one on your computer.

![The 'New Console' section on the PythonAnywhere web interface, with a button for 'bash'](images/pythonanywhere_bash_console.png)

> **Note** PythonAnywhere is based on Linux, so if you're on Windows, the console will look a little different from the one on your computer.

Deploying a web app on PythonAnywhere involves pulling down your code from GitHub, and then configuring PythonAnywhere to recognise it and start serving it as a web application. There are manual ways of doing it, but PythonAnywhere provides a helper tool that will do it all for you. Let's install it first:

{% filename %}PythonAnywhere command-line{% endfilename %}

    $ pip3.6 install --user pythonanywhere
    

That should print out some things like `Collecting pythonanywhere`, and eventually end with a line saying `Successfully installed (...) pythonanywhere- (...)`.

Now we run the helper to automatically configure our app from GitHub. Type the following into the console on PythonAnywhere (don't forget to use your GitHub username in place of `<your-github-username>`, so that the URL matches the clone URL from GitHub):

{% filename %}PythonAnywhere command-line{% endfilename %}

    $ pa_autoconfigure_django.py --python=3.6 https://github.com/<your-github-username>/my-first-blog.git
    

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

> **Note** This is a beginners' tutorial, and in deploying this site we've taken a few shortcuts which aren't ideal from a security point of view. If and when you decide to build on this project, or start a new project, you should review the [Django deployment checklist](https://docs.djangoproject.com/en/2.2/howto/deployment/checklist/) for some tips on securing your site.

## Debugging tips

If you see an error while running the `pa_autoconfigure_django.py` script, here are a few common causes:

- Forgetting to create your PythonAnywhere API token.
- Making a mistake in your GitHub URL
- If you see an error saying *"Could not find your settings.py"*, it's probably because you didn't manage to add all your files to Git, and/or you didn't push them up to GitHub successfully. Have another look at the Git section above
- If you previously signed up for a PythonAnywhere account and had an error with collectstatic, you probably have an older version of SQLite (eg 3.8.2) for your account. In that case, sign up for a new account and try the commands in the PythonAnywhere section above.

If you see an error when you try to visit your site, the first place to look for some debugging info is in your **error log**. You'll find a link to this on the PythonAnywhere ["Web" page](https://www.pythonanywhere.com/web_app_setup/). See if there are any error messages in there; the most recent ones are at the bottom.

There are also some [general debugging tips on the PythonAnywhere help site](http://help.pythonanywhere.com/pages/DebuggingImportError).

And remember, your coach is here to help!

# Check out your site!

The default page for your site should say "It worked!", just like it does on your local computer. Try adding `/admin/` to the end of the URL, and you'll be taken to the admin site. Log in with the username and password, and you'll see you can add new Posts on the server -- remember, the posts from your local test database were not sent to your live blog.

Once you have a few posts created, you can go back to your local setup (not PythonAnywhere). From here you should work on your local setup to make changes. This is a common workflow in web development – make changes locally, push those changes to GitHub, and pull your changes down to your live Web server. This allows you to work and experiment without breaking your live Web site. Pretty cool, huh?

Give yourself a *HUGE* pat on the back! Server deployments are one of the trickiest parts of web development and it often takes people several days before they get them working. But you've got your site live, on the real Internet!