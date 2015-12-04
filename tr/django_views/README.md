# Django views - yaratma zamanı geldi!

Evvelki bölümde yaptığımız hatayı yok edelim :)

*Görünüm* uygulamanın "mantığı"nın ifade edildiği yerdir. Daha önce oluşturulan `model` den bilgi alıp `template`'a iletir. Gelecek bölümde bir template oluşturacağız. Görünümler bildiğiniz Python metodlarıdır. Ancak, **Python'a Giriş** bölümünde yazdığımız metodlardan biraz daha karmaşıktır.

Görünümler `views.py` doyasına yazılır. Şimdi, `blog/views.py` dosyasına *görünüm (view)* ekleyelim.

## blog/views.py

Dosyayı açıp inceleyelim:

```python 
from django.shortcuts import render

# Görünümler buraya yzaılacak.
```

Henüz fazla bir şey görünmüyor. En basitinden *görünüm* şöyle olabilir.

```python 
def post_list(request):     
    return render(request, 'blog/post_list.html', {})
```

Burada, `request` i alıp şablonumuzu `blog/post_list.html` ile görüntüleyen `render` metodunu `döndüren` `post_list` isimli bir metod yarattık.

Dosyamızı kaydedelim ve http://127.0.0.1:8000/ e gidip bakalım.

Yine hata! Okuyup anlamaya çalışalım:

![Hata][1]

 [1]: images/error.png

Bu hatayı düzeltmek kolay: *TemplateDoesNotExist* (Şablon yok). Şablonu (Template) bulamadı. Bu hatayı şablonu oluşturarak gelecek bölümde düzeltelim!

> Django görünümleri(view) hakkında daha fazla bilgi edinmek için resmi dokümantasyonları okuyun: https://docs.djangoproject.com/en/1.8/topics/http/views/