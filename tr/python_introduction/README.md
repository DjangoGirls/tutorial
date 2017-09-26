# Python'a Giriş

> Part of this chapter is based on tutorials by Geek Girls Carrots (https://github.com/ggcarrots/django-carrots).

Biraz kod yazalım!

## Python komut istemi (prompt)

> For readers at home: this part is covered in the [Python Basics: Integers, Strings, Lists, Variables and Errors](https://www.youtube.com/watch?v=MO63L4s-20U) video.

Python'la oynamaya başlamadan önce bilgisayarımızda bir *komut satırı* açmamız gerekiyor. You should already know how to do that – you learned it in the [Intro to Command Line](../intro_to_command_line/README.md) chapter.

Hazır olduğunuzda, aşağıdaki talimatları takip edin.

We want to open up a Python console, so type in `python` on Windows or `python3` on Mac OS/Linux and hit `enter`.

{% filename %}command-line{% endfilename %}

    $ python3
    Python 3.6.1 (...)
    Type "help", "copyright", "credits" or "license" for more information.
    >>>
    

## İlk Python komutunuz!

Python komutunu çalıştırdıktan sonra, komut istemi `>>>` şeklinde değişti. Bizim için bu, şimdi yalnızca Python dilinde komutlar kullanabileceğimiz anlamına geliyor. You don't have to type in `>>>` – Python will do that for you.

Eğer herhangi bir zamanda Python komut satırından çıkmak isterseniz, yalnızca `exit()` yazmanız ya da Windows için `Ctrl + Z`, Mac/Linux için `Ctrl + D` kısa yolunu kullanmanız yeterli. Bunu yaptığınız taktirde artık `>>>` yazısını görmeyeceksiniz.

Şu an için Python komut satırından çıkmak istemiyoruz. Bu konuda daha fazlasını öğrenmek istiyoruz. Gerçekten basit bir şeyle başlayalım. For example, try typing some math, like `2 + 3` and hit `enter`.

{% filename %}command-line{% endfilename %}

```python
>>> 2 + 3
5
```

Nice! See how the answer popped out? Python knows math! You could try other commands like:

- `4 * 5`
- `5 - 1`
- `40 / 2`

To perform exponential calculation, say 2 to the power 3, we type: {% filename %}command-line{% endfilename %}

```python
>>> 2 ** 3
8
```

Have fun with this for a little while and then get back here. :)

As you can see, Python is a great calculator. If you're wondering what else you can do…

## String'ler (dizeler)

Mesela ismin? İsmini tırnak işaretleri içerisinde şu şekilde yaz:

{% filename %}command-line{% endfilename %}

```python
>>> "Zeynep"
'Zeynep'
```

İlk string'ini oluşturdun! String (katar), bilgisayar tarafından işlenebilen ve karakterlerden oluşan dizilerin genel adıdır. Bir string her zaman aynı özel karakterle başlamalı ve aynı özel karakterle bitmelidir. Tek tırnak (`'`) veya çift tırnak (`"`) olabilir (aralarında herhangi bir fark yok!). Tırnak işaretleri Python'da içlerinde olan şeyin bir string olduğunu ifade eder.

Stringler birbirlerine eklenebilir. Şunu dene:

{% filename %}command-line{% endfilename %}

```python
>>> "Merhaba " + "Zeynep"
'Merhaba Zeynep'
```

Ayrıca stringleri bir sayı ile çarpabilirsin:

{% filename %}command-line{% endfilename %}

```python
>>> "Zeynep" * 3
'ZeynepZeynepZeynep'
```

Eğer stringinin içerisine bir tırnak işareti koymak istiyorsan, bunun için iki seçeneğin var.

Çift tırnak kullanarak:

{% filename %}command-line{% endfilename %}

```python
>>> "Turgut Uyar'ın dizeleriyiz"
"Turgut Uyar'ın dizeleriyiz"
```

veya sola eğik çizgi (` \ `) kullanarak:

{% filename %}command-line{% endfilename %}

```python
>>> 'Turgut Uyar\'ın dizeleriyiz'
"Turgut Uyar'ın dizeleriyiz"
```

Hoş değil mi? İsminin tamamını büyük harf yapmak için, sadece şunu yazman yeterli:

{% filename %}command-line{% endfilename %}

```python
>>> "Zeynep".upper()
'ZEYNEP'
```

You just used the `upper` **method** on your string! A method (like `upper()`) is a sequence of instructions that Python has to perform on a given object (`"Ola"`) once you call it.

If you want to know the number of letters contained in your name, there is a **function** for that too!

{% filename %}command-line{% endfilename %}

```python
>>> len("Zeynep")
6
```

Fonksiyonları neden bazen stringin sonunda bir `.` ile (`"Zeynep".upper()` gibi) ve bazen de önce fonksiyonu çağırıp sonra parantez içerisine stringi yazarak kullandığımızı merak ediyor musun? Pekala, bazı durumlarda, fonksiyonlar bir takım nesnelere aittirler, mesela `upper()`, yalnızca stringler üzerinde kullanılabilir. Böyle durumlarda, bu tarz fonksiyonlara biz **method** ismini veriyoruz. Diğer durumlarda, bir fonksiyon özel olarak bir nesneye ait olmayıp, farklı çeşitlerde nesneler üzerinde de kullanılabilir, aynı `len()` gibi. İşte bu nedenle `"Zeynep"` stringini `len` fonksiyonuna bir parametre olarak veriyoruz.

### Özet

Tamam, stringlerden yeterince bahsettik. Şu ana kadar şu konuları öğrendin:

- **the prompt** – typing commands (code) into the Python prompt results in answers in Python
- **numbers and strings** – in Python numbers are used for math and strings for text objects
- **operators** – like `+` and `*`, combine values to produce a new one
- **functions** – like `upper()` and `len()`, perform actions on objects.

Bunlar öğreneceğiniz her programlama dilinin temelleri. Biraz daha zor bir şey için hazır mısın? İddiaya gireriz öylesin!

## Hatalar

Şimdi yeni bir şey deneyelim. Bir sayının uzunluğunu, bir string'in uzunluğunu bulduğumuz gibi bulabilir miyiz? Bunu görmek için `len(304023)` yazıp `enter`a basalım:

{% filename %}command-line{% endfilename %}

```python
>>> len(304023)
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
TypeError: object of type 'int' has no len()
```

İlk hatamızı aldık! Nesne türü "int" (tam sayılar, tüm sayılar) in uzunluğu olmadığını söylüyor. Şimdi ne yapabiliriz? Belki de rakamı bir string olarak yazabiliriz? Stringlerin bir uzunluğu var, değil mi?

{% filename %}command-line{% endfilename %}

```python
>>> len(str(304023))
6
```

İşe yaradı! `str` fonksiyonunu `len` fonksiyonunun içinde kullandık. `str` her şeyi string'e çeviriyor.

- `str` fonksiyonu, değişkenleri **stringe** çeviriyor
- `int` fonksiyonu değişkenleri **integera** çeviriyor

> Important: we can convert numbers into text, but we can't necessarily convert text into numbers – what would `int('hello')` be anyway?

## Değişkenler

Programlamada en önemli konulardan biri değişkenlerdir. Değişken, daha sonra kullanmak istediğiniz bir yapıya verdiğiniz isimdir. Programcılar değişkenleri verileri tutmak ya da kodlarını daha okunabilir ve anlaşılabilir kılmak için kullanırlar ve böylece her şeyi sürekli akıllarında tutmaya gerek kalmaz.

`name` adında bir değişken yaratmak istediğimizi varsayalım:

{% filename %}command-line{% endfilename %}

```python
>>> name = "Ayşe"
```

Gördünüz mü? Ne kadar kolay: name değişkeni "Ayşe" oldu.

Farkettiğiniz gibi, program daha öncekilerinin aksine bu kez hiçbir cevap vermedi. O zaman böyle bir değişkenin gerçekten tanımlı olduğunu nasıl bilebiliriz? Basitçe, `name` yazıp `enter` tuşuna basalım:

{% filename %}command-line{% endfilename %}

```python
>>> name
'Ayşe'
```

Yippee! Your first variable! :) You can always change what it refers to:

{% filename %}command-line{% endfilename %}

```python
>>> name = "Suzan"
>>> name
'Suzan'
```

Bu değişkeni fonksiyonlar içinde de kullanabilirsiniz:

{% filename %}command-line{% endfilename %}

```python
>>> len(name)
5
```

Awesome, right? Of course, variables can be anything – numbers too! Try this:

{% filename %}command-line{% endfilename %}

```python
>>> a = 4
>>> b = 6
>>> a * b
24
```

Peki ya değişkenin adını yanlış kullanırsak? Ne olacağını tahmin ediyor musunuz? Deneyelim! 

{% filename %}command-line{% endfilename %}

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

{% filename %}command-line{% endfilename %}

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

Python, string ve integerın yanı sıra, çok değişik türlerde nesnelere sahiptir. Şimdi, **liste** türünü tanıtacağız. Lists are exactly what you think they are: objects which are lists of other objects. :)

Yeni bir liste yaratmakla devam edelim:

{% filename %}command-line{% endfilename %}

```python
>>> []
[]
```

Evet, liste boş. Çok kullanışlı sayılmaz, değil mi? Hadi loto numaralarıyla liste oluşturalım. Sürekli kendimizi tekrar etmek istemeyiz, o yüzden listeyi değişkene atayalım:

{% filename %}command-line{% endfilename %}

```python
>>> lottery = [3, 42, 12, 19, 30, 59]
```

Pekala, listeyi oluşturduk! Onunla ne yapabiliriz? Hadi listede kaç tane loto numarası olduğunu görelim. Hangi fonksiyonu kullanman gerektiği hakkında bir fikrin var mı? Zaten bildiğin bir fonksiyon!

{% filename %}command-line{% endfilename %}

```python
>>> len(lottery)
6
```

Evet! `len()` listedeki nesne sayısını verir. Kullanışlı, değil mi? Belki de şu an listeyi sıralarız:

{% filename %}command-line{% endfilename %}

```python
>>> lottery.sort()
```

Bu hiçbir cevap vermez, sadece listedeki numaraların sırasını değiştirir. Şimdi listeyi yazdıralım ve ne olduğunu görelim:

{% filename %}command-line{% endfilename %}

```python
>>> print(lottery)
[3, 12, 19, 30, 42, 59]
```

Gördüğünüz gibi, listedeki sayılar artık küçükten büyüğe sıralı. Tebrikler!

Belki de sıralamayı ters çevirmek isteriz? Hadi yapalım!

{% filename %}command-line{% endfilename %}

```python
>>> lottery.reverse()
>>> print(lottery)
[59, 42, 30, 19, 12, 3]
```

Kolay, değil mi? Listeye yeni bir eleman eklemek isterseniz, bu komutu yazarak yapabilirsiniz:

{% filename %}command-line{% endfilename %}

```python
>>> lottery.append(199)
>>> print(lottery)
[59, 42, 30, 19, 12, 3, 199]
```

Sadece listedeki ilk elemanı göstermek isterseniz, **indexes** (indeksler) ile yapabilirsiniz. İndeks elemanın listede nerede olduğunu belirten numaradır. Programcılar sıfırdan başlamayı tercih ederler, bu yüzden listedeki ilk eleman listenin 0. indeksindedir, sonraki 1. indeksindedir ve böyle devam eder. Şunu deneyin:

{% filename %}command-line{% endfilename %}

```python
>>> print(lottery[0])
59
>>> print(lottery[1])
42
```

Gördüğünüz gibi, Listedeki nesnelere listenin ismi ve köşeli parantez içindeki nesnenin indeksini kullanarak ulaşabilirsin.

To delete something from your list you will need to use **indexes** as we learned above and the `pop()` method. Let's try an example and reinforce what we learned previously; we will be deleting the first number of our list.

{% filename %}command-line{% endfilename %}

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

> For readers at home: this part is covered in the [Python Basics: Dictionaries](https://www.youtube.com/watch?v=ZX1CVvZLE6c) video.

A dictionary is similar to a list, but you access values by looking up a key instead of a numeric index. A key can be any string or number. The syntax to define an empty dictionary is:

{% filename %}command-line{% endfilename %}

```python
>>> {}
{}
```

Bu boş bir sözlük oluşturduğunuzu gösterir. Yaşasın!

Now, try writing the following command (try substituting your own information, too):

{% filename %}command-line{% endfilename %}

```python
>>> participant = {'name': 'Ayşe', 'country': 'Türkiye', 'favorite_numbers': [7, 42, 92]}
```

With this command, you just created a variable named `participant` with three key–value pairs:

- Anahtar `name` `'Ayşe'` (`string` nesnesi) değerine işaret eder,
- `country` points to `'Poland'` (another `string`),
- ve `favorite_numbers` `[7, 42, 92]` (3 numaralı bir `list`) değerine işaret eder.

Bu söz dizimi ile tek bir anahtarın içeriğini kontrol edebilirsin:

{% filename %}command-line{% endfilename %}

```python
>>> print(participant['name'])
Ayşe
```

See, it's similar to a list. But you don't need to remember the index – just the name.

Python'a olmayan bir anahtarın değerini sorarsak ne olur? Tahmin edebiliyor musun? Hadi deneyip görelim!

{% filename %}command-line{% endfilename %}

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

Dictionaries, like lists, are *mutable*, meaning that they can be changed after they are created. You can add new key–value pairs to a dictionary after it is created, like this:

{% filename %}command-line{% endfilename %}

```python
>>> participant['favorite_language'] = 'Python'
```

Like lists, using the `len()` method on the dictionaries returns the number of key–value pairs in the dictionary. Go ahead and type in this command:

{% filename %}command-line{% endfilename %}

```python
>>> len(participant)
4
```

I hope it makes sense up to now. :) Ready for some more fun with dictionaries? Read on for some amazing things.

You can use the `pop()` method to delete an item in the dictionary. Mesela, `'favorite_numbers'` anahtarına karşılık gelen elemanı silmek istersen, sadece şu komutu yaz:

{% filename %}command-line{% endfilename %}

```python
>>> participant.pop('favorite_numbers')
[7, 42, 92]
>>> participant
{'country': 'Poland', 'favorite_language': 'Python', 'name': 'Ola'}
```

As you can see from the output, the key–value pair corresponding to the 'favorite_numbers' key has been deleted.

As well as this, you can also change a value associated with an already-created key in the dictionary. Type this:

{% filename %}command-line{% endfilename %}

```python
>>> participant['country'] = 'Almanya'
>>> participant
{'country': 'Almanya', 'favorite_language': 'Python', 'name': 'Ayşe'}
```

As you can see, the value of the key `'country'` has been altered from `'Poland'` to `'Germany'`. :) Exciting? Hurrah! You just learned another amazing thing.

### Özet

Harika! Şu an programlama hakkında birçok şey biliyorsun. Bu kısımda, şunları öğrendin:

- **errors** – you now know how to read and understand errors that show up if Python doesn't understand a command you've given it
- **variables** – names for objects that allow you to code more easily and to make your code more readable
- **lists** – lists of objects stored in a particular order
- **dictionaries** – objects stored as key–value pairs

Bir sonraki part için heyecanlı mısınız? :)

## Karşılaştırma

> For readers at home: this part is covered in the [Python Basics: Comparisons](https://www.youtube.com/watch?v=7bzxqIKYgf4) video.

A big part of programming involves comparing things. What's the easiest thing to compare? Numbers, of course. Let's see how that works:

{% filename %}command-line{% endfilename %}

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

We gave Python some numbers to compare. As you can see, not only can Python compare numbers, but it can also compare method results. Nice, huh?

İki sayının eşit olup olmadığını öğrenmek için neden iki tane eşittir işraretini `==` yan yana koyduk? Değişkenlere içerik verirken, tek `=` işaretini kullanıyoruz. You always, **always** need to put two of them – `==` – if you want to check if things are equal to each other. Sayıların birbirine eşit olmaması durumunu da kontrol edebiliriz. Bunun için, yukarıdaki örnekteki gibi `!=` sembolünü kullanıyoruz. 

Python' a iki görev daha verin:

{% filename %}command-line{% endfilename %}

```python
>>> 6 >= 12 / 2
True
>>> 3 <= 2
False
```

`>` ve `<` işaretleri kolay, fakat `>=` ve `<=` ne anlama geliyor?

- x `>` y : x büyüktür y
- x `<` y : x küçüktür y
- x `<=` y : x küçük eşittir y
- x `>=` y : x büyük eşittir y

Harika! Biraz daha ister misiniz? Şunu deneyin: 

{% filename %}command-line{% endfilename %}

```python
>>> 6 > 2 and 2 < 3
True
>>> 3 > 2 and 2 < 1
False
>>> 3 > 2 or 2 < 1
True
```

Python'a istediğiniz kadar sayıyı karşılaştırmak için verebilirsiniz, ve size hepsinin cevabını verecek. Çok akıllı değil mi?

- **and** – if you use the `and` operator, both comparisons have to be True in order for the whole command to be True
- **or** – if you use the `or` operator, only one of the comparisons has to be True in order for the whole command to be True

Portakallarla elmaları karşılaştılaştırabilir miyiz? Bunun Python'daki eşdeğerini deneyelim: 

{% filename %}command-line{% endfilename %}

```python
>>> 1 > 'django'
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
TypeError: unorderable types: int() > str()
```

Gördüğünüz gibi Python tam sayılar(`int`) ve kelimeleri(yani stringleri, `str`) karşılaştıramıyor. Onun yerine, **TypeError** göstererek iki farklı tipteki değişkenin karşılaştırılamayacağını söylüyor. 

## Boolean (Mantıksal)

Incidentally, you just learned about a new type of object in Python. It's called **Boolean**, and it is probably the easiest type there is.

There are only two Boolean objects:

- True
- False

But for Python to understand this, you need to always write it as 'True' (first letter uppercase, with the rest of the letters lowercased). **true, TRUE, and tRUE won't work – only True is correct.** (The same applies to 'False' as well, of course.)

Boolean'lar değişken de olabiliyor! Bakınız: 

{% filename %}command-line{% endfilename %}

```python
>>> a = True
>>> a
True
```

Ayrıca bu şekilde de yapabilirsiniz:

{% filename %}command-line{% endfilename %}

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

> For readers at home: this part is covered in the [Python Basics: Saving files and "If" statement](https://www.youtube.com/watch?v=dOAg6QVAxyk) video.

Şimdiye kadar kodumuzu bizi sadece tek satır yazmaya limitleyen yorumlayıcı üzerinde yazdık. Normal programlar dosyalar içine kaydedilir ve programlama dilimizin **yorumlayıcısıyla** veya **derleyicisiyle** çalıştırılır. Şimdiye kadar programlarımızı Python **yorumlayıcısında** teker satır teker satır çalıştırdık. Bundan sonraki görevlerde, birden fazla satıra ihtiyacımız olacak, bu yüzden şunlara ihtiyacımız olacak:

- Python yorumlayıcısından çıkın
- Seçtiğiniz kod düzenleyicisini açın
- Yeni Python dosyasına kod kaydedin
- Çalıştırın!

To exit from the Python interpreter that we've been using, simply type the `exit()` function

{% filename %}command-line{% endfilename %}

```python
>>> exit()
$
```

Bu sizi komut satırına geri yönlendirecektir.

Biraz önce [kod editörü](../code_editor/README.md) bölümünden bir kod editörü seçmiştik. Şimdi o editörü açmalı ve yeni bir dosya içine kod yazmalıyız:

{% filename %}editor{% endfilename %}

```python
print('Hello, Django girls!')
```

Açıkça, artık oldukça deneyimli Python programcısısın, bu yüzden bugün öğrendiğin kodları yazmaktan çekinme.

Şimdi dosyayı tanımlayıcı bir isimle kaydetmemiz gerekir. Dosyanın ismine **python_intro.py** diyelim ve masaüstüne kaydedelim. Dosyaya istediğimiz ismi verebiliriz, burada önemli olan kısım dosyanın **.py** uzantısı ile bitmesidir. The **.py** extension tells our operating system that this is a **Python executable file** and Python can run it.

> **Note** You should notice one of the coolest thing about code editors: colors! In the Python console, everything was the same color; now you should see that the `print` function is a different color from the string. Bunun ismi "söz dizimi vurgulama" ve kod yazarken gerçekten yararlı bir özellik. The color of things will give you hints, such as unclosed strings or a typo in a keyword name (like the `def` in a function, which we'll see below). This is one of the reasons we use a code editor. :)

Dosyayı kaydettiğimize göre artık çalıştırabiliriz! Konsoldan **Klasör değiştirme** yaparak masaüstüne ulaşın, komut satırı bölümünde öğrendiklerinizi hatırlayın.

<!--sec data-title="OS X" data-id="python_OSX"
data-collapse=true ces-->

Mac'de bu komut şunun gibi görünecektir:

{% filename %}command-line{% endfilename %}

    $ cd ~/Desktop
    

<!--endsec-->

<!--sec data-title="Linux" data-id="python_linux"
data-collapse=true ces-->

On Linux, it will be like this (the word "Desktop" might be translated to your local language):

{% filename %}command-line{% endfilename %}

    $ cd ~/Desktop
    

<!--endsec-->

<!--sec data-title="Windows Command Prompt" data-id="python_windows" data-collapse=true ces-->

On Windows Command Prompt, it will be like this:

{% filename %}command-line{% endfilename %}

    > cd %HomePath%\Desktop
    

<!--endsec-->

<!--sec data-title="Windows Powershell" data-id="python_windowsPSH" data-collapse=true ces-->

And on Windows Powershell, it will be like this:

{% filename %}command-line{% endfilename %}

    > cd $Home\Desktop
    

<!--endsec-->

Bir problem olursa yardım istemekten çekinmeyin.

Şimdi dosyadaki komutları çalıştırmak için Python'u kulllanın:

{% filename %}command-line{% endfilename %}

    $ python3 python_intro.py
    Merhaba, Django girls!
    

Note: on Windows 'python3' is not recognized as a command. Instead, use 'python' to execute the file:

{% filename %}command-line{% endfilename %}

```python
> python python_intro.py
```

Tamam! Bir dosyaya kaydedilen ilk Python programınızı çalıştırdınız. Harika hissediyor musunuz?

Şimdi programlamanın olmazsa olmaz bir aracını öğrenme zamanı:

## If … elif … else

Lots of things in code should be executed only when given conditions are met. That's why Python has something called **if statements**.

**python_intro.py** dosyasındaki kodunuzu şununla değiştirin:

{% filename %}python_intro.py{% endfilename %}

```python
if 3 > 2:
```

If we were to save and run this, we'd see an error like this:

{% filename %}command-line{% endfilename %}

    $ python3 python_intro.py
    File "python_intro.py", line 2
             ^
    SyntaxError: unexpected EOF while parsing
    

Python bizden kendisine `3 > 2` durumu (veya `True`) sağlandığında neyi çalıştıracağını söylememizi bekliyor. Python'a "Çalışıyor!" yazmasını söyleyelim. **python_intro.py** dosyanızdaki kodu şununla değiştirin:

{% filename %}python_intro.py{% endfilename %}

```python
if 3 > 2:
    print('It works!')
```

4 tane boşluk karakteri bıraktığımıza dikkat ettiniz mi? Bunu yaparak if cümlesine yazdığım durum doğru olduğunda neyi çalıştırması gerektiğini Python'a söylemiş oluyoruz. Aslında tek bir boşlukla da yapabilirsiniz, ama hemen hemen bütün Python programcıları kodlarının temiz görünmesi için 4 boşluk bırakıyor. Tek `tab` karakteri de 4 boşluk yerine geçecektir.

Kaydedip çalıştırmayı deneyelim:

{% filename %}command-line{% endfilename %}

```python
$ python3 python_intro.py
Çalışıyor!
```

Note: Remember that on Windows, 'python3' is not recognized as a command. From now on, replace 'python3' with 'python' to execute the file.

### Ya bir koşul True (Doğru) değilse?

Önceki örneklerde kod sadece koşullar sadece True olduğunda çalışıyordu. Ama Python ayrıca `elif` ve `else` ifadelerine de sahip:

{% filename %}python_intro.py{% endfilename %}

```python
if 5 > 2:
    print('5 is indeed greater than 2')
else:
    print('5 is not greater than 2')
```

Bu kod çalıştığında aşağıdaki çıktıyı verecektir:

{% filename %}command-line{% endfilename %}

    $ python3 python_intro.py
    5 gerçekten de 2'den büyüktür
    

Eğer 2 5'ten büyük bir sayı olsaydı ikinci komut çalışacaktı. Kolay, değil mi? Şimdi `elif`'in nasıl çalıştığına bakalım:

{% filename %}python_intro.py{% endfilename %}

```python
name = 'Sonja'
if name == 'Ola':
    print('Hey Ola!')
elif name == 'Sonja':
    print('Hey Sonja!')
else:
    print('Hey anonymous!')
```

ve çalıştırılınca:

{% filename %}command-line{% endfilename %}

    $ python3 python_intro.py
    Selam Zeynep!
    

Gördünüz mü? Eğer önceki if cümleleriniz doğru olmazsa kontrol edilmek üzere `elif` cümleleri ekleyebilirsiniz.

`if` cümlenizden sonra istediğiniz kadar `elif` cümlesi ekleyebilirsiniz. Mesela:

{% filename %}python_intro.py{% endfilename %}

```python
volume = 57
if volume < 20:
    print("It's kinda quiet.")
elif 20 <= volume < 40:
    print("It's nice for background music")
elif 40 <= volume < 60:
    print("Perfect, I can hear all the details")
elif 60 <= volume < 80:
    print("Nice for parties")
elif 80 <= volume < 100:
    print("A bit loud!")
else:
    print("My ears are hurting! :(")
```

Python sırayla her sorguyu çalıştırır ve sonucu ona göre yazar:

{% filename %}command-line{% endfilename %}

    $ python3 python_intro.py
    Harika, her notayı duyabiliyorum
    

## Comments

Comments are lines beginning with `#`. You can write whatever you want after the `#` and Python will ignore it. Comments can make your code easier for other people to understand.

Let's see how that looks:

{% filename %}python_intro.py{% endfilename %}

```python
# Change the volume if it's too loud or too quiet
if volume < 20 or volume > 80:
    volume = 50
    print("That's better!")
```

You don't need to write a comment for every line of code, but they are useful for explaining why your code is doing something, or providing a summary when it's doing something complex.

### Özet

In the last few exercises you learned about:

- **comparing things** – in Python you can compare things by using `>`, `>=`, `==`, `<=`, `<` and the `and`, `or` operators
- **Boolean** – a type of object that can only have one of two values: `True` or `False`
- **Saving files** – storing code in files so you can execute larger programs.
- **if … elif … else** – statements that allow you to execute code only when certain conditions are met.
- **comments** - lines that Python won't run which let you document your code

Bu bölümün son kısmının zamanı geldi!

## Kendi fonksiyonlarınız!

> For readers at home: this part is covered in the [Python Basics: Functions](https://www.youtube.com/watch?v=5owr-6suOl0) video.

Remember functions like `len()` that you can execute in Python? Well, good news – you will learn how to write your own functions now!

Fonksiyon Python tarafından işlenmesi gereken yönergeler dizisidir. Python'da her fonksiyon `def` anahtar kelimesi ile başlar, bir isim verilir ve bazı parameterleri olabilir. Kolay bir tane ile başlayalım. **python_intro.py** içindeki kodu aşağıdaki ile değiştirelim:

{% filename %}python_intro.py{% endfilename %}

```python
def hi():
    print('Hi there!')
    print('How are you?')

hi()
```

Tamam, ilk fonksiyonumuz hazır!

Fonksiyon adını neden dosyanın en altına yazdığımızı merak edebilirsiniz. Bunun nedeni, Python'ın dosyayı okuyup, onu yukarıdan aşağı doğru işlemesi. Yani fonksiyonumuzu kullanabilmek için, onu en alt kısımda yeniden yazmalıyız.

Haydi şimdi bunu çalıştıralım ve neler olacağını görelim:

{% filename %}command-line{% endfilename %}

    $ python3 python_intro.py
    Merhaba!
    Nasılsın?
    

Note: if it didn't work, don't panic! The output will help you to figure why:

- If you get a `NameError`, that probably means you typed something wrong, so you should check that you used the same name when creating the function with `def hi():` and when calling it with `hi()`.
- If you get an `IndentationError`, check that both of the `print` lines have the same whitespace at the start of a line: python wants all the code inside the function to be neatly aligned.
- If there's no output at all, check that the last `hi()` *isn't* indented - if it is, that line will become part of the function too, and it will never get run.

Let's build our first function with parameters. We will use the previous example – a function that says 'hi' to the person running it – with a name:

{% filename %}python_intro.py{% endfilename %}

```python
def hi(name):
```

Gördüğünüz gibi, fonksiyonumuza `name` (isim) adında bir parametre ekledik:

{% filename %}python_intro.py{% endfilename %}

```python
def hi(name):
    if name == 'Ola':
        print('Hi Ola!')
    elif name == 'Sonja':
        print('Hi Sonja!')
    else:
        print('Hi anonymous!')

hi()
```

Unutmayın: `if` içerisindeki `print` fonksiyonundan önce dört tane boşluk var. Bunun sebebi sadece durum sağlandığında çalışmasını istememiz. Bakalım nasıl çalışıyor:

{% filename %}command-line{% endfilename %}

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

{% filename %}command-line{% endfilename %}

    $ python3 python_intro.py
    Selam Ayşe!
    

Ve eğer ismi değiştirirsek ne olur?

{% filename %}python_intro.py{% endfilename %}

```python
hi("Sonja")
```

Ve çalıştırın:

{% filename %}command-line{% endfilename %}

    $ python3 python_intro.py
    Selam Zeynep!
    

Now, what do you think will happen if you write another name in there? (Not Ola or Sonja.) Give it a try and see if you're right. It should print out this:

{% filename %}command-line{% endfilename %}

    Selam yabancı!
    

Süper değil mi? Böylece fonksiyona göndereceğiniz isim değiştiğinde aynı kodu tekrar tekrar yazmanıza gerek kalmayacak. And that's exactly why we need functions – you never want to repeat your code!

Let's do something smarter – there are more names than two, and writing a condition for each would be hard, right?

{% filename %}python_intro.py{% endfilename %}

```python
def hi(name):
    print('Hi ' + name + '!')

hi("Rachel")
```

Şimdi kodu çağıralım:

{% filename %}command-line{% endfilename %}

    $ python3 python_intro.py
    Selam Seda!
    

Tebrikler! Az önce fonksiyonları nasıl yazacağınızı öğrendiniz! :)

## Döngüler

> For readers at home: this part is covered in the [Python Basics: For Loop](https://www.youtube.com/watch?v=aEA6Rc86HF0) video.

Bu da zaten son parça. Hızlı oldu, değil mi? :)

Programcılar kendilerini tekrar etmeyi sevmezler. Programlama tamamen işleri otomatize etmedir, bu yüzden her insanı ismiyle selam istemeyiz, değil mi? İşte burası döngülerin devreye girdiği yerdir.

Hala listeleri hatırlıyoruz değil mi? Haydi bir kızlar listesi yapalım:

{% filename %}python_intro.py{% endfilename %}

```python
girls = ['Rachel', 'Monica', 'Phoebe', 'Ola', 'You']
```

Diyelim ki hepsine merhaba demek istiyoruz. Az önce yazdığımız `hi` fonksiyonunu döngü içinde kullanabiliriz:

{% filename %}python_intro.py{% endfilename %}

```python
for name in girls:
```

The ```for``` statement behaves similarly to the ```if``` statement; code below both of these need to be indented four spaces.

Dosyada yer alacak tam kod aşağıdadır:

{% filename %}python_intro.py{% endfilename %}

```python
def hi(name):
    print('Hi ' + name + '!')

girls = ['Rachel', 'Monica', 'Phoebe', 'Ola', 'You']
for name in girls:
    hi(name)
    print('Next girl')
```

Ve onu çalıştırdığımız zaman:

{% filename %}command-line{% endfilename %}

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
    

As you can see, everything you put inside a `for` statement with an indent will be repeated for every element of the list `girls`.

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

Sizin verdiğiniz ikinci parametrenin listede olmadığına dikkat edin. Yani `range(1, 6)` 1'den 5'e kadar sayıyor, 6 dahil edilmiyor. That is because "range" is half-open, and by that we mean it includes the first value, but not the last.

## Özet

İşte bu. **Harikasın, süpersin!** Bu bölüm biraz zordu, kendinle gurur duymalısın. Biz buraya kadar geldiğin için seninle gurur duyuyoruz!

You might want to briefly do something else – stretch, walk around for a bit, rest your eyes – before going on to the next chapter. :)

![Kek](images/cupcake.png)