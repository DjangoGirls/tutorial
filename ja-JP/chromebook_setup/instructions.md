Chromebookを使わない場合は、このセクションを飛ばして、[Pythonのインストール](http://tutorial.djangogirls.org/en/installation/#install-python) に進んでください。 もし利用している場合は、普通のインストールの作業とは少し異なります。 インストール手順の残りの部分は無視できます。

### クラウドIDE (PaizaCloud Cloud IDE, AWS Cloud9)

クラウドIDEはコードエディタと、インターネットにつながって動作し、ソフトウェアをインストールしたり、書いたり、実行したりできるコンピュータへのアクセスを提供するツールです。 チュートリアルを通して、クラウドIDEはまるであなたの*ローカルマシン*のように動作するでしょう。 みんながOS XやUbuntuやWindowsでやるのと同じようにターミナルからコマンドを実行できますが、そのターミナルはクラウドIDEが準備したどこかのコンピュータに接続されています。 さて、いろいろなクラウドIDE（PaizaCloud Cloud IDE, AWS Cloud9）について見ていきましょう。 クラウドIDEのうちどれかを選んで、指示に従ってください。

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
2. [c9.io](https://c9.io)に行って、*AWS Cloud9をはじめる*をクリックしてください。
3. AWSアカウントを作成してください。（クレジットカード情報の登録が必要ですが、このチュートリアルは無料利用枠で進めることができます。）
4. AWSのダッシュボードを開き、検索ボックスで*Cloud9*と入力し選択してください。
5. Cloud9のダッシュボードで、*環境の作成*を選択します。
6. 名前は*django-girls*としておきましょう。
7. ”Configure settings (設定の構成)”ページで、”環境タイプ”は*環境 の新しいインスタンスを作成する (EC2)*を、”Instance type (インスタンスタイプ)”は*t2.micro*を選択します。（無料利用枠で利用できます） ”Cost-saving setting (コスト削減の設定)”はデフォルトの選択のままにします。その他の設定もデフォルトにしておきましょう。
8. *Next step (次のステップ)*を選択します。
9. *Create environment (環境の作成)*を選択します。

大きなメイン画面とサイドバー、そして下部にはこのような小さな画面が表示されています。

{% filename %}bash{% endfilename %}

    yourusername:~/workspace $
    

この下の部分が、あなたのターミナルです。Cloud9のコンピュータにリモートで指示をおくることができます。ウィンドウズのサイズを変更して少し大きくすることもできます。

### 仮想環境

仮想環境 (virtualenvとも呼ばれます) は、取り組んでいるプロジェクト用に、便利なコードを詰め込んでおけるプライベートボックスのようなものです。 様々なプロジェクトの様々なコードがプロジェクト間で混ざってしまわないように、仮想環境を使います。

以下を1行ずつ実行してください：

{% filename %}Cloud 9{% endfilename %}

    mkdir djangogirls
    cd djangogirls
    python3.6 -mvenv myvenv
    source myvenv/bin/activate
    pip install django~={{ book.django_version }}
    

（最後の行は`~=`とチルダに続けてイコール記号をつけることに注意してください）

### GitHub

[GitHub](https://github.com)アカウントを作成してください。

### PythonAnywhere

Django Girlsチュートリアルには、デプロイと呼ばれるセクションが含まれています。これはあなたの新しいWebアプリケーションの原動力となるコードを取得して、それを公にアクセス可能なコンピューター（サーバーと呼ばれます）に移動するプロセスです。これにより、あなたのやったことを他の人が見ることができるようになります。

Chromebookでチュートリアルを行うとき、すでにインターネットに接続されているコンピュータ（ラップトップとは対照的に）を使用しているので、この作業は少し変な感じがします。 しかし、Cloud 9のワークスペースを「開発中」の場所、PythonAnywhere をより完成したものを披露する場所として考えると役に立ちます。

したがって、PythonAnywhereに新規アカウントを作成してください。 [ www.pythonanywhere.com ](https://www.pythonanywhere.com)