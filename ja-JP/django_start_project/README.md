# プロジェクトを作成しよう！

> このチャプターの一部はGeek Girls Carrotsのチュートリアルをもとにしています。(https://github.com/ggcarrots/django-carrots)
> 
> このチャプターの一部は Creative Commons Attribution-ShareAlike 4.0 International License のライセンスによる [django-marcador tutorial](http://django-marcador.keimlink.de/) をもとにしています。 この django-marcador tutorial は Markus Zapke-Gründemann たちが著作権を保有しています。

ここからは、小さなブログを作っていきますよ！

最初のステップは、Djangoのプロジェクトを新しく作成します。 基本的に、Djangoのスクリプトを実行しDjangoプロジェクトの骨格を作ります。 スクリプトは、これから使う沢山のファイルやディレクトリを自動生成します。

Djangoでは、ファイルやディレクトリの名前がとても重要です。 作成されたファイルの名前は変えるべきではありません。 ファイルを移動させるのもいいアイディアとはいえません。 Djangoでは、重要なファイルを決められたファイル構成で作成しておくことが必要です。 

> virtualenv（仮想環境）を実行しているでしょうか。 もしコンソールのプロンプトの前に `(myvenv)` という文字が表示されていない時は、virtualenv が実行されていないので、有効にする必要があります。 **Djangoのインストール** のチャプターの **仮想環境の操作** のパートで、仮想環境を実行する方法について説明しました。 Windowsでは、`myvenv\Scripts\activate`、MacOS や Linux では、 `source myvenv/bin/activate` というコマンドを入力すると有効にできます。

<!--sec data-title="Create project: OS X or Linux" data-id="django_start_project_OSX_Linux" data-collapse=true ces-->

MacOS や Linux の場合は、コンソールで以下のコマンドを実行します。**最後のピリオド(ドット) `.` を忘れないようにしてください！**

{% filename %}コマンドライン{% endfilename %}

    (myvenv) ~/djangogirls$ django-admin startproject mysite .
    

> コマンドの最後にピリオド `.` を入力したことを確認してくださいね。このピリオドは、現在の作業ディレクトリに Django をインストールするということを示しています (ピリオド `.` は、現在のディレクトリを表す省略表記です)。
> 
> **メモ:** 上記のコマンドを入力するときは、`django-admin` で始まる部分のみを入力することを忘れないでください。 ここに書いた `(myvenv) ~/djangogirls$` の部分は、コマンドライン上で入力を受け付けることを示しているプロンプトの一例なので、人によって違うかもしれません。

<!--endsec-->

<!--sec data-title="Create project: Windows" data-id="django_start_project_windows" data-collapse=true ces-->

Windows の場合は、以下のコマンドを実行しないといけません。**(最後にピリオド (ドット) `.` を書いてください)**

{% filename %}コマンドライン{% endfilename %}

    (myvenv) C:\Users\Name\djangogirls> django-admin.exe startproject mysite .
    

> コマンドの最後にピリオド (.) があることを確認してくださいね。これば、現在の作業ディレクトリにDjangoをインストールするということを示すので、とても重要なのです。(ピリオドは簡略表記です).
> 
> **メモ:** 上記のコマンドを入力するときは、`django-admin` で始まる部分のみを入力することを忘れないでください。 ここに書いた `(myvenv) ~/djangogirls$` の部分は、コマンドライン上で入力を受け付けることを示しているプロンプトの一例なので、人によって違うかもしれません。

<!--endsec-->

django-admin.py は、必要なディレクトリとファイルを作成するスクリプトです。次のようなファイル構造が作成されましたね。:

    djangogirls
    ├── manage.py
    ├── mysite
    │   ├── __init__.py
    │   ├── settings.py
    │   ├── urls.py
    │   └── wsgi.py
    ├── myvenv
    │   └── ...
    └── requirements.txt
    

> **注**：ディレクトリ構造には、以前作成した`venv`ディレクトリもあります。

`manage.py`はサイトの管理に役立つスクリプトです。 それを使用して、他のものをインストールすることなく、私たちのコンピュータ上でWebサーバーを起動することができます。

`settings.py`ファイルには、ウェブサイトの設定が含まれています。

手紙を送付する場所を確認する郵便業者について話した事を覚えていますか？ `urls.py`ファイルには、`urlresolver`（Djangoがビューを見つける仕組みです。Django URLのチャプターで説明します）で使用されるパターンのリストが含まれています。

私たちが変更しない他のファイルを今は無視しましょう。 覚えておくべき唯一の事は、間違えてそれらを削除しないことです！

## 設定変更

`mysite/settings.py`にいくつか変更を加えましょう。 前にインストールしたコードエディタを使用してファイルを開きます。

**注**：`settings.py`は他のものと同じように通常のファイルであることに注意してください。 「ファイルを開く」メニューを使用して、コードエディタ内から開くことができます。 これにより、`settings.py`ファイルに移動して選択できる通常のウィンドウが表示されます。 あるいは、デスクトップのdjangogirlsフォルダに移動して右クリックしてファイルを開くこともできます。 次に、リストからコードエディタを選択します。 インストールされた他のプログラムでは、ファイルを開けても編集できないかもしれないので、エディタの選択は重要です。

私たちのWebサイトが正しい時間で動くといいでしょう。 [Wikipediaのタイムゾーンのリスト](https://en.wikipedia.org/wiki/List_of_tz_database_time_zones)に移動して、関連するタイムゾーン (TZ) をコピーします (例：`Asia/Tokyo`)。

`settings.py` の中から `TIME_ZONE` と書かれた行を探してください。この行はタイムゾーンを表しているので、自分が住んでいるタイムゾーンに合わせて修正しましょう。たとえば、次のように書きます。

{% filename %}mysite/settings.py{% endfilename %}

```python
TIME_ZONE = 'Asia/Tokyo'
```

言語コードは、言語（例えば、英語の場合は`en`、ドイツ語の場合は`de`のように表します）と、国コード（例えば、ドイツの場合は`de`、スイスの場合は`ch`のように表します）からできています。 あなたの母国語が英語でない場合、これを追加すると、Djangoのデフォルトのボタンや通知が設定した言語に変更されます。 ですのでたとえば「Cancel」ボタンがここで定義した言語に翻訳されます。 [Djangoは多くの言語に対応しています。](https://docs.djangoproject.com/ja/2.2/ref/settings/#language-code)

別の言語を使用する場合は、次の行を変更して言語コードを変更します。

{% filename %}mysite/settings.py{% endfilename %}

```python
LANGUAGE_CODE = 'ja'
```

静的ファイルのパスも追加する必要があります。 （静的ファイルとCSSについては、後ほどチュートリアルで説明します）。ファイルの*一番下*に移動し、`STATIC_URL`の下に `STATIC_ROOT`を追加します。：

{% filename %}mysite/settings.py{% endfilename %}

```python
STATIC_URL = '/static/'
STATIC_ROOT = os.path.join(BASE_DIR, 'static')
```

`DEBUG` が `True` に設定されていて、`ALLOWED_HOSTS` が空のリストの時は、自動的に `['localhost', '127.0.0.1', '[::1]']` という3つのホストに対してチェックが行われます。 このままの設定では、これから私たちがデプロイして使う PythonAnywhere のホストネームが含まれていません。ですから、次のように設定を変更します。

{% filename %}mysite/settings.py{% endfilename %}

```python
ALLOWED_HOSTS = ['127.0.0.1', '.pythonanywhere.com']
```

> **メモ**: Chromebook を使っている人は、次の1行を settings.py ファイルの最後に追加してください。 `MESSAGE_STORAGE = 'django.contrib.messages.storage.session.SessionStorage'`
> 
> cloud9を使っている人は、 `ALLOWED_HOSTS` に、`.amazonaws.com` を追加しましょう。
> 
> If you are hosting your project on `Glitch.com`, let us protect the Django secret key that needs to remain confidential (otherwise, anyone remixing your project could see it): * First, we are going to create a random secret key. Open the Glitch terminal again, and type the following command: {% filename %}.env{% endfilename %} 
> 
>     bash
>         python -c 'from django.core.management.utils import get_random_secret_key; \
>               print(get_random_secret_key())' This should display a long random string, perfect to use as a secret key for your brand new Django web site. We will now paste this key into a 
> 
> `.env` file that Glitch will only show you if you are the owner of the web site.  
>   
> * Create a file `.env` at the root of your project and add the following property in it: {% filename %}.env{% endfilename %} 
> 
>     bash
>         # Here, inside the single quotes, you can cut and paste the random key generated above
>         SECRET='3!0k#7ds5mp^-x$lqs2%le6v97h#@xopab&oj5y7d=hxe511jl' * Then update the Django settings file to inject this secret value and set the Django web site name: {% filename %}mysite/settings.py{% endfilename %} 
> 
>     python
>         SECRET_KEY = os.getenv('SECRET') * And a little further, in the same file, we inject the name of your new Glitch website: {% filename %}mysite/settings.py{% endfilename %} 
> 
>     python
>         ALLOWED_HOSTS = [os.getenv('PROJECT_DOMAIN') + ".glitch.me"] The 
> 
> `PROJECT_DOMAIN` value is automatically generated by Glitch. It will correspond to the name of your project.

## データベースをセットアップする

あなたのサイトのデータを保管することができるデータベース・ソフトウェアには、たくさんの種類があります。今は、Django がデフォルトで使う `sqlite3` というデータベースを使うことにします。

この設定はすでに `mysite/settings.py` ファイルの中に次のように書かれています。

{% filename %}mysite/settings.py{% endfilename %}

```python
DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.sqlite3',
        'NAME': os.path.join(BASE_DIR, 'db.sqlite3'),
    }
}
```

ブログのデータベースを作成するには、コンソールで次のコードを実行してみましょう： `python manage.py migrate` (`manage.py`ファイルのある`djangogirls`ディレクトリにいる必要があります) 。 うまくいったら次のように表示されるでしょう：

{% filename %}command-line{% endfilename %}

    (myvenv) ~/djangogirls$ python manage.py migrate
    Operations to perform:
      Apply all migrations: auth, admin, contenttypes, sessions
    Running migrations:
      Rendering model states... DONE
      Applying contenttypes.0001_initial... OK
      Applying auth.0001_initial... OK
      Applying admin.0001_initial... OK
      Applying admin.0002_logentry_remove_auto_add... OK
      Applying contenttypes.0002_remove_content_type_name... OK
      Applying auth.0002_alter_permission_name_max_length... OK
      Applying auth.0003_alter_user_email_max_length... OK
      Applying auth.0004_alter_user_username_opts... OK
      Applying auth.0005_alter_user_last_login_null... OK
      Applying auth.0006_require_contenttypes_0002... OK
      Applying auth.0007_alter_validators_add_error_messages... OK
      Applying auth.0008_alter_user_username_max_length... OK
      Applying auth.0009_alter_user_last_name_max_length... OK
      Applying sessions.0001_initial... OK
    

終わったら、 Webサーバーを起動し、私たちのWebサイトが動作しているかどうかを確認する時間です。

## ウェブサーバを起動する

コマンドラインやコマンドプロンプトで`manage.py`ファイルを含むディレクトリ（`djangogirls`ディレクトリ）に移動してください。 `python manage.py runserver`を実行してWebサーバーを起動できます。

{% filename %}command-line{% endfilename %}

    (myvenv) ~/djangogirls$ python manage.py runserver
    

Chromebookを使用している場合は、代わりに次のコマンドを使用します。

{% filename %}Cloud 9{% endfilename %}

    (myvenv) ~/djangogirls$ python manage.py runserver 0.0.0.0:8080
    

or this one if you are using Glitch:

{% filename %}Glitch.com terminal{% endfilename %}

    $ refresh
    
    

If you are on Windows and this fails with `UnicodeDecodeError`, use this command instead:

{% filename %}command-line{% endfilename %}

    (myvenv) ~/djangogirls$ python manage.py runserver 0:8000
    

Now you need to check that your website is running. Open your browser (Firefox, Chrome, Safari, Internet Explorer or whatever you use) and enter this address:

{% filename %}ブラウザ{% endfilename %}

    http://127.0.0.1:8000/
    

If you're using a Chromebook and Cloud9, instead click the URL in the pop-up window that should have appeared in the upper right corner of the command window where the web server is running. The URL will look something like:

{% filename %}browser{% endfilename %}

    https://<a bunch of letters and numbers>.vfs.cloud9.us-west-2.amazonaws.com
    

or on Glitch:

    https://name-of-your-glitch-project.glitch.me
    

Congratulations! You've just created your first website and run it using a web server! Isn't that awesome?

![Install worked!](images/install_worked.png)

Note that a command window can only run one thing at a time, and the command window you opened earlier is running the web server. As long as the web server is running and waiting for additional incoming requests, the terminal will accept new text but will not execute new commands.

> Webサーバーの仕組みについては、「インターネットの仕組み」の章を参照してください。

To type additional commands while the web server is running, open a new terminal window and activate your virtualenv -- to review instructions on how to open a second terminal window, see [Introduction to the command line](../intro_to_command_line/README.md). To stop the web server, switch back to the window in which it's running and press CTRL+C - Control and C keys together (on Windows, you might have to press Ctrl+Break).

Ready for the next step? It's time to create some content!