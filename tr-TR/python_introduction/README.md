{% set warning_icon = '<span class="glyphicon glyphicon-exclamation-sign" style="color: red;" aria-hidden="true" data-toggle="tooltip" title="An error is expected when you run this command!" ></span>' %}

# Python'a giriş

> Bu bölümün bir kısmı Geek Girls Carrots tarafından hazırlanmış eğitimlere dayanılarak hazırlanmıştır (https://github.com/ggcarrots/django-carrots).

Biraz kod yazalım!

## Python komut istemi (prompt)

> Evdeki okuyucular için: Bu kısım [Python Temelleri: Tamsayılar, Dizeler, Listeler, Değişkenler ve Hatalar](https://www.youtube.com/watch?v=MO63L4s-20U) videosunda bulunabilir.

Python'la oynamaya başlamadan önce bilgisayarımızda bir *komut satırı* açmamız gerekiyor. Bunu zaten nasıl yapacağınızı artık biliyorsunuz, [Komut satırına giriş](../intro_to_command_line/README.md) bölümünde öğrenmiştiniz.

Hazır olduğunuzda, aşağıdaki talimatları takip edin.

Bir Python konsolu açmak istiyoruz; öyleyse Windows'ta `python`, Mac OS/Linux'ta `python3` yazıp, `enter`'a basın.

{% filename %}komut satırı{% endfilename %}

    $ python3
    Python 3.6.1 (...)
    Type "help", "copyright", "credits" or "license" for more information.
    >>>
    

## İlk Python komutunuz!

Python komutunu çalıştırdıktan sonra, komut istemi `>>>` şeklinde değişti. Bizim için bu, şimdi yalnızca Python dilinde komutlar kullanabileceğimiz anlamına geliyor. `>>>` yazmanıza gerek yok - Python bunu sizin için yapacak.

Eğer herhangi bir zamanda Python komut satırından çıkmak isterseniz, yalnızca `exit()` yazmanız ya da Windows için `Ctrl + Z`, Mac/Linux için `Ctrl + D` kısa yolunu kullanmanız yeterli. Bunu yaptığınız taktirde artık `>>>` yazısını görmeyeceksiniz.

Şimdilik, Python konsolundan çıkmak istemiyoruz. Bu konuda daha fazla bilgi edinmek istiyoruz. Biraz matematik yazarak başlayalım (` 2 + 3 ` gibi) ve `enter` 'a basalım.

{% filename %}komut satırı{% endfilename %}

```python
>>> 2 + 3
5
```

Güzel! Cevap nasıl da çıktı görüyor musun? Python matematik biliyor! Sen de diğer komutları şöyle deneyebilirsin:

- `4 * 5`
- `5 - 1`
- `40 / 2`

Üstel hesaplama yapmak için 2 üzeri 3 deyin, şöyle yazalım: {% filename %}komut-satırı{% endfilename %}

```python
>>> 2 ** 3
8
```

Bunları biraz kurcalayıp eğlen, sonra tekrar burada buluşalım. :)

Gördüğün gibi Python çok iyi bir hesap makinesi. Eğer başka neler yapabileceğini merak ediyorsan...

## String'ler (dizeler)

Mesela ismin? İsmini tırnak işaretleri içerisinde şu şekilde yaz:

{% filename %}komut satırı{% endfilename %}

```python
>>> "Zeynep"
'Zeynep'
```

İlk string'ini oluşturdun! String (dize), bilgisayar tarafından işlenebilen ve karakterlerden oluşan dizilerin genel adıdır. Bir string her zaman aynı özel karakterle başlamalı ve aynı özel karakterle bitmelidir. Tek tırnak (`'`) veya çift tırnak (`"`) olabilir (aralarında herhangi bir fark yok!). Tırnak işaretleri Python'da içlerinde olan şeyin bir string olduğunu ifade eder.

Stringler birbirlerine eklenebilir. Şunu dene:

{% filename %}komut satırı{% endfilename %}

```python
>>> "Merhaba " + "Zeynep"
'Merhaba Zeynep'
```

Ayrıca stringleri bir sayı ile çarpabilirsin:

{% filename %}komut satırı{% endfilename %}

```python
>>> "Zeynep" * 3
'ZeynepZeynepZeynep'
```

Eğer stringinin içerisine bir tırnak işareti koymak istiyorsan, bunun için iki seçeneğin var.

Çift tırnak kullanarak:

{% filename %}komut satırı{% endfilename %}

```python
>>> "Turgut Uyar'ın dizeleriyiz"
"Turgut Uyar'ın dizeleriyiz"
```

veya backslash (` \ `) kullanarak:

{% filename %}komut satırı{% endfilename %}

```python
>>> 'Turgut Uyar\'ın dizeleriyiz'
"Turgut Uyar'ın dizeleriyiz"
```

Hoş değil mi? İsminin tamamını büyük harf yapmak için, sadece şunu yazman yeterli:

{% filename %}komut satırı{% endfilename %}

```python
>>> "Zeynep".upper()
'ZEYNEP'
```

String'in üzerinde `upper` **fonksiyon**unu kullandın! Bir fonksiyon (`upper()` gibi), çağırıldığında (calling) Python'un girdi olarak verilen bir obje (`"Zeynep"`) üzerinde gerçekleştirmesi gereken bir dizi işleme denilir.

Eğer ismindeki harflerin sayısını öğrenmek istiyorsan bunun için de bir **fonksiyon** var!

{% filename %}komut satırı{% endfilename %}

```python
>>> len("Zeynep")
6
```

Fonksiyonları neden bazen stringin sonunda bir `.` ile (`"Zeynep".upper()` gibi) ve bazen de önce fonksiyonu çağırıp sonra parantez içerisine stringi yazarak kullandığımızı merak ediyor musun? Pekala, bazı durumlarda, fonksiyonlar bir takım nesnelere aittirler, mesela `upper()`, yalnızca stringler üzerinde kullanılabilir. Böyle durumlarda, bu tarz fonksiyonlara biz **method** ismini veriyoruz. Diğer durumlarda, bir fonksiyon özel olarak bir nesneye ait olmayıp, farklı çeşitlerde nesneler üzerinde de kullanılabilir, aynı `len()` gibi. İşte bu nedenle `"Zeynep"` stringini `len` fonksiyonuna bir parametre olarak veriyoruz.

### Özet

Tamam, stringlerden yeterince bahsettik. Şu ana kadar şu konuları öğrendin:

- **komut istemi** – komutları (kod) Python'un komut istemine yazdığınızda Python'da sonuçlandırarak yanıtlar üretir
- **sayılar ve dizeler** – Python'da sayılar matematik için dizeler ise metin nesneleri için kullanılmaktadır
- **operatörler** `+` ve `*` gibi, değerleri birleştirerek yeni bir değer üretmek için kullanılmaktadır
- **fonksiyonlar** `upper()` ve `len()` gibi, nesneler üzerinde eylemler gerçekleştirmektedirler.

Bunlar öğreneceğiniz her programlama dilinin temelleri. Biraz daha zor bir şey için hazır mısın? İddiaya gireriz öylesin!

## Hatalar

Şimdi yeni bir şey deneyelim. Bir sayının uzunluğunu, bir string'in uzunluğunu bulduğumuz gibi bulabilir miyiz? Bunu görmek için `len(304023)` yazıp `enter` a basalım:

{% filename %}{{ warning_icon }} komut satırı{% endfilename %}

```python
>>> len(304023)
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
TypeError: object of type 'int' has no len()
```

İlk hatamızı aldık! {{ warning_icon }} ikonu çalıştırmak üzere olduğunuz programın beklediğiniz gibi çalışmayacağı konusunda sizi ikaz eder. Hatalar yapmak (kasıtlı olanlar bile) öğrenmenin önemli bir kısmı!

Nesne türü "int" (tam sayılar, tüm sayılar) in uzunluğu olmadığını söylüyor. Şimdi ne yapabiliriz? Belki de rakamı bir string olarak yazabiliriz? Stringlerin bir uzunluğu var, değil mi?

{% filename %}komut satırı{% endfilename %}

```python
>>> len(str(304023))
6
```

İşe yaradı! `str` fonksiyonunu `len` fonksiyonunun içinde kullandık. `str` her şeyi string'e çeviriyor.

- `str` fonksiyonu, değişkenleri **stringe** çeviriyor
- `int` fonksiyonu değişkenleri **integera** çeviriyor

> Önemli: Sayıları metin durumuna getirebiliriz ama metni sayılar durumuna tam olarak getiremeyebiliriz - yine de `int('hello')` olsa ne olurdu?

## Değişkenler

Programlamada en önemli konulardan biri değişkenlerdir. Değişken (variable), daha sonra kullanmak istediğiniz bir yapıya verdiğiniz isimdir. Programcılar değişkenleri verileri tutmak ya da kodlarını daha okunabilir ve anlaşılabilir kılmak için kullanırlar ve böylece her şeyi sürekli akıllarında tutmaya gerek kalmaz.

`name` adında bir değişken yaratmak istediğimizi varsayalım:

{% filename %}komut satırı{% endfilename %}

```python
>>> name = "Ayşe"
```

name (isim) eşittir "Ayşe" yazalım.

Farkettiğiniz gibi, program daha öncekilerinin aksine bu kez hiçbir cevap vermedi. O zaman böyle bir değişkenin gerçekten tanımlı olduğunu nasıl bilebiliriz? Basitçe, `name` yazıp `enter` tuşuna basalım:

{% filename %}komut satırı{% endfilename %}

```python
>>> name
'Ayşe'
```

Yaşasın! İşte bu senin ilk değişkenin! :) Bu değişkenin işaret ettiği şeyi her zaman değiştirebilirsin:

{% filename %}komut satırı{% endfilename %}

```python
>>> name = "Suzan"
>>> name
'Suzan'
```

Bu değişkeni fonksiyonlar içinde de kullanabilirsin:

{% filename %}komut satırı{% endfilename %}

```python
>>> len(name)
5
```

Harika değil mi? Tabii ki değişkenler, sayılar da dahil herhangi bir şey olabilir. Şunu deneyin:

{% filename %}komut satırı{% endfilename %}

```python
>>> a = 4
>>> b = 6
>>> a * b
24
```

Peki ya değişkenin adını yanlış kullanırsak? Ne olacağını tahmin ediyor musun? Deneyelim!

{% filename %}{{ warning_icon }} komut satırı{% endfilename %}

```python
>>> city = "Tokyo"
>>> ctiy
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
NameError: name 'ctiy' is not defined
```

Bir hata! Gördüğünüz gibi, Python birçok hata çeşidine sahip ve bu hatanın adı **NameError**, yani İsimlendirme Hatası. Tanımlamadığınız bir değişkenin adını kullanmaya çalışırsanız, Python size bu hatayı verir. Eğer bu hata ile daha sonra karşılaşırsanız, kodunuzdaki değişkenlerin adını doğru yazıp yazmadığınızı kontrol edin.

Bununla biraz oynayıp, neler yapabildiğinizi görün!

## Yazdırma (Print) İşlevi

Şunu deneyin:

{% filename %}komut satırı{% endfilename %}

```python
>>> name = 'Merve'
>>> name
'Merve'
>>> print(name)
Merve
```

Sadece `name` yazdığınız zaman, Python yorumlayıcısından 'name' değişkeninin dize olarak *temsili* döner, yani tek tırnaklar içine alınmış M-e-r-v-e harfleri. Eğer `print(name)` derseniz Python ekrana değişkenin içeriğini yazdıracaktır, bu kez tırnaklar olmaksızın, daha temiz biçimde.

Daha ileride göreceğimiz gibi `print()`, işlevlerin içindeyken bir şey yazdırmak istediğimizde ya da bazı şeyleri birden fazla satırda yazdırmak istediğimizde de kullanışlıdır.

## Listeler

Python, string (dize) ve integerın (tam sayı) yanı sıra, çok değişik türlerde nesnelere sahiptir. Şimdi, **liste** türünü tanıtacağız. Listeler tam da düşündüğünüz gibidir: diğer nesnelerin listesi olan nesne. :)

Yeni bir liste yaratmakla devam edelim:

{% filename %}komut satırı{% endfilename %}

```python
>>> []
[]
```

Evet, liste boş. Çok kullanışlı sayılmaz, değil mi? Hadi loto numaralarıyla liste oluşturalım. Sürekli kendimizi tekrar etmek istemeyiz, o yüzden listeyi değişkene atayalım:

{% filename %}komut satırı{% endfilename %}

```python
>>> lottery = [3, 42, 12, 19, 30, 59]
```

Pekala, listeyi oluşturduk! Onunla ne yapabiliriz? Hadi listede kaç tane loto numarası olduğunu görelim. Hangi fonksiyonu kullanman gerektiği hakkında bir fikrin var mı? Zaten bildiğin bir fonksiyon!

{% filename %}komut satırı{% endfilename %}

```python
>>> len(lottery)
6
```

Evet! `len()` listedeki nesne sayısını verir. Kullanışlı, değil mi? Belki de şu an listeyi sıralarız:

{% filename %}komut satırı{% endfilename %}

```python
>>> lottery.sort()
```

Bu hiçbir cevap vermez, sadece listedeki numaraların sırasını değiştirir. Şimdi listeyi yazdıralım ve ne olduğunu görelim:

{% filename %}komut satırı{% endfilename %}

```python
>>> print(lottery)
[3, 12, 19, 30, 42, 59]
```

Gördüğünüz gibi, listedeki sayılar artık küçükten büyüğe sıralı. Tebrikler!

Belki de sıralamayı ters çevirmek isteriz? Hadi yapalım!

{% filename %}komut-satırı{% endfilename %}

```python
>>> lottery.reverse()
>>> print(lottery)
[59, 42, 30, 19, 12, 3]
```

Kolay, değil mi? Listeye yeni bir eleman eklemek isterseniz, şu komutu yazarak yapabilirsiniz:

{% filename %}komut-satırı{% endfilename %}

```python
>>> lottery.append(199)
>>> print(lottery)
[59, 42, 30, 19, 12, 3, 199]
```

Sadece listedeki ilk elemanı göstermek isterseniz, **indexes** (indeksler) ile yapabilirsiniz. İndeks elemanın listede nerede olduğunu belirten numaradır. Programcılar sıfırdan başlamayı tercih ederler, bu yüzden listedeki ilk eleman listenin 0. indeksindedir, sonraki 1. indeksindedir ve böyle devam eder. Şunu deneyin:

{% filename %}komut satırı{% endfilename %}

```python
>>> print(lottery[0])
59
>>> print(lottery[1])
42
```

Gördüğünüz gibi, listedeki nesnelere listenin ismi ve köşeli parantez içindeki nesnenin indeksini kullanarak ulaşabilirsin.

Listenizden bir şeyler silmek için, yukarıda öğrendiğimiz gibi **indeksleri** ve `pop()` metodunu kullanmamız gerekecektir. Bir örnekle öğrendiklerimizi pekiştirelim; listeden ilk numarayı sileceğiz.

{% filename %}komut satırı{% endfilename %}

```python
>>> print(lottery)
[59, 42, 30, 19, 12, 3, 199]
>>> print(lottery[0])
59
>>> lottery.pop(0)
59
>>> print(lottery)
[42, 30, 19, 12, 3, 199]
```

Kusursuz çalıştı!

Daha fazla eğlence için diğer indeksleri de deneyin: 6, 7, 1000, -1, -6 veya -1000. Denemeden önce komutların sonuçlarını tahmin etmeye çalışın. Sonuçlar mantıklı mıydı?

Bütün liste fonksiyonlarını Python dökümantasyonunun bu bölümünde bulabilirsin: https://docs.python.org/3/tutorial/datastructures.html

## Sözlükler (Dictionaries)

> Evdeki okuyucular için: Bu kısım [Python Temelleri: Sözlükler](https://www.youtube.com/watch?v=ZX1CVvZLE6c) videosunda işlenmiştir.

Sözlük listeye benzerdir ancak sözlük değerlerine indeks yerine anahtar ile ulaşılır. Anahtar metin veya numara olabilir. Boş bir sözlük oluşturmak için kullanılan söz dizimi şudur:

{% filename %}komut satırı{% endfilename %}

```python
>>> {}
{}
```

Bu boş bir sözlük oluşturduğunuzu gösterir. Yaşasın!

Şimdi, bu komutu yazmayı deneyin (kendi bilgilerinizle değiştirmeyi deneyin):

{% filename %}komut satırı{% endfilename %}

```python
>>> participant = {'name': 'Ayşe', 'country': 'Türkiye', 'favorite_numbers': [7, 42, 92]}
```

Bu komutla, üç anahtar-değer çifti ile `participant` (katılımcı) isminde bir değişken oluşturdunuz:

- Anahtar `name` `'Ayşe'` (`string` nesnesi) değerine işaret eder,
- `country` `Türkiye` (bir diğer `string`) değerine),
- ve `favorite_numbers` `[7, 42, 92]` (3 numaralı bir `list`) değerine işaret eder.

Bu söz dizimi ile tek bir anahtarın içeriğini kontrol edebilirsin:

{% filename %}komut satırı{% endfilename %}

```python
>>> print(participant['name'])
Ayşe
```

Gördünüz mü, bu listeye benzer. Fakat indeksi hatırlamanıza gerek yok - sadece ismini hatırlayın.

Python'a olmayan bir anahtarın değerini sorarsak ne olur? Tahmin edebiliyor musun? Hadi deneyip görelim!

{% filename %}{{ warning_icon }} komut satırı{% endfilename %}

```python
>>> participant['age']
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
KeyError: 'age'
```

Bir başka hata! **KeyError** hatası. Python yardımseverdir ve sana `'age'` anahtarının sözlükte bulunmadığını söyler.

Ne zaman sözlük veya liste kullanmalısın? Düşünmek için güzel bir nokta. Sonraki satıra bakmadan önce cevap üzerinde bir düşünün.

- Sıralı elemanlara mı ihtiyacın var? Liste ile devam et.
- İleride hızlıca (anahtarlar ile) değerlere ulaşmak istediğin için anahtarlar ile ilişkilendirilmiş değerlere mi ihtiyacın var? Sözlük kullan.

Sözlükler de listeler gibi değişebilirdir (*mutable*), yani oluşturulduktan sonra değiştirilebilirler. Oluşturulduktan sonra sözlüklere anahtar/değer çifti ekleyebilirsiniz, aşağıdaki gibi:

{% filename %}komut-satırı{% endfilename %}

```python
>>> participant['favorite_language'] = 'Python'
```

Like lists, using the `len()` function on the dictionaries returns the number of key–value pairs in the dictionary. Go ahead and type in this command:

{% filename %}komut satırı{% endfilename %}

```python
>>> len(participant)
4
```

Umarım şu ana kadar mantıklı gelmiştir :) Sözlüklerle biraz daha eğlenceye hazır mısın? İlginç şeyler için sonraki satıra atla.

Sözlükten bir maddeyi silmek için `pop()` metodunu kullanabilirsin. Mesela, `'favorite_numbers'` anahtarına karşılık gelen elemanı silmek istersen, şu komutu yaz:

{% filename %}komut satırı{% endfilename %}

```python
>>> del participant['favorite_numbers']
>>> participant
{'country': 'Türkiye', 'favorite_language': 'Python', 'name': 'Ayşe'}
```

Çıktıdan görebildiğin gibi, 'favorite_numbers' anahtarına karşılık gelen anahtar-değer çifti silindi.

Bunun yanı sıra, sözlükteki daha önce oluşturulmuş anahtarın değerini değiştirebilirsiniz. Şunu yazın:

{% filename %}komut satırı{% endfilename %}

```python
>>> participant['country'] = 'Almanya'
>>> participant
{'country': 'Almanya', 'favorite_language': 'Python', 'name': 'Ayşe'}
```

Gördüğün gibi, `'country'` anahtarının değeri `'Türkiye'`den `'Almanya`'ya çevrildi. :) Heyecan verici değil mi? Yaşasın! Bir başka harika şey öğrendin.

### Özet

Harika! Şu an programlama hakkında birçok şey biliyorsun. Bu kısımda, şunları öğrendin:

- **errors** - eğer Python yazdığın komutu anlamazsa çıkan hataları nasıl okuyacağını ve anlayacağını artık biliyorsun
- **değişkenler** - daha kolay kod yazmanı sağlayan ve kodunu daha okunabilir yapan nesnelerin isimleri
- **listeler** - belirli bir sırada tutulan nesnelerin listesi
- **sözlükler** - anahtar-değer çifti olarak tutulan nesneler

Bir sonraki bölüm için heyecanlı mısınız? :)

## Karşılaştırma

> Evden okuyanlar için: Bu kısım [Python Basics: Comparisons](https://www.youtube.com/watch?v=7bzxqIKYgf4) videosunda anlatılıyor.

Programlamanın büyük kısmı karşılaştırma içerir. Karşılaştırması en kolay olan şey nedir? Tabi ki sayılar. Bakalım nasıl çalışıyor:

{% filename %}komut satırı{% endfilename %}

```python
>>> 5 > 2
True
>>> 3 < 1
False
>>> 5 > 2 * 2
True
>>> 1 == 1
True
>>> 5 != 2
True
>>> len([1, 2, 3]) > len([4, 5])
True
```

We gave Python some numbers to compare. As you can see, not only can Python compare numbers, but it can also compare values of mathematical expressions like `2 * 2` and function results like the `2` returned by `len([4, 5])`. Nice, huh?

İki sayının eşit olup olmadığını öğrenmek için neden iki tane eşittir işraretini `==` yan yana koyduk? Değişkenlere içerik verirken, tek `=` işaretini kullanıyoruz. Her zaman ama **her zaman** ikisini birden koyman gerekir – `==` – eğer birbirlerine eşit olup olmadıklarını kontrol etmek isterseniz. Sayıların birbirine eşit olmaması durumunu da kontrol edebiliriz. Bunun için, yukarıdaki örnekteki gibi `!=` sembolünü kullanıyoruz. 

Python' a iki görev daha verin:

{% filename %}komut satırı{% endfilename %}

```python
>>> 6 >= 12 / 2
True
>>> 3 <= 2
False
```

`>`‘ı ve `<`‘ı gördük, ama `>=` ve `<=` ne anlama geliyor? Onları böyle okuyabilirsin:

- x `>` y : x büyüktür y
- x `<` y : x küçüktür y
- x `<=` y : x küçük eşittir y
- x `>=` y : x büyük eşittir y

Harika! Birkaç denemeye daha ne dersiniz? Şunu deneyin:

{% filename %}komut satırı{% endfilename %}

```python
>>> 6 > 2 and 2 < 3
True
>>> 3 > 2 and 2 < 1
False
>>> 3 > 2 or 2 < 1
True
```

Python'a istediğiniz kadar sayıyı karşılaştırmak için verebilirsiniz, ve size hepsinin cevabını verecek. Çok akıllı değil mi?

- **and** - Mantıkta kullandığımız "ve" anlamına geliyor, yani iki taraf da True, yani doğruysa, cevap da True olacak
- **or** - Bu da "veya" anlamına geliyor, karşılaştırılan iki taraftan tek bir tanesi bile True ise bize True cevabını verecek

Portakallarla elmaları karşılaştılaştırabilir miyiz? Bunun Python'daki eşdeğerini deneyelim: 

{% filename %}{{ warning_icon }} komut satırı{% endfilename %}

```python
>>> 1 > 'django'
Geri görüş (en son çağrı):
  Dosya "<stdin>", satır 1, <module>‘in içinde
HataTürü: ‘>’ 'int' ve 'str' örnekleri arasında desteklenmiyor
```

Gördüğünüz gibi Python tam sayılar(`int`) ve kelimeleri(yani stringleri, `str`) karşılaştıramıyor. Onun yerine, **TypeError** göstererek iki farklı tipteki değişkenin karşılaştırılamayacağını söylüyor.

## Boolean (Mantıksal)

Bu arada, python'da yeni bir nesne türü öğrendin. Buna **Boolean** denir.

Yalnızca iki Boolean nesnesi vardır:

- True
- False

Python'un bunu anlaması için her zaman "True" (ilk harf büyük, geri kalanları küçük) yazmanız gerekiyor. **true, TRUE, tRUE işe yaramaz -- sadece True doğru.** (Aynısı "False" için de geçerli.)

Boolean'lar değişken de olabiliyor! Bakınız:

{% filename %}komut-satırı{% endfilename %}

```python
>>> a = True
>>> a
True
```

Ayrıca bu şekilde de yapabilirsiniz:

{% filename %}komut-satırı{% endfilename %}

```python
>>> a = 2 > 5
>>> a
False
```

Boolean'lar ile aşağıdaki komutları deneyerek biraz oynayın:

- `True and True`
- `False and True`
- `True or 1 == 1`
- `1 != 2`

Tebrikler! Boolean'lar programlamadaki en havalı özelliklerden, ve az önce onları nasıl kullanmanız gerektiğini öğrendiniz!

# Kaydet!

> Evdeki okuyucular için: Bu kısım [Python Basics: Saving files and "If" statement](https://www.youtube.com/watch?v=dOAg6QVAxyk) videosunda işlenmiştir.

Şimdiye kadar kodumuzu bizi sadece tek satır yazmaya limitleyen yorumlayıcı üzerinde yazdık. Normal programlar dosyalar içine kaydedilir ve programlama dilimizin **yorumlayıcısıyla** veya **derleyicisiyle** çalıştırılır. Şimdiye kadar programlarımızı Python **yorumlayıcısında** teker satır teker satır çalıştırdık. Bundan sonraki görevlerde, birden fazla satıra ihtiyacımız olacak, bu yüzden şunlara ihtiyacımız olacak:

- Python yorumlayıcısından çıkın
- Seçtiğiniz kod düzenleyicisini açın
- Yeni Python dosyasına kod kaydedin
- Çalıştırın!

Kullandığımız Python yorumlayıcısından çıkmak için `
exit() ` fonksiyonunu yazın

{% filename %}komut satırı{% endfilename %}

```python
>>> exit()
$
```

Bu sizi komut satırına geri yönlendirecektir.

Biraz önce [kod editörü](../code_editor/README.md) bölümünden bir kod editörü seçmiştik. Şimdi o editörü açıp ve yeni bir dosya içine kod yazmalıyız (eğer Chromebook kullanıyorsanız, Cloud IDE'de yeni bir dosya oluşturun ve dahil edilen kod editöründe dosyayı açın):

{% filename %}editör{% endfilename %}

```python
print('Merhaba, Django girls!')
```

Açıkça, artık oldukça deneyimli Python programcısısın, bu yüzden bugün öğrendiğin kodları yazmaktan çekinme.

Şimdi dosyayı tanımlayıcı bir isimle kaydetmemiz gerekir. Dosyanın ismine **python_intro.py** diyelim ve masaüstüne kaydedelim. Dosyaya istediğimiz ismi verebiliriz, burada önemli olan kısım dosyanın **.py** uzantısı ile bitmesidir. **.py** uzantısı işletim sistemimize bu dosyanın bir **python çalıştırılabilir dosyası** olduğunu ve Python'un bu dosyayı çalıştırabileceğini belirtiyor.

> **Not** Kod editörleriyle ilgili en harika şeylerden birine dikkat etmelisiniz: renkler! Python konsolunda herşey aynı renkteydi; şimdi bakın `print` fonksiyonu dizeden farklı renkte. Bunun ismi "söz dizimi vurgulama" ve kod yazarken gerçekten yararlı bir özellik. Koddaki renkler ipucu verir, kapanmamış dizeler gibi ya da aşağıda göreceğimiz (`def` fonksiyonu gibi imla hatası içeren anahtar kelimeler olabilir). Bu kod düzenleyicisi kullanma nedenlerimizden biri. :)

Dosyayı kaydettiğimize göre artık çalıştırabiliriz! Konsoldan **klasör değiştirme ** yaparak masaüstüne ulaşın, komut satırı bölümünde öğrendiklerinizi hatırlayın.

<!--sec data-title="Change directory: OS X" data-id="python_OSX"
data-collapse=true ces-->

Mac'de bu komut şunun gibi görünecektir:

{% filename %}komut-satırı{% endfilename %}

    $ cd ~/Desktop
    

<!--endsec-->

<!--sec data-title="Change directory: Linux" data-id="python_linux"
data-collapse=true ces-->

Linux'ta bunun gibi görünecektir:

{% filename %}komut-satırı{% endfilename %}

    $ cd ~/Desktop
    

("Desktop" kelimesinin yerel dilinize çevrilebileceğini unutmayın.)

<!--endsec-->

<!--sec data-title="Change directory: Windows Command Prompt" data-id="python_windows" data-collapse=true ces-->

Windows Komut İstemi’nde bunun gibi olacak:

{% filename %}komut satırı{% endfilename %}

    > cd %HomePath%\Desktop
    

<!--endsec-->

<!--sec data-title="Change directory: Windows Powershell" data-id="python_windowsPSH" data-collapse=true ces-->

Ve Windows Powershell’de bunun gibi olacak:

{% filename %}komut satırı{% endfilename %}

    > cd $Home\Desktop
    

<!--endsec-->

Takılırsanız, yardım isteyin. Eğitmenler bunun için var!

Şimdi dosyadaki komutları çalıştırmak için Python'u kulllanın:

{% filename %}komut satırı{% endfilename %}

    $ python3 python_intro.py
    Merhaba, Django girls!
    

Not: Windows'ta 'python3' bir komut olarak kullanılmaz. Onun yerine, dosyayı çalıştırmak için 'python'ı kullanın:

{% filename %}komut satırı{% endfilename %}

```python
> python python_intro.py
```

Tamamdır! Bir dosyaya kaydedilen ilk Python programınızı çalıştırdınız. Harika hissediyor musunuz?

Şimdi programlamanın olmazsa olmaz bir aracını öğrenme zamanı:

## If … elif … else

Kodunuzdaki bir çok şey yalnızca belirli koşullar yerine getirildiğinde çalışmalıdır. İşte tam da bu yüzden Python'da **if deyimi** isminde bir yapı bulunuyor.

**python_intro.py** dosyasındaki kodunuzu şununla değiştirin:

{% filename %}python_intro.py{% endfilename %}

```python
if 3 > 2:
```

Eğer bunu kaydetmiş ve çalıştırmış olsaydık, bunun gibi bir hata görecektik:

{% filename %}{{ warning_icon }} komut satırı{% endfilename %}

    $ python3 python_intro.py
    File "python_intro.py", line 2
             ^
    SyntaxError: unexpected EOF while parsing
    

Python bizden `3 > 2` durumu (veya `True`) sağlandığında kendisine neyi çalıştıracağını söylememizi bekliyor. Python'a "Çalışıyor!" yazmasını söyleyelim. **python_intro.py** dosyanızdaki kodu şununla değiştirin:

{% filename %}python_intro.py{% endfilename %}

```python
if 3 > 2:
    print('Çalışıyor!')
```

Sonraki kod satırında 4 tane boşluk karakteri bıraktığımıza dikkat ettiniz mi? Böylece if ifadesine yazılan durum doğru olduğunda neyi çalıştırması gerektiğini Python'a söylemiş oluyoruz. Aslında tek bir boşlukla da yapabilirsiniz, ama hemen hemen bütün Python programcıları kodlarının temiz görünmesi için 4 boşluk bırakıyor. Metin düzenleyiciniz ayarlıysa bir tab karakteri de 4 boşluk karakteri olarak sayılacaktır. Seçiminizi yaptıktan sonra değiştirmeyin! Eğer girintilerde 4 boşluk kullandıysanız, gelecek girintilerde de 4 boşluk kullanmaya devam edin - aksi halde sorunlarla karşılaşabilirsiniz.

Kaydedip çalıştırmayı deneyelim:

{% filename %}command-line{% endfilename %}

```python
$ python3 python_intro.py
Çalışıyor!
```

Not: Windows'ta 'python3' komutunun geçerli olmadığını unutmayın. Bundan sonra dosyayı çalıştırmak için 'python3' komutunu yerine 'python' komutu kullanın.

### Ya bir koşul True (Doğru) değilse?

Önceki örneklerde kod sadece koşullar True (doğru) olduğunda çalışıyordu. Ama Python ayrıca `elif` ve `else` ifadelerine de sahip:

{% filename %}python_intro.py{% endfilename %}

```python
if 5 > 2:    
    print("5 gerçekten de 2'den büyüktür") 
else:     
    print("5  2'den büyük değildir")
```

Bu kod çalıştığında aşağıdaki çıktıyı verecektir:

{% filename %}command-line{% endfilename %}

    $ python3 python_intro.py
    5 gerçekten de 2'den büyüktür
    

Eğer 2 5'ten büyük bir sayı olsaydı, ikinci komut çalıştırılmış olacaktı. Bakalım `elif` nasıl çalışıyor:

{% filename %}python_intro.py{% endfilename %}

```python
name = 'Zeynep'
if name == 'Ayşe':
    print('Selam Ayşe!')
elif name == 'Zeynep':
    print('Selam Zeynep!')
else:
    print('Selam yabancı!')
```

ve çalıştırılınca:

{% filename %}command-line{% endfilename %}

    $ python3 python_intro.py
    Selam Zeynep!
    

Gördünüz mü? Eğer önceki if koşulları başarısız olursa kontrol edilmek üzere `elif` ifadeleri ekleyebilirsiniz.

`if` ifadesinden sonra istediğiniz kadar `elif` ifadesi ekleyebilirsiniz. Örneğin:

{% filename %}python_intro.py{% endfilename %}

```python
volume = 57
if volume < 20:
    print("Çok sessiz.")
elif 20 <= volume < 40:
    print("Güzel bir fon müziği")
elif 40 <= volume < 60:
    print("Harika, her notayı duyabiliyorum")
elif 60 <= volume < 80:
    print("Parti başlasın")
elif 80 <= volume < 100:
    print("Biraz gürültülü!")
else:
    print("Kulaklarım ağrıyor! :(")
```

Python sırayla her sorguyu çalıştırır ve sonucu ona göre yazar:

{% filename %}command-line{% endfilename %}

    $ python3 python_intro.py
    Harika, her notayı duyabiliyorum
    

## Yorumlar

Yorumlar `#` ile başlayan satırlardır. İstediğiniz her şeyi `#` den sonra yazabilirsiniz ve Python onu gözardı edecektir. Yorumlar diğer insanların kodunuzu anlamasını kolaylaştırabilir.

Bakalım nasıl gözüküyor:

{% filename %}python_intro.py{% endfilename %}

```python
# Çok yüksek ya da çok düşük olduğunda ses seviyesini değiştirme
if volume < 20 or volume > 80:
    volume = 50
    print("That's better!")
```

Kodun her satırı için bir açıklama yazmaya ihtiyacınız yoktur, ama kodunuzun niçin bir şey yaptığını açıklamak ya da kompleks bir şey yaptığınızda bir özet sunmak için yorumlar faydalıdırlar.

### Özet

En son yaptığınız alıştırmalarda öğrendikleriniz:

- **kıyaslama yapmak** - Python'da `>`, `>=`, `==`, `<=`, `<` ve `ve`, `veya` operatörlerini kullanarak kıyaslama yapabilirsiniz
- **Boolean** - İki farklı değer alabilen bir nesne tipidir: Ya `True` (doğru) olur ya da `False` (yanlış)
- **Dosya kaydetmek** – kodlarımızı dosyalara kaydederek daha büyük programları çalıştırabiliriz.
- **if ... elif ... else** - ifadelerini sadece belirli durumlar sağlandığında çalıştırmak istediğimiz komutlar için kullanabiliriz.
- **yorumlar** - kodunuzu belgelemenize izin verecek şekilde Python’un çalışmayacağı satırlar

Bu bölümün son kısmının zamanı geldi!

## Kendi fonksiyonlarınız!

> Evdeki okuyucular için: Bu kısım [Python Basics: Functions](https://www.youtube.com/watch?v=5owr-6suOl0) videosunda işlenmiştir.

Python'da çalıştırabileceğin `len()` gibi fonksiyonları hatırlıyor musun? Güzel, iyi haber - Şimdi kendi fonksiyonlarını nasıl yazacağını öğreneceksin!

Fonksiyon Python tarafından işlenmesi gereken yönergeler dizisidir. Python'da her fonksiyon `def` anahtar kelimesi ile başlar, bir isim verilir ve bazı parameterleri olabilir. Hadi başlayalım. **python_intro.py** içindeki kodu aşağıdaki ile değiştirelim:

{% filename %}python_intro.py{% endfilename %}

```python
python
def hi():
    print('Merhaba!')
    print('Nasılsın?')

hi()
```

Tamam, ilk fonksiyonumuz hazır!

Fonksiyon adını neden dosyanın en altına yazdığımızı merak edebilirsiniz. When we write `def hi():` and the indented lines following, this is us writing instructions for what the `hi()` function should do. Python will read and remember these instructions, but won't run the function yet. To tell Python we want to run the function, we have to call the function with `hi()`. Python reads the file and executes it from top to bottom, so we have to define the function in the file before we call it.

Haydi şimdi bunu çalıştıralım ve neler olacağını görelim:

{% filename %}command-line{% endfilename %}

    $ python3 python_intro.py
    Merhaba!
    Nasılsın?
    

Not: Eğer çalışmadıysa panik yapmayın! Çıktı hatanın neden olduğu hakkında bir fikir verir:

- Eğer bir `NameError` alırsanız, muhtemelen yanlış bir şey yazdığınız anlamına gelir, bu nedenle `def hi():` lı fonksiyonu oluştururken ve `hi()` lıyı çağırırken aynı adı kullanıp kullanmadığınızı kontrol etmelisiniz.
- Eğer bir `IndentationError` alırsanız,`print` dizelerinin her ikisinin de satır başında aynı boşluğa sahip olduğunu kontrol et: python fonksiyonun içindeki tüm kodların düzenli bir şekilde hizalanmasını ister.
- Eğer tamamında da çıktı yoksa, son `hi()` *isn't* girintiliğini kontrol et - eğer öyleyse, bu dize fonksiyonunda bir parçası haline gelecek ve hiçbir zaman çalışmayacak.

İlk fonksiyonumuzu parametrelerle birlikte oluşturalım. Önceki örneği - fonksiyonu çalıştıran kişiye merhaba diyen bir fonksiyon - bir isimle kullanacağız:

{% filename %}python_intro.py{% endfilename %}

```python
def hi(name):
```

Gördüğünüz gibi, fonksiyonumuza `name` (isim) adında bir parametre ekledik:

{% filename %}python_intro.py{% endfilename %}

```python
def hi(name):
    if name == 'Ayşe':
        print("Merhaba Ayşe!')
    elif name == 'Zeynep':
        print('Merhaba Zeynep!')
    else:
        print('Merhaba yabancı!')

hi()
```

Unutmayın: `if` durumu içerisindeki `print` fonksiyonundan önce dört tane boşluk var. Bunun sebebi sadece durum sağlandığında çalışmasını istememiz. Bakalım nasıl çalışıyor:

{% filename %}{{ warning_icon }} command-line{% endfilename %}

    $ python3 python_intro.py
    Traceback (most recent call last):
    File "python_intro.py", line 10, in <module>
      hi()
    TypeError: hi() missing 1 required positional argument: 'name'
    

Üzgünüz, bir hata. Neyse ki, Python bize oldukça yararlı bir hata mesajı veriyor. `hi()` fonksiyonun (yukarıda tanımladığımız) bir değişken kullanımını gerektirdiğini (`name` isimli) ve bizim o değişkeni fonksiyonu çağırırken iletmeyi unuttuğumuzu söylüyor. Dosyanın alt kısmında hatayı düzeltelim:

{% filename %}python_intro.py{% endfilename %}

```python
hi("Ayşe")
```

Ve tekrar çalıştıralım:

{% filename %}command-line{% endfilename %}

    $ python3 python_intro.py
    Selam Ayşe!
    

Eğer ismi değiştirirsek ne olur?

{% filename %}python_intro.py{% endfilename %}

```python
hi("Zeynep")
```

Ve çalıştırın:

{% filename %}command-line{% endfilename %}

    $ python3 python_intro.py
    Selam Zeynep!
    

Peki Ayşe veya Zeynep dışında başka bir isim yazdığımızda ne olacağını tahmin edebiliyor musunuz? Deneyin ve tahmininizin doğru olup olmadığını görün. Şunun gibi bir şey yazmalı:

{% filename %}command-line{% endfilename %}

    Selam yabancı!
    

Müthiş değil mi? Böylece fonksiyona göndereceğiniz isim değiştiğinde aynı kodu tekrar tekrar yazmanıza gerek kalmayacak. İşte fonksiyonlara tam da bu yüzden ihtiyacımız var - aynı kodu tekrar yazmayı istemeyiz!

Hadi daha zekice bir şey yapalım - İkiden fazla isim var ve her biri için bir şart yazmak zor olur değil mi? Dosyanın içeriğini aşağıdakiyle değiştirin:

{% filename %}python_intro.py{% endfilename %}

```python
def hi(name):
    print('Merhaba ' + name + '!')

hi("Seda")
```

Şimdi kodu çağıralım:

{% filename %}command-line{% endfilename %}

    $ python3 python_intro.py
    Merhaba Seda!
    

Tebrikler! Az önce fonksiyonları nasıl yazacağınızı öğrendiniz! :)

## Döngüler

> Evdeki okuyucular için: Bu kısım [Python Basics: For Loop](https://www.youtube.com/watch?v=aEA6Rc86HF0) videosunda işlenmiştir.

Bu da zaten son kısım. Hızlı oldu, değil mi? :)

Programcılar kendilerini tekrar etmeyi sevmezler. Programlama tamamen işleri otomatize etmedir, bu yüzden her insanı ismiyle selamlamak istemeyiz, değil mi? İşte burası döngülerin devreye girdiği yerdir.

Hala listeleri hatırlıyoruz değil mi? Haydi bir kızlar listesi yapalım:

{% filename %}python_intro.py{% endfilename %}

```python
kızlar = ['Seda', 'Gül', 'Pınar', 'Ayşe', 'Sen']
```

Diyelim ki hepsine merhaba demek istiyoruz. Az önce yazdığımız `hi` fonksiyonunu döngü içinde kullanabiliriz:

{% filename %}python_intro.py{% endfilename %}

```python
for name in girls:
```

`for` durumu `if` durumuna benzer şekilde çalışır; aşağıdaki kodda her iki satır dört boşluk ile girintili olmalıdır.

Dosyada yer alacak tam kod aşağıdadır:

{% filename %}python_intro.py{% endfilename %}

```python
def hi(name):
    print('Merhaba ' + name + '!')

girls = ['Seda', 'Gül', 'Pınar', 'Ayşe', 'Sen']
for name in girls:
    hi(name)
    print('Sıradaki kız')
```

Ve onu çalıştırdığımız zaman:

{% filename %}command-line{% endfilename %}

    $ python3 python_intro.py
    Selam Seda!
    Sıradaki kız
    Selam Gül!
    Sıradaki kız
    Selam Pınar!
    Sıradaki kız
    Selam Ayşe!
    Sıradaki kız
    Selam Sen!
    Sıradaki kız
    

Gördüğünüz gibi, `for` cümlesinin içine boşluk karakteri ile koyduğunuz her şey `girls` listesinin her elemanı için tekrarlanıyor.

Ayrıca `for`'u `range` fonksiyonuyla beraber sayılar üzerinde de kullanabilirsiniz:

{% filename %}python_intro.py{% endfilename %}

```python
for i in range(1, 6):
    print(i)
```

Çalıştırırsak:

{% filename %}command-line{% endfilename %}

    1
    2
    3
    4
    5
    

`range` fonksiyonu birbirini takip eden sayılardan bir liste oluşturur (bu sayıları da siz parametre olarak yazarsınız).

Sizin verdiğiniz ikinci parametrenin listede olmadığına dikkat edin (yani `range(1, 6)` 1'den 5'e kadar sayar, 6'yı dahil etmez). Çünkü “aralık” yarı açıktır, ve yani ilk değeri içerir ama son değeri içermez.

## Özet

İşte bu. **Harikasın, süpersin!** Bu bölüm biraz zordu, kendinle gurur duymalısın. Biz buraya kadar geldiğin için seninle gurur duyuyoruz!

Resmi ve tam python kılavuzu için https://docs.python.org/3/tutorial/ adresini ziyaret edin. Bu size Python dili hakkında daha kapsamlı ve eksiksiz bir çalışma sunacaktır. Teşekkürler :)

Sonraki bölüme geçmeden önce başka bir şey yapmak isteyebilirsin. -gerin, biraz etrafta gezin, gözlerini dinlendir- :)

![Cupcake](images/cupcake.png)