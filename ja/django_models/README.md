# Django models

What we want to create now is something that will store all the posts in our blog. But to be able to do that we need to talk a little bit about things called `objects`.

## オブジェクト

There is a concept in programming called `object-oriented programming`. The idea is that instead of writing everything as a boring sequence of programming instructions, we can model things and define how they interact with each other.

じゃあオブジェクトって何なの？って思いますよね。オブジェクトは状態（プロパティ）と命令（アクション）の塊です。ピンと来ないでしょうから例を挙げましょう。

If we want to model a cat, we will create an object `Cat` that has some properties such as `color`, `age`, `mood` (like good, bad, or sleepy ;)), and `owner` (which could be assigned a `Person` object – or maybe, in case of a stray cat, this property could be empty).

Then the `Cat` has some actions: `purr`, `scratch`, or `feed` (in which case, we will give the cat some `CatFood`, which could be a separate object with properties, like `taste`).

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
    

So basically the idea is to describe real things in code with properties (called `object properties`) and actions (called `methods`).

ではブログポストはどういうモデルになるでしょうか。ブログが作りたいんですよね？

それにはブログポストとは何か、それはどんなプロパティがあるかという問いに答えなければなりません。

まず確実なのはブログポストにはコンテンツと表題がが必要ですね。 It would be also nice to know who wrote it – so we need an author. 最後にポストの作成公開した時間も分かるといいですね。

    Post
    --------
    title
    text
    author
    created_date
    published_date
    

ではブログポストがどうなればいいですか？ポストをが公開されるといいですよね？

なのでpublishメソッドが必要です。

達成したいことが分かったので、Djangoでモデリングの開始です！

## Django model

オブジェクトが何か分かったので、ブログポストのDjangoモデルを作りましょう。

A model in Django is a special kind of object – it is saved in the `database`. データベースはデータの集まりです。 ここにユーザーやブログポストの情報を格納します。 データを格納するのにSQLiteデータベースを使います。 This is the default Django database adapter – it'll be enough for us right now.

データベースの中のモデルは、列（フィールド）と行（データ）があるスプレッドシートと思ってもらっても結構です。

### Creating an application

全部をきちんと整理しておくため、プロジェクトの中に別のアプリケーションを作ります。 初めから全てを整理しておくのはとっても良いことです。 アプリケーションを作るには、次のコマンドをコンソールの中で走らせなけれなりません。（manage.pyファイルがあるdjangogirlsディレクトリから）：

{% filename %}command-line{% endfilename %}

    (myvenv) ~/djangogirls$ python manage.py startapp blog
    

You will notice that a new `blog` directory is created and it contains a number of files now. The directories and files in our project should look like this:

    djangogirls
    ├── blog
    │   ├── __init__.py
    │   ├── admin.py
    │   ├── apps.py
    │   ├── migrations
    │   │   └── __init__.py
    │   ├── models.py
    │   ├── tests.py
    │   └── views.py
    ├── db.sqlite3
    ├── manage.py
    └── mysite
        ├── __init__.py
        ├── settings.py
        ├── urls.py
        └── wsgi.py
    

After creating an application, we also need to tell Django that it should use it. それはmysite/settings.pyファイルの中でやります。 We need to find `INSTALLED_APPS` and add a line containing `'blog',` just above `]`. そうすると、最終的には以下のようになりますね。

{% filename %}mysite/settings.py{% endfilename %}

```python
INSTALLED_APPS = [
    'django.contrib.admin',
    'django.contrib.auth',
    'django.contrib.contenttypes',
    'django.contrib.sessions',
    'django.contrib.messages',
    'django.contrib.staticfiles',
    'blog',
]
```

### Creating a blog post model

In the `blog/models.py` file we define all objects called `Models` – this is a place in which we will define our blog post.

Let's open `blog/models.py`, remove everything from it, and write code like this:

{% filename %}blog/models.py{% endfilename %}

```python
from django.db import models
from django.utils import timezone


class Post(models.Model):
    author = models.ForeignKey('auth.User')
    title = models.CharField(max_length=200)
    text = models.TextField()
    created_date = models.DateTimeField(
            default=timezone.now)
    published_date = models.DateTimeField(
            blank=True, null=True)

    def publish(self):
        self.published_date = timezone.now()
        self.save()

    def __str__(self):
        return self.title
```

> Double-check that you use two underscore characters (`_`) on each side of `str`. これはPythonでよく使われて"ダンダー"(ダブルアンダースコア）と呼んでいます。

It looks scary, right? But don't worry – we will explain what these lines mean!

Fromとかimportで始まる行は全部他のファイルから何かをちょこっとずつ追加する行です。 なので色んなファイルから必要な部分をコピペする代わりにfrom ... import ... で必要部分を入れられるんです。 import ...</code>.

`class Post(models.Model):` – this line defines our model (it is an `object`).

- classはオブジェクトを定義してますよ、ということを示すキーワードです。
- `Post` is the name of our model. We can give it a different name (but we must avoid special characters and whitespace). Always start a class name with an uppercase letter.
- models.ModelはポストがDjango Modelだという意味で、Djangoが、これはデータベースに保存すべきものだと分かるようにしています。

さて今度はプロパティを定義しましょう：title、text、created_date、published_date、それにauthorですね。 To do that we need to define the type of each field (Is it text? 数字？ 日付？ A relation to another object, like a User?)

- `models.CharField` – this is how you define text with a limited number of characters.
- `models.TextField` – this is for long text without a limit. Sounds ideal for blog post content, right?
- `models.DateTimeField` – this is a date and time.
- `models.ForeignKey` – this is a link to another model.

コードの細かいところまでは説明し出すと時間がかかるので、ここではしませんが、 You should take a look at Django's documentation if you want to know more about Model fields and how to define things other than those described above (https://docs.djangoproject.com/en/1.11/ref/models/fields/#field-types).

Def publish(self): は何かと言うと、 This is exactly the `publish` method we were talking about before. defは、これはファンクション（関数）/メソッドといいう意味です。 You can change the name of the method if you want. The naming rule is that we use lowercase and underscores instead of spaces. For example, a method that calculates average price could be called `calculate_average_price`.

メソッドは通常何かをreturnします。 一つの例が__str__メソッド にあります。 このシナリオでは、__str__() を呼ぶと、ポストの表題のテキスト(string) が返ってきます。

Also notice that both `def publish(self):` and `def __str__(self):` are indented inside our class. Because Python is sensitive to whitespace, we need to indent our methods inside the class. Otherwise, the methods won't belong to the class, and you can get some unexpected behavior.

もしモデルがまだはっきりつかめないようだったら、気軽にコーチに聞いて下さい！ 特にオブジェクトとファンクションを同時に習ったときはとても複雑なのはよく分かってますから。 でも前ほど魔法みたいじゃないといいですけど！

### Create tables for models in your database

最後のステップは新しいモデルをデータベースに追加することです。 First we have to make Django know that we have some changes in our model. (We have just created it!) Go to your console window and type `python manage.py makemigrations blog`. こんな感じですね。

{% filename %}command-line{% endfilename %}

    (myvenv) ~/djangogirls$ python manage.py makemigrations blog
    Migrations for 'blog':
      blog/migrations/0001_initial.py:
    
      - Create model Post
    

**Note:** Remember to save the files you edit. Otherwise, your computer will execute the previous version which might give you unexpected error messages.

Django prepared a migration file for us that we now have to apply to our database. Type `python manage.py migrate blog` and the output should be as follows:

{% filename %}command-line{% endfilename %}

    (myvenv) ~/djangogirls$ python manage.py migrate blog
    Operations to perform:
      Apply all migrations: blog
    Running migrations:
      Rendering model states... DONE
      Applying blog.0001_initial... OK
    

やった～！ポストモデルがデータベースに入りました。どうなったか見たいでしょ？次へ進みましょう！