# Komut satırı arayüzüne giriş

> Evden okuyanlar için: Bu bölüm [ Yeni arkadaşınız: Command Line](https://www.youtube.com/watch?v=jvZLWhkzX-8) videosu içinde anlatıldı.

Heyecanlı değil mi?! Birkaç dakika içinde ilk kod satırınızı yazacaksın! :)

**Sizi yeni arkadaşınızla tanıştıralım: komut satırı!**

Gelecek aşamalar size tüm "hacker"ların kullandığı siyah pencerenin nasıl kullanıldığını gösterecek. Başta biraz korkutucu görünebilir fakat bu sadece sizden komut bekleyen bir pencere.

> **Not** Lütfen kitap boyunca 'dizin' ve 'klasör' terimlerini birbirinin yerine kullandığımızı ve aynı anlama geldiklerini not unutmayın.

## Komut satırı nedir?

Genellikle **komut satırı** veya **komut satırı arabirimi** adı verilen pencere, bilgisayarınızdaki dosyaları görmek, düzenlemek ve yönetmek için kullanılan metin tabanlı bir uygulamadır. Bu tıpkı windows gezgini yada mac'teki finder gibi fakat grafiksel arayüzü olmadan. Komut satırının diğer adları: *cmd*, *CLI*, *komut istemcisi*, *konsol* veya *terminal (uçbirim)*dir.

## Komut satırı arabirimini açın

Birkaç deneme yapmak için önce komut satırı arabirimini açmamız gerekir.

<!--sec data-title="Opening: Windows" data-id="windows_prompt" data-collapse=true ces-->

Başlat'a gidin → Windows sistemi → Komut istemcisi.

> Daha eski bir windows sistemi için, Başlat menüsü →Tüm programlar → Aksesuarlar → Komut istemcisi.

<!--endsec-->

<!--sec data-title="Opening: OS X" data-id="OSX_prompt" data-collapse=true ces-->

Uygulamalar → Araçlar →Terminal.

<!--endsec-->

<!--sec data-title="Opening: Linux" data-id="linux_prompt" data-collapse=true ces-->

Muhtemelen Uygulamalar → Donatılar → Terminal altında olmalı, fakat sistemler arası farklılık gösterebilir. Eğer orada değilse İnternet'te arayın. :)

<!--endsec-->

## İstemci

Şu anda yüksek ihtimalle sizden komut bekleyen siyah ya da beyaz bir ekran görüyor olmalısınız.

<!--sec data-title="Prompt: OS X and Linux" data-id="OSX_Linux_prompt" data-collapse=true ces-->

If you're on Mac or Linux, you probably see a `$`, like this:

{% filename %}komut-satırı{% endfilename %}

    $
    

<!--endsec-->

<!--sec data-title="Prompt: Windows" data-id="windows_prompt2" data-collapse=true ces-->

On Windows, you probably see a `>`, like this:

{% filename %}komut-satırı{% endfilename %}

    >
    

Take a look at the Linux section just above now -- you'll see something more like that when you get to PythonAnywhere later in the tutorial.

<!--endsec-->

Each command will be prepended by a `$` or `>` and one space, but you should not type it. Your computer will do it for you. :)

> Küçük bir not: sizin durumunuzda `C:\Users\ola>` veya `Olas-MacBook-Air:~ ola$` benzeri bir durumda olabilir ve kesinlikle sorun yok.

The part up to and including the `$` or the `>` is called the *command line prompt*, or *prompt* for short. It prompts you to input something there.

In the tutorial, when we want you to type in a command, we will include the `$` or `>`, and occasionally more to the left. Ignore the left part and only type in the command, which starts after the prompt.

## İlk komutunuz (Yaşasın!)

Let's start by typing this command:

<!--sec data-title="Your first command: OS X and Linux" data-id="OSX_Linux_whoami" data-collapse=true ces-->

{% filename %}komut-satırı{% endfilename %}

    $ whoami
    

<!--endsec-->

<!--sec data-title="Your first command: Windows" data-id="windows_whoami" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    > whoami
    

<!--endsec-->

And then hit `enter`. This is our result:

{% filename %}command-line{% endfilename %}

    $ whoami zeynep
    

As you can see, the computer has just printed your username. Neat, huh? :)

> Her komutu yazmaya çalışın; kopyala - yapıştır yapmayın. Böylece daha akılda kalıcı olur!

## Temeller

Each operating system has a slightly different set of commands for the command line, so make sure to follow instructions for your operating system. Let's try this, shall we?

### Geçerli Dizin

It'd be nice to know where are we now, right? Let's see. Type this command and hit `enter`:

<!--sec data-title="Current directory: OS X and Linux" data-id="OSX_Linux_pwd" data-collapse=true ces-->

{% filename %}komut-satırı{% endfilename %}

    $ pwd
    /Users/zeynep
    

> Not: 'pwd'nin anlamı "print working directory" yani "çalışma dizinini yazdır"dır.

<!--endsec-->

<!--sec data-title="Current directory: Windows" data-id="windows_cd" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    > cd
    C:\Users\zeynep
    

> Not: 'cd' komutu 'dizin değiştir' anlamındadır. Powershell ile Linux veya Mac OS X'teki gibi pwd komutunu kullanabilirsiniz.

<!--endsec-->

You'll probably see something similar on your machine. Once you open the command line you usually start at your user's home directory.

* * *

### Dosya ve dizinleri listele

So what's in it? It'd be cool to find out. Let's see:

<!--sec data-title="List files and directories: OS X and Linux" data-id="OSX_Linux_ls" data-collapse=true ces-->

{% filename %}komut-satırı{% endfilename %}

    $ ls
    Uygulamalar
    Masaüstü
    İndirilenler
    Müzik
    ...
    

<!--endsec-->

<!--sec data-title="List files and directories: Windows" data-id="windows_dir" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    > dir  Directory of C:\Users\zeynep 
    05/08/2014 07:28 PM <DIR> Uygulamalar 
    05/08/2014 07:28 PM <DIR> Masaüstü 
    05/08/2014 07:28 PM <DIR> İndirilenler 
    05/08/2014 07:28 PM <DIR> Müzik 
    ...
    

> Not: Ayrıca powershell kullanırken Linux ve Mac OS X'teki gibi 'ls' komutunu kullanabilirsiniz. <!--endsec-->

* * *

### Geçerli dizini değiştir

Now, let's go to our Desktop directory:

<!--sec data-title="Change current directory: OS X and Linux" data-id="OSX_Linux_move_to" data-collapse=true ces-->

{% filename %}komut-satırı{% endfilename %}

    $ cd Masaüstü
    

<!--endsec-->

<!--sec data-title="Change current directory: Windows" data-id="windows_move_to" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    > cd Masaüstü
    

<!--endsec-->

Check if it's really changed:

<!--sec data-title="Check if changed: OS X and Linux" data-id="OSX_Linux_pwd2" data-collapse=true ces-->

{% filename %}komut-satırı{% endfilename %}

    $ pwd
    C:\Users\zeynep\Masaüstü
    

<!--endsec-->

<!--sec data-title="Check if changed: Windows" data-id="windows_cd2" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    > cd 
    C:\Users\zeynep\Masaüstü
    

<!--endsec-->

Here it is!

> Profesyonel İpucu: Eğer `cd D` yazarsanız ve klavyenizden `tab`'a basarsanız, komut satırı ismin geri kalanını tamamlar ve daha hızlı gezersiniz. Eğer "D" ile başlayan birden fazla klasör varsa, diğer seçenekleri görmek için `tab` tuşuna iki kez basın.

* * *

### Dizin oluşturun

How about creating a practice directory on your desktop? You can do it this way:

<!--sec data-title="Create directory: OS X and Linux" data-id="OSX_Linux_mkdir" data-collapse=true ces-->

{% filename %}komut-satırı{% endfilename %}

    $ mkdir uygulama
    

<!--endsec-->

<!--sec data-title="Create directory: Windows" data-id="windows_mkdir" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    > mkdir uygulama
    

<!--endsec-->

This little command will create a folder with the name `practice` on your desktop. You can check if it's there by looking on your Desktop or by running a `ls` or `dir` command! Try it. :)

> Profesyonel ipucu: Eğer aynı komutları tekrar tekrar yazmak istemiyorsanız, `yukarı ok` ve `aşağı ok` tuşlarına basarak yazdığınız komutlar arasında geçiş yapabilirsiniz.

* * *

### Alıştırma!

A small challenge for you: in your newly created `practice` directory, create a directory called `test`. (Use the `cd` and `mkdir` commands.)

#### Çözüm:

<!--sec data-title="Exercise solution: OS X and Linux" data-id="OSX_Linux_test_dir" data-collapse=true ces-->

{% filename %}komut satırı{% endfilename %}

    $ cd uygulama
    $ mkdir test
    $ ls
    test
    

<!--endsec-->

<!--sec data-title="Exercise solution: Windows" data-id="windows_test_dir" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    > cd uygulama
    > mkdir test
    > dir
    05/08/2014 07:28 PM <DIR>      test
    

<!--endsec-->

Congrats! :)

* * *

### Temizlik

We don't want to leave a mess, so let's remove everything we did until that point.

First, we need to get back to Desktop:

<!--sec data-title="Clean up: OS X and Linux" data-id="OSX_Linux_back" data-collapse=true ces-->

{% filename %}komut satırı{% endfilename %}

    $ cd ..
    

<!--endsec-->

<!--sec data-title="Clean up: Windows" data-id="windows_back" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    > cd ..
    

<!--endsec-->

Using `..` with the `cd` command will change your current directory to the parent directory (that is, the directory that contains your current directory).

Check where you are:

<!--sec data-title="Check location: OS X and Linux" data-id="OSX_Linux_pwd3" data-collapse=true ces-->

{% filename %}komut satırı{% endfilename %}

    $ pwd
    C:\Users\zeynep\Masaüstü
    

<!--endsec-->

<!--sec data-title="Check location: Windows" data-id="windows_cd3" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    > cd 
    C:\Users\zeynep\Masaüstü
    

<!--endsec-->

Now time to delete the `practice` directory:

> **Dikkat**: `del`, `rmdir` veya `rm` komutları kullanılarak yapılan silme işlemleri geri alınamaz, bunun anlamı: *silinen dosyalar sonsuza dek yok olur*! Yani bu komutları kullanırken çok dikkatli olun.

<!--sec data-title="Delete directory: Windows Powershell, OS X and Linux" data-id="OSX_Linux_rm" data-collapse=true ces-->

{% filename %}komut satırı{% endfilename %}

    $ rm -r uygulama
    

<!--endsec-->

<!--sec data-title="Delete directory: Windows Command Prompt" data-id="windows_rmdir" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    > rmdir /S uygulama
    uygulama, Emin misiniz <E/H>? E
    

<!--endsec-->

Done! To be sure it's actually deleted, let's check it:

<!--sec data-title="Check deletion: OS X and Linux" data-id="OSX_Linux_ls2" data-collapse=true ces-->

{% filename %}komut satırı{% endfilename %}

    $ ls
    

<!--endsec-->

<!--sec data-title="Check deletion: Windows" data-id="windows_dir2" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    > dir
    

<!--endsec-->

### Çıkış

That's it for now! You can safely close the command line now. Let's do it the hacker way, alright? :)

<!--sec data-title="Exit: OS X and Linux" data-id="OSX_Linux_exit" data-collapse=true ces-->

{% filename %}komut satırı{% endfilename %}

    $ exit
    

<!--endsec-->

<!--sec data-title="Exit: Windows" data-id="windows_exit" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    > exit
    

<!--endsec-->

Cool, huh? :)

## Özet

Here is a summary of some useful commands:

| Komut (Windows)  | Komut (Mac OS - GNU/Linux) | Açıklama                | Örnek                                             |
| ---------------- | -------------------------- | ----------------------- | ------------------------------------------------- |
| exit             | exit                       | pencereyi kapatır       | **exit**                                          |
| cd               | cd                         | dizin değiştir          | **cd test**                                       |
| cd               | pwd                        | geçerli dizini göster   | **cd** (Windows) veya **pwd** (Mac OS / Linux)    |
| dir              | ls                         | dizin/dosyaları listele | **dir**                                           |
| copy             | cp                         | dosya kopyala           | **copy c:\test\test.txt c:\windows\test.txt** |
| move             | mv                         | dosya taşı              | **move c:\test\test.txt c:\windows\test.txt** |
| mkdir            | mkdir                      | yeni bir dizin oluştur  | **mkdir testdizini**                              |
| rmdir (veya del) | rm                         | dosyayı silin           | **del c:\test\test.txt**                        |
| rmdir /S         | rm -r                      | klasörü siliniz         | **rm - r testdizini**                             |

These are just a very few of the commands you can run in your command line, but you're not going to use anything more than that today.

If you're curious, [ss64.com](http://ss64.com) contains a complete reference of commands for all operating systems.

## Hazır mısınız?

Let's dive into Python!