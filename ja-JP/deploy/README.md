# デプロイ！

> **補足** このチャプターはちょっと難しいことが沢山書かれています。 頑張って最後までやりきってください。デプロイはウェブサイトを開発するプロセスの上で、とても重要な部分ですが、つまずきやすいポイントも多く含まれています。 チュートリアルの途中にこのチャプターを入れています。そういったつまずきやすい箇所はメンターに質問して、あなたが作っているウェブサイトをオンラインでみれるようにしてください。 言い換えれば、もし時間切れでワークショップ内でチュートリアルを終わらせることができなかったとしても、この後のチュートリアルはきっと自分で終わらせることができるでしょう。

今のところ、あなたが作ったサイトは、あなたのコンピューターでしかみることができません。 ここでは、デプロイの方法を学びましょう！ デプロイとは、あなたが作っているアプリケーションをインターネットで公開することです。あなた以外の人もウェブサイトを見ることができるようになりますよ. :)

これまでに学んだとおり、ウェブサイトはサーバーに置かれています。 インターネットで利用できる多くのサーバー プロバイダーがありますが、私達は [PythonAnywhere](https://www.pythonanywhere.com/) を使用します。 PythonAnywhere は、多くの人がアクセスするものではない小さいアプリケーションを無料で公開できますので今のあなたには最適でしょう。

使用するその他の外部サービスは [GitHub](https://www.github.com)、コードのホスティング サービスです。 他にも色々ありますが、ほとんどのプログラマはGitHubのアカウントを持っています。そしてあなたも今そうなります。

これら3つの場所が重要になります。 ローカルコンピューターは、開発およびテストを行う場所になります。 変更に満足したら、GitHub上にプログラムのコピーを配置します。 あなたのウェブサイトはPythonAnywhereで公開され、GitHub からコードの新しいコピーを取得することによって更新されます。

# Git

> **Note** If you already did the [installation steps](../installation/README.md), there's no need to do this again – you can skip to the next section and start creating your Git repository.

{% include "/deploy/install_git.md" %}

## Gitリポジトリを始める

Gitはコードリポジトリ（または略して「リポジトリ」）というものの中に置かれる特定のファイルへの変更を追跡します。 私たちのプロジェクトを開始しましょう。 あなたのコンソールを開き、`djangogirls` ディレクトリでこれらのコマンドを実行します。

> **備考：**リポジトリを初期化する前に `pwd` (OSX/Linux) または `cd` (Windows) コマンドで現在の作業ディレクトリを確認してください。 `djangogirls` フォルダー内にいる必要があります。

{% filename %}command-line{% endfilename %}

    $ git init
    Initialized empty Git repository in ~/djangogirls/.git/
    $ git config --global user.name "Your Name"
    $ git config --global user.email you@example.com
    

gitリポジトリを初期化することは、プロジェクトごとに1回だけ行う必要があります（ユーザー名と電子メールをもう一度入力する必要はありません）。

Git はこのディレクトリ内のすべてのファイルとフォルダの変更を追跡しますが、無視してほしいいくつかのファイルがあります。 ベースディレクトリ内で `.gitignore` という名前のファイルを作成することによってこれを行います。 あなたのエディターを開き、次の内容で新しいファイルを作成します。

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
    

これを "djangogirls" フォルダ内に `.gitignore` という名前で保存します。

> **備考：**ファイル名の先頭のドットは重要です! もしそのファイルを作るのが難しいなら、（Macをお使いの方はFinderからドット（ . ）で始まるファイルを作れません。）そういう時はエディタでSave Asから作成すれば問題ありません。 `.txt`や `.py`などの拡張子をファイル名に入れないように気をつけてください。 ファイル名が`.gitignore`でないとGitに認識されません。 LinuxとMacOSは、（`.gitignore` のように） `.<code>で始まる名前のファイルを隠しファイルとして扱います。通常の<code>ls`コマンドでは、これらのファイルは表示されません。 Instead use `ls -a` to see the `.gitignore` file.
> 
> **備考：** `.gitignore`ファイルで指定したファイルの1つが`db.sqlite3`です。 そのファイルはローカルデータベースで、すべてのユーザーと投稿が保存されます。 私達は標準的なウェブプログラミングの慣習に従います。つまり、ローカルのテストサイトとPythonAnywhere上の本番のウェブサイトでデータベースを分けるということです。 PythonAnywhereのデータベースは開発用のマシンと同じようにSQLiteにすることができますが、通常はMySQLというSQLiteよりもたくさんのサイト訪問者に対処できるデータベースを使用します。 どちらの方法でも、GitHubのコードのコピーではSQLiteデータベースを無視することで、これまでに作成したすべての投稿と管理者はそのままローカルで利用できますが、本番環境（ブログを公開するPythonAnywhereのことです）ではそれらを再び作成する必要があります。 ローカルデータベースは本当のブログ投稿をブログから削除してしまうことを心配せずに、さまざまなことをテストできるよい遊び場として考えるといいでしょう。

`git add` コマンドを実行する前や、どのような変更を加えたか定かでない時は、 `git status` コマンドを使用する事をおすすめします。 これは間違ったファイルを追加またはコミットなど思いもかけない事を止めるために役立ちます。 `git status` コマンドは、あらゆる追跡されていない/変更されている/ステージされている（untracked/modifed/staged）ファイルや、ブランチの状態などさまざまな情報を返します。 出力は次のようになります。

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
    

最後に、変更内容を保存します。コンソールに移動し、これらのコマンドを実行します。

{% filename %}command-line{% endfilename %}

    $ git add .
    $ git commit -m "My Django Girls app, first commit"
     [...]
     13 files changed, 200 insertions(+)
     create mode 100644 .gitignore
     [...]
     create mode 100644 mysite/wsgi.py
    

## GitHubにコードをプッシュする

[GitHub.com](https://www.github.com)にアクセスし、Sign upをクリックして無料の新規アカウントを作成してください。 （ワークショップの前にすでに作成していたら、それは素晴らしいです!） あなたのパスワードを忘れないようにしてください（使っていたら、パスワードマネージャーに入れておいてください）

そして、新しいリポジトリに "my-first-blog"の名前で新しいリポジトリを作成します。 "READMEで初期化する"チェックボックスをオフのままにし、.gitignoreオプションを空白にして（手動で行っています）、ライセンスをNoneのままにしておきます。

![](images/new_github_repo.png)

> **注** `my-first-blog`という名前は重要です。何か他のものを選択することもできますが、以下の手順では何度も繰り返す必要があります。他の名前を選択した場合は、 毎回それを置き換えてください。 できれば、`my-first-blog` の名前にしておきましょう。

次の画面では、リポジトリをクローンするためのURLが表示されます。これはこの後のコマンドで利用します。

![](images/github_get_repo_url_screenshot.png)

そして自分のコンピューター上のGitリポジトリをGitHub上のGitリポジトリに結びつけてあげる必要があります。

コンソールに次のように入力します（`<your-github-username>`をGitHubアカウントの作成時に入力したユーザー名に置き換えます。山カッコ&lt;&gt;を残さないでください。このURLはさっき見たクローンURLと一致する必要があります）。

{% filename %}command-line{% endfilename %}

    $ git remote add origin https://github.com/<your-github-username>/my-first-blog.git
    $ git push -u origin master
    

GitHubにプッシュするとき、GitHubのユーザー名とパスワードを聞かれます（コマンドライン上かポップアップウィンドウにて）。認証情報を入力したらこんな風に表示されます。

{% filename %}command-line{% endfilename %}

    Counting objects: 6, done.
    Writing objects: 100% (6/6), 200 bytes | 0 bytes/s, done.
    Total 3 (delta 0), reused 0 (delta 0)
    
    To https://github.com/ola/my-first-blog.git
     * [new branch]      master -> master
    Branch master set up to track remote branch master from origin.
    

<!--TODO: maybe do ssh keys installs in install party, and point ppl who dont have it to an extension -->

あなたのコードは今GitHub上にあります。 見に行きましょう！ [ Django ](https://github.com/django/django)や[ Django Girls Tutorial ](https://github.com/DjangoGirls/tutorial)、その他たくさんの素晴らしいオープンソースソフトウェアプロジェクトもGitHubでコードをホストしています。 :)

# PythonAnywhereでブログを設定する

## PythonAnywhere アカウントにサインアップする

> **備考：**あなたがすでにPythonAnywhereのアカウントを以前に作成しインストールの手順をふんでいたら、再びそれを行う必要はありません。

{% include "/deploy/signup_pythonanywhere.md" %}

## PythonAnywhere でサイトを設定する

ロゴをクリックしてメインの[PythonAnywhere Dashboard](https://www.pythonanywhere.com/)に戻り、「Bash」コンソールを起動するボタンをクリックします。これはPythonAnywhereバージョンのコマンドラインで、ちょうどあなたのコンピューターのコマンドラインと同じようなものです。

![PythonAnywhereのウェブインターフェースの「New Console」、「bash」ボタン](images/pythonanywhere_bash_console.png)

> **備考：**PythonAnywhere は Linuxベースなので、Windowsを使っている場合は、コンソールがあなたのものと少し違って見えるでしょう。

PythonAnywhereにWebアプリケーションをデプロイするには、コードをGitHubからプルし、PythonAnywhereがそれを認識してWebアプリケーションのサーバを動かし始めるように設定する必要があります。 それを手動で行う方法もありますが、PythonAnywhereはそれをすべて行うヘルパーツールを提供しています。 まず、インストールしてみましょう。

{% filename %}PythonAnywhere command-line{% endfilename %}

    $ pip{{ book.pa_py_version }} install --user pythonanywhere
    

`Collecting pythonanywhere` のようなメッセージがいくつか出力され、最終的に`Successfully installed (...) pythonanywhere- (...)`という行で終わると思います。

GitHub からアプリを自動的に構成するためのヘルパーを実行します。 PythonAnywhereのコンソールに次のように入力します（GitHubからクローンするときのURLと一致するように、`<your-github-username>`の代わりにご自身のGitHubユーザー名を使用することを忘れないでください）：

{% filename %}PythonAnywhere command-line{% endfilename %}

    $ pa_autoconfigure_django.py --python={{ book.pa_py_version }} https://github.com/<your-github-username>/my-first-blog.git
    

実行しているところを見れば、何をしているのかわかるでしょう。

- GitHubからコードをダウンロードする
- ちょうどあなたのPC上でやったように、PythonAnywhere上に仮想環境 を作成する
- 一部のデプロイメント設定で設定ファイルを更新する
- `manage.py migrate`コマンドを使ってPythonAnywhere上のデータベースをセットアップする
- 静的ファイルの設定（これについては後で学習します）
- APIを通じてPythonAnywhereがあなたのWebアプリケーションを提供するように設定する

PythonAnywhereではこれらすべてのステップは自動化されていますが、他のサーバープロバイダーでは同じ手順を自分で実行しなければなりません。

今注目すべき重要な点は、PythonAnywhere上のデータベースが、自分のPC上のデータベースとはまったく別物であることです。つまり、異なる投稿と管理者アカウントを持つことができます。 その結果、自分のコンピュータで行ったように、`createsuperuser`で管理者アカウントを初期化する必要があります。 PythonAnywhereがあなたの代わりに仮想環境を自動的に起動したので、あなたがする必要があるのは以下の通りです：

{% filename %}PythonAnywhere command-line{% endfilename %}

    (ola.pythonanywhere.com) $ python manage.py createsuperuser
    

管理者の詳細を入力します。 PythonAnywhere上のパスワードをより安全にしたい場合を除き、混乱を避けるために自分のコンピュータで使用しているのと同じものを使用することをお勧めします。

PythonAnywhereのコードを`ls`を使って見てみることもできます：

{% filename %}PythonAnywhere command-line{% endfilename %}

    (ola.pythonanywhere.com) $ ls
    blog  db.sqlite3  manage.py  mysite requirements.txt static
    (ola.pythonanywhere.com) $ ls blog/
    __init__.py  __pycache__  admin.py  apps.py  migrations  models.py
    tests.py  views.py
    

また、Filesページに移動し、PythonAnywhereに組み込まれているファイルブラウザを使用して閲覧することもできます。 (ConsoleページからPythonAnywhereの他のページには、右上のメニューボタンからいけます。 一度いずれかのページに移動したら、他ページへのリンクは上部にあります。)

## 動いています！

Your site should now be live on the public Internet! Click through to the PythonAnywhere "Web" page to get a link to it. You can share this with anyone you want. :)

> **注** これは初心者向けのチュートリアルです。このサイトをデプロイする際にはセキュリティの観点からは理想的ではない、いくつかのショートカットをしました。 もしこのプロジェクトを利用すると決めたり、新しいプロジェクトを開始する場合は、あなたのサイトを安全にするいくつかのヒントについて、[Djangoデプロイチェックリスト](https://docs.djangoproject.com/ja/2.2/howto/deployment/checklist/)を注意深く読んでください。

## デバッギングのヒント

`pa_autoconfigure_django.py`スクリプトの実行中にエラーが表示された場合は、次のような原因が考えられます。

- PythonAnywhere APIトークンの作成を忘れている
- あなたのGitHubのURLを間違えている
- *Could not find your settings.py*というエラーが表示された場合は、おそらくGitにすべてのファイルを追加できていなかったか、 GitHubにうまくプッシュできていなかった。 この場合はGitセクションをもう一度見てください
- PythonAnywhereのアカウントを以前に作成していてcollectstaticでエラーが起きたとしたら、あなたのアカウントで古いバージョンのSQLite（例えば、3.8.2）を使っている可能性があります。 その場合、新しいアカウントを作成して、上記のPythonAnywhereのセクションに記載しているコマンドを実行してください。

サイトにアクセスしようとするとエラーが表示された場合、最初にデバッグ情報を探す場所は**エラーログ**です。 PythonAnywhereの[ Webページ](https://www.pythonanywhere.com/web_app_setup/)には、エラーログへのリンクがあります。 そこにエラーメッセージがあるかどうかを確認してください。 最新のものは一番下にあります。

[ PythonAnywhereヘルプサイトの一般的なデバッグのヒント](http://help.pythonanywhere.com/pages/DebuggingImportError)もあります。

つまづいた時は、コーチに助けを求めましょう。

# あなたのサイトをチェック！

サイトのデフォルトページでは、ローカルコンピュータと同じように「It worked！」と表示されます。 URLの最後に`/admin/`を追加すると、管理サイトに移動します。 ユーザー名とパスワードでログインしたら、Postsへのリンクからサーバーに新規投稿を追加できることがわかるでしょう。ローカルのテスト用データベースの投稿は本番環境のブログに送られていないことも忘れないてくださいね。

いくつかの投稿を作成したら、ローカル環境（PythonAnywhereではなく）に戻ることができます。 ここから、変更を加えるためにはあなたのローカル環境で作業する必要があります。 これがWeb開発の一般的なワークフローです。ローカルで変更し、それらの変更をGitHubにプッシュし、それからその変更を公開しているWebサーバーにプルしてきます。 これにより、公開しているWebサイトを壊すことなく作業したり試したりできます。 とってもクールでしょ？

自分を*すっごく*褒めてあげてください！ サーバーのデプロイはWeb開発の最も難しい部分の1つで、ちゃんと動くようになるまで数日かかることもよくあります。 しかし、あなたは実際のインターネット上で、あなたのサイトを動かす事ができました！