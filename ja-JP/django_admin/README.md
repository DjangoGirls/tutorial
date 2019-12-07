# Django admin

ブログの投稿を追加、編集、削除するのにDjango adminを使います。

`blog/admin.py`ファイルをエディタで開いて、内容をこのように変えて下さい：

{% filename %}blog/admin.py{% endfilename %}

```python
from django.contrib import admin
from .models import Post

admin.site.register(Post)
```

見て分かる通り、前回定義したPostモデルをimportしています。 モデルをAdminページ（管理画面）上で見えるようにするため、`admin.site.register(Post)`でモデルを登録する必要があります。

ではPostモデルを見てみましょう。 Web サーバーを実行するコンソールで `python manage.py runserver` を実行してください。 ブラウザに行って http://127.0.0.1:8000/admin/ とアドレスバーにタイプします。 こんなログインページが出ますね。

![ログインページ](images/login_page2.png)

ログインするには、*superuser *（サイトの全てを管理するユーザー）を作る必要があります。 コマンドラインに戻り、`python manage.py createsuperuser` と入力し、enter キーを押します。

> Webサーバーを実行しているときに新しいコマンドを入力したい場合は、新しいターミナルウィンドウを開き、仮想環境（virtualenv）を有効にすることを思い出してください。 **プロジェクトを作成しよう！**の**ウェブサーバを起動する**セクションでどうやって新しいコマンドを書くかというのを見直しました。

{% filename %}Mac OS X または Linux:{% endfilename %}

    (myvenv) ~/djangogirls$ python manage.py createsuperuser
    

{% filename %}Windows:{% endfilename %}

    (myvenv) C:\Users\Name\djangogirls> python manage.py createsuperuser
    

プロンプトが表示されたら、ユーザー名 (小文字、スペースなし)、電子メール アドレス、およびパスワードを入力します。 **タイプしてる間パスワードは見えなくても大丈夫、それが正常です。**タイプして`Enter`を押して続けましょう。 そうすればこのように見えるはずです。（ユーザーネームとパスワードは今あなたがタイプしたものです。）

    Username: ola
    Email address: ola@example.com
    Password:
    Password (again):
    Superuser created successfully.
    

ブラウザに戻ってsuperuserでログインすると、Django admin ダッシュボードが見えるでしょう。

![Django admin](images/django_admin3.png)

Postsをクリックして移動し、少し試してみましょう。 5つか6つほど記事を追加してみることにします。 内容は気にしなくて大丈夫です。ローカルコンピュータで、あなただけに見える記事ですので。また、時間を節約するため、このチュートリアルからテキストをコピー&ペーストしても構いません。 :)

少なくとも 2 つまたは 3 つの記事 (すべてではない) は公開日がセットされているようにしてください。後ほど役に立ちます。

![Django admin](images/edit_post3.png)

Django adminについてもっと知りたいときは、Djangoのドキュメントを見るとよいでしょう。https://docs.djangoproject.com/ja/2.2/ref/contrib/admin/

ここでそろそろコーヒー（または紅茶）か何か食べるものを摂って自分を元気づけるのにいいタイミングでしょう。最初のDjangoモデルを作ったのだから、少し休みをとっていいところです！