Chromebookをお持ちでない場合は、[このセクションをスキップ](http://tutorial.djangogirls.org/en/installation/#install-python) できます。 もし利用している場合は、普通のインストールの作業とは少し異なります。 インストール手順の残りの部分は無視できます。

### クラウドIDE (PaizaCloud Cloud IDE, AWS Cloud9)

クラウドIDEはコードエディタであり、どこからでも何かをインストールできたり、コードを書いたり、ソフトウェアを動かしたりできるインターネットにつながったコンピュータへアクセスできます。 チュートリアルを通して、クラウドIDEはまるであなたのローカルマシンのように動作するでしょう。 みんながOS XやUbuntuやWindowsでやるのと同じようにターミナルからコマンドを入力できますが、そのターミナルはIDEがセットアップされたどこかのコンピュータに接続されています。 さて、いろいろなクラウドIDE（PaizaCloud Cloud IDE,AWS Cloud9）について見ていきましょう。 クラウドIDEのうちどれかを選んで、指示に従ってください。

#### PaizaCloud Cloud IDE

1. Go to [PaizaCloud Cloud IDE](https://paiza.cloud/)
2. Sign up for an account
3. Click *New Server*
4. Click Terminal button(on the left side of the window)

さて、左側にサイドバーとボタンがついた画面が見えていると思います。 下記のようなプロンプトが表示されたターミナルウィンドウを開くために、“Terminal”ボタンをクリックしてください。

{% filename %}Terminal{% endfilename %}

    $
    

これでPaizaCloud Cloud IDEのターミナルは準備できました。 ウィンドウのサイズを変えたり、ちょっと大きくしたいときは最大化したりできますよ。

#### AWS Cloud9

1. Go to [AWS Cloud9](https://aws.amazon.com/cloud9/)
2. Sign up for an account
3. Click *Create Environment*

インターフェイスには、サイドバー、テキストが書かれた大きなメインウィンドウ、下部に小さなウィンドウがあり、次の表示が見えると思います。

{% filename %}bash{% endfilename %}

    yourusername:~/workspace $
    

下部がターミナルです。 Cloud 9コンピュータにリモートで指示を送るためにターミナルを使えます。 ウィンドウはサイズ変更可能です。

### 仮想環境

仮想環境 (virtualenvとも呼ばれます) は、取り組んでいるプロジェクト用に、便利なコンピューターコードを詰め込んでおけるプライベートボックスのようなものです。 様々なプロジェクトの様々なコードがプロジェクト間で混ざってしまわないようにこれを使います。

Cloud 9のインターフェイスのうち、下部のターミナルで次を実行します。

{% filename %}Cloud 9{% endfilename %}

    sudo apt update
    sudo apt install python3.6-venv
    

それでも問題が解決しない場合は、コーチに相談してください。

Next, run:

{% filename %}Cloud 9{% endfilename %}

    mkdir djangogirls
    cd djangogirls
    python3.6 -mvenv myvenv
    source myvenv/bin/activate
    pip install django~={{ book.django_version }}
    

(note that on the last line we use a tilde followed by an equal sign: `~=`).

### GitHub

Make a [GitHub](https://github.com) account.

### PythonAnywhere

The Django Girls tutorial includes a section on what is called Deployment, which is the process of taking the code that powers your new web application and moving it to a publicly accessible computer (called a server) so other people can see your work.

This part is a little odd when doing the tutorial on a Chromebook since we're already using a computer that is on the Internet (as opposed to, say, a laptop). However, it's still useful, as we can think of our Cloud 9 workspace as a place for our "in progress" work and Python Anywhere as a place to show off our stuff as it becomes more complete.

Thus, sign up for a new Python Anywhere account at [www.pythonanywhere.com](https://www.pythonanywhere.com).