Chromebookを使わない場合は、このセクションを飛ばして、[Pythonのインストール](http://tutorial.djangogirls.org/en/installation/#install-python) に進んでください。 もし利用している場合は、普通のインストールの作業とは少し異なります。 インストール手順の残りの部分は無視できます。

### クラウドIDE (PaizaCloud Cloud IDE, AWS Cloud9)

クラウドIDEはコードエディタであり、どこからでも何かをインストールできたり、コードを書いたり、ソフトウェアを動かしたりできるインターネットにつながったコンピュータへアクセスできます。 チュートリアルを通して、クラウドIDEはまるであなたのローカルマシンのように動作するでしょう。 みんながOS XやUbuntuやWindowsでやるのと同じようにターミナルからコマンドを入力できますが、そのターミナルはIDEがセットアップされたどこかのコンピュータに接続されています。 さて、いろいろなクラウドIDE（PaizaCloud Cloud IDE,AWS Cloud9）について見ていきましょう。 クラウドIDEのうちどれかを選んで、指示に従ってください。

#### PaizaCloud Cloud IDE

1. [PaizaCloud Cloud IDE](https://paiza.cloud/)へ。
2. アカウントにサインアップします
3. *新規サーバ作成*をクリックして、Djangoを選択してください。
4. (ウィンドウの左側にある) [ターミナル] をクリックします。

さて、左側にサイドバーとボタンがついた画面が見えていると思います。 下記のようなプロンプトが表示されたターミナルウィンドウを開くために、“Terminal”ボタンをクリックしてください。

{% filename %}Terminal{% endfilename %}

    $
    

これでPaizaCloud Cloud IDEのターミナルは準備できました。 ウィンドウのサイズを変えたり、ちょっと大きくしたいときは最大化したりできますよ。

#### AWS Cloud9

現在、Cloud 9 はAWSのアカウント作成とクレジットカード情報の登録が必須になっています。

1. [Chrome ウェブストア](https://chrome.google.com/webstore/detail/cloud9/nbdmccoknlfggadpfkmcpnamfnbkmkcp)から、Cloud 9 をインストールしてください。
2. [c9.io](https://c9.io)に行って、*AWS Cloud9で開発をはじめる*をクリックしてください。
3. AWSアカウントにサインアップしてください。（クレジットカード情報の登録が必要ですが、このチュートリアルは無料で進めることができます。）
4. AWSのダッシュボードを開き、検索ボックスで*Cloud9*と入力し選択してください。
5. Cloud9のダッシュボードで、*環境の作成*を選択します。
6. 名前は*django-girls*としておきましょう。
7. While configuring settings, select *Create a new instance for environment (EC2)* for "Environment Type" and the *t2.micro* "Instance type" (it should say "Free-tier eligible."). The default cost-saving setting is fine and you can keep the other defaults.
8. Click *Next step*
9. Click *Create environment*

Now you should see an interface with a sidebar, a big main window with some text, and a small window at the bottom that looks something like this:

{% filename %}bash{% endfilename %}

    yourusername:~/workspace $
    

This bottom area is your terminal. You can use the terminal to send instructions to the remote Cloud 9 computer. You can resize that window to make it a bit bigger.

### 仮想環境

A virtual environment (also called a virtualenv) is like a private box we can stuff useful computer code into for a project we're working on. We use them to keep the various bits of code we want for our various projects separate so things don't get mixed up between projects.

実行：

{% filename %}Cloud 9{% endfilename %}

    mkdir djangogirls
    cd djangogirls
    python3.6 -mvenv myvenv
    source myvenv/bin/activate
    pip install django~={{ book.django_version }}
    

(note that on the last line we use a tilde followed by an equal sign: `~=`).

### GitHub

[GitHub](https://github.com)アカウントを作成してください。

### PythonAnywhere

The Django Girls tutorial includes a section on what is called Deployment, which is the process of taking the code that powers your new web application and moving it to a publicly accessible computer (called a server) so other people can see your work.

This part is a little odd when doing the tutorial on a Chromebook since we're already using a computer that is on the Internet (as opposed to, say, a laptop). However, it's still useful, as we can think of our Cloud 9 workspace as a place for our "in progress" work and Python Anywhere as a place to show off our stuff as it becomes more complete.

Thus, sign up for a new Python Anywhere account at [www.pythonanywhere.com](https://www.pythonanywhere.com).