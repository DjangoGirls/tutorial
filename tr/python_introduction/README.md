# Python'a giriş

> Bu bölümün bir kısmı Geek Girls Carrots tarafından hazırlanmış eğitimlere dayanılarak hazırlanmıştır (https://github.com/ggcarrots/django-carrots).

Biraz kod yazalım!

## Python komut istemi (prompt)

> Evdeki okuyucular için: Bu kısım [Python Temelleri: Tamsayılar, Dizeler, Listeler, Değişkenler ve Hatalar](https://www.youtube.com/watch?v=MO63L4s-20U) videosunda bulunabilir.

Python'la oynamaya başlamadan önce bilgisayarımızda bir *komut satırı* açmamız gerekiyor. Bunu zaten nasıl yapacağınızı artık biliyorsunuz, [Komut satırına giriş](../intro_to_command_line/README.md) bölümünde öğrenmiştiniz.

Hazır olduğunuzda, aşağıdaki talimatları takip edin.

Bir Python konsolu açmak istiyoruz; öyleyse Windows'ta `python`, Mac OS/Linux'ta `python3` yazıp, `enter`'a basın.

{% filename %}komut-satırı{% endfilename %}

    $ python3
    Python 3.6.1 (...)
    Daha fazla bilgi için "yardım", "telif hakkı", "krediler" veya "lisans" yazın
    >>>
    

## İlk Python komutunuz!

Python komutunu çalıştırdıktan sonra, komut istemi `>>>` şeklinde değişti. Bizim için bu, şimdi yalnızca Python dilinde komutlar kullanabileceğimiz anlamına geliyor. `>>>` yazmanıza gerek yok - Python bunu sizin için yapacak.

Eğer herhangi bir zamanda Python komut satırından çıkmak isterseniz, yalnızca `exit()` yazmanız ya da Windows için `Ctrl + Z`, Mac/Linux için `Ctrl + D` kısa yolunu kullanmanız yeterli. Bunu yaptığınız taktirde artık `>>>` yazısını görmeyeceksiniz.

Şimdilik, Python konsolundan çıkmak istemiyoruz. Bu konuda daha fazla bilgi edinmek istiyoruz. ` girmek ` 'e basarak ` 2 + 3 ` gibi biraz matematik yazarak başlayalım.

{% filename %}komut-satırı{% endfilename %}

```python
>>> 2 + 3
5
```

Güzel! Cevap nasıl da çıktı görüyor musun? Python matematik biliyor! Sen de diğer komutları şöyle deneyebilirsin:

- `4 * 5`
- `5 - 1`
- `40 / 2`

Üstel hesaplama uygulamak, 2 üzeri 3 deyin, Biz yazalım: {% filename %}komut-satırı{% endfilename %}

```python
>>> 2 ** 3
8
```

Bunları biraz kurcalayıp eğlen, sonra tekrar burada buluşalım. :)

Gördüğünüz gibi Python mükemmel bir hesap makinesidir. Eğer başka neler yapabileceğinizi merak ediyorsanız…

## String'ler (dizeler)

Mesela ismin? İsmini tırnak işaretleri içerisinde şu şekilde yaz:

{% filename %}komut-satırı{% endfilename %}

```python
>>> "Zeynep"
'Zeynep'
```

İlk string'ini oluşturdun! String (katar), bilgisayar tarafından işlenebilen ve karakterlerden oluşan dizilerin genel adıdır. Bir string her zaman aynı özel karakterle başlamalı ve aynı özel karakterle bitmelidir. Tek tırnak (`'`) veya çift tırnak (`"`) olabilir (aralarında herhangi bir fark yok!). Tırnak işaretleri Python'da içlerinde olan şeyin bir string olduğunu ifade eder.

Stringler birbirlerine eklenebilir. Şunu dene:

{% filename %}komut-satırı{% endfilename %}

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

veya sola eğik çizgi (` \ `) kullanarak:

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
- **sayılar ve dizinler** – Python'da sayılar matematik için dizinler ise metin nesneleri için kullanılmaktadır
- **operatörler** `+` ve `*` gibi, değerleri birleştirerek yeni bir değer üretmek için kullanılmaktadır
- **fonksiyonlar** `upper()` ve `len()` gibi, nesneler üzerinde eylemler gerçekleştirmektedirler.

Bunlar öğreneceğiniz her programlama dilinin temelleri. Biraz daha zor bir şey için hazır mısın? İddiaya gireriz öylesin!

## Hatalar

Şimdi yeni bir şey deneyelim. Bir sayının uzunluğunu, bir string'in uzunluğunu bulduğumuz gibi bulabilir miyiz? Bunu görmek için `len(304023)` yazıp `enter`a basalım:

{% filename %}komut satırı{% endfilename %}

```python
>>> len(304023)
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
TypeError: object of type 'int' has no len()
```

İlk hatamızı aldık! Nesne türü "int" (tam sayılar, tüm sayılar) in uzunluğu olmadığını söylüyor. Şimdi ne yapabiliriz? Belki de rakamı bir string olarak yazabiliriz? Stringlerin bir uzunluğu var, değil mi?

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

Programlamada en önemli konulardan biri değişkenlerdir. Değişken, daha sonra kullanmak istediğiniz bir yapıya verdiğiniz isimdir. Programcılar değişkenleri verileri tutmak ya da kodlarını daha okunabilir ve anlaşılabilir kılmak için kullanırlar ve böylece her şeyi sürekli akıllarında tutmaya gerek kalmaz.

`name` adında bir değişken yaratmak istediğimizi varsayalım:

{% filename %}komut satırı{% endfilename %}

```python
>>> name = "Ayşe"
```

Tip adı eşittir Ola.

Farkettiğiniz gibi, program daha öncekilerinin aksine bu kez hiçbir cevap vermedi. O zaman böyle bir değişkenin gerçekten tanımlı olduğunu nasıl bilebiliriz? Basitçe, `name` yazıp `enter` tuşuna basalım:

{% filename %}komut satırı{% endfilename %}

```python
>>> name
'Ayşe'
```

İşte bu sizin ilk değişkeniniz! :) Bu değişkeni işaret ettiği şeyi her zaman değiştirebilirsiniz:

{% filename %}komut satırı{% endfilename %}

```python
>>> name = "Suzan"
>>> name
'Suzan'
```

Bu değişkeni fonksiyonlar içinde de kullanabilirsiniz:

{% filename %}komut satırı{% endfilename %}

```python
>>> len(name)
5
```

Muhteşem değil mi? Tabikide değişkenler herhangi bir şey olabilir – sayılar da! Bunu deneyin:

{% filename %}komut satırı{% endfilename %}

```python
>>> a = 4
>>> b = 6
>>> a * b
24
```

Peki ya değişkenin adını yanlış kullanırsak? Ne olacağını tahmin ediyor musunuz? Deneyelim! 

{% filename %}komut satırı{% endfilename %}

```python
>>> city = "Tokyo"
>>> ctiy
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
NameError: name 'ctiy' is not defined
```

Bir hata! Gördüğünüz gibi, Python bir çok çeşit hata çeşidine sahip ve bu hatanın adı **NameError**, yani İsimlendirme Hatası. Tanımlamadığınız bir değişkenin adını kullanmaya çalışırsanız, Python size bu hatayı verir. Eğer bu hata ile daha sonra karşılaşırsanız, kodunuzdaki değişkenlerin adını doğru yazıp yazmadığınızı kontrol edin.

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

Python, string ve integerın yanı sıra, çok değişik türlerde nesnelere sahiptir. Şimdi, **liste** türünü tanıtacağız. Listeler tam da düşündüğünüz gibidir: diğer nesnelerin listesi olan nesne. :)

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

Listenize bir şeyler eklemek isterseniz, şu komutu yazarak yapabilirsiniz:

{% filename %}komut-satırı{% endfilename %}

```python
>>> lottery.append(199)
>>> print(lottery)
[59, 42, 30, 19, 12, 3, 199]
```

Sadece listedeki ilk elemanı göstermek isterseniz, **indexes** (indeksler) ile yapabilirsiniz. İndeks elemanın listede nerede olduğunu belirten numaradır. Programcılar sıfırdan başlamayı tercih ederler, bu yüzden listedeki ilk eleman listenin 0. indeksindedir, sonraki 1. indeksindedir ve böyle devam eder. Şunu deneyin:

{% filename %}komut-satırı{% endfilename %}

```python
>>> print(lottery[0])
59
>>> print(lottery[1])
42
```

Gördüğünüz gibi, Listedeki nesnelere listenin ismi ve köşeli parantez içindeki nesnenin indeksini kullanarak ulaşabilirsin.

Listenizde bir şeyler silmek için ve yukarıda öğrendiğimiz gibi **indeksleri** ve `pop()` metodunu kullanmanız gerekecektir. Bir örnek yapalım ve daha önce öğrendiklerimizi pekiştirelim; listemizden ilk numarayı sileceğiz.

{% filename %}komut-satırı{% endfilename %}

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

Sözlük listeye benzerdir fakat siz değerlere sayısal indeks yerine anahtar ile ulaşırsınız. Anahtar herhangi metin veya numara olabilir. Boş bir sözlük oluşturmak için kullanılan söz dizimi şöyledir:

{% filename %}komut-satırı{% endfilename %}

```python
>>> {}
{}
```

Bu boş bir sözlük oluşturduğunuzu gösterir. Yaşasın!

Şimdi, bu komutu yazmayı deneyin (kendi bilgilerinizi de değiştirmeyi deneyiniz):

{% filename %}komut-satırı{% endfilename %}

```python
>>> participant = {'name': 'Ayşe', 'country': 'Türkiye', 'favorite_numbers': [7, 42, 92]}
```

Bu komutla, üç anahtar-değer çifti ile `katılımcı` isminde bir değişken oluşturdunuz:

- Anahtar `name` `'Ayşe'` (`string` nesnesi) değerine işaret eder,
- `country` `Türkiye` (bir diğer `string`) değerine),
- ve `favorite_numbers` `[7, 42, 92]` (3 numaralı bir `list`) değerine işaret eder.

Bu söz dizimi ile tek bir anahtarın içeriğini kontrol edebilirsin:

{% filename %}komut-satırı{% endfilename %}

```python
>>> print(participant['name'])
Ayşe
```

Gördünüz mü, bu listeye benzer. Fakat indeksi hatırlamanıza gerek yok - sadece ismini hatırlayın.

Python'a olmayan bir anahtarın değerini sorarsak ne olur? Tahmin edebiliyor musun? Hadi deneyip görelim!

{% filename %}komut-satırı{% endfilename %}

```python
>>> participant['age']
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
KeyError: 'age'
```

Bir başka hata! **KeyError** hatası. Python yardımseverdir ve sana `'age'` anahtarının sözlükte bulunmadığını söyler.

Ne zaman sözlük veya liste kullanmalısın? Düşünmek için güzel bir nokta. Sonraki satırdaki cevaba bakmadan önce kafanızda bir çözüm oluşturun.

- Sıralı elemanlara mı ihtiyacın var? Liste ile devam et.
- İleride hızlıca (anahtarlar ile) değerlere ulaşmak istediğin için anahtarlar ile ilişkilendirilmiş değerlere mi ihtiyacın var? Sözlük kullan.

Sözlükler de listeler gibi *değişken*'dir, yani oluşturulduktan sonra değiştirilebilir anlamına gelmektedir. Oluşturulduktan sonra sözlüklere yeni anahtar-değer çifti ekleyebilirsiniz, bunun gibi:

{% filename %}komut-satırı{% endfilename %}

```python
>>> participant['favorite_language'] = 'Python'
```

Listeler gibi,`len()` metodunu sözlüklerde kullanmak sözlükteki anahtar-değer çiftlerinin sayısını geri getirir. Devam et ve bu komutu yaz:

{% filename %}komut-satırı{% endfilename %}

```python
>>> len(participant)
4
```

Umarım şimdiye kadar mantıklı gelmiştir. :) Sözlüklerle biraz daha eğlenceye hazır mısınız? Hayret verici bazı şeyler okumaya devam edin.

Sözlükten bir maddeyi silmek için `pop()` metodunu kullanabilirsin. Mesela, `'favorite_numbers'` anahtarına karşılık gelen elemanı silmek istersen, sadece şu komutu yaz:

{% filename %}komut-satırı{% endfilename %}

```python
>>> participant.pop('favorite_numbers')
[7, 42, 92]
>>> participant
{'country': 'Poland', 'favorite_language': 'Python', 'name': 'Ola'}
```

Çıktıdan görüldüğü gibi, ana değer eşleniği 'favorite_numbers' anahtarı silinmiştir.

Bunun yanı sıra, oluşturulmuş anahtar değerini değiştirebilirsiniz. Bunu yazın:

{% filename %}komut-satırı{% endfilename %}

```python
>>> participant['country'] = 'Almanya'
>>> participant
{'country': 'Almanya', 'favorite_language': 'Python', 'name': 'Ayşe'}
```

Gördüğün gibi, `'country'` anahtarının değeri `'Poland'`‘den `'Germany’`'e çevrildi. :) Heyecan verici değil mi? Yaşasın! Bir başka harika şey öğrendin.

### Özet

Harika! Şu an programlama hakkında birçok şey biliyorsun. Bu kısımda, şunları öğrendin:

- **errors** - eğer Python yazdığın komutu anlamazsa çıkan hataları nasıl okuyacağını ve anlayacağını artık biliyorsun
- **değişkenler** - daha kolay kod yazmanı sağlayan ve kodunu daha okunabilir yapan nesnelerin isimleri
- **listeler** - belirli bir sırada tutulan nesnelerin listesi
- **sözlükler** - anahtar-değer çifti olarak tutulan nesneler

Bir sonraki part için heyecanlı mısınız? :)

## Karşılaştırma

> Evden okuyanlar için: Bu kısım [Python Basics: Comparisons](https://www.youtube.com/watch?v=7bzxqIKYgf4) vidyosunda anlatılıyor.

Programlamanın büyük kısmı karşılaştırma içerir. Karşılaştırması en kolay olan şey nediir? Tabiki sayılar. Bakalım nasıl çalışıyor:

{% filename %}komut-satırı{% endfilename %}

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
```

Python karşılaştırma için numara verildi. Gördüğünüz gibi Python sadece numaraları karşılaştırmakla kalmıyor, aynı zamanda metod sonuçlarını karşılaştırabiliyor. Harika değil mi?

İki sayının eşit olup olmadığını öğrenmek için neden iki tane eşittir işraretini `==` yan yana koyduk? Değişkenlere içerik verirken, tek `=` işaretini kullanıyoruz. Her zaman ama **her zaman** ikisini birden koyman gerekir – `==` – eğer birbirlerine eşit olup olmadıklarını kontrol etmek isterseniz. Sayıların birbirine eşit olmaması durumunu da kontrol edebiliriz. Bunun için, yukarıdaki örnekteki gibi `!=` sembolünü kullanıyoruz. 

Python' a iki görev daha verin:

{% filename %}komut-satırı{% endfilename %}

```python
>>> 6 >= 12 / 2
True
>>> 3 <= 2
False
```

`>`‘ı ve `<`‘ı gördük, ama `>=` ve `<=` ne anlama geliyor? Onları böyle oku:

- x `>` y : x büyüktür y
- x `<` y : x küçüktür y
- x `<=` y : x küçük eşittir y
- x `>=` y : x büyük eşittir y

Harika! Biraz daha ister misiniz? Şunu deneyin: 

{% filename %}komut-satırı{% endfilename %}

```python
>>> 6 > 2 and 2 < 3
True
>>> 3 > 2 and 2 < 1
False
>>> 3 > 2 or 2 < 1
True
```

Python'a istediğiniz kadar sayıyı karşılaştırmak için verebilirsiniz, ve size hepsinin cevabını verecek. Çok akıllı değil mi?

- **and** - Eğer `and` işlecini kullanırsan, bütün komutların doğru olması için her iki kıyaslama da doğru olmak zorundadır
- **or** - eğer `or` işlecini kullanırsan, bütün komutların doğru olması için kıyaslamalardan yalnızca biri doğru olmak zorundadır

Portakallarla elmaları karşılaştılaştırabilir miyiz? Bunun Python'daki eşdeğerini deneyelim: 

{% filename %}komut-satırı{% endfilename %}

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

- Doğru
- Yalnış

Ama Python un bunu algılaması için, her zaman 'True' (baş harf büyük karakter kalan küçük olacak şekilde). **true, TRUE, tRUE işe yaramaz -- sadece True doğru.** (Aynısı "False" için de geçerli.)

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

Kullanmakta olduğumuz Python yorumlayıcısından çıkmak için, basitçe `exit()` fonksiyonunu yaz

{% filename %}komut-satırı{% endfilename %}

```python
>>> exit()
$
```

Bu sizi komut satırına geri yönlendirecektir.

Biraz önce [kod editörü](../code_editor/README.md) bölümünden bir kod editörü seçmiştik. Şimdi o editörü açmalı ve yeni bir dosya içine kod yazmalıyız:

{% filename %}editör{% endfilename %}

```python
print(‘Merhaba, Django kızları!’)
```

Açıkça, artık oldukça deneyimli Python programcısısın, bu yüzden bugün öğrendiğin kodları yazmaktan çekinme.

Şimdi dosyayı tanımlayıcı bir isimle kaydetmemiz gerekir. Dosyanın ismine **python_intro.py** diyelim ve masaüstüne kaydedelim. Dosyaya istediğimiz ismi verebiliriz, burada önemli olan kısım dosyanın **.py** uzantısı ile bitmesidir. **.py** uzantısı işletim sistemimize bu dosyanın bir **Python çalıştırılabilir dosyası** olduğunu ve Python'un bu dosyayı çalıştırabileceğini belirtiyor.

> **Not** Kod editörleriyle ilgili en harika şeylerden birine dikkat etmelisiniz: renkler! Python konsolunda herşey aynı renkteydi; şimdi bakın `print` fonksiyonu dizeden farklı renkte. Bunun ismi "söz dizimi vurgulama" ve kod yazarken gerçekten yararlı bir özellik. Koddaki renkler ipucu verir, kapanmamış dizeler gibi yada aşağıda göreceğimiz (`def` fonksiyonu gibi imla hatası içeren anahtar kelimeler oalbilir). Bu kod düzenleyicisi kullanma nedenlerimizden biri. :)

Dosyayı kaydettiğimize göre artık çalıştırabiliriz! Konsoldan **Klasör değiştirme** yaparak masaüstüne ulaşın, komut satırı bölümünde öğrendiklerinizi hatırlayın.

<!--sec data-title="Change directory: OS X" data-id="python_OSX"
data-collapse=true ces-->

Mac'de bu komut şunun gibi görünecektir:

{% filename %}komut-satırı{% endfilename %}

    $ cd ~/Masaüstü
    

<!--endsec-->

<!--sec data-title="Change directory: Linux" data-id="python_linux"
data-collapse=true ces-->

Linux’ta bunun gibi olacak (“Desktop” kelimesi yerel dilinize çevrilebilir):

{% filename %}komut-satırı{% endfilename %}

    $ cd ~/Masaüstü
    

<!--endsec-->

<!--sec data-title="Change directory: Windows Command Prompt" data-id="python_windows" data-collapse=true ces-->

Windows Komut İstemi’nde, bunun gibi olacak:

{% filename %}komut-satırı{% endfilename %}

    > cd %HomePath%\Masaüstü
    

<!--endsec-->

<!--sec data-title="Change directory: Windows Powershell" data-id="python_windowsPSH" data-collapse=true ces-->

Ve Windows Powershell’de, bunun gibi olacak:

{% filename %}komut-satırı{% endfilename %}

    > cd $Home\Masaüstü
    

<!--endsec-->

Bir problem olursa yardım istemekten çekinmeyin.

Şimdi dosyadaki komutları çalıştırmak için Python'u kulllanın:

{% filename %}komut-satırı{% endfilename %}

    $ python3 python_intro.py
    Merhaba, Django girls!
    

Not: Windows'ta 'python3' bir komut olarak geçmez. Onun yerine, dosyayı çalıştırmak için 'python'ı kullanın:

{% filename %}komut-satırı{% endfilename %}

```python
> python python_intro.py
```

Tamam! Bir dosyaya kaydedilen ilk Python programınızı çalıştırdınız. Harika hissediyor musunuz?

Şimdi programlamanın olmazsa olmaz bir aracını öğrenme zamanı:

## eğer…elif… yoksa

Koddaki pek çok şey sadece karşılaşılan şartlar sağlandığında çalıştırılmalıdır. Python'da **eğer açıklamaları** olarak adlandırılan bir şey olmasının nedeni budur.

**python_intro.py** dosyasındaki kodunuzu şununla değiştirin:

{% filename %}python_intro.py{% endfilename %}

```python
eğer 3 > 2 ise:
```

Eğer bunu kaydetmiş ve çalıştırmış olsaydık, bunun gibi bir hata görecektik:

{% filename %}komut-satırı{% endfilename %}

    $ python3 python_intro.py
    File "python_intro.py", line 2
             ^
    SyntaxError: unexpected EOF while parsing
    

Python bizden kendisine `3 > 2` durumu (veya `True`) sağlandığında neyi çalıştıracağını söylememizi bekliyor. Python'a "Çalışıyor!" yazmasını söyleyelim. **python_intro.py** dosyanızdaki kodu şununla değiştirin:

{% filename %}python_intro.py{% endfilename %}

```python
eğer 3 > 2 ise:
    print(‘Çalışıyor!’)
```

4 tane boşluk karakteri bıraktığımıza dikkat ettiniz mi? Bunu yaparak if cümlesine yazdığım durum doğru olduğunda neyi çalıştırması gerektiğini Python'a söylemiş oluyoruz. Aslında tek bir boşlukla da yapabilirsiniz, ama hemen hemen bütün Python programcıları kodlarının temiz görünmesi için 4 boşluk bırakıyor. Tek `tab` karakteri de 4 boşluk yerine geçecektir.

Kaydedip çalıştırmayı deneyelim:

{% filename %}komut-satırı{% endfilename %}

```python
$ python3 python_intro.py
Çalışıyor!
```

Not: Windows'ta 'python3'ün komut olarak geçerli olmadığını unutmayın. Bundan böyle dosyayı çalıştırmak için 'python3'ü 'python'la değiştirin.

### Ya bir koşul True (Doğru) değilse?

Önceki örneklerde kod sadece koşullar sadece True olduğunda çalışıyordu. Ama Python ayrıca `elif` ve `else` ifadelerine de sahip:

{% filename %}python_intro.py{% endfilename %}

```python
eğer 5 > 2 ise:
    print(‘5 gerçekten 2’den büyüktür’)
Değilse:
    print(‘5 2’de büyük değildir’)
```

Bu kod çalıştığında aşağıdaki çıktıyı verecektir:

{% filename %}komut-satırı{% endfilename %}

    $ python3 python_intro.py
    5 gerçekten de 2'den büyüktür
    

Eğer 2 5'ten büyük bir sayı olsaydı, ikinci komut çalıştırılmış olacaktı. Bakalım `elif` nasıl çalışıyor:

{% filename %}python_intro.py{% endfilename %}

```python
isim = ‘Sonja’
eğer isim == ‘Ola’ ise:
    print(‘Selam Ola!’)
elif isim == ‘Sonja’ ise:
    print(‘Selam Sonja!’)
değilse:
    print(‘Selam yabancı!’)
```

ve çalıştırılınca:

{% filename %}komut-satırı{% endfilename %}

    $ python3 python_intro.py
    Selam Zeynep!
    

Gördünüz mü? Eğer önceki if cümleleriniz doğru olmazsa kontrol edilmek üzere `elif` cümleleri ekleyebilirsiniz.

`if` cümlenizden sonra istediğiniz kadar `elif` cümlesi ekleyebilirsiniz. Mesela:

{% filename %}python_intro.py{% endfilename %}

```python
volüm = 57
eğer volüm < 20 ise:
    print(“Biraz sessiz.”)
elif 20 <= volüm < 40 ise:
    print(“Arka plan müziği için güzel“)
elif 40 <= volüm < 60 ise:
    print(“Mükemmel, tüm detayları duyabiliyorum“)
elif 60 <= volüm < 80 ise:
    print(“Partiler için güzel”)
elif 80 <= volüm < 100 ise:
    print(“Biraz gürültülü!”)
değilse:
    print(“Kulaklarım ağrıyor! :(")
```

Python sırayla her sorguyu çalıştırır ve sonucu ona göre yazar:

{% filename %}komut-satırı{% endfilename %}

    $ python3 python_intro.py
    Harika, her notayı duyabiliyorum
    

## Yorumlar

Yorumlar `#` ile başlayan satırlardır. İstediğiniz her neyse `#` den sonra yazabilirsiniz ve Python onu gözardı eder. Yorumlar kodunuzu diğer insanların anlamasını daha kolaylaştırabilir.

Bakalım nasıl gözüküyor:

{% filename %}python_intro.py{% endfilename %}

```python
# Çok yüksek veya çok düşük olduğunda volümü değiştirme
Eğer volüm < 20 veya volüm > 80 ise:
    volüm = 50
    print(“Bu daha iyi!”)
```

Kodun her satırı için bir açıklama yazmaya ihtiyacınız yoktur, ama kodunuzun niçin birşey yaptığını açıklamak ya da kompleks bir şey yaptığında bir özet sunmak için faydalıdırlar.

### Özet

En son yaptığınız alıştırmalarda öğrendikleriniz:

- **kıyaslama yapmak** - Python'da `>`, `>=`, `==`, `<=`, `<` ve `ve`, `veya` operatörlerini kullanarak kıyaslama yapabilirsiniz
- **Boole** – yalnızca iki değerden birini olabilir nesnesi türü: `doğru` veya `yanlış`
- **Dosya kaydetmek** – kodlarımızı dosyalara kaydederek daha büyük programları çalıştırabiliriz.
- **if ... elif ... else** - cümlelerini sadece belirli durumlar sağlandığında çalıştırmak istediğimiz komutlar için kullanabiliriz.
- **yorumlar** - kodunuzu belgelemenize izin verecek şekilde Python’un çalışmayacağı satırlar

Bu bölümün son kısmının zamanı geldi!

## Kendi fonksiyonlarınız!

> Evdeki okuyucular için: Bu kısım [Python Basics: Functions](https://www.youtube.com/watch?v=5owr-6suOl0) videosunda işlenmiştir.

Python'da çalıştırabileceğin `len()` gibi fonksiyonları hatırlıyor musun? Güzel, iyi haber - Şimdi kendi fonksiyonlarını nasıl yazacağını öğreneceksin!

Fonksiyon Python tarafından işlenmesi gereken yönergeler dizisidir. Python'da her fonksiyon `def` anahtar kelimesi ile başlar, bir isim verilir ve bazı parameterleri olabilir. Hadi başlayalım. **python_intro.py** içindeki kodu aşağıdaki ile değiştirelim:

{% filename %}python_intro.py{% endfilename %}

```python
def hi():
    print('Selam!')
    print('Nasılsın?')

hi()
```

Tamam, ilk fonksiyonumuz hazır!

Fonksiyon adını neden dosyanın en altına yazdığımızı merak edebilirsiniz. Bunun nedeni, Python'ın dosyayı okuyup, onu yukarıdan aşağı doğru işlemesi. Yani fonksiyonumuzu kullanabilmek için, onu en alt kısımda yeniden yazmalıyız.

Haydi şimdi bunu çalıştıralım ve neler olacağını görelim:

{% filename %}komut-satırı{% endfilename %}

    $ python3 python_intro.py
    Merhaba!
    Nasılsın?
    

Not: Eğer çalışmadıysa panik yapmayın! Bilgi çıkışı neden olduğu hakkında bir fikir verir:

- Eğer bir `NameError` alırsanız, muhtemelen yanlış bir şey yazdığınız anlamına gelir, bu nedenle `def hi():` lı fonksiyonu oluştururken ve `hi()` lıyı çağırırken aynı adı kullanıp kullanmadığınızı kontrol etmelisiniz.
- Eğer bir `IndentationError` alırsanız,`print` dizelerinin her ikisinin de satır başında aynı boşluğa sahip olduğunu kontrol et: python fonksiyonun içindeki tüm kodların düzenli bir şekilde hizalanmasını ister.
- Eğer tamamında da çıktı yoksa, son `hi()` *isn't* girintiliğini kontrol et - eğer öyleyse, bu dize fonksiyonunda bir parçası haline gelecek ve hiçbir zaman çalışmayacak.

İlk fonksiyonumuzu parametrelerle birlikte oluşturalım. Önceki örneği - çalışmaktaki kişiye merhaba diyen bi fonksiyon - ismiyle kullanacağız:

{% filename %}python_intro.py{% endfilename %}

```python
def hi(name):
```

Gördüğünüz gibi, fonksiyonumuza `name` (isim) adında bir parametre ekledik:

{% filename %}python_intro.py{% endfilename %}

```python
def hi(name):
    if name == 'Ola':
        print("Merhaba Ola!')
    elif name == 'Sonja':
        print('Merhaba Sonja!')
    else:
        print('Merhaba anonim!')

hi()
```

Unutmayın: `if` içerisindeki `print` fonksiyonundan önce dört tane boşluk var. Bunun sebebi sadece durum sağlandığında çalışmasını istememiz. Bakalım nasıl çalışıyor:

{% filename %}komut-satırı{% endfilename %}

    $ python3 python_intro.py
    Traceback (most recent call last):
    File "python_intro.py", line 10, in <module>
      hi()
    TypeError: hi() missing 1 required positional argument: 'name'
    

Üzgünüz, bir hata. Neyse ki, Python bize oldukça yararlı bir hata mesajı veriyor. `hi()` fonksiyonun (yukarıda tanımladığımız) bir değişken kullanımını gerektirdiğini (`name` isimli) ve bizim o değişkeni fonksiyonu çağırırken iletmeyi unuttuğumuzu söylüyor. Dosyanın alt kısmında hatayı düzeltelim:

{% filename %}python_intro.py{% endfilename %}

```python
hi("Ola")
```

Ve tekrar çalıştıralım:

{% filename %}komut-satırı{% endfilename %}

    $ python3 python_intro.py
    Selam Ayşe!
    

Ve eğer ismi değiştirirsek ne olur?

{% filename %}python_intro.py{% endfilename %}

```python
hi("Sonja")
```

Ve çalıştırın:

{% filename %}komut-satırı{% endfilename %}

    $ python3 python_intro.py
    Selam Zeynep!
    

Şimdi, eğer oraya başka bir isim yazarsanız ne olacağını düşünüyorsunuz?(Ola veya Sonja değil.) Deneyin ve eğer doğruysa görün. Bunu yazdırması gerekir:

{% filename %}komut-satırı{% endfilename %}

    Selam yabancı!
    

Süper değil mi? Böylece fonksiyona göndereceğiniz isim değiştiğinde aynı kodu tekrar tekrar yazmanıza gerek kalmayacak. Ve tam olarak bu nedenle fonksiyonlara ihtiyacımız var- kodunu hiçbir zaman tekrarlamak istemiyorsun!

Hadi daha zekice bir şey yapalım - İkiden fazla isim var ve her biri için bir şart yazmak zor olur değil mi?

{% filename %}python_intro.py{% endfilename %}

```python
def hi(name):
    print('Merhaba ' + name + '!')

hi("Rachel")
```

Şimdi kodu çağıralım:

{% filename %}komut-satırı{% endfilename %}

    $ python3 python_intro.py
    Selam Seda!
    

Tebrikler! Az önce fonksiyonları nasıl yazacağınızı öğrendiniz! :)

## Döngüler

> Evdeki okuyucular için: Bu kısım [Python Basics: For Loop](https://www.youtube.com/watch?v=aEA6Rc86HF0) videosunda işlenmiştir.

Bu da zaten son parça. Hızlı oldu, değil mi? :)

Programcılar kendilerini tekrar etmeyi sevmezler. Programlama tamamen işleri otomatize etmedir, bu yüzden her insanı ismiyle selam istemeyiz, değil mi? İşte burası döngülerin devreye girdiği yerdir.

Hala listeleri hatırlıyoruz değil mi? Haydi bir kızlar listesi yapalım:

{% filename %}python_intro.py{% endfilename %}

```python
kızlar = ['Rachel', 'Monica', 'Phoebe', 'Ola', 'Sen']
```

Diyelim ki hepsine merhaba demek istiyoruz. Az önce yazdığımız `hi` fonksiyonunu döngü içinde kullanabiliriz:

{% filename %}python_intro.py{% endfilename %}

```python
kızlar içindeki isimler:
```

Bu ```için``` ifade şunlara benzer davranış gösteriyor ```eğer``` ifade: aşağıdaki kodların ikiside girintili ve dört boşluk olması lazım.

Dosyada yer alacak tam kod aşağıdadır:

{% filename %}python_intro.py{% endfilename %}

```python
def hi(name):
    print('Merhaba ' + name + '!')

girls = ['Rachel', 'Monica', 'Phoebe', 'Ola', 'Sen']
for name in girls:
    hi(name)
    print('Sıradaki kız')
```

Ve onu çalıştırdığımız zaman:

{% filename %}komut-satırı{% endfilename %}

    $ python3 python_intro.py
    Selam Seda!
    Sıradaki
    Selam Gül!
    Sıradaki
    Selam Pınar!
    Sıradaki
    Selam Ayşe!
    Sıradaki
    Selam Sen!
    Sıradaki
    

Gördüğünüz gibi, `for` cümlesinin içine boşluk karakteri ile koyduğunuz her şey `girls` listesi için tekrarlanıyor.

Ayrıca `for`'u `range` fonksiyonuyla beraber sayılar üzerinde de kullanabilirsiniz:

{% filename %}python_intro.py{% endfilename %}

```python
for i in range(1, 6):
    print(i)
```

Çalıştırırsak:

{% filename %}komut-satırı{% endfilename %}

    1
    2
    3
    4
    5
    

`range` fonksiyonu birbirini takip eden sayılardan bir liste oluşturur (bu sayıları da siz parametre olarak yazarsınız).

Sizin verdiğiniz ikinci parametrenin listede olmadığına dikkat edin. Yani `range(1, 6)` 1'den 5'e kadar sayıyor, 6 dahil edilmiyor. Yani çünkü “aralık” yarı açıktır, ve yani ilk değeri içerir, ama son değeri içermez.

## Özet

İşte bu. **Harikasın, süpersin!** Bu bölüm biraz zordu, kendinle gurur duymalısın. Biz buraya kadar geldiğin için seninle gurur duyuyoruz!

Resmi ve tam python öğreticisi için https://docs.python.org/3/tutorial/ adresini ziyaret edin. Bu size dil hakkında daha kapsamlı ve eksiksiz bir çalışma sunacaktır. Şerefe :)

Sonraki bölüme geçmeden başka bir şey yapmak isteyebilirsin. -gerin, biraz etrafta gezin, gözlerini dinlendir- :)

![Cupcake (Kek)](images/cupcake.png)