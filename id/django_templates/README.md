# Django templates

Saatnya menampilkan data! Django menyediakan fitur bawaan berupa **template tags** untuk keperluan tersebut.

## Apa itu template tags?

You see, in HTML, you can't really write Python code, because browsers don't understand it. They know only HTML. We know that HTML is rather static, while Python is much more dynamic.

**Django template tags** allow us to transfer Python-like things into HTML, so you can build dynamic websites faster and easier. Cool!

## Menampilkan template post list

Di pembahasan sebelumnya kita menyediakan post list ke dalam variabel `posts`.

Untuk mencetak variabel ke dalam Django templates, kita menggunakan dua buah karakter kurung kurawal denga nama variable di dalamnya, seperti ini:

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
{{ posts }}
```

Terapkan ke template `blog/templates/blog/post_list.html`. Ubah semua dari `<div>` kedua sampai dengan `</div>` ketiga ganti dengan `{{ posts }}`. Simpan file, dan refresh halaman untuk melihat hasil perubahan:

![Figure 13.1](images/step1.png)

Seperti yang bisa kita lihat, tercetak seperti berikut:

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
<QuerySet [<Post: My second post>, <Post: My first post>]>
```

Yang berarti Django dapat mengenalinya sebagai list objek. Ingat pembahasan dari **Introduction to Python** bagaimana kita menampilkan list? Ya, dengan loop! Di Django template, kita menerapkannya seperti ini:

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
{% for post in posts %}
    {{ post }}
{% endfor %}
```

Cobalah terapkan di template.

![Figure 13.2](images/step2.png)

It works! But we want the posts to be displayed like the static posts we created earlier in the **Introduction to HTML** chapter. You can mix HTML and template tags. Our `body` will look like this:

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
<div>
    <h1><a href="/">Django Girls Blog</a></h1>
</div>

{% for post in posts %}
    <div>
        <p>published: {{ post.published_date }}</p>
        <h1><a href="">{{ post.title }}</a></h1>
        <p>{{ post.text|linebreaksbr }}</p>
    </div>
{% endfor %}
```

{% raw %}Everything you put between `{% for %}` and `{% endfor %}` will be repeated for each object in the list. Refresh your page:{% endraw %}

![Figure 13.3](images/step3.png)

Have you noticed that we used a slightly different notation this time (`{{ post.title }}` or `{{ post.text }})`? We are accessing data in each of the fields defined in our `Post` model. Also, the `|linebreaksbr` is piping the posts' text through a filter to convert line-breaks into paragraphs.

## One more thing

It'd be good to see if your website will still be working on the public Internet, right? Let's try deploying to PythonAnywhere again. Here's a recap of the steps…

* First, push your code to Github

{% filename %}command-line{% endfilename %}

    $ git status
    [...]
    $ git add --all .
    $ git status
    [...]
    $ git commit -m "Modified templates to display posts from database."
    [...]
    $ git push
    

* Then, log back in to [PythonAnywhere](https://www.pythonanywhere.com/consoles/) and go to your **Bash console** (or start a new one), and run:

{% filename %}PythonAnywhere command-line{% endfilename %}

    $ cd my-first-blog
    $ git pull
    [...]
    

* Finally, hop on over to the [Web tab](https://www.pythonanywhere.com/web_app_setup/) and hit **Reload** on your web app. Your update should be live! If the blog posts on your PythonAnywhere site don't match the posts appearing on the blog hosted on your local server, that's OK. The databases on your local computer and Python Anywhere don't sync with the rest of your files.

Congrats! Now go ahead and try adding a new post in your Django admin (remember to add published_date!) Make sure you are in the Django admin for your pythonanywhere site, https://yourname.pythonanywhere.com/admin. Then refresh your page to see if the post appears there.

Works like a charm? We're proud! Step away from your computer for a bit – you have earned a break. :)

![Figure 13.4](images/donut.png)