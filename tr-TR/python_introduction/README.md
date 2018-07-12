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
- **sayılar ve dizinler** – Python'da sayılar matematik için dizinler ise metin nesneleri için kullanılmaktadır
- **operatörler** `+` ve `*` gibi, değerleri birleştirerek yeni bir değer üretmek için kullanılmaktadır
- **fonksiyonlar** `upper()` ve `len()` gibi, nesneler üzerinde eylemler gerçekleştirmektedirler.

Bunlar öğreneceğiniz her programlama dilinin temelleri. Biraz daha zor bir şey için hazır mısın? İddiaya gireriz öylesin!

## Hatalar

Şimdi yeni bir şey deneyelim. Bir sayının uzunluğunu, bir string'in uzunluğunu bulduğumuz gibi bulabilir miyiz? Bunu görmek için `len(304023)` yazıp `enter`a basalım:

{% filename %}{{ warning_icon }} komut satırı{% endfilename %}

```python
>>> len(304023)
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
TypeError: object of type 'int' has no len()
```

İlk hatamızı aldık! The {{ warning_icon }} icon is our way of giving you a heads up that the code you are about to run won't work as expected. Hatalar yapmak (kasıtlı olanlar bile) öğrenmenin önemli bir kısmı!

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

{% filename %}command-line{% endfilename %}

```python
>>> name = "Ayşe"
```

We type name equals Ola.

As you've noticed, your program didn't return anything like it did before. So how do we know that the variable actually exists? Simply enter `name` and hit `enter`:

{% filename %}komut satırı{% endfilename %}

```python
>>> name
'Ayşe'
```

Yippee! Your first variable! :) You can always change what it refers to:

{% filename %}komut satırı{% endfilename %}

```python
>>> name = "Suzan"
>>> name
'Suzan'
```

You can use it in functions too:

{% filename %}komut satırı{% endfilename %}

```python
>>> len(name)
5
```

Awesome, right? Of course, variables can be anything – numbers too! Try this:

{% filename %}komut satırı{% endfilename %}

```python
>>> a = 4
>>> b = 6
>>> a * b
24
```

But what if we used the wrong name? Can you guess what would happen? Let's try!

{% filename %}{{ warning_icon }} command-line{% endfilename %}

```python
>>> city = "Tokyo"
>>> ctiy
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
NameError: name 'ctiy' is not defined
```

An error! As you can see, Python has different types of errors and this one is called a **NameError**. Python will give you this error if you try to use a variable that hasn't been defined yet. If you encounter this error later, check your code to see if you've mistyped any names.

Play with this for a while and see what you can do!

## Yazdırma (Print) İşlevi

Try this:

{% filename %}command-line{% endfilename %}

```python
>>> name = 'Merve'
>>> name
'Merve'
>>> print(name)
Merve
```

When you just type `name`, the Python interpreter responds with the string *representation* of the variable 'name', which is the letters M-a-r-i-a, surrounded by single quotes, ''. When you say `print(name)`, Python will "print" the contents of the variable to the screen, without the quotes, which is neater.

As we'll see later, `print()` is also useful when we want to print things from inside functions, or when we want to print things on multiple lines.

## Listeler

Beside strings and integers, Python has all sorts of different types of objects. Now we're going to introduce one called **list**. Lists are exactly what you think they are: objects which are lists of other objects. :)

Go ahead and create a list:

{% filename %}komut satırı{% endfilename %}

```python
>>> []
[]
```

Yes, this list is empty. Not very useful, right? Let's create a list of lottery numbers. We don't want to repeat ourselves all the time, so we will put it in a variable, too:

{% filename %}komut satırı{% endfilename %}

```python
>>> lottery = [3, 42, 12, 19, 30, 59]
```

All right, we have a list! What can we do with it? Let's see how many lottery numbers there are in a list. Do you have any idea which function you should use for that? You know this already!

{% filename %}komut satırı{% endfilename %}

```python
>>> len(lottery)
6
```

Yes! `len()` can give you a number of objects in a list. Handy, right? Maybe we will sort it now:

{% filename %}komut satırı{% endfilename %}

```python
>>> lottery.sort()
```

This doesn't return anything, it just changed the order in which the numbers appear in the list. Let's print it out again and see what happened:

{% filename %}command-line{% endfilename %}

```python
>>> print(lottery)
[3, 12, 19, 30, 42, 59]
```

As you can see, the numbers in your list are now sorted from the lowest to highest value. Congrats!

Maybe we want to reverse that order? Let's do that!

{% filename %}komut-satırı{% endfilename %}

```python
>>> lottery.reverse()
>>> print(lottery)
[59, 42, 30, 19, 12, 3]
```

If you want to add something to your list, you can do this by typing this command:

{% filename %}komut-satırı{% endfilename %}

```python
>>> lottery.append(199)
>>> print(lottery)
[59, 42, 30, 19, 12, 3, 199]
```

If you want to show only the first number, you can do this by using **indexes**. An index is the number that says where in a list an item occurs. Programmers prefer to start counting at 0, so the first object in your list is at index 0, the next one is at 1, and so on. Try this:

{% filename %}command-line{% endfilename %}

```python
>>> print(lottery[0])
59
>>> print(lottery[1])
42
```

As you can see, you can access different objects in your list by using the list's name and the object's index inside of square brackets.

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

That worked like a charm!

For extra fun, try some other indexes: 6, 7, 1000, -1, -6 or -1000. See if you can predict the result before trying the command. Do the results make sense?

You can find a list of all available list methods in this chapter of the Python documentation: https://docs.python.org/3/tutorial/datastructures.html

## Sözlükler (Dictionaries)

> Evdeki okuyucular için: Bu kısım [Python Temelleri: Sözlükler](https://www.youtube.com/watch?v=ZX1CVvZLE6c) videosunda işlenmiştir.

A dictionary is similar to a list, but you access values by looking up a key instead of a numeric index. A key can be any string or number. The syntax to define an empty dictionary is:

{% filename %}command-line{% endfilename %}

```python
>>> {}
{}
```

This shows that you just created an empty dictionary. Hurray!

Now, try writing the following command (try substituting your own information, too):

{% filename %}command-line{% endfilename %}

```python
>>> participant = {'name': 'Ayşe', 'country': 'Türkiye', 'favorite_numbers': [7, 42, 92]}
```

With this command, you just created a variable named `participant` with three key–value pairs:

- Anahtar `name` `'Ayşe'` (`string` nesnesi) değerine işaret eder,
- `country` `Türkiye` (bir diğer `string`) değerine),
- ve `favorite_numbers` `[7, 42, 92]` (3 numaralı bir `list`) değerine işaret eder.

You can check the content of individual keys with this syntax:

{% filename %}command-line{% endfilename %}

```python
>>> print(participant['name'])
Ayşe
```

See, it's similar to a list. But you don't need to remember the index – just the name.

What happens if we ask Python the value of a key that doesn't exist? Can you guess? Let's try it and see!

{% filename %}{{ warning_icon }} command-line{% endfilename %}

```python
>>> participant['age']
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
KeyError: 'age'
```

Look, another error! This one is a **KeyError**. Python is helpful and tells you that the key `'age'` doesn't exist in this dictionary.

When should you use a dictionary or a list? Well, that's a good point to ponder. Just have a solution in mind before looking at the answer in the next line.

- Sıralı elemanlara mı ihtiyacın var? Liste ile devam et.
- İleride hızlıca (anahtarlar ile) değerlere ulaşmak istediğin için anahtarlar ile ilişkilendirilmiş değerlere mi ihtiyacın var? Sözlük kullan.

Dictionaries, like lists, are *mutable*, meaning that they can be changed after they are created. You can add new key–value pairs to a dictionary after it is created, like this:

{% filename %}komut-satırı{% endfilename %}

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

You can use the `pop()` method to delete an item in the dictionary. Say, if you want to delete the entry corresponding to the key `'favorite_numbers'`, just type in the following command:

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

Awesome! You know a lot about programming now. In this last part you learned about:

- **errors** - eğer Python yazdığın komutu anlamazsa çıkan hataları nasıl okuyacağını ve anlayacağını artık biliyorsun
- **değişkenler** - daha kolay kod yazmanı sağlayan ve kodunu daha okunabilir yapan nesnelerin isimleri
- **listeler** - belirli bir sırada tutulan nesnelerin listesi
- **sözlükler** - anahtar-değer çifti olarak tutulan nesneler

Excited for the next part? :)

## Karşılaştırma

> Evden okuyanlar için: Bu kısım [Python Basics: Comparisons](https://www.youtube.com/watch?v=7bzxqIKYgf4) vidyosunda anlatılıyor.

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

Do you wonder why we put two equal signs `==` next to each other to compare if numbers are equal? We use a single `=` for assigning values to variables. You always, **always** need to put two of them – `==` – if you want to check if things are equal to each other. We can also state that things are unequal to each other. For that, we use the symbol `!=`, as shown in the example above.

Give Python two more tasks:

{% filename %}command-line{% endfilename %}

```python
>>> 6 >= 12 / 2
True
>>> 3 <= 2
False
```

We've seen `>` and `<`, but what do `>=` and `<=` mean? Read them like this:

- x `>` y : x büyüktür y
- x `<` y : x küçüktür y
- x `<=` y : x küçük eşittir y
- x `>=` y : x büyük eşittir y

Awesome! Wanna do one more? Try this:

{% filename %}command-line{% endfilename %}

```python
>>> 6 > 2 and 2 < 3
True
>>> 3 > 2 and 2 < 1
False
>>> 3 > 2 or 2 < 1
True
```

You can give Python as many numbers to compare as you want, and it will give you an answer! Pretty smart, right?

- **and** - Eğer `and` işlecini kullanırsan, bütün komutların doğru olması için her iki kıyaslama da doğru olmak zorundadır
- **or** - eğer `or` işlecini kullanırsan, bütün komutların doğru olması için kıyaslamalardan yalnızca biri doğru olmak zorundadır

Have you heard of the expression "comparing apples to oranges"? Let's try the Python equivalent:

{% filename %}{{ warning_icon }} command-line{% endfilename %}

```python
>>> 1 > 'django'
Geri görüş (en son çağrı):
  Dosya "<stdin>", satır 1, <module>‘in içinde
HataTürü: ‘>’ 'int' ve 'str' örnekleri arasında desteklenmiyor
```

Here you see that just like in the expression, Python is not able to compare a number (`int`) and a string (`str`). Instead, it shows a **TypeError** and tells us the two types can't be compared together.

## Boolean (Mantıksal)

Incidentally, you just learned about a new type of object in Python. It's called **Boolean**.

There are only two Boolean objects:

- Doğru
- Yalnış

But for Python to understand this, you need to always write it as 'True' (first letter uppercase, with the rest of the letters lowercased). **true, TRUE, and tRUE won't work – only True is correct.** (The same applies to 'False' as well, of course.)

Booleans can be variables, too! See here:

{% filename %}komut-satırı{% endfilename %}

```python
>>> a = True
>>> a
True
```

You can also do it this way:

{% filename %}command-line{% endfilename %}

```python
>>> a = 2 > 5
>>> a
False
```

Practice and have fun with Booleans by trying to run the following commands:

- `True and True`
- `False and True`
- `True or 1 == 1`
- `1 != 2`

Congrats! Booleans are one of the coolest features in programming, and you just learned how to use them!

# Kaydet!

> Evdeki okuyucular için: Bu kısım [Python Basics: Saving files and "If" statement](https://www.youtube.com/watch?v=dOAg6QVAxyk) videosunda işlenmiştir.

So far we've been writing all our python code in the interpreter, which limits us to entering one line of code at a time. Normal programs are saved in files and executed by our programming language **interpreter** or **compiler**. So far we've been running our programs one line at a time in the Python **interpreter**. We're going to need more than one line of code for the next few tasks, so we'll quickly need to:

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

This will put you back into the command prompt.

Earlier, we picked out a code editor from the [code editor](../code_editor/README.md) section. We'll need to open the editor now and write some code into a new file:

{% filename %}editor{% endfilename %}

```python
print(‘Merhaba, Django kızları!’)
```

Obviously, you're a pretty seasoned Python developer now, so feel free to write some code that you've learned today.

Now we need to save the file and give it a descriptive name. Let's call the file **python_intro.py** and save it to your desktop. We can name the file anything we want, but the important part here is to make sure the file ends in **.py**. The **.py** extension tells our operating system that this is a **Python executable file** and Python can run it.

> **Not** Kod editörleriyle ilgili en harika şeylerden birine dikkat etmelisiniz: renkler! Python konsolunda herşey aynı renkteydi; şimdi bakın `print` fonksiyonu dizeden farklı renkte. Bunun ismi "söz dizimi vurgulama" ve kod yazarken gerçekten yararlı bir özellik. Koddaki renkler ipucu verir, kapanmamış dizeler gibi yada aşağıda göreceğimiz (`def` fonksiyonu gibi imla hatası içeren anahtar kelimeler oalbilir). Bu kod düzenleyicisi kullanma nedenlerimizden biri. :)

With the file saved, it's time to run it! Using the skills you've learned in the command line section, use the terminal to **change directories** to the desktop.

<!--sec data-title="Change directory: OS X" data-id="python_OSX"
data-collapse=true ces-->

On a Mac, the command will look something like this:

{% filename %}komut-satırı{% endfilename %}

    $ cd ~/Masaüstü
    

<!--endsec-->

<!--sec data-title="Change directory: Linux" data-id="python_linux"
data-collapse=true ces-->

On Linux, it will be like this (the word "Desktop" might be translated to your local language):

{% filename %}komut-satırı{% endfilename %}

    $ cd ~/Masaüstü
    

<!--endsec-->

<!--sec data-title="Change directory: Windows Command Prompt" data-id="python_windows" data-collapse=true ces-->

On Windows Command Prompt, it will be like this:

{% filename %}komut-satırı{% endfilename %}

    > cd %HomePath%\Masaüstü
    

<!--endsec-->

<!--sec data-title="Change directory: Windows Powershell" data-id="python_windowsPSH" data-collapse=true ces-->

And on Windows Powershell, it will be like this:

{% filename %}command-line{% endfilename %}

    > cd $Home\Masaüstü
    

<!--endsec-->

If you get stuck, just ask for help.

Now use Python to execute the code in the file like this:

{% filename %}komut-satırı{% endfilename %}

    $ python3 python_intro.py
    Merhaba, Django girls!
    

Note: on Windows 'python3' is not recognized as a command. Instead, use 'python' to execute the file:

{% filename %}command-line{% endfilename %}

```python
> python python_intro.py
```

Alright! You just ran your first Python program that was saved to a file. Feel awesome?

You can now move on to an essential tool in programming:

## eğer…elif… yoksa

Lots of things in code should be executed only when given conditions are met. That's why Python has something called **if statements**.

Replace the code in your **python_intro.py** file with this:

{% filename %}python_intro.py{% endfilename %}

```python
eğer 3 > 2 ise:
```

If we were to save and run this, we'd see an error like this:

{% filename %}{{ warning_icon }} command-line{% endfilename %}

    $ python3 python_intro.py
    File "python_intro.py", line 2
             ^
    SyntaxError: unexpected EOF while parsing
    

Python expects us to give further instructions to it which are executed if the condition `3 > 2` turns out to be true (or `True` for that matter). Let’s try to make Python print “It works!”. Change your code in your **python_intro.py** file to this:

{% filename %}python_intro.py{% endfilename %}

```python
eğer 3 > 2 ise:
    print(‘Çalışıyor!’)
```

Notice how we've indented the next line of code by 4 spaces? We need to do this so Python knows what code to run if the result is true. You can do one space, but nearly all Python programmers do 4 to make things look neat. A single Tab will also count as 4 spaces as long as your text editor is set to do so. When you made your choice, don't change it! If you already indented with 4 spaces, make any future indentation with 4 spaces, too - otherwise you may run into problems.

Save it and give it another run:

{% filename %}command-line{% endfilename %}

```python
$ python3 python_intro.py
Çalışıyor!
```

Note: Remember that on Windows, 'python3' is not recognized as a command. From now on, replace 'python3' with 'python' to execute the file.

### Ya bir koşul True (Doğru) değilse?

In previous examples, code was executed only when the conditions were True. But Python also has `elif` and `else` statements:

{% filename %}python_intro.py{% endfilename %}

```python
eğer 5 > 2 ise:
    print(‘5 gerçekten 2’den büyüktür’)
Değilse:
    print(‘5 2’de büyük değildir’)
```

When this is run it will print out:

{% filename %}command-line{% endfilename %}

    $ python3 python_intro.py
    5 gerçekten de 2'den büyüktür
    

If 2 were a greater number than 5, then the second command would be executed. Let's see how `elif` works:

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

and executed:

{% filename %}command-line{% endfilename %}

    $ python3 python_intro.py
    Selam Zeynep!
    

See what happened there? `elif` lets you add extra conditions that run if the previous conditions fail.

You can add as many `elif` statements as you like after your initial `if` statement. For example:

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

Python runs through each test in sequence and prints:

{% filename %}command-line{% endfilename %}

    $ python3 python_intro.py
    Harika, her notayı duyabiliyorum
    

## Yorumlar

Comments are lines beginning with `#`. You can write whatever you want after the `#` and Python will ignore it. Comments can make your code easier for other people to understand.

Let's see how that looks:

{% filename %}python_intro.py{% endfilename %}

```python
# Çok yüksek veya çok düşük olduğunda volümü değiştirme
Eğer volüm < 20 veya volüm > 80 ise:
    volüm = 50
    print(“Bu daha iyi!”)
```

You don't need to write a comment for every line of code, but they are useful for explaining why your code is doing something, or providing a summary when it's doing something complex.

### Özet

In the last few exercises you learned about:

- **kıyaslama yapmak** - Python'da `>`, `>=`, `==`, `<=`, `<` ve `ve`, `veya` operatörlerini kullanarak kıyaslama yapabilirsiniz
- **Boole** – yalnızca iki değerden birini olabilir nesnesi türü: `doğru` veya `yanlış`
- **Dosya kaydetmek** – kodlarımızı dosyalara kaydederek daha büyük programları çalıştırabiliriz.
- **if ... elif ... else** - cümlelerini sadece belirli durumlar sağlandığında çalıştırmak istediğimiz komutlar için kullanabiliriz.
- **yorumlar** - kodunuzu belgelemenize izin verecek şekilde Python’un çalışmayacağı satırlar

Time for the last part of this chapter!

## Kendi fonksiyonlarınız!

> Evdeki okuyucular için: Bu kısım [Python Basics: Functions](https://www.youtube.com/watch?v=5owr-6suOl0) videosunda işlenmiştir.

Remember functions like `len()` that you can execute in Python? Well, good news – you will learn how to write your own functions now!

A function is a sequence of instructions that Python should execute. Each function in Python starts with the keyword `def`, is given a name, and can have some parameters. Let's give it a go. Replace the code in **python_intro.py** with the following:

{% filename %}python_intro.py{% endfilename %}

```python
def hi():
    print('Selam!')
    print('Nasılsın?')

hi()
```

Okay, our first function is ready!

You may wonder why we've written the name of the function at the bottom of the file. This is because Python reads the file and executes it from top to bottom. So in order to use our function, we have to re-write it at the bottom.

Let's run this now and see what happens:

{% filename %}command-line{% endfilename %}

    $ python3 python_intro.py
    Merhaba!
    Nasılsın?
    

Note: if it didn't work, don't panic! The output will help you to figure why:

- Eğer bir `NameError` alırsanız, muhtemelen yanlış bir şey yazdığınız anlamına gelir, bu nedenle `def hi():` lı fonksiyonu oluştururken ve `hi()` lıyı çağırırken aynı adı kullanıp kullanmadığınızı kontrol etmelisiniz.
- Eğer bir `IndentationError` alırsanız,`print` dizelerinin her ikisinin de satır başında aynı boşluğa sahip olduğunu kontrol et: python fonksiyonun içindeki tüm kodların düzenli bir şekilde hizalanmasını ister.
- Eğer tamamında da çıktı yoksa, son `hi()` *isn't* girintiliğini kontrol et - eğer öyleyse, bu dize fonksiyonunda bir parçası haline gelecek ve hiçbir zaman çalışmayacak.

Let's build our first function with parameters. We will use the previous example – a function that says 'hi' to the person running it – with a name:

{% filename %}python_intro.py{% endfilename %}

```python
def hi(name):
```

As you can see, we now gave our function a parameter that we called `name`:

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

Remember: The `print` function is indented four spaces within the `if` statement. This is because the function runs when the condition is met. Let's see how it works now:

{% filename %}{{ warning_icon }} command-line{% endfilename %}

    $ python3 python_intro.py
    Traceback (most recent call last):
    File "python_intro.py", line 10, in <module>
      hi()
    TypeError: hi() missing 1 required positional argument: 'name'
    

Oops, an error. Luckily, Python gives us a pretty useful error message. It tells us that the function `hi()` (the one we defined) has one required argument (called `name`) and that we forgot to pass it when calling the function. Let's fix it at the bottom of the file:

{% filename %}python_intro.py{% endfilename %}

```python
hi("Ola")
```

And run it again:

{% filename %}command-line{% endfilename %}

    $ python3 python_intro.py
    Selam Ayşe!
    

And if we change the name?

{% filename %}python_intro.py{% endfilename %}

```python
hi("Sonja")
```

And run it:

{% filename %}komut-satırı{% endfilename %}

    $ python3 python_intro.py
    Selam Zeynep!
    

Now, what do you think will happen if you write another name in there? (Not Ola or Sonja.) Give it a try and see if you're right. It should print out this:

{% filename %}command-line{% endfilename %}

    Selam yabancı!
    

This is awesome, right? This way you don't have to repeat yourself every time you want to change the name of the person the function is supposed to greet. And that's exactly why we need functions – you never want to repeat your code!

Let's do something smarter – there are more names than two, and writing a condition for each would be hard, right?

{% filename %}python_intro.py{% endfilename %}

```python
def hi(name):
    print('Merhaba ' + name + '!')

hi("Rachel")
```

Let's call the code now:

{% filename %}command-line{% endfilename %}

    $ python3 python_intro.py
    Selam Seda!
    

Congratulations! You just learned how to write functions! :)

## Döngüler

> Evdeki okuyucular için: Bu kısım [Python Basics: For Loop](https://www.youtube.com/watch?v=aEA6Rc86HF0) videosunda işlenmiştir.

This is the last part already. That was quick, right? :)

Programmers don't like to repeat themselves. Programming is all about automating things, so we don't want to greet every person by their name manually, right? That's where loops come in handy.

Still remember lists? Let's do a list of girls:

{% filename %}python_intro.py{% endfilename %}

```python
kızlar = ['Rachel', 'Monica', 'Phoebe', 'Ola', 'Sen']
```

We want to greet all of them by their name. We have the `hi` function to do that, so let's use it in a loop:

{% filename %}python_intro.py{% endfilename %}

```python
kızlar içindeki isimler:
```

The `for` statement behaves similarly to the `if` statement; code below both of these need to be indented four spaces.

Here is the full code that will be in the file:

{% filename %}python_intro.py{% endfilename %}

```python
def hi(name):
    print('Merhaba ' + name + '!')

girls = ['Rachel', 'Monica', 'Phoebe', 'Ola', 'Sen']
for name in girls:
    hi(name)
    print('Sıradaki kız')
```

And when we run it:

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

You can also use `for` on numbers using the `range` function:

{% filename %}python_intro.py{% endfilename %}

```python
for i in range(1, 6):
    print(i)
```

Which would print:

{% filename %}command-line{% endfilename %}

    1
    2
    3
    4
    5
    

`range` is a function that creates a list of numbers following one after the other (these numbers are provided by you as parameters).

Note that the second of these two numbers is not included in the list that is output by Python (meaning `range(1, 6)` counts from 1 to 5, but does not include the number 6). That is because "range" is half-open, and by that we mean it includes the first value, but not the last.

## Özet

That's it. **You totally rock!** This was a tricky chapter, so you should feel proud of yourself. We're definitely proud of you for making it this far!

For official and full python tutorial visit https://docs.python.org/3/tutorial/. This will give you a more thorough and complete study of the language. Cheers :)

You might want to briefly do something else – stretch, walk around for a bit, rest your eyes – before going on to the next chapter. :)

![Cupcake](images/cupcake.png)