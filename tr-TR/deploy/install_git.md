Git, birçok programcı tarafından kullanılan bir "sürüm kontrol sistemi"dir. Bu yazılım dosyaların zaman içindeki değişimlerini izler, böylelikle sonradan eski sürümlere ulaşabilirsiniz. Bir parça, kelime işlemcisi programlarındaki (Microsoft Word ve ya LibreOffice Writer v.b.) "değişikleri izleme" özelliği gibi, ama çok daha güçlü.

## Git'i kurmak

<!--sec data-title="Installing Git: Windows" data-id="git_install_windows"
data-collapse=true ces-->

Git'i [git-scm.com](https://git-scm.com/) adresinden indirebilirsiniz. You can hit "next" on all steps except for two: in the step where it asks to choose your editor, you should pick Nano, and in the step entitled "Adjusting your PATH environment", choose "Use Git and optional Unix tools from the Windows Command Prompt" (the bottom option). Onun dışında varsayılanları seçebilirsiniz. Satır sonları için kodu çekerken Windows-stilini, kodu gönderirken Unix-stilini kullanın.

Kurulum başarı ile tamamlandıktan sonra komut istemini veya powershelli yeniden başlatmayı unutmayın. <!--endsec-->

<!--sec data-title="Installing Git: OS X" data-id="git_install_OSX"
data-collapse=true ces-->

Git'i [git-scm.com](https://git-scm.com/)'den indirin ve yönergeleri izleyin.

> **Not** Eğer OS X 10.6, 10.7 ya da 10.8 kullanıyorsanız, giti buradan indirmeniz gerekmektedir: [OS X Snow Leopard için Git Kurulumu](https://sourceforge.net/projects/git-osx-installer/files/git-2.3.5-intel-universal-snow-leopard.dmg/download)

<!--endsec-->

<!--sec data-title="Installing Git: Debian or Ubuntu" data-id="git_install_debian_ubuntu"
data-collapse=true ces-->

{% filename %}komut-satırı{% endfilename %}

```bash
$ sudo apt install git
```

<!--endsec-->

<!--sec data-title="Installing Git: Fedora" data-id="git_install_fedora"
data-collapse=true ces-->

{% filename %}komut-satırı{% endfilename %}

```bash
$ sudo dnf install git
```

<!--endsec-->

<!--sec data-title="Installing Git: openSUSE" data-id="git_install_openSUSE"
data-collapse=true ces-->

{% filename %}komut-satırı{% endfilename %}

```bash
$ sudo zypper install git
```

<!--endsec-->