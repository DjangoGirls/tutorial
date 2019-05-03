# Select2 elements

Forms with just text are fine, and our model only contains CharField fields.
In general, model classes will be linked with each other, and some fields
will be a link to objects from a different class.

Let's start small, let's just add a field to our blog post, that indicates
the category of the post.  Think of "history", or "nature", "family", or
"science".  not all your thoughts fall in the same category!

We're going to alter the model, ask Django to create a migration on the
model, store it in the repository — necessary for the deployment, run it.
We'll do some minimal further adjustment, and appreciate the power and
flexibility of what we did in the previous Forms step.  Then we'll explore
the ``select2`` external module.

This is the change to the ``models.py`` file:

{% filename %}blog/models.py{% endfilename %}
```diff
modified   blog/models.py
@@ -2,10 +2,24 @@ from django.conf import settings
 from django.db import models
 from django.utils import timezone
 
+POST_CATEGORIES = (
+    ('geek', 'geek.png'),
+    ('hist', 'history.png'),
+    ('idea', 'idea.png'),
+    ('lang', 'languages.png'),
+    ('netw', 'network.png'),
+    ('prou', 'proud.png'),
+    ('refe', 'reference.png'),
+    ('soft', 'software.png'),
+    ('tech', 'technical.png'),
+)
+
+
 class Post(models.Model):
     author = models.ForeignKey(settings.AUTH_USER_MODEL, on_delete=models.CASCADE)
     title = models.CharField(max_length=200)
     text = models.TextField()
+    category = models.CharField(default="geek", max_length=4, choices=POST_CATEGORIES)
     created_date = models.DateTimeField(default=timezone.now)
     published_date = models.DateTimeField(blank=True, null=True)
```

And let's make sure our PostForm class informs its base class of the new field:

```diff
modified   blog/forms.py
@@ -6,4 +6,4 @@ class PostForm(forms.ModelForm):
 
     class Meta:
         model = Post
-        fields = ('title', 'text',)
+        fields = ('category', 'title', 'text', )
```

> Does the above text look unfamiliar?  We are using the ``diff`` format, it
> is composed of **hunks**, introduced by ``@@`` lines, and within a hunk,
> it gives some context in the form of lines that have not been altered, and
> then goes to the core of the change, given as lines starting with a ``-``
> (that should be removed) and others that start with a ``+`` (that should
> be added).  If it looks strange to a human, but still readable, it is
> extremely useful for automated **patching**, i.e.: invoking a program that
> knows how to apply the change to the existing text.  You will see a lot of
> these ``patches`` if you stay with git.

Shall we make this new field also visible in the post list?  Again, the
addition in ``diff`` format.

```diff
modified   blog/templates/blog/post_list.html
@@ -6,7 +6,7 @@
   <div class="date">
     <p>published: {{ post.published_date }}</p>
   </div>
-  <h2><a href="{% url 'post_detail' pk=post.pk %}">{{ post.title }}</a></h2>
+  <h2>{{ post.category }} <a href="{% url 'post_detail' pk=post.pk %}">{{ post.title }}</a></h2>
   <p>{{ post.text|linebreaksbr }}</p>
 </div>
 {% endfor %}
```

With this code in place, the blog site will not work any more: it will
complain about the still not existing 'category' field.  After all, we just
added to the model, and what does the database know of what we write in our
Python code?  Nothing as of now, and everything, as soon as we ask Django to
come in rescue, with its 'migrations'.

Run the following two commands from the {% filename %}command-line{% endfilename %}
```
(myvenv) ~/djangogirls$ python manage.py makemigrations blog
Migrations for 'blog':
  blog/migrations/0002_post_category.py
    - Add field category to post
(myvenv) ~/djangogirls$ python manage.py migrate blog
Operations to perform:
  Apply all migrations: admin, auth, blog, contenttypes, sessions
Running migrations:
  Applying blog.0002_post_category... OK
```

And again run the server.

Navigate to your localhost, and take notice of what we changed.  In the
list, you see a four-chars text, in front of each post title.  This is the
code of the category.  In the post_edit form, you will see a new ``select``
element.  Experiment with changing a few, and see what happens in the
``post_list``.  Do notice how the ``post_list`` shows the internal code,
while the ``select`` element offers the human readable equivalent.
