Chromebookを使わない場合は、このセクションを飛ばして、[Pythonのインストール](http://tutorial.djangogirls.org/en/installation/#install-python) に進んでください。 もし利用している場合は、普通のインストールの作業とは少し異なります。 インストール手順の残りの部分は無視できます。

### Cloud IDE (PaizaCloud Cloud IDE, AWS Cloud9, Glitch.com)

クラウドIDEはコードエディタと、インターネットにつながって動作し、ソフトウェアをインストールしたり、書いたり、実行したりできるコンピュータへのアクセスを提供するツールです。 チュートリアルを通して、クラウドIDEはまるであなたの*ローカルマシン*のように動作するでしょう。 みんながOS XやUbuntuやWindowsでやるのと同じようにターミナルからコマンドを実行できますが、そのターミナルはクラウドIDEが準備したどこかのコンピュータに接続されています。 Here are the instructions for cloud IDEs (PaizaCloud Cloud IDE, AWS Cloud9, Glitch.com). クラウドIDEのうちどれかを選んで、指示に従ってください。

#### PaizaCloud Cloud IDE

1. [PaizaCloud Cloud IDE](https://paiza.cloud/) へ移動します。
2. アカウントを登録します。
3. *新規サーバ作成* をクリックして、Djangoを選択してください。
4. （ウィンドウの左側にある）「ターミナル」をクリックします。

左側にサイドバーといくつかボタンのある画面が見えていると思います。 「ターミナル」ボタンをクリックして、下記のようなプロンプトが表示されたターミナルウィンドウを開いてください：

{% filename %}Terminal{% endfilename %}

    $
    

これでPaizaCloud Cloud IDEのターミナルは準備できました。 ウィンドウを大きくしたいときは、サイズを変えたり最大化したりできますよ。

#### AWS Cloud9

現在、Cloud 9 はAWSのアカウント作成とクレジットカード情報の登録が必須になっています。

1. [Chrome ウェブストア](https://chrome.google.com/webstore/detail/cloud9/nbdmccoknlfggadpfkmcpnamfnbkmkcp)から、Cloud 9 をインストールしてください。
2. [c9.io](https://c9.io)に行って、*AWS Cloud9をはじめる* をクリックしてください。
3. AWSアカウントを作成してください。（クレジットカード情報の登録が必要ですが、このチュートリアルは無料利用枠で進めることができます。）
4. AWSのダッシュボードを開き、検索ボックスで *Cloud9* と入力し選択してください。
5. Cloud9のダッシュボードで、*Create environment (環境の作成)* を選択します。
6. 名前は *django-girls* としておきましょう。
7. ”Configure settings (設定の構成)”のステップでは、”Environment Type (環境タイプ)”に *Create a new instance for environment (EC2) (新しいインスタンスを作成する (EC2))* を、”Instance type (インスタンスタイプ)”に *t2.micro* を選択します（"Free-tier eligible (無料利用枠で利用できる)" と書かれているはずです）。 ”Cost-saving setting (コスト削減の設定)”はデフォルトの選択のままにします。その他の設定もデフォルトにしておきましょう。
8. *Next step (次のステップ)* を選択します。
9. *Create environment (環境の作成)* を選択します。

サイドバー、文章が書かれた大きなメインウィンドウ、そして下部にはこのような小さなウィンドウが表示されています：

{% filename %}bash{% endfilename %}

    yourusername:~/workspace $
    

この下の部分が、あなたのターミナルです。このターミナルから、遠くにあるCloud 9のコンピュータに指示を送ることができます。ウィンドウのサイズを変更して少し大きくすることもできます。

#### Glitch.com Cloud IDE

1. Glitch.com<0>に行く</li> 
    
    - アカウントをサインアップ(https://glitch.com/signup)するか、GitHubアカウントを持っている場合はそれを使用します。(以下のGitHubの手順を参照してください)
    - *新規プロジェクト* をクリックし、 *hello-webpage* を選択します。
    - ツールドロップダウンリスト(ウィンドウの左下にある)をクリックします。 次に、ターミナルのボタンを以下のようなプロンプトとともにターミナルを開くために、ターミナルボタンをクリックします。</ol> 
    
    {% filename %}Terminal{% endfilename %}
    
        app@name-of-your-glitch-project:~
        
    
    When using Glitch.com as your Cloud IDE, you don't have to create a virtual environment. Instead, create the following files manually:
    
    {% filename %}glitch.json{% endfilename %}
    
    ```json
    {
      "install": "pip3 install -r requirements.txt --user",
      "start": "bash start.sh",
      "watch": {
        "throttle": 1000
      }
    }
    ```
    
    {% filename %}requirements.txt{% endfilename %}
    
        Django~={{ book.django_version }}
        
    
    {% filename %}.bash_profile{% endfilename %}
    
    ```bash
    alias python=python3
    alias pip=pip3
    ```
    
    {% filename %}start.sh{% endfilename %}
    
    ```bash
    chmod 600 .bash_profile
    pip3 install -r requirements.txt --user
    python3 manage.py makemigrations
    python3 manage.py migrate
    python3 manage.py runserver $PORT
    ```
    
    Once these files are created, go to the Terminal and execute the following commands to create your first Django project:
    
    {% filename %}Terminal{% endfilename %}
    
        django-admin.py startproject mysite .
        refresh
        
    
    In order to see detailed error messages, you can activate Django debug logs for your Glitch application. Simply add the following at the end of the `mysite/settings.py` file.
    
    {% filename %}mysite/settings.py{% endfilename %}
    
    ```python
    LOGGING = {
        'version': 1,
        'disable_existing_loggers': False,
        'handlers': {
            'file': {
                'level': 'DEBUG',
                'class': 'logging.FileHandler',
                'filename': 'debug.log',
            },
        },
        'loggers': {
            'django': {
                'handlers': ['file'],
                'level': 'DEBUG',
                'propagate': True,
            },
        },
    }
    ```
    
    This will create a `debug.log` file detailing Django operations and any error messages that might come up, making it much easier to fix if your website does not work.
    
    The initial restarting of the Glitch project should fail. (If you click on the top dropdown button `Show` then click on `In a New Window`, you will receive a `DisallowedHost` error message.) Do not worry about it at this stage, the tutorial will fix this as soon as you update the Django settings of your project in the `mysite/settings.py` file.
    
    ### 仮想環境
    
    A virtual environment (also called a virtualenv) is like a private box we can stuff useful computer code into for a project we're working on. We use them to keep the various bits of code we want for our various projects separate so things don't get mixed up between projects.
    
    Run:
    
    {% filename %}Cloud 9{% endfilename %}
    
        mkdir djangogirls
        cd djangogirls
        python3 -m venv myvenv
        source myvenv/bin/activate
        pip install django~={{ book.django_version }}
        
    
    (note that on the last line we use a tilde followed by an equal sign: `~=`).
    
    ### GitHub
    
    Make a [GitHub](https://github.com) account.
    
    ### PythonAnywhere
    
    The Django Girls tutorial includes a section on what is called Deployment, which is the process of taking the code that powers your new web application and moving it to a publicly accessible computer (called a server) so other people can see your work.
    
    This part is a little odd when doing the tutorial on a Chromebook since we're already using a computer that is on the Internet (as opposed to, say, a laptop). However, it's still useful, as we can think of our Cloud 9 workspace as a place for our "in progress" work and Python Anywhere as a place to show off our stuff as it becomes more complete.
    
    Thus, sign up for a new Python Anywhere account at [www.pythonanywhere.com](https://www.pythonanywhere.com).