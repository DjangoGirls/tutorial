# Django views - yaratma zamanı geldi!

Evvelki bölümde yaptığımız hatayı yok edelim :)

*view*, "uygulama mantığının" ifade edildiği yerdir. Daha önce oluşturulan `model` den bilgi alıp `template`'e iletir. Gelecek bölümde bir template oluşturacağız. View'ler bildiğiniz Python methodlarıdır. Ancak, **Python'a Giriş** bölümünde yazdığımız methodlardan biraz daha karmaşıktır.

View'ler `views.py` doyasına yazılır. Şimdi, `blog/views.py` dosyasına *view* ekleyelim.

## blog/views.py

Dosyayı açıp inceleyelim:

```python 
from django.shortcuts import render

# View'lar buraya yazılacak.
```

Henüz fazla bir şey görünmüyor. En basitinden *view* şöyle olabilir.

```python 
def post_list(request):     
    return render(request, 'blog/post_list.html', {})
```

Burada, `request (istek)` i alıp template `blog/post_list.html` ile görüntüleyen `render` methodunu `döndüren` `post_list` isimli bir method yarattık.

Dosyamızı kaydedelim ve http://127.0.0.1:8000/ e gidip bakalım.

Yine hata! Okuyup anlamaya çalışalım:

![Hata][1]

 [1]: images/error.png

Bu hatayı düzeltmek kolay: *TemplateDoesNotExist* (Template bulunamadı). Bu hatayı template oluşturarak gelecek bölümde düzeltelim!

> Django view hakkında daha fazla bilgi edinmek için dokümantasyonları okuyun: https://docs.djangoproject.com/en/1.8/topics/http/views/