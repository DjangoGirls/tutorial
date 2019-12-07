# Djangoモデル

さて、ブログの投稿をためておくものが欲しいですよね。そのために `オブジェクト` についてちょっとお話しします。

## オブジェクト

プログラミングには `オブジェクト指向プログラミング` という概念があります。 それは、退屈なプログラムを繰り返し書く代わりにモデルになるものを作って、それが他とどう作用するかを定義するという考え方です。

じゃあオブジェクトって何なの？って思いますよね。オブジェクトは状態（プロパティ）と命令（アクション）の塊です。ピンと来ないでしょうから例を挙げましょう。

猫をモデルにしたいときは、`猫(Cat)` オブジェクトを作ります。そのプロパティは、`色(color)` 、`年齢(age)` 、`機嫌(mood)`（いい、悪い、眠い）、`飼い主(owner)`（ `人(Person)` オブジェクトですね、捨て猫ならそのプロパティは空白）です。

`猫` のアクションは、`喉を鳴らす(purr)` 、`引っ掻く(scratch)` 、`餌を食べる(feed)`（ `キャットフード(CatFood)` などで、それはまた `味(taste)` というプロパティを持つ別のオブジェクトになるでしょう。）

    Cat
    --------
    color
    age
    mood
    owner
    purr()
    scratch()
    feed(cat_food)
    

    CatFood
    --------
    taste
    

つまり、オブジェクト指向とは実際の物を、プロパティ（ `オブジェクト・プロパティ` と呼びます）と命令（ `メソッド` と呼びます）を持つコードで表現するという考え方です。

ではブログの投稿はどういうモデルになるでしょうか。ブログが作りたいんですよね？

それにはブログの投稿とは何か、それはどんなプロパティがあるかという問いに答えなければなりません。

まず確実なのはブログの投稿にはコンテンツとタイトルが必要ですね。 それからそれを書いた人が分かるといいでしょう。 最後に、投稿をいつ作成、公開したかも分かるといいですね。

    Post
    --------
    title
    text
    author
    created_date
    published_date
    

ではブログポストがどうなればいいですか？ポストが公開されるといいですよね？

なので `publish` メソッドが必要です。

達成したいことが分かったので、Djangoでモデリングの開始です！

## Djangoモデル

オブジェクトが何か分かったので、ブログポストのDjangoモデルを作りましょう。

Djangoのモデルは特別なオブジェクトで、`データベース` に格納されます。 データベースはデータの集まりです。 ここにユーザーやブログポストの情報を格納します。 データを格納するのにSQLiteデータベースを使います。 これはDjangoのデフォルトのデータベースで、今はこれで十分です。

データベースの中のモデルは、列（フィールド）と行（データ）があるスプレッドシートと思ってもらっても結構です。

### 新しいアプリケーションの作成

全部をきちんと整理しておくため、プロジェクトの中に別のアプリケーションを作ります。 初めから全てを整理しておくのはとっても良いことです。 アプリケーションを作るために、次のコマンドをコンソールの中で走らせましょう。（`manage.py` ファイルがある `djangogirls` ディレクトリでコマンドをタイプしてくださいね）

{% filename %}Mac OS X and Linux:{% endfilename %}

    (myvenv) ~/djangogirls$ python manage.py startapp blog
    

{% filename %}Windows:{% endfilename %}

    (myvenv) C:\Users\Name\djangogirls> python manage.py startapp blog
    

新しく `blog` ディレクトリが作られて、今沢山のファイルがそこに入っているのに気がついたでしょう。ディレクトリとファイルはこんな風に見えるはずです：

    djangogirls
    ├── blog
    │   ├── admin.py
    │   ├── apps.py
    │   ├── __init__.py
    │   ├── migrations
    │   │   └── __init__.py
    │   ├── models.py
    │   ├── tests.py
    │   └── views.py
    ├── db.sqlite3
    ├── manage.py
    ├── mysite
    │   ├── __init__.py
    │   ├── settings.py
    │   ├── urls.py
    │   └── wsgi.py
    ├── myvenv
    │   └── ...
    └── requirements.txt
    
    

アプリケーションを作ったら、Djangoにそれを使うように伝えないといけません。 それは `mysite/settings.py` でします。エディタでこれを開いてください。 `INSTALLED_APPS` を見つけて `]` の上に `'blog.apps.BlogConfig',` という一行を追加します。 そうすると、最終的には以下のようになりますね。

{% filename %}mysite/settings.py{% endfilename %}

```python
INSTALLED_APPS = [
    'django.contrib.admin',
    'django.contrib.auth',
    'django.contrib.contenttypes',
    'django.contrib.sessions',
    'django.contrib.messages',
    'django.contrib.staticfiles',
    'blog.apps.BlogConfig',
]
```

### ブログポストモデルの作成

`blog/models.py` ファイルで `Model` と呼ばれるオブジェクトを全て定義します。これがブログポストを定義する場所です。

`blog/models.py` をエディタで開いて中身を全部削除し、下のコードを書きましょう。

{% filename %}blog/models.py{% endfilename %}

```python
from django.conf import settings
from django.db import models
from django.utils import timezone


class Post(models.Model):
    author = models.ForeignKey(settings.AUTH_USER_MODEL, on_delete=models.CASCADE)
    title = models.CharField(max_length=200)
    text = models.TextField()
    created_date = models.DateTimeField(default=timezone.now)
    published_date = models.DateTimeField(blank=True, null=True)

    def publish(self):
        self.published_date = timezone.now()
        self.save()

    def __str__(self):
        return self.title
```

> `str` の両側に2つのアンダースコア（ `_` ）がちゃんと入っているか確認しましょう。 これはPythonでよく使われて、"ダンダー"（ダブルアンダースコア）と呼ばれます。

難しそうでしょ？でも大丈夫！ちゃんと説明しますから。

`from` とか `import` で始まる行は全部、他のファイルから何かをちょこっとずつ追加する行です。 なので色んなファイルから必要な部分をコピペする代わりに `from ... import ...` で必要部分を入れることができます。

`class Post(models.Model):` – この行が今回のモデルを定義します (これが `オブジェクト` です)。

- classはオブジェクトを定義してますよ、ということを示すキーワードです。
- `Post` はモデルの名前で、他の名前をつけることもできます（が、特殊文字と空白は避けなければいけません）。モデルの名前は大文字で始めます。
- `models.Model` はポストがDjango Modelだという意味で、Djangoが、これはデータベースに保存すべきものだと分かるようにしています。

さて今度はプロパティを定義しましょう：`title`、`text`、`created_date`、`published_date`、それに `author` ですね。 それにはまずフィールドのタイプを決めなければいけません。（テキスト？ 数値？ 日付？ 他のオブジェクト、例えばユーザーとの関係？）

- `models.CharField` – 文字数が制限されたテキストを定義するフィールド
- `models.TextField` – これは制限無しの長いテキスト用です。ブログポストのコンテンツに理想的なフィールドでしょ？
- `models.DateTimeField` – 日付と時間のフィールド
- `models.ForeignKey` – これは他のモデルへのリンク

コードの細かいところまでは説明し出すと時間がかかるので、ここではしませんが、 モデルのフィールドや上記以外の定義のやり方について知りたい方は是非Djangoドキュメントを見てみて下さい。 (https://docs.djangoproject.com/ja/2.2/ref/models/fields/#field-types)

`def publish(self):` は何かと言うと、 これこそが先程お話ししたブログを公開するメソッドそのものです。 `def` は、これはファンクション（関数）/メソッドという意味です。`publish` はメソッドの名前で、 変えることもできます。 メソッドの名前に使っていいのは、英小文字とアンダースコアで、アンダースコアはスペースの代わりに使います。 （例えば、平均価格を計算するメソッドは `calculate_average_price` っていう名前にします）

メソッドは通常何かを `return` します。 一つの例が `__str__` メソッドにあります。 このシナリオでは、`__str__()` を呼ぶと、ポストのタイトルのテキスト（**string**）が返ってきます。

`def publish(self):` と `def __str__(self):` の両方が class キーワードに続く行でインデントされているのに気づきましたか？ Pythonにモデルのメソッドだと伝えるために、class キーワードに続く行ではメソッドをインデントしましょう。 そうしないと、メソッドはモデルのものではなくなり、思ってもみない振る舞いをするでしょう。

もしモデルがまだはっきりつかめないようだったら、気軽にコーチに聞いて下さい！ 特にオブジェクトとファンクションを同時に習ったときはとても複雑なのはよく分かってますから。 でも前ほど魔法みたいじゃないといいですけど！

### データベースにモデルのためのテーブルを作成する

最後のステップは新しいモデルをデータベースに追加することです。 まず、モデルに少し変更があったこと（今作ったこと）をDjangoに知らせましょう。 コンソールで `python manage.py makemigrations blog` とタイプします。 こんな感じですね。

{% filename %}command-line{% endfilename %}

    (myvenv) ~/djangogirls$ python manage.py makemigrations blog
    Migrations for 'blog':
      blog/migrations/0001_initial.py:
    
      - Create model Post
    

**メモ：**編集したファイルを忘れずに保存してくださいね。保存しないと、コンピュータが以前のパージョンのファイルを実行してしまい、思ってもみないエラーメッセージに出くわすかもしれません。

Djangoが作ってくれた移行ファイルを私たちがデータベースに追加すれば完了です。`python manage.py migrate blog` とタイプするとこうなるでしょう。

{% filename %}command-line{% endfilename %}

    (myvenv) ~/djangogirls$ python manage.py migrate blog
    Operations to perform:
      Apply all migrations: blog
    Running migrations:
      Applying blog.0001_initial... OK
    

やった～！ポストモデルがデータベースに入りました。どうなったか見たいでしょ？次へ進みましょう！