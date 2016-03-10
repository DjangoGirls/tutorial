# Django admin

Modelini hazırladığımız yazıları eklemek, düzenlemek ve silmek için Django admin'i kullanacağız.

Hadi `blog/admin.py` dosyasını açalım ve içeriğini şununla değiştirelim:

```python
from django.contrib import admin
from .models import Post

admin.site.register(Post)
```    

Gördüğünüz gibi, bir önceki bölümde tanımladığımız Post modelini admin.py dosyamıza dahil (import) ettik. Modelimizi admin sayfasında görünür yapmak için modeli `admin.site.register(Post)` ile belirtmemiz gerekir..

Tamam, artık admin sayfasında Post modelimize göz atabiliriz. Web sunucusunu çalıştırmak için komut satırında `python manage.py runserver` komutunu çalıştırmayı unutmayın. Tarayıcınızda http://127.0.0.1:8000/admin/ adresini adres çubuğuna yazın. Aşağıdaki gibi bir giriş sayfası göreceksiniz:

![Giriş sayfası][1]

 [1]: images/login_page2.png

Giriş yapmak için, sitede her şeyin üzerinde kontrolü olan bir kullanıcı, yani bir *superuser* oluşturmanız gerekiyor. Komut satırında `python manage.py createsuperuser` yazın ve enter tuşuna basın. Giriş satırı geldiğinde, kullanıcı adınızı (küçük harfler ile ve boşluksuz), email adresinizi ve parolanızı girin. Parolayı yazarken ekranda bir şey çıkmayacaktır. Sadece yazın ve `enter` tuşuna basıp devam edin. Çıktısı aşağıdaki formatta olacaktır (kullanıcı adı ve email sizinki olacak):

```
(myvenv) ~/djangogirls$ python manage.py createsuperuser Username: admin Email address: admin@admin.com Password: Password (again): Superuser created successfully.
```

Tarayıcınıza dönün. Oluşturduğunuz superuser'ın bilgileri ile giriş yaptığınızda Django'nun admin panelini göreceksiniz.

![Django admin][2]

 [2]: images/django_admin3.png

Posts'a tıklayın ve biraz kurcalayın. Mesela üç beş tane blog yazısı ekleyin ve ne yazacağım diye düşünmeyin - zaman kazanmak için bu tutorial'dan kopyalayıp yapıştırabilirsiniz. :)

En azından iki ya da üç yazıya (ama hepsinin değil) yayınlama tarihi girdiğinizden emin olun. Bunu ileriki adımlarda kullanacağız.

![Django admin][3]

 [3]: images/edit_post3.png

Eğer Django admin ile ilgili daha fazla şey öğrenmek istiyorsanız Django'nun belgelerine göz atabilirsiniz: https://docs.djangoproject.com/en/1.8/ref/contrib/admin/

Şimdi enerjinizi toplamak için kendinize bir çay veya kahve alabilirsiniz. Ne de olsa ilk Django modelinizi oluşturdunuz - biraz molayı hak ediyorsunuz. :)