# Komut satırı arayüzüne giriş

> For readers at home: this chapter is covered in the [Your new friend: Command Line](https://www.youtube.com/watch?v=jvZLWhkzX-8) video.

It's exciting, right?! You'll write your first line of code in just a few minutes! :)

**Sizi yeni arkadaşınızla tanıştıralım: komut satırı!**

Gelecek aşamalar size tüm "hacker"ların kullandığı siyah pencerenin nasıl kullanıldığını gösterecek. Başta biraz korkutucu görünebilir fakat bu sadece sizden komut bekleyen bir pencere.

> **Note** Please note that throughout this book we use the terms 'directory' and 'folder' interchangeably but they are one and the same thing.

## Komut satırı nedir?

Genellikle **komut satırı** veya **komut satırı arabirimi** adı verilen pencere, bilgisayarınızdaki dosyaları görmek, düzenlemek ve yönetmek için kullanılan metin tabanlı bir uygulamadır. It's much like Windows Explorer or Finder on the Mac, but without the graphical interface. Other names for the command line are: *cmd*, *CLI*, *prompt*, *console* or *terminal*.

## Komut satırı arabirimini açın

Birkaç deneme yapmak için önce komut satırı arabirimini açmamız gerekir.

<!--sec data-title="Windows" data-id="windows_prompt" data-collapse=true ces-->

Go to Start menu → Windows System → Command Prompt.

> On older versions of Windows, look in Start menu → All Programs → Accessories → Command Prompt.

<!--endsec-->

<!--sec data-title="OS X" data-id="OSX_prompt" data-collapse=true ces-->

Go to Applications → Utilities → Terminal.

<!--endsec-->

<!--sec data-title="Linux" data-id="linux_prompt" data-collapse=true ces-->

It's probably under Applications → Accessories → Terminal, but that may depend on your system. If it's not there, just Google it. :)

<!--endsec-->

## İstemci

Şu anda yüksek ihtimalle sizden komut bekleyen siyah ya da beyaz bir ekran görüyor olmalısınız.

<!--sec data-title="OS X and Linux" data-id="OSX_Linux_prompt" data-collapse=true ces-->

Eğer Mac veya GNU/Linux kullanıyorsanız, yüksek ihtimalle `$` işareti göreceksiniz, tıpkı bunun gibi:

{% filename %}command-line{% endfilename %}

    $
    

<!--endsec-->

<!--sec data-title="Windows" data-id="windows_prompt2" data-collapse=true ces-->

Windows'da ise `>` işareti göreceksiniz, bunun gibi:

{% filename %}command-line{% endfilename %}

    >
    

<!--endsec-->

Each command will be prepended by this sign and one space, but you don't have to type it. Your computer will do it for you. :)

> Just a small note: in your case there may be something like `C:\Users\ola>` or `Olas-MacBook-Air:~ ola$` before the prompt sign, and this is 100% OK.

The part up to and including the `$` or the `>` is called the *command line prompt*, or *prompt* for short. It prompts you to input something there.

In the tutorial, when we want you to type in a command, we will include the `$` or `>`, and occasionally more to the left. You can ignore the left part and just type in the command which starts after the prompt.

## İlk komutunuz (Yaşasın!)

Basit bir şeyle başlayalım. Aşağıdaki komutu yazın:

<!--sec data-title="OS X and Linux" data-id="OSX_Linux_whoami" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    $ whoami
    

<!--endsec-->

<!--sec data-title="Windows" data-id="windows_whoami" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    > whoami
    

<!--endsec-->

Ve ardından `enter` tuşuna basın. Sonucumuz bu:

{% filename %}command-line{% endfilename %}

    $ whoami zeynep
    

As you can see, the computer has just printed your username. Neat, huh? :)

> Try to type each command; do not copy-paste. You'll remember more this way!

## Temeller

Tüm işletim sistemleri komut satırı için birbirinden biraz farklı komutlar kullanır, bu nedenle işletim sisteminize uygun yönergeleri izlediğinizden emin olun. Deneyelim mi?

### Geçerli Dizin

Nerede olduğumuzu bilmek güzel olurdu, değil mi? Bakalım. Bu komutu yazın ve `enter` tuşuna basın:

<!--sec data-title="OS X and Linux" data-id="OSX_Linux_pwd" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    $ pwd
    /Users/zeynep
    

> Not: 'pwd'nin anlamı "print working directory" yani "çalışma dizinini yazdır"dır.

<!--endsec-->

<!--sec data-title="Windows" data-id="windows_cd" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    > cd
    C:\Users\zeynep
    

> Note: 'cd' stands for 'change directory'. With powershell you can use pwd just like on Linux or Mac OS X.

<!--endsec-->

Muhtemelen makinenizde benzeri bir yazı göreceksiniz. Komut satırını açtığınızda genellikle kullanıcınızın ev dizininde başlarsınız.

* * *

### Dosya ve dizinleri listele

Yani içeride ne var? Bilmek harika olurdu. Haydi bakalım:

<!--sec data-title="OS X and Linux" data-id="OSX_Linux_ls" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    $ ls
    Uygulamalar
    Masaüstü
    İndirilenler
    Müzik
    ...
    

<!--endsec-->

<!--sec data-title="Windows" data-id="windows_dir" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    > dir  Directory of C:\Users\zeynep 
    05/08/2014 07:28 PM <DIR> Uygulamalar 
    05/08/2014 07:28 PM <DIR> Masaüstü 
    05/08/2014 07:28 PM <DIR> İndirilenler 
    05/08/2014 07:28 PM <DIR> Müzik 
    ...
    

> Note: In powershell you can also use 'ls' like on Linux and Mac OS X. <!--endsec-->

* * *

### Geçerli dizini değiştir

Şimdi, haydi Masaüstü dizinimize gidelim:

<!--sec data-title="OS X and Linux" data-id="OSX_Linux_move_to" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    $ cd Masaüstü
    

<!--endsec-->

<!--sec data-title="Windows" data-id="windows_move_to" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    > cd Masaüstü
    

<!--endsec-->

Gerçekten değişmiş mi bir bakalım:

<!--sec data-title="OS X and Linux" data-id="OSX_Linux_pwd2" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    $ pwd
    C:\Users\zeynep\Masaüstü
    

<!--endsec-->

<!--sec data-title="Windows" data-id="windows_cd2" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    > cd 
    C:\Users\zeynep\Masaüstü
    

<!--endsec-->

İşte oldu!

> PRO tip: if you type `cd D` and then hit `tab` on your keyboard, the command line will automatically fill in the rest of the name so you can navigate faster. If there is more than one folder starting with "D", hit the `tab` key twice to get a list of options.

* * *

### Dizin oluşturun

Uygulamalı yapmak için masaüstünüzde bir dizin oluşturmaya ne dersiniz? Bu şekilde yapabilirsiniz:

<!--sec data-title="OS X and Linux" data-id="OSX_Linux_mkdir" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    $ mkdir uygulama
    

<!--endsec-->

<!--sec data-title="Windows" data-id="windows_mkdir" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    > mkdir uygulama
    

<!--endsec-->

Bu küçük komut masaüstünüzde `uygulama` isimli bir klasör oluşturacaktır. Orada olup olmadığını kontrol etmek için `ls` veya `dir` komutlarını kullanabilirsiniz! Try it. :)

> Profesyonel ipucu: Eğer aynı komutları tekrar tekrar yazmak istemiyorsanız, `yukarı ok` ve `aşağı ok` tuşlarına basarak yazdığınız komutlar arasında geçiş yapabilirsiniz.

* * *

### Alıştırma!

A small challenge for you: in your newly created `practice` directory, create a directory called `test`. (Use the `cd` and `mkdir` commands.)

#### Çözüm:

<!--sec data-title="OS X and Linux" data-id="OSX_Linux_test_dir" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    $ cd uygulama
    $ mkdir test
    $ ls
    test
    

<!--endsec-->

<!--sec data-title="Windows" data-id="windows_test_dir" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    > cd uygulama
    > mkdir test
    > dir
    05/08/2014 07:28 PM <DIR>      test
    

<!--endsec-->

Tebrikler! :)

* * *

### Temizlik

Ortalığı dağınık bırakmak istemeyiz, haydi yaptığımız her şeyi silelim.

İlk önce masaüstüne geri dönmemiz gerek:

<!--sec data-title="OS X and Linux" data-id="OSX_Linux_back" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    $ cd ..
    

<!--endsec-->

<!--sec data-title="Windows" data-id="windows_back" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    > cd ..
    

<!--endsec-->

Using `..` with the `cd` command will change your current directory to the parent directory (that is, the directory that contains your current directory).

Nerede olduğunuzu kontrol edin:

<!--sec data-title="OS X and Linux" data-id="OSX_Linux_pwd3" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    $ pwd
    C:\Users\zeynep\Masaüstü
    

<!--endsec-->

<!--sec data-title="Windows" data-id="windows_cd3" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    > cd 
    C:\Users\zeynep\Masaüstü
    

<!--endsec-->

Şimdi `uygulama` dizinini silme vakti:

> **Attention**: Deleting files using `del`, `rmdir` or `rm` is irrecoverable, meaning *the deleted files will be gone forever*! So be very careful with this command.

<!--sec data-title="Windows Powershell, OS X and Linux" data-id="OSX_Linux_rm" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    $ rm -r uygulama
    

<!--endsec-->

<!--sec data-title="Windows Command Prompt" data-id="windows_rmdir" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    > rmdir /S uygulama
    uygulama, Emin misiniz <E/H>? E
    

<!--endsec-->

Bitti! Gerçekten silindiğinden emin olalım:

<!--sec data-title="OS X and Linux" data-id="OSX_Linux_ls2" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    $ ls
    

<!--endsec-->

<!--sec data-title="Windows" data-id="windows_dir2" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    > dir
    

<!--endsec-->

### Çıkış

That's it for now! You can safely close the command line now. Let's do it the hacker way, alright? :)

<!--sec data-title="OS X and Linux" data-id="OSX_Linux_exit" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    $ exit
    

<!--endsec-->

<!--sec data-title="Windows" data-id="windows_exit" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    > exit
    

<!--endsec-->

Cool, huh? :)

## Özet

İşte bazı yararlı komutların özeti:

| Komut (Windows) | Komut (Mac OS - GNU/Linux) | Açıklama                   | Örnek                                             |
| --------------- | -------------------------- | -------------------------- | ------------------------------------------------- |
| exit            | exit                       | pencereyi kapatır          | **exit**                                          |
| cd              | cd                         | dizin değiştir             | **cd test**                                       |
| cd              | pwd                        | show the current directory | **cd** (Windows) or **pwd** (Mac OS / Linux)      |
| dir             | ls                         | dizin/dosyaları listele    | **dir**                                           |
| copy            | cp                         | dosya kopyala              | **copy c:\test\test.txt c:\windows\test.txt** |
| move            | mv                         | dosya taşı                 | **move c:\test\test.txt c:\windows\test.txt** |
| mkdir           | mkdir                      | yeni bir dizin oluştur     | **mkdir testdizini**                              |
| rmdir (or del)  | rm                         | delete a file              | **del c:\test\test.txt**                        |
| rmdir /S        | rm -r                      | delete a directory         | **rm -r testdirectory**                           |

Bu kullanabileceğiniz komutlardan sadece birkaçı, fakat bugün bundan daha fazlasını kullanmayacaksınız.

Eğer merak ediyorsanız, [ss64.com](http://ss64.com) adresinden tüm işletim sistemleri için tüm komutların kullanımına ulaşabilirsiniz.

## Hazır mısınız?

Haydi Python'a giriş yapalım!