# Komut satırı arayüzüne giriş

Ha, heyecan verici, değil mi?! İlk kodunuzu birkaç dakika içinde yazacaksınız :)

**Sizi yeni arkadaşınızla tanıştıralım: komut satırı!**

Gelecek aşamalar size tüm "hacker"ların kullandığı siyah pencerenin nasıl kullanıldığını gösterecek. Başta biraz korkutucu görünebilir fakat bu sadece sizden komut bekleyen bir pencere.

> **Not**Lütfen bu kitap boyunca 'dizin' veya 'klasör' terimlerini birbirinin yerine kullandığımızı ve aynı anlama geldiklerini unutmayınız.

## Komut satırı nedir?

Genellikle **komut satırı** veya **komut satırı arabirimi** adı verilen pencere, bilgisayarınızdaki dosyaları görmek, düzenlemek ve yönetmek için kullanılan metin tabanlı bir uygulamadır. Tıpkı Windows Gezgini veya Mac'deki Finder gibi, fakat grafik arayüzü olmadan. Komut satırının diğer adları: *cmd*, *CLI*, *komut istemcisi*, *konsol* veya *terminal (uçbirim)*dir.

## Komut satırı arabirimini açın

Birkaç deneme yapmak için önce komut satırı arabirimini açmamız gerekir.

### Windows

Başlat menüsü → Tüm Programlar → Donatılar → Komut Satırı.

### Mac OS X

Uygulamalar → Araçlar → Terminal.

### GNU/Linux

Muhtemelen Uygulamalar → Donatılar → Terminal altında olmalı, fakat sistemler arası farklılık gösterebilir. Eğer orada değilse İnternet'te arayın :)

## İstemci

Şu anda yüksek ihtimalle sizden komut bekleyen siyah ya da beyaz bir ekran görüyor olmalısınız.

Eğer Mac veya GNU/Linux kullanıyorsanız, yüksek ihtimalle `$` işareti göreceksiniz, tıpkı bunun gibi:

```
$
```

Windows'da ise `>` işareti göreceksiniz, bunun gibi:

```
>
```

Tüm komutlar bu işaret ve bir boşluktan sonra gelir fakat bunu yazmak zorunda değilsiniz. Bilgisayarınız bunu sizin için yapacaktır :)

> Ufak bir not: sizin durumunuzda bu `C:\Users\ola>` veya `Olas-MacBook-Air:~ ola$` ve benzeri bir şekilde olabilir ve bu kesinlikle doğru. Bu eğitimde bunu sade ve basit bir şekilde anlatacağız.

## İlk komutunuz(Yaşasın!)

Basit bir şeyle başlayalım. Aşağıdaki komutu yazın:

```
$ whoami
```

ya da

```
> whoami
```

Ve ardından `enter` tuşuna basın. Sonucumuz bu:

```
$ whoami zeynep
```

Gördüğünüz gibi, bilgisayar az önce kullanıcı adınızı yazdı. Muntazam, değil mi?:)

> Her komutu yazmaya çalışın, kopyala-yapıştır yapmayın. Bu şekilde daha akılda kalıcı olur!

## Temeller

Tüm işletim sistemleri komut satırı için birbirinden biraz farklı komutlar kullanır, bu nedenle işletim sisteminize uygun yönergeleri izlediğinizden emin olun. Deneyelim mi?

### Geçerli Dizin

Nerede olduğumuzu bilmek güzel olurdu, değil mi? Bakalım. Bu komutu yazın ve `enter` tuşuna basın:

```
$ pwd
/Users/zeynep
```

Windows'ta iseniz:

```
> cd
C:\Users\zeynep
```

Muhtemelen makinenizde benzeri bir yazı göreceksiniz. Komut satırını açtığınızda genellikle kullanıcınızın ev dizininde başlarsınız.

> Not: 'pwd'nin anlamı "print working directory" yani "çalışma dizinini yazdır"dır.

* * *

### Dosya ve dizinleri listele

Yani içeride ne var? Bilmek harika olurdu. Haydi bakalım:

```
$ ls
Uygulamalar
Masaüstü
İndirilenler
Müzik
...
```

Windows:

```
> dir  Directory of C:\Users\zeynep 
05/08/2014 07:28 PM <DIR> Uygulamalar 
05/08/2014 07:28 PM <DIR> Masaüstü 
05/08/2014 07:28 PM <DIR> İndirilenler 
05/08/2014 07:28 PM <DIR> Müzik 
...
```    

* * *

### Geçerli dizini değiştir

Şimdi, haydi Masaüstü dizinimize gidelim:

```
$ cd Masaüstü
```    

Windows:

```
> cd Masaüstü
```    

Gerçekten değişmiş mi bir bakalım:

```
$ pwd
C:\Users\zeynep\Masaüstü
```    

Windows:

```
> cd 
C:\Users\zeynep\Masaüstü
```    

İşte oldu!

> Profesyonel ipucu: eğer `cd D` yazarsanız ve `tab` tuşuna basarsanız, komut satırı ismin kalanını otomatik tamamlar ve gitmek istediğiniz yere daha hızlı gidersiniz. Eğer "D" ile başlayan birden çok klasör var ise, seçeneklerin listesi için `tab` tuşuna iki kez basın.

* * *

### Dizin oluşturun

Uygulamalı yapmak için masaüstünüzde bir dizin oluşturmaya ne dersiniz? Bu şekilde yapabilirsiniz:

```
$ mkdir uygulama
```

Windows:

```
> mkdir uygulama
```

Bu küçük komut masaüstünüzde `uygulama` isimli bir klasör oluşturacaktır. Orada olup olmadığını kontrol etmek için `ls` veya `dir` komutlarını kullanabilirsiniz! Deneyin :)

> Profesyonel ipucu: Eğer aynı komutları tekrar tekrar yazmak istemiyorsanız, `yukarı ok` ve `aşağı ok` tuşlarına basarak yazdığınız komutlar arasında geçiş yapabilirsiniz.

* * *

### Alıştırma!

Sizin için ufak bir alıştırma: yeni oluşturduğunuz `uygulama` dizininde `test` adında bir dizin oluşturun.`cd` ve `mkdir` komutlarını kullanın.

#### Çözüm:

```
$ cd uygulama
$ mkdir test
$ ls
test
```

Windows:

```
> cd uygulama
> mkdir test
> dir
05/08/2014 07:28 PM <DIR>      test
```    

Tebrikler! :)

* * *

### Temizlik

Ortalığı dağınık bırakmak istemeyiz, haydi yaptığımız her şeyi silelim.

İlk önce masaüstüne geri dönmemiz gerek:

```
$ cd ..
```

Windows:

```
> cd ..
```

`cd` komutu ile `..` kullanmak sizi bir üst dizine götürür (Bu sizin şuanki dizininizi tutan ana dizindir).

Nerede olduğunuzu kontrol edin:

```
$ pwd
C:\Users\zeynep\Masaüstü
```

Windows:

```
> cd 
C:\Users\zeynep\Masaüstü
```

Şimdi `uygulama` dizinini silme vakti:

> **Dikkat**: Dosyaları `del`,`rmdir` veya `rm` ile silme işlemi geri alınamaz, bu *silinen dosyalar sonsuza dek yok olur* anlamına gelir! Yani, bu komutları kullanırken çok dikkatli olun.

```
$ rm -r uygulama
```

Windows:

```
> rmdir /S uygulama
uygulama, Emin misiniz <E/H>? E
```

Bitti! Gerçekten silindiğinden emin olalım:

```
$ ls
```

Windows:

```
> dir
```

### Çıkış

Şimdilik bu kadar! Şimdi komut satırını güvenle kapatabilirsiniz. Bunu "hacker" tarzında yapalım, tamam mı?:)

```
$ exit
```    

Windows:

```
> exit
```

Harika, değil mi?:)

## Özet

İşte bazı yararlı komutların özeti:

| Komut (Windows) | Komut (Mac OS - GNU/Linux) | Açıklama                | Örnek                                             |
| --------------- | -------------------------- | ----------------------- | ------------------------------------------------- |
| exit            | exit                       | pencereyi kapatır       | **exit**                                          |
| cd              | cd                         | dizin değiştir          | **cd test**                                       |
| dir             | ls                         | dizin/dosyaları listele | **dir**                                           |
| copy            | cp                         | dosya kopyala           | **copy c:\test\test.txt c:\windows\test.txt** |
| move            | mv                         | dosya taşı              | **move c:\test\test.txt c:\windows\test.txt** |
| mkdir           | mkdir                      | yeni bir dizin oluştur  | **mkdir testdizini**                              |
| del             | rm                         | bir dosya/dizin sil     | **del c:\test\test.txt**                        |

Bu kullanabileceğiniz komutlardan sadece birkaçı, fakat bugün bundan daha fazlasını kullanmayacaksınız.

Eğer meraklı iseniz, [ss64.com][1] adresinden tüm işletim sistemleri için tüm komutların kullanımına ulaşabilirsiniz.

 [1]: http://ss64.com

## Hazır mısınız?

Haydi Python'a giriş yapalım!