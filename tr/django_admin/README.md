# Django admin

Az önce modellediğimiz gönderilere ekleleme, düzenleme yada silme işlemi yapmak için Django admini kullanacağız.

Şimdi `blog/admin.py` dosyasını açarak İçeriği bununla değiştirelim:

{% filename %}blog/admin.py{% endfilename %}

```python
from django.contrib import admin
from .models import Post

admin.site.register(Post)
```

Gördüğünüz gibi, bir önceki bölümde tanımladığımız gönderi modelini admin. py dosyamıza dahil (import) ettik. Admin sayfasında modelimizi görünür kılabilmek için, Modeli `admin.site.register(Post)` ile kaydetmemiz gerekiyor.

Tamam, artık admin sayfasında gönderi modelimize göz atabiliriz. Web sunucusunu çalıştırmak için komut satırında `python manage.py runserver` komutunu çalıştırmayı unutmayın. Tarayacınıza gidin ve adresi yazın http://127.0.0.1:8000/admin/. Bunun gibi bir giriş ekranı göreceksiniz:

![Giriş sayfası](images/login_page2.png)

Giriş yapabilmek için, sitedeki her şey üzerinde kontrolü olan *superuser* - bir kullanıcı hesabı oluşturmanız gerekiyor. Komut satırana geri giderek `python manage.py createsuperuser` yazın ve enter'a basın.

> Unutmayın, ağ sunucusu açıkken yeni komut yazmak için, yeni bir terminal penceresi açın ve virtualenv'nizi aktif edin. **Web sunucusu başlatma** bölümünde, **Sizin ilk Django projeniz!** kısmında yeni komutların nasıl yazılacağını gözden geçirdik.

{% filename %}Mac OS X veya Linux:{% endfilename %}

    (myvenv) ~/djangogirls$ python manage.py createsuperuser
    

{% filename %}Windows:{% endfilename %}

    (myvenv) C:\Users\Name\djangogirls> python manage.py createsuperuser
    

İstendiğinde, kullanıcı adınızı (küçük harf, boşluksuz), e-posta adresinizi ve şifrenizi yazın. **Yazdığınız şifreyi göremezseniz endişelenmeyin - olması gerekenler burada var.** Devam etmek için şifreyi yazıp `enter` 'e bas. Çıktı şu şekilde olmalıdır (kullanıcı adı ve e-postanın sizin tarafınızdan olması gerekir):

    Kullanıcı adı: admin
    E-posta adresi: admin@admin.com
    Şifre:
    Şifre (tekrar):
    Süper kullanıcı başarıyla oluşturuldu.
    

Tarayıcınıza dönün. Seçtiğiniz süper kullanıcının kimlik bilgileri ile oturum açın; Django admin gösterge panelini göreceksiniz.

![Django admin](images/django_admin3.png)

Mesajlara gidin ve onunla biraz deneme yapın. Beş veya altı blog yazısı ekleyin. İçerik hakkında endişelenmeyin - zamandan kazanmak için bu öğreticiden bazı metinleri kopyalayıp yapıştırın. :)

En az iki veya üç yazının (ama hepsinin değil) yayınlanma tarihinin ayarlanmış olduğundan emin olun. Bu size daha sonra yardımcı olacak.

![Django admin](images/edit_post3.png)

Django admin hakkında daha fazla bilgi edinmek isterseniz, Django'nun belgelerini kontrol etmelisiniz: https://docs.djangoproject.com/en/1.11/ref/contrib/admin/

Bu, muhtemelen kendinize yeniden enerji vermek için bir kahve (veya çay) veya başka şeyler yemek için iyi bir an. İlk Django modelinizi yarattınız - küçük bir molayı hak ettiniz!