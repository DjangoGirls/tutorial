Git, birçok programcı tarafından kullanılan bir "sürüm kontrol sistemi"dir. Bu yazılım dosyaların zaman içindeki değişimlerini izler, böylelikle sonradan eski sürümlere ulaşabilirsiniz. Bir parça, kelime işlemcisi programlarındaki (Microsoft Word ve ya LibreOffice Writer v.b.) "değişikleri izleme" özelliği gibi, ama çok daha güçlü.

## Git'i kurmak

<!--sec data-title="Installing Git: Windows" data-id="git_install_windows"
data-collapse=true ces-->

Git'i [git-scm.com](https://git-scm.com/) adresinden indirebilirsiniz. İki adım hariç bütün adımlarda "next"e basarak ilerleyebilirsiniz. Editör seçiminin sorulduğu adımda, Nano seçeneğini seçin. "Adjusting your PATH environment" adımında ise "Run Git and associated Unix tools from the Windows command-line" (en alttaki opsiyonu) seçin. Onun dışında varsayılanları seçebilirsiniz. Satır sonları için kodu çekerken Windows-stilini, kodu gönderirken Unix-stilini kullanın.

Do not forget to restart the command prompt or PowerShell after the installation finished successfully. <!--endsec-->

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