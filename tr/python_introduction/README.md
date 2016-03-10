# Python'a Giriş

> Bu bölümün bazı kısımları Geek Girls Carrots (http://django.carrots.pl/) öğreticisinden alınmıştır.

Biraz kod yazalım!

## Python komut istemi (prompt)

Python'la oynamaya başlamadan önce bilgisayarımızda bir *komut satırı* açmamız gerekiyor. Bunu nasıl yapacağınızı artık biliyorsunuz, [Komut satırına giriş][1] bölümünde öğrenmiştiniz.

 [1]: ../intro_to_command_line/README.md

Hazır olduğunuzda, aşağıdaki talimatları takip edin.

Bir Python konsolu açmak istiyoruz; öyleyse Windows'ta `python`, Mac OS/Linux'ta `python3` yazıp, `enter`'a basın.

```
$ python3
Python 3.4.3 (...)
Type "help", "copyright", "credits" or "license" for more information.
>>>
```

## İlk Python komutunuz!

Python komutunu çalıştırdıktan sonra, komut istemi `>>>` şeklinde değişti. Bizim için bu, şimdi yalnızca Python dilinde komutlar kullanabileceğimiz anlamına geliyor. `>>>` yazmanıza gerek yok, Python sizin için bunu yapıyor.

Eğer herhangi bir zamanda Python komut satırından çıkmak isterseniz, yalnızca `exit()` yazmanız ya da Windows için `Ctrl + Z`, Mac/Linux için `Ctrl + D` kısa yolunu kullanmanız yeterli. Bunu yaptığınız taktirde artık `>>>` yazısını görmeyeceksiniz.

Şu an için Python komut satırından çıkmak istemiyoruz. Bu konuda daha fazlasını öğrenmek istiyoruz. Gerçekten basit bir şeyle başlayalım. Örneğin, biraz matematik yapmayı deneyip `2 + 3` gibi bir şey yazın ve `enter`'a basın.

```
>>> 2 + 3
5
```

Harika! Cevabın komut satırına geldiğini gördün değil mi? Python matematik biliyor! Şu gibi komutları da deneyebilirsiniz: - `4 * 5` - `5 - 1` - `40 / 2`

Bunları biraz kurcalayıp eğlen, sonra tekrar burada buluşalım :).

Gördüğün üzere Python çok iyi bir hesap makinesi. Eğer başka neler yapabileceğini merak ediyorsan...

## String'ler (dizeler)

Mesela ismin? İsmini tırnak işaretleri içerisinde şu şekilde yaz:

```
>>> "Zeynep"
'Zeynep'
```

İlk string'ini oluşturdun! String (katar), bilgisayar tarafından işlenebilen ve karakterlerden oluşan dizilerin genel adıdır. Bir string her zaman aynı özel karakterle başlamalı ve aynı özel karakterle bitmelidir. Tek tırnak (`'`) veya çift tırnak (`"`) olabilir (aralarında herhangi bir fark yok!). Tırnak işaretleri Python'da içlerinde olan şeyin bir string olduğunu ifade eder.

Stringler birbirlerine eklenebilir. Şunu dene:

```
>>> "Merhaba " + "Zeynep"
'Merhaba Zeynep'
```

Ayrıca stringleri bir sayı ile çarpabilirsin:

```
>>> "Zeynep" * 3
'ZeynepZeynepZeynep'
```    

Eğer stringinin içerisine bir tırnak işareti koymak istiyorsan, bunun için iki seçeneğin var.

Çift tırnak kullanarak:

```
>>> "Turgut Uyar'ın dizeleriyiz"
"Turgut Uyar'ın dizeleriyiz"
```

veya sola eğik çizgi (``) kullanarak:

```
>>> 'Turgut Uyar\'ın dizeleriyiz'
"Turgut Uyar'ın dizeleriyiz"
```

Hoş değil mi? İsminin tamamını büyük harf yapmak için, sadece şunu yazman yeterli:

```
>>> "Zeynep".upper()
'ZEYNEP'
```

Stringin üzerinde `upper` **fonksiyon**unu kullandın! Bir fonksiyon (`upper()` gibi) , çağırıldığında(calling) Python'un bir obje (`"Zeynep"`) üzerinde gerçekleştirmesi gereken bir dizi işleme denilir.

Eğer ismindeki harflerin sayısını öğrenmek istiyorsan bunun için de bir fonksiyon var!

```
>>> len("Zeynep")
6
```

Fonksiyonları bazen string sonunda bir `.` ile (`"Zeynep".upper()` gibi) ve bazen önce fonksiyonu çağırıp sonra parantezler içerisine stringi yerleştirerek kullandığımızı merak ediyor musun? Pekala, bazı durumlarda, fonksiyonlar bir takım nesnelere aittirler, mesela `upper()`, yalnızca stringler üzerinde kullanılabilir. Böyle durumlarda, bu tarz fonksiyonlara biz **method** ismini veriyoruz. Diğer durumlarda, bir fonksiyon özel olarak bir nesneye ait olmayıp, farklı çeşitlerde nesneler üzerinde de kullanılabilir, aynı `len()` gibi. İşte bu nedenle `"Zeynep"` stringini `len` fonksiyonuna bir parametre olarak veriyoruz.

### Özet

Tamam, stringlerden yeterince bahsettik. Şu ana kadar şu konuları öğrendin:

*   **konsol-komut istemcisi** - Python komut satırına komut(kod) yazdığında Python cevap veriyor
*   **sayılar ve strings(karakter dizinleri)** - Python'da sayılar matematik ve stringler metin nesneleri için kullanılıyor
*   **operators(işleçler)** + ve * gibi, değerleri birleştirerek yeni bir değer oluştuyor
*   **fonksiyonlar-işlevler** - upper() ve len() gibi, nesneler üzerinde eylemler gerçekleştiriyor.

Bunlar öğreneceğiniz her programlama dilinin temelleri. Biraz daha zor bir şey için hazır mısın? İddiaya gireriz öylesin!

## Errors - Hatalar

Şimdi yeni bir şey deneyelim. Bir sayının uzunluğunu, bir string'in uzunluğunu bulduğumuz gibi bulabilir miyiz? Bu görmek için `len(304023)` yazıp `enter`a basalım:

```
>>> len(304023)
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
TypeError: object of type 'int' has no len()
```

İlk hatamızı aldık! Nesne türü "int" (tam sayılar, tüm sayılar) in uzunluğu olmadığını söylüyor. Şimdi ne yapabiliriz? Belki de rakamı bir string olarak yazabiliriz? Stringlerin bir uzunluğu var, değil mi?

```
>>> len(str(304023))
6
```

İşe yaradı! `str` fonksiyonunu `len` fonksiyonunun içinde kullandık. `str` her şeyi string'e çeviriyor.

*   `str` fonksiyonu, değişkenleri **stringe** çeviriyor
*   `int` fonksiyonu değişkenleri **integera** çeviriyor

> Önemli: Tamsayıları yazıya çevirebiliriz, fakat yazıları(text) sayılara çeviremeyiz - `int('selamlar')` bir anlam ifade etmiyor.

## Değişkenler

Programlamada en önemli konulardan biri değişkenlerdir. Değişken, daha sonra kullanmak istediğiniz bir yapıya verdiğiniz isimdir. Programcılar değişkenleri verileri tutmak ya da kodlarını daha okunabilir ve anlaşılabilir kılmak için kullanırlar ve böylece her şeyi sürekli akıllarında tutmaya gerek kalmaz.

`name` adında bir değişken yaratmak istediğimizi varsayalım:

```
>>> name = "Ayşe"
```

Gördünüz mü? Ne kadar kolay: name değişkeni "Ayşe" oldu.

Farkettiğiniz gibi, program daha öncekilerinin aksine bu kez hiçbir cevap vermedi. O zaman böyle bir değişkenin gerçekten tanımlı olduğunu nasıl bilebiliriz? Basitçe, `name` yazıp `enter` tuşuna basalım:

```
>>> name
'Ayşe'
```

İşte bu sizin ilk değişkeniniz! name değişkeninin referansını(içini) istediğiniz zaman değiştirebilirsiniz:

```
>>> name = "Suzan"
>>> name
'Suzan'
```

Bu değişkeni fonksiyonlar içinde de kullanabilirsiniz:

```
>>> len(name)
5
```

Harika değil mi? Tabii ki değişkenler, sayılar da dahil herhangi bir şey olabilir. Şunu deneyin: 

```
>>> a = 4
>>> b = 6
>>> a * b
24
```    

Peki ya değişkenin adını yanlış kullanırsak? Ne olacağını tahmin ediyor musunuz? Deneyelim! 

```
>>> city = "Tokyo"
>>> ctiy
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
NameError: name 'ctiy' is not defined
```

Bir hata! Gördüğünüz gibi, Python bir çok çeşit hata çeşidine sahip ve bu hatanın adı **NameError** , yani İsimlendirme Hatası. Tanımlamadığınız bir değişkenin adını kullanmaya çalışırsanız, Python size bu hatayı verir. Eğer bu hata ile daha sonra karşılaşırsanız, kodunuzdaki değişkenlerin adını doğru yazıp yazmadığınızı kontrol edin.

Bununla biraz oynayıp, neler yapabildiğinizi görün!

## Print (yazdır) işlevi

Şunu deneyin:

```
>>> name = 'Merve'
>>> name
'Merve'
>>> print(name)
Merve
```

Sadece `name` yazdığınız zaman, Python yorumlayıcısından 'name' değişkeninin dize olarak *temsili* döner, yani tek tırnaklar içine alınmış M-e-r-v-e harfleri. Eğer `print(name)` derseniz Python ekrana değişkenin içeriğini yazdıracaktır, bu kez tırnaklar olmaksızın, daha temiz biçimde.

Daha ileride göreceğimiz gibi `print()`, işlevlerin içindeyken bir şey yazdırmak istediğimizde ya da bazı şeyleri birden fazla satırda yazdırmak istediğimizde de kullanışlıdır.

## Listeler

Python, string ve integerın yanı sıra, çok değişik türlerde nesnelere sahiptir. Şimdi, **liste** türünü tanıtacağız. Listeler tam da düşündüğünüz gibidir: diğer nesnelerin listesi olan nesne :)

Yeni bir liste yaratmakla devam edelim:

```
>>> []
[]
```

Evet, liste boş. Çok kullanışlı sayılmaz, değil mi? Hadi loto numaralarıyla liste oluşturalım. Sürekli kendimizi tekrar etmek istemeyiz, o yüzden listeyi değişkene atayalım:

```
>>> lottery = [3, 42, 12, 19, 30, 59]
```

Pekala, listeyi oluşturduk! Onunla ne yapabiliriz? Hadi listede kaç tane loto numarası olduğunu görelim. Hangi fonksiyonu kullanman gerektiği hakkında bir fikrin var mı? Zaten bildiğin bir fonksiyon!

```
>>> len(lottery)
6
```

Evet! `len()` listedeki nesne sayısını verir. Kullanışlı, değil mi? Belki de şu an listeyi sıralarız:

```
>>> lottery.sort()
```

Bu hiçbir cevap vermez, sadece listedeki numaraların sırasını değiştirir. Şimdi listeyi yazdıralım ve ne olduğunu görelim:

```
>>> print(lottery)
[3, 12, 19, 30, 42, 59]
```

Gördüğünüz gibi, listedeki sayılar artık küçükten büyüğe sıralı. Tebrikler!

Belki de sıralamayı ters çevirmek isteriz? Hadi yapalım!

```
>>> lottery.reverse()
>>> print(lottery)
[59, 42, 30, 19, 12, 3]
```

Kolay, değil mi? Listeye yeni bir eleman eklemek isterseniz, bu komutu yazarak yapabilirsiniz:

```
>>> lottery.append(199)
>>> print(lottery)
[59, 42, 30, 19, 12, 3, 199]
```

Sadece listedeki ilk elemanı göstermek isterseniz, **indexes** (indeksler) ile yapabilirsiniz. İndeks elemanın listede nerede olduğunu belirten numaradır. Programcılar sıfırdan başlamayı tercih ederler, bu yüzden listedeki ilk eleman listenin 0. indeksindedir, sonraki 1. indeksindedir ve böyle devam eder. Şunu deneyin:

```
>>> print(lottery[0])
59
>>> print(lottery[1])
42
```

Gördüğünüz gibi, Listedeki nesnelere listenin ismi ve köşeli parantez içindeki nesnenin indeksini kullanarak ulaşabilirsin.

Listeden eleman silmek için yukarıda öğrendiğimiz gibi **indeksleri** ve **del** komutunu kullanman gerekir (del silmenin(delete) kısaltmasıdır). Bir örnekle öğrendiklerimizi pekiştirelim; listeden ilk numarayı sileceğiz.

```
>>> print(lottery)
[59, 42, 30, 19, 12, 3, 199]
>>> print(lottery[0])
59
>>> del lottery[0]
>>> print(lottery)
[42, 30, 19, 12, 3, 199]
```

Kusursuz çalıştı!

Daha fazla eğlence için diğer indeksleri de deneyin: 6, 7, 1000, -1, -6 veya -1000. Denemeden önce komutların sonuçlarını tahmin etmeye çalışın. Sonuçlar mantıklı mıydı?

Bütün liste fonksiyonlarını Python dökümantasyonunun bu bölümünde bulabilirsin: https://docs.python.org/3/tutorial/datastructures.html

## Sözlükler

Sözlük listeye benzerdir ancak sözlük değerlerine indeks yerine anahtar ile ulaşılır. Anahtar metin veya numara olabilir. Boş bir sözlük oluşturmak için kullanılan söz dizimi şudur:

```
>>> {}
{}
```

Bu boş bir sözlük oluşturduğunuzu gösterir. Yaşasın!

Şimdi, bu komutu yazmayı deneyin (kendi bilgilerinle değiştir):

```
>>> participant = {'name': 'Ayşe', 'country': 'Türkiye', 'favorite_numbers': [7, 42, 92]}
```    

Bu komut ile üç anahtar-değer çiftine sahip `participant` isminde bir değişken oluşturdun:

*   Anahtar `name` `'Ayşe'` (`string` nesnesi) değerine işaret eder,
*   `country` `Türkiye` (bir diğer `string`) değerine,),
*   ve `favorite_numbers` `[7, 42, 92]` (3 numaralı bir `list`) değerine işaret eder.

Bu söz dizimi ile tek bir anahtarın içeriğini kontrol edebilirsin:

```
>>> print(participant['name'])
Ola
```

Gördün mü, listeye benzer. Ancak indeksini hatırlamana gerek yok - sadece ismi.

Python'a olmayan bir anahtarın değerini sorarsak ne olur? Tahmin edebiliyor musun? Hadi deneyip görelim!

```
>>> participant['age']
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
KeyError: 'age'
```

Bir başka hata! **KeyError** hatası. Python yardımseverdir ve sana `'age'` anahtarının sözlükte bulunmadığını söyler.

Ne zaman sözlük veya liste kullanmalısın? Düşünmek için güzel bir nokta. Sonraki satırdaki cevaba bakmadan önce kafanızda bir çözüm oluşturun.

*   Sıralı elemanlara mı ihtiyacın var? Liste ile devam et.
*   İleride hızlıca (anahtarlar ile) değerlere ulaşmak istediğin için anahtarlar ile ilişkilendirilmiş değerlere mi ihtiyacın var? Sözlük kullan.

Sözlükler de listeler gibi değişebilirdir (*mutable*), yani oluşturulduktan sonra değiştirilebilirler. Oluşturulduktan sonra sözlüklere anahtar/değer çifti ekleyebilirsiniz, aşağıdaki gibi:

```
>>> participant['favorite_language'] = 'Python'
```

Listeler gibi, `len()` metodu sözlükteki anahtar-değer çiftlerinin sayısını bize verir. Devam edip şu komutu yazın:

```
>>> len(participant)
4
```

Umarım şu ana kadar mantıklı gelmiştir :) Sözlüklerle biraz daha eğlenceye hazır mısın? İlginç şeyler için sonraki satıra atla.

`del` komutunu sözlükten eleman silmek için kullanabilirsin. Mesela, `'favorite_numbers'` anahtarına karşılık gelen elemanı silmek istersen, sadece şu komutu yaz:

```
>>> del participant['favorite_numbers']
>>> participant
{'country': 'Türkiye', 'favorite_language': 'Python', 'name': 'Ayşe'}
```    

Çıktıdan görebildiğin gibi, 'favorite_numbers' anahtarına karşılık gelen anahtar-değer çifti silindi.

Bunun yanı sıra, sözlükteki daha önce oluşturulmuş anahtarın değerini değiştirebilirsiniz. Şunu yazın:

```
>>> participant['country'] = 'Almanya'
>>> participant
{'country': 'Almanya', 'favorite_language': 'Python', 'name': 'Ayşe'}
```

Gördüğün gibi, `'country'` anahtarının değeri `'Türkiye'`den `'Almanya`'ya çevrildi. :) Heyecan verici değil mi? Yaşasın! Bir başka harika şey öğrendin.

### Özet

Harika! Şu an programlama hakkında birçok şey biliyorsun. Bu kısımda, şunları öğrendin:

*   **hatalar** - eğer Python yazdığın komutu anlamazsa çıkan hataları nasıl okuyacağını ve anlayacağını artık biliyorsun
*   **değişkenler** - daha kolay kod yazmanı sağlayan ve kodunu daha okunabilir yapan nesnelerin isimleri
*   **listeler** - belirli bir sırada tutulan nesnelerin listesi
*   **sözlükler** - anahtar-değer çifti olarak tutulan nesneler

Bir sonraki part için heyecanlı mısınız? :)

## Karşılaştırma

Programlamanın önemli bir bölümü bir şeyleri karşılaştırmayı içerir. Karşılaştırılabilecek en kolay şey nedir? Tabii ki sayılar. Nasıl çalıştığını görelim (True = "Doğru", False= "Yanlış" demek).

```
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

Python'a birkaç sayı karşılaştırmasını söyledik. Gördüğünüz gibi, sadece sayıları karşılaştırmakla kalmadı, aynı zamanda metodların sonuçlarını da karşılaştırdı. Güzel değil mi?

İki sayının eşit olup olmadığını öğrenmek için neden iki tane eşittir işraretini `==` yan yana koyduk? Değişkenlere içerik verirken, tek `=` işaretini kullanıyoruz. İki sayının birbirine eşit olup olmadığını görmek için **her zaman** `==` işaretini kullanmak gerekiyor. Sayıların birbirine eşit olmaması durumunu da kontrol edebiliriz. Bunun için, yukarıdaki örnekteki gibi `!=` sembolünü kullanıyoruz. 

Python' a iki görev daha verin:

```
>>> 6 >= 12 / 2
True
>>> 3 <= 2
False
```

`>` ve `<` işaretleri kolay, fakat `>=` ve `<=` ne anlama geliyor?

*   x `>` y : x büyüktür y
*   x `<` y : x küçüktür y
*   x `<=` y : x küçük eşittir y
*   x `>=` y : x büyük eşittir y

Harika! Biraz daha ister misiniz? Şunu deneyin: 

```
>>> 6 > 2 and 2 < 3
True
>>> 3 > 2 and 2 < 1
False
>>> 3 > 2 or 2 < 1
True
```

Python'a istediğiniz kadar sayıyı karşılaştırmak için verebilirsiniz, ve size hepsinin cevabını verecek. Çok akıllı değil mi?

*   **and** - Mantıkta kullandığımız "ve" anlamına geliyor, yani iki taraf da True, yani doğruysa, cevap da True olacak
*   **or** - Bu da "veya" anlamına geliyor, karşılaştırılan iki taraftan tek bir tanesi bile True ise bize True cevabını verecek

Portakallarla elmaları karşılaştılaştırabilir miyiz? Bunun Python'daki eşdeğerini deneyelim: 

```
>>> 1 > 'django'
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
TypeError: unorderable types: int() > str()
```

Gördüğünüz gibi Python tam sayılar(`int`) ve kelimeleri(yani stringleri, `str`) karşılaştıramıyor. Onun yerine, **TypeError** göstererek iki farklı tipteki değişkenin karşılaştırılamayacağını söylüyor. 

## Boolean (Mantıksal)

Laf arasında, yeni bir Python nesne tipi öğrendiniz. Adı **boolean** olan bu tip çok kolay. 

Sadece iki tane boolean nesnesi var: - True (Doğru) - False (Yanlış)

Python'un bunu anlaması için her zaman "True" (ilk harf büyük, geri kalanları küçük) yazmanız gerekiyor. **true, TRUE, tRUE işe yaramaz -- sadece True doğru.** (Aynısı "False" için de geçerli.) 

Boolean'lar değişken de olabiliyor! Bakınız: 

```
>>> a = True
>>> a
True
```

Ayrıca bu şekilde de yapabilirsiniz:

```
>>> a = 2 > 5
>>> a
False
```

Boolean'lar ile aşağıdaki komutları deneyerek biraz oynayın:

*   `True and True`
*   `False and True`
*   `True or 1 == 1`
*   `1 != 2`

Tebrikler! Boolean'lar programlamadaki en havalı özelliklerden, ve az önce onları nasıl kullanmanız gerektiğini öğrendiniz! 

# Kaydet!

Şimdiye kadar kodumuzu bizi sadece tek satır yazmaya limitleyen yorumlayıcı üzerinde yazdık. Normal programlar dosyalar içine kaydedilir ve programlama dilimizin **yorumlayıcısıyla** veya **derleyicisiyle** çalıştırılır. Şimdiye kadar programlarımızı Python **yorumlayıcısında** teker satır teker satır çalıştırdık. Bundan sonraki görevlerde, birden fazla satıra ihtiyacımız olacak, bu yüzden şunlara ihtiyacımız olacak:

*   Python yorumlayıcısından çıkın
*   Seçtiğiniz kod düzenleyicisini açın
*   Yeni Python dosyasına kod kaydedin
*   Çalıştırın!

Kullandığımız Python yorumlayıcısından çıkmak için sadece ~~~ exit() ~~~ fonksiyonunu yazmanız yeterlidir:

```
>>> exit()
$
```

Bu sizi komut satırına geri yönlendirecektir.

Biraz önce [kod editörü][2] bölümünden bir kod editörü seçmiştik. Şimdi o editörü açmalı ve yeni bir dosya içine kod yazmalıyız:

 [2]: ../code_editor/README.md

```python
print('Merhaba, Django girls!')
```

> **Not** Kod editörlerinin en havalı özelliğini fark etmiş olmalısınız: renkler! Python konsolunda her şey aynı renkteydi, şimdi `print` fonksiyonunun stringden farklı bir renkte olduğunu görüyorsunuz. Bunun ismi "söz dizimi vurgulama" ve kod yazarken gerçekten yararlı bir özellik. Koddaki renkler sana ipucu verecektir, örneğin metin kullanım hatasında veya dildeki anahtar kelimenin yanlış yazımında (mesela fonksiyondaki `def`, aşağıda göreceğiz). Bu kod düzenleyicisi kullanma nedenlerimizden biri :)

Açıkça, artık oldukça deneyimli Python programcısısın, bu yüzden bugün öğrendiğin kodları yazmaktan çekinme.

Şimdi dosyayı tanımlayıcı bir isimle kaydetmemiz gerekir. Dosyanın ismine **python_intro.py** diyelim ve masaüstüne kaydedelim. Dosyaya istediğimiz ismi verebiliriz, burada önemli olan kısım dosyanın **.py** uzantısı ile bitmesidir. **.py** uzantısı işletim sistemimize bu dosyanın bir **python çalıştırılabilir dosyası** olduğunu ve Python'un bu dosyayı çalıştırabileceğini belirtiyor.

Dosyayı kaydettiğimize göre artık çalıştırabiliriz! Konsoldan **Klasör değiştirme** yaparak masaüstüne ulaşın, komut satırı bölümünde öğrendiklerinizi hatırlayın.

Mac'de bu komut şunun gibi görünecektir:

```
$ cd /Users/<isminiz>/Desktop
```

Linux'ta ise bu şekilde ("Desktop" kelimesi "Masaüstü" olarak da görünebilir):

```
$ cd /home/<isminiz>/Desktop
```

Ve Windows'ta, bu şekilde olacak:

```
> cd C:\Users\<isminiz>\Desktop
```

Bir problem olursa yardım istemekten çekinmeyin.

Şimdi dosyadaki komutları çalıştırmak için Python'u kulllanın:

```
$ python3 python_intro.py
Merhaba, Django girls!
```

Tamam! Bir dosyaya kaydedilen ilk Python programınızı çalıştırdınız. Harika hissediyor musunuz?

Şimdi programlamanın olmazsa olmaz bir aracını öğrenme zamanı:

## If...elif...else (Koşullu Akış)

Kodunuzdaki bir çok şeyi sadece belirli bir durum sağlanıyorsa çalıştırmayı isteyeceksiniz. İşte tam da bu yüzden Python'da **if deyimi** isminde bir yapı bulunuyor.

**python_intro.py** dosyasındaki kodunuzu şununla değiştirin:

```python
if 3 > 2:
```

Eğer bunu kaydedip çalıştırsaydık şu hatayla karşılaşacaktık:

```
$ python3 python_intro.py
File "python_intro.py", line 2
         ^
SyntaxError: unexpected EOF while parsing
```

Python bizden kendisine `3 > 2` durumu (veya `True`) sağlandığında neyi çalıştıracağını söylememizi bekliyor. Python'a "Çalışıyor!" yazmasını söyleyelim. **python_intro.py** dosyanızdaki kodu şununla değiştirin:

```python
if 3 > 2:
    print('Çalışıyor!')
```

4 tane boşluk karakteri bıraktığımıza dikkat ettiniz mi? Bunu yaparak if cümlesine yazdığım durum doğru olduğunda neyi çalıştırması gerektiğini Python'a söylemiş oluyoruz. Aslında tek bir boşlukla da yapabilirsiniz, ama hemen hemen bütün Python programcıları kodlarının temiz görünmesi için 4 boşluk bırakıyor. Tek `tab` karakteri de 4 boşluk yerine geçecektir.

Kaydedip çalıştırmayı deneyelim:

```
$ python3 python_intro.py
Çalışıyor!
```

### Ya bir koşul True (Doğru) değilse?

Önceki örneklerde kod sadece koşullar sadece True olduğunda çalışıyordu. Ama Python ayrıca `elif` ve `else` ifadelerine de sahip:

```python
if 5 > 2:    
    print('5 gerçekten de 2'den büyüktür') 
else:     
    print('5  2'den büyük değildir')
```

Bu kod çalıştığında aşağıdaki çıktıyı verecektir:

```
$ python3 python_intro.py
5 gerçekten de 2'den büyüktür
```

Eğer 2 5'ten büyük bir sayı olsaydı ikinci komut çalışacaktı. Kolay, değil mi? Şimdi `elif`'in nasıl çalıştığına bakalım:

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

```
$ python3 python_intro.py
Selam Zeynep!
```

Gördünüz mü? Eğer önceki if cümleleriniz doğru olmazsa kontrol edilmek üzere `elif` cümleleri ekleyebilirsiniz.

`if` cümlenizden sonra istediğiniz kadar `elif` cümlesi ekleyebilirsiniz. Mesela:

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

```
$ python3 python_intro.py
Harika, her notayı duyabiliyorum
```    

### Özet

Son üç alıştırmada öğrendikleriniz:

*   **kıyaslama yapmak** - Python'da `>`, `>=`, `==`, `<=`, `<`, `and`, `or` operatörlerini kullanarak kıyaslama yapabiliriz
*   **Boolean** - İki farklı değer alabilen bir nesne tipidir: Ya `True` (doğru) olur ya da `False` (yanlış)
*   **Dosya kaydetmek** - kodlarımızı dosyalara kaydederek daha büyük programları çalıştırabiliriz.
*   **if...elif...else** - cümlelerini sadece belirli durumlar sağlandığında çalıştırmak istediğimiz komutlar için kullanabiliriz.

Bu bölümün son kısmının zamanı geldi!

## Kendi fonksiyonlarınız!

Python'daki `len()` gibi fonksiyonları hatırlıyor musunuz? Haberler iyi - artık kendi fonksiyonlarınızı da yazabileceksiniz!

Fonksiyon Python tarafından işlenmesi gereken yönergeler dizisidir. Python'da her fonksiyon `def` anahtar kelimesi ile başlar, bir isim verilir ve bazı parameterleri olabilir. Kolay bir tane ile başlayalım. **python_intro.py** içindeki kodu aşağıdaki ile değiştirelim:

```python
def hi():
    print('Merhaba!')
    print('Nasılsın?')

hi()
```

Tamam, ilk fonksiyonumuz hazır!

Fonksiyon adını neden dosyanın en altına yazdığımızı merak edebilirsiniz. Bunun nedeni, Python'ın dosyayı okuyup, onu yukarıdan aşağı doğru işlemesi. Yani fonksiyonumuzu kullanabilmek için, onu en alt kısımda yeniden yazmalıyız.

Haydi şimdi bunu çalıştıralım ve neler olacağını görelim:

```
$ python3 python_intro.py
Merhaba!
Nasılsın?
```

Bu epey kolaydı! Şimdi parametreli bir fonksiyon yazalım. Bir önceki örneği kullanabiliriz - fonksiyonumuz yine 'merhaba' desin - ama bu sefer ismini de söylesin:

```python
def hi(name):
```

Gördüğünüz gibi, fonksiyonumuza `name` (isim) adında bir parametre ekledik:

```python
def hi(name):
    if name == 'Ayşe':
        print('Selam Ayşe!')
    elif name == 'Zeynep':
        print('Selam Zeynep!')
    else:
        print('Selam yabancı!')

hi()
```

Unutmayın: `if` içerisindeki `print` fonksiyonundan önce dört tane boşluk var. Bunun sebebi sadece durum sağlandığında çalışmasını istememiz. Bakalım nasıl çalışıyor:

```
$ python3 python_intro.py
Traceback (most recent call last):
File "python_intro.py", line 10, in <module>
  hi()
TypeError: hi() missing 1 required positional argument: 'name'
```

Üzgünüz, bir hata. Neyse ki, Python bize oldukça yararlı bir hata mesajı veriyor. `hi()` fonksiyonun (yukarıda tanımladığımız) bir değişken kullanımını gerektirdiğini (`name` isimli) ve bizim o değişkeni fonksiyonu çağırırken iletmeyi unuttuğumuzu söylüyor. Dosyanın alt kısmında hatayı düzeltelim:

```python
hi("Ayşe")
```

Ve tekrar çalıştıralım:

```
$ python3 python_intro.py
Selam Ayşe!
```

Ve eğer ismi değiştirirsek ne olur?

```python
hi("Zeynep")
```

Ve çalıştırın:

```
$ python3 python_intro.py
Selam Zeynep!
```

Peki Ayşe veya Zeynep dışında başka bir isim yazdığımızda ne olacağını tahmin edebiliyor musunuz? Deneyin ve tahmininizin doğru olup olmadığını görün. Şunun gibi bir şey yazmalı:

```
Selam yabancı!
```

Süper değil mi? Böylece fonksiyona göndereceğiniz isim değiştiğinde aynı kodu tekrar tekrar yazmanıza gerek kalmayacak. İşte fonksiyonlara tam da bu yüzden ihtiyacımız var - aynı kodu tekrar yazmaya gerek yok!

Hadi daha akıllıca bir şeyler yapalım -- tabii ki ikiden fazla isim var ve her isim için bir kontrol yazmak zor olurdu, değil mi?

```python
def hi(name):
    print('Selam ' + name + '!')

hi("Seda")
```

Şimdi kodu çağıralım:

```
$ python3 python_intro.py
Selam Seda!
```

Tebrikler! Az önce fonksiyonları nasıl yazacağınızı öğrendiniz! :)

## Döngüler

Bu da zaten son parça. Hızlı oldu, değil mi? :)

Programcılar kendilerini tekrar etmeyi sevmezler. Programlama tamamen işleri otomatize etmedir, bu yüzden her insanı ismiyle selam istemeyiz, değil mi? İşte burası döngülerin devreye girdiği yerdir.

Hala listeleri hatırlıyoruz değil mi? Haydi bir kızlar listesi yapalım:

```python
girls = ['Seda', 'Gül', 'Pınar', 'Ayşe', 'Sen']
```

Diyelim ki hepsine merhaba demek istiyoruz. Az önce yazdığımız `hi` fonksiyonunu döngü içinde kullanabiliriz:

```python
for name in girls:
```    

~~~ for~~~ cümlesi ~~~ if~~~ cümlesine benzer davranır; ikisi için de dört boşluk karakterine ihtiyacımız car.

Dosyada yer alacak tam kod aşağıdadır:

```python
def hi(name):
    print('Selam ' + name + '!')

girls = ['Seda', 'Gül', 'Pınar', 'Ayşe', 'Sen']
for name in girls:
    hi(name)
    print('Sıradaki')
```

Ve onu çalıştırdığımız zaman:

```
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
```

Gördüğünüz gibi, `for` cümlesinin içine boşluk karakteri ile koyduğunuz her şey `girls` listesi için tekrarlanıyor.

Ayrıca `for`'u `range` fonksiyonuyla beraber sayılar üzerinde de kullanabilirsiniz:

```
for i in range(1, 6):
    print(i)
```

Çalıştırırsak:

```
1
2
3
4
5
```    

`range` fonksiyonu birbirini takip eden sayılardan bir liste oluşturur (bu sayıları da siz parametre olarak yazarsınız).

Sizin verdiğiniz ikinci parametrenin listede olmadığına dikkat edin. Yani `range(1, 6)` 1'den 5'e kadar sayıyor, 6 dahil edilmiyor. Çünkü "range" yarı-açık bir aralık ifade ediyor, yani ilk sayı dahil ediliyor ama sondaki sayı dahil edilmiyor.

## Özet

İşte bu. **Harikasın, süpersin!** Bu bölüm biraz zordu, kendinle gurur duymalısın. Biz buraya kadar geldiğin için seninle gurur duyuyoruz!

Bir sonraki bölüme geçmeden önce kısa bir süreliğine başka birşey yapmak isteyebilirsiniz - esneyin, biraz etrafı dolaşın, gözlerinizi dinlendirin :)

![Kek][3]

 [3]: images/cupcake.png