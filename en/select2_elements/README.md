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

With this code in place, the blog site will not work any more: it will
complain about the still not existing 'category' field.  Django comes in
rescue with 'migrations'.

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

