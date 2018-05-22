# Django admin

今作成したポストを追加、編集、削除するのにDjango adminを使います。

`blog/admin.py<code>ファイルをエディタで開いて、内容をこのように変えて下さい：</p>

<p>{% filename %}blog/admin.py{% endfilename %}</p>

<pre><code class="python"><code>from django.contrib import admin
from .models import Post

admin.site.register(Post)` </code></pre> 

見て分かる通り、前回定義したPostモデルをimportしています。 Adminページ(管理画面)のモデルを作るために、モデルを登録する必要があります。`admin.site.register(Post)`の部分です.

ではPostモデルを見てみましょう。 Web サーバーを実行するコンソールで `python manage.py runserver` を実行してください。 ブラウザに行って http://127.0.0.1:8000/admin/ とアドレスバーにタイプします。 こんなログインページが出ますね。

![ログインページ](images/login_page2.png)

ログインするには、*superuser *（サイトの全てを管理するユーザー）を作る必要があります。 コマンドラインに戻り、`python manage.py createsuperuser` と入力し、enter キーを押します。

> 今あなたのコマンドラインでは、最初の Django プロジェクト **プロジェクトを作成しよう**で行った web サーバー</b> セクションを開始しています。 Web サーバーの実行中に新しいコマンドを書き込む時は、新しいターミナル ウィンドウを開いて、仮想環境をアクティブにしてください。

{% filename %}Mac OS X または Linux:{% endfilename %}

    (myvenv) ~/djangogirls$ python manage.py runserver
    

{% filename %}Windows:{% endfilename %}

    (myvenv) C:\Users\Name\djangogirls> python manage.py createsuperuser
    

プロンプトが表示されたら、ユーザー名 (小文字、スペースなし)、電子メール アドレス、およびパスワードを入力します。 タイプしてる間パスワードは見えなくても大丈夫、それが正常です。タイプしてEnterを押して続けましょう。 そうすればこのように見えるはずです。（ユーザーネームとパスワードは今あなたがタイプしたものです。）

    Username: admin
    Email address: admin@admin.com
    Password:
    Password (again):
    Superuser created successfully.
    

Return to your browser. Log in with the superuser's credentials you chose; you should see the Django admin dashboard.

![Django admin](images/django_admin3.png)

Go to Posts and experiment a little bit with it. Add five or six blog posts. Don't worry about the content – you can simply copy-paste some text from this tutorial to save time. :)

Make sure that at least two or three posts (but not all) have the publish date set. It will be helpful later.

![Django admin](images/edit_post3.png)

If you want to know more about Django admin, you should check Django's documentation: https://docs.djangoproject.com/en/1.11/ref/contrib/admin/

This is probably a good moment to grab a coffee (or tea) or something to eat to re-energize yourself. You created your first Django model – you deserve a little break!