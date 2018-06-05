# Deploy!

> **補足** このチャプターはちょっと難しいことが沢山書かれています。 頑張って最後までやりきってください。デプロイはウェブサイトを開発するプロセスの上で、とても重要な部分ですが、躓きやすいポイントも多く含まれています。 チュートリアルの途中にこのチャプターを入れています。そういった躓きやすい箇所はメンターに質問して、あなたが作っているウェブサイトをオンラインでみれるようにしてください。 言い換えれば、もし時間切れでワークショップ内でチュートリアルを終わらせることができなかったとしても、この後のチュートリアルはきっと自分で終わらせることができるでしょう。

今のところ、あなたが作ったサイトは、あなたのコンピューターでしかみることができません。 ここでは、デプロイの方法を学びましょう！ デプロイとは、あなたが作っているアプリケーションをインターネットで公開することです。あなた以外の人もウェブサイトを見ることができるようになりますよ. :)

これまでに学んだとおり、ウェブサイトはサーバーに置かれています。 インターネットで利用できる多くのサーバー プロバイダーがありますが、私達は [PythonAnywhere](https://www.pythonanywhere.com/) を使用します。 PythonAnywhere は、多くの人がアクセスするものではない小さいアプリケーションを無料で公開できますので今のあなたには最適でしょう。

使用するその他の外部サービスは [GitHub](https://www.github.com) コードのホスティング サービスです。 他にも色々ありますが、ほとんどのプログラマはGitHubのアカウントを持っています。そしてあなたも今そうなります。

これらの 3 つの場所はあなたに重要です。 ローカル コンピューターは、開発およびテストを行う場所になります。 変更に満足したら、GitHub 上で、プログラムのコピーを配置します。 あなたのウェブサイトは、PythonAnywhere になります、GitHub からコードの新しいコピーを取得することによって更新されます。

# Git

> **特徴：**もし、既にgitのインストールをやっている場合は再度行う必要はありません。-あなたは次のセクションにスキップしてあなたのGitリポジトリの作成を開始します。

{% include "deploy/install_git.md" %}

## Starting our Git repository

Gitはリポジトリ（または略して「レポ」）と呼ばれる特定のファイルに変更をセットし追跡します。 私たちのプロジェクトを開始しましょう。 あなたのコンソールを開き、`djangogirls` ディレクトリでこれらのコマンドを実行します。

> **備考：**リポジトリを初期化する前に `pwd` (OSX/Linux) または `cd` (Windows) コマンドで現在の作業ディレクトリを確認してください。 `Djangogirls` フォルダーにする必要があります。

{% filename %}command-line{% endfilename %}

    $ git init
    Initialized empty Git repository in ~/djangogirls/.git/
    $ git config --global user.name "Your Name"
    $ git config --global user.email you@example.com
    

gitリポジトリを初期化することは、プロジェクトごとに1回だけ行う必要があります（ユーザー名と電子メールをもう一度入力する必要はありません）。

Git のすべてのファイルおよびこのディレクトリ内のフォルダーの変更を追跡しますが、無視するいくつかのファイルがあります。 ベース ディレクトリの `.gitignore` という名前のファイルを作成することによってこれを行います。 あなたのエディターを開き、次の内容で新しいファイルを作成します。

{% filename %}.gitignore{% endfilename %}

    *.pyc
    *~
    __pycache__
    myvenv
    db.sqlite3
    /static
    .DS_Store
    

`.Gitignore` トップレベルの"djangogirls"フォルダーとして保存します。

> **備考：**ファイル名の先頭のドットは重要です! もしそのファイルを作るのが難しいなら、（Macをお使いの型はFinderからドット（ . ）で始まるファイルが作られていません。）そういう時はエディタでSave Asから作成すれば問題ありません。
> 
> `.gitignore </ code>ファイルで指定したファイルの1つが<code> db.sqlite3 </ code>です。 そのファイルはローカルデータベースで、すべての投稿が保存されます。 PythonAnywhere上のあなたのウェブサイトは別のデータベースを使用しているので、これをあなたのリポジトリには追加したくありません。  データベースは開発マシンのようにSQLiteにすることができますが、通常はSQLiteよりも多くのサイト訪問者に対処できるMySQLと呼ばれるものを使用します。 どちらの方法でも、SQLiteデータベースをGitHubのコピーとして無視することで、これまでに作成したすべての投稿はそのまま残し、ローカルでのみ利用できるようになりますが、プロダクションに再び追加する必要があります。 あなたは、あなたのブログの実際の投稿をあなたのブログから削除することを恐れることなく、さまざまなことをテストできる良い遊び場としてローカルデータベースを考えるべきです。</p>
</blockquote>

<p><code> git add </ code>をする前に、何が変更されたか確認するために、<code> git status </ code>コマンドを使用する事をおすすめします。 これは間違ったファイルを追加またはコミットなど思いもかけない事を止めるために役立ちます。 <code>Git status` コマンドは、untracked/modifed/staged filesおよび多くについての情報を返します。 出力は次のようになります。
> 
> {% filename %}command-line{% endfilename %}
> 
>     $ git status
>     On branch master
>     
>     Initial commit
>     
>     Untracked files:
>       (use "git add <file>..." to include in what will be committed)
>     
>             .gitignore
>             blog/
>             manage.py
>             mysite/
>     
>     nothing added to commit but untracked files present (use "git add" to track)
>     
> 
> 最終的に我々 は、変更内容を保存します。本体に移動し、これらのコマンドを実行します。
> 
> {% filename %}command-line{% endfilename %}
> 
>     $ git add --all .
>     $ git commit -m "My Django Girls app, first commit"
>      [...]
>      13 files changed, 200 insertions(+)
>      create mode 100644 .gitignore
>      [...]
>      create mode 100644 mysite/wsgi.py
>     
> 
> ## Pushing your code to GitHub
> 
> [ GitHub.com ](https://www.github.com)にアクセスし、新しい無料のユーザーアカウントを登録します。 （もしあなたがすでにワークショップの準備でそれをしていたら、それは素晴らしいことです！）
> 
> そして、新しいリポジトリに "my-first-blog"の名前で新しいリポジトリを作成します。 "READMEで初期化する"チェックボックスをオフのままにし、.gitignoreオプションを空白にして（手動で行っています）、ライセンスをNoneのままにしておきます。
> 
> ![](images/new_github_repo.png)
> 
> > **注</ strong> ` my-first-blog </ code>という名前は重要です。何か他のものを選択することもできますが、以下の手順では何度も繰り返す必要があります。他の名前を選択した場合は、 毎回それを置き換えてください。 できれば、<code>my-first-blog`の名前にしておきましょう。</p> </blockquote> 
> > 
> > 次の画面では、あなたの repo のクローンの URL が表示されます。"HTTPS"のバージョンを選択してコピーし端末にそれを貼り付けます。
> > 
> > ![](images/github_get_repo_url_screenshot.png)
> > 
> > GitHub上のGitリポジトリにコンピュータのGitリポジトリを接続する必要があります。
> > 
> > コンソールに次のように入力します（`＆lt; your-github-username＆gt; </ code>をGitHubアカウントの作成時に入力したユーザー名に置き換えます）。</p>

<p>{% filename %}command-line{% endfilename %}</p>

<pre><code>$ git remote add origin https://github.com/<your-github-username>/my-first-blog.git
$ git push -u origin master
`</pre> 
> > 
> > あなたのGitHubのユーザー名とパスワードを入力すると、次のように表示されます：
> > 
> > {% filename %}command-line{% endfilename %}
> > 
> >     Username for 'https://github.com': ola
> >     Password for 'https://ola@github.com':
> >     Counting objects: 6, done.
> >     Writing objects: 100% (6/6), 200 bytes | 0 bytes/s, done.
> >     Total 3 (delta 0), reused 0 (delta 0)
> >     To https://github.com/ola/my-first-blog.git
> >     
> >      * [new branch]      master -> master
> >     Branch master set up to track remote branch master from origin.
> >     
> > 
> > <!--TODO: maybe do ssh keys installs in install party, and point ppl who dont have it to an extension -->
> > 
> > コードは GitHub 上で公開されます。 それをチェックしにいってください。 これは、[ Django ](https://github.com/django/django)、<a href = "https://github.com/DjangoGirls/tutorial/にあります。 "> Django Girls Tutorial </a>などのオープンソースソフトウェアプロジェクトも、GitHubでコードをホストしています。 :)
> > 
> > # PythonAnywhereでブログを設定する
> > 
> > ## PythonAnywhere アカウントにサインアップする
> > 
> > > **備考：**あなたがすでにPythonAnywhereのアカウントを以前に作成しインストールの手順をふんでいたら、再びそれを行う必要はありません。
> > 
> > {% include "/deploy/signup_pythonanywhere.md" %}
> > 
> > ## PythonAnywhere でサイトを設定する
> > 
> > メインの[ PythonAnywhere Dashboard ](https://www.pythonanywhere.com/)のロゴをクリックし、「Bash」コンソールを起動するオプションを選択します。これがPythonAnywhereバージョンです あなたのコンピュータのコマンドラインと同じようなものです。
> > 
> > ![Pointing at Bash in the New Console section](images/pythonanywhere_bash_console.png)
> > 
> > > **備考：**PythonAnywhere は Linux に基づきますので、Windows の場合は、あなたのコンピュータ上で進行中のものと少し違って見えるでしょう。
> > 
> > PythonAnywhereにWebアプリケーションをデプロイするには、コードをGitHubからプルし、PythonAnywhereでそれを認識してWebアプリケーションとして提供するように設定する必要があります。 それを手動で行う方法もありますが、PythonAnywhereはそれをすべて行うヘルパーツールを提供しています。 まず、インストールしてみましょう。
> > 
> > {% filename %}PythonAnywhere command-line{% endfilename %}
> > 
> >     $ pip3.6 install --user pythonanywhere
> >     
> > 
> > ` pythonanywhereを収集する</ code>のようなものをいくつか出力し、最終的に<code> pythonanywhere-（...）</ code>をインストールしたという行で終わるはずです。</p>

<p> GitHub からアプリを自動的に構成するためのヘルパーを実行します。 Type the following into the console on PythonAnywhere (don't forget to use your GitHub username in place of <code><your-github-username>`):
> > 
> > {% filename %}PythonAnywhere command-line{% endfilename %}
> > 
> >     $ pa_autoconfigure_django.py https://github.com/<your-github-username>/my-first-blog.git
> >     
> > 
> > As you watch that running, you'll be able to see what it's doing:
> > 
> > - Downloading your code from GitHub
> > - Creating a virtualenv on PythonAnywhere, just like the one on your own PC
> > - Updating your settings file with some deployment settings
> > - Setting up a database on PythonAnywhere using the `manage.py migrate` command
> > - Setting up your static files (we'll learn about these later)
> > - And configuring PythonAnywhere to serve your web app via its API
> > 
> > On PythonAnywhere all those steps are automated, but they're the same steps you would have to go through with any other server provider. The main thing to notice right now is that your database on PythonAnywhere is actually totally separate from your database on your own PC—that means it can have different posts and admin accounts.
> > 
> > As a result, just as we did on your own computer, we need to initialize the admin account with `createsuperuser`. PythonAnywhere has automatically activated your virtualenv for you, so all you need to do is run:
> > 
> > {% filename %}PythonAnywhere command-line{% endfilename %}
> > 
> >     (ola.pythonanywhere.com) $ python manage.py createsuperuser
> >     
> > 
> > Type in the details for your admin user. Best to use the same ones as you're using on your own computer to avoid any confusion, unless you want to make the password on PythonAnywhere more secure.
> > 
> > Now, if you like, you can also take a look at your code on PythonAnywhere using `ls`:
> > 
> > {% filename %}PythonAnywhere command-line{% endfilename %}
> > 
> >     (ola.pythonanywhere.com) $ ls
> >     blog  db.sqlite3  manage.py  mysite  static
> >     (ola.pythonanywhere.com) $ ls blog/
> >     __init__.py  __pycache__  admin.py  forms.py  migrations  models.py  static
> >     templates  tests.py  urls.py  views.py
> >     
> > 
> > You can also go to the "Files" tab and navigate around using PythonAnywhere's built-in file browser.
> > 
> > ## You are now live!
> > 
> > Your site should now be live on the public Internet! Click through to the PythonAnywhere "Web" tab to get a link to it. You can share this with anyone you want :)
> > 
> > > **Note** This is a beginners' tutorial, and in deploying this site we've taken a few shortcuts which aren't ideal from a security point of view. If and when you decide to build on this project, or start a new project, you should review the [Django deployment checklist](https://docs.djangoproject.com/en/1.11/howto/deployment/checklist/) for some tips on securing your site.
> > 
> > ## Debugging tips
> > 
> > If you see an error while running the `pa_autoconfigure_django.py` script, here are a few common causes:
> > 
> > - Forgetting to create your PythonAnywhere API token.
> > - Making a mistake in your GitHub URL
> > - If you see an error saying *"Could not find your settings.py"*, it's probably because you didn't manage to add all your files to Git, and/or you didn't push them up to GitHub successfully. Have another look at the Git section above
> > 
> > If you see an error when you try to visit your site, the first place to look for some debugging info is in your **error log**. You'll find a link to this on the PythonAnywhere [Web tab](https://www.pythonanywhere.com/web_app_setup/). See if there are any error messages in there; the most recent ones are at the bottom.
> > 
> > There are also some [general debugging tips on the PythonAnywhere help site](http://help.pythonanywhere.com/pages/DebuggingImportError).
> > 
> > And remember, your coach is here to help!
> > 
> > # Check out your site!
> > 
> > The default page for your site should say "It worked!", just like it does on your local computer. Try adding `/admin/` to the end of the URL, and you'll be taken to the admin site. Log in with the username and password, and you'll see you can add new Posts on the server.
> > 
> > Once you have a few posts created, you can go back to your local setup (not PythonAnywhere). From here you should work on your local setup to make changes. This is a common workflow in web development – make changes locally, push those changes to GitHub, and pull your changes down to your live Web server. This allows you to work and experiment without breaking your live Web site. Pretty cool, huh?
> > 
> > Give yourself a *HUGE* pat on the back! Server deployments are one of the trickiest parts of web development and it often takes people several days before they get them working. But you've got your site live, on the real Internet, just like that!