# コマンドラインを使ってみよう

> 家で１人でこのチャプターに挑戦している方へ：このチャプターは、動画（英語）もあるので参考にしてください。 [Your new friend: Command Line](https://www.youtube.com/watch?v=jvZLWhkzX-8)

さぁ、これから最初のコードを書いていきますよ。楽しんでいきましょう！:)

**最初にお友達になるのはコレです。: コマンドライン!**

プログラマーが黒い画面に向かっている光景を見たことがありますか？ここからは、その黒い画面を触ってみます。最初はちょっとコワイと思うかもしれませんが、そんなことはありません。プロンプトと呼ばれるものがあなたの命令（コマンド）を待っています。

> **備考：** このチュートリアルでは、”ディレクトリ”や"フォルダ"という用語が出てきますが、同じ意味です。

## コマンドラインって何？

さて、**コマンドライン** あるいは **コマンドライン インターフェイス**と呼ばれるこの画面は、キーボードで入力したテキストで命令を出してコンピューターと直接対話するように、ファイルを見たり、変更したりするものです。 グラフィカル・インターフェイスではないだけで、WindowsのエクスプローラやMacのFinderと同じ役割です。 このコマンドラインは、 *cmd*や*CLI*、*プロンプト*、*コンソール*、*ターミナル*と呼ばれることもあります.

## コマンドラインインタフェースを開く

では、実際にコマンドラインを開いて、触ってみることとしましょう。

<!--sec data-title="Opening: Windows" data-id="windows_prompt" data-collapse=true ces-->

［スタート］→［Windowsシステムツール］→［コマンドプロンプト］を選択しましょう

> Windowsの古いバージョンの場合、[スタート] → [アクセサリ] → [コマンドプロンプト] です。

<!--endsec-->

<!--sec data-title="Opening: OS X" data-id="OSX_prompt" data-collapse=true ces-->

［アプリケーション］→［ユーティリティ］→［ターミナル］を選択しましょう。

<!--endsec-->

<!--sec data-title="Opening: Linux" data-id="linux_prompt" data-collapse=true ces-->

おそらく ［アプリケーション］→［アクセサリ］→［ターミナル］と選択し起動できるでしょう。あなたのシステムによってはこの通りではないことがあります。見つからないときは、Google先生にきいてみましょう. :)

<!--endsec-->

## プロンプト

おそらく今、真っ白または真っ黒な画面が開かれていることでしょう。この画面はあなたの命令を待っています。

<!--sec data-title="Prompt: OS X and Linux" data-id="OSX_Linux_prompt" data-collapse=true ces-->

MacあるいはLinuxの方は、次のように `$` と表示されているのがわかりますか？

{% filename %}command-line{% endfilename %}

    $
    

<!--endsec-->

<!--sec data-title="Prompt: Windows" data-id="windows_prompt2" data-collapse=true ces-->

Windowsの方は、 `>` という記号が表示されていることでしょう。

{% filename %}command-line{% endfilename %}

    >
    

<!--endsec-->

各コマンドの先頭には、この記号とスペースがつきます。あなたのコンピューターが表示してくれるので、自分で入力する必要はありません. :)

> ちょっと補足です。プロンプト記号の前に `C:\Users\ola>` や `Olas-MacBook-Air:~ ola$` のような表示がありますね。これは間違いではありません。100%正解です。このチュートリアルでは、シンプルにわかりやすくするために、その部分を省略して記述します。

`$` や `>` と書かれているところまでを、 *コマンドラインプロンプト* あるいは略して*プロンプト*と呼ばれます。プロンプトは、あなたがここに何かを入力することを促しています。

このチュートリアルでは、コマンドを入力してほしい時は、 `$` や `>` を含めて示しています。 $や>は無視して、プロンプト以降のコマンドを入力してください。

## 最初のコマンド (イェイ！)

次のようにコマンドを入力してみましょう。:

<!--sec data-title="Your first command: OS X and Linux" data-id="OSX_Linux_whoami" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    $ whoami
    

<!--endsec-->

<!--sec data-title="Your first command: Windows" data-id="windows_whoami" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    > whoami
    

<!--endsec-->

そして最後にEnterキーを押して下さい。このような結果が返ってきます

{% filename %}command-line{% endfilename %}

    $ whoami
    olasitarska
    

ご覧のとおり、コンピューターがあなたのユーザーネームを表示してくれましたね。面白いでしょ? :)

> コピー＆ペーストではなく、コマンドを入力して試してみてください。そのうち自然と覚えられるようになりますからね！

## 基本

OSによってコマンドが若干違います。あなたのコンピューターのOSの方法に従って、以下は進めていってくださいね。次にいってみましょう。

### カレントディレクトリ（現在のディレクトリ）

今どこのディレクトリにいるか（どのフォルダで作業をしているか）、知りたいですよね？では、このようにキーボードで入力して、`Enterキー`をおしてください。

<!--sec data-title="Current directory: OS X and Linux" data-id="OSX_Linux_pwd" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    $ pwd
    /Users/olasitarska
    

> 補足: 'pwd' は'print working directory'を意味しており、現在いる作業ディレクトリを取得することです。

<!--endsec-->

<!--sec data-title="Current directory: Windows" data-id="windows_cd" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    > cd
    C:\Users\olasitarska
    

> 補足: 'cd' は、'change directory' を意味しています。Powershellを使うと、LinuxやMac OS Xのようにpwdコマンドを使えます。

<!--endsec-->

おそらく、似たようなものがあなたの画面に表示されたのではないでしょうか。コマンドラインを起動した最初は、通常ユーザーのホームディレクトリが表示されます。

* * *

### ファイルとディレクトリの一覧

では、その中には何があるのでしょうか？表示させてみましょう。

<!--sec data-title="List files and directories: OS X and Linux" data-id="OSX_Linux_ls" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    $ ls
    Applications
    Desktop
    Downloads
    Music
    ...
    

<!--endsec-->

<!--sec data-title="List files and directories: Windows" data-id="windows_dir" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    > dir
     Directory of C:\Users\olasitarska
    05/08/2014 07:28 PM <DIR>      Applications
    05/08/2014 07:28 PM <DIR>      Desktop
    05/08/2014 07:28 PM <DIR>      Downloads
    05/08/2014 07:28 PM <DIR>      Music
    ...
    

> 補足：Powershellでは、lsコマンドをLinux や Mac OS X同様に使えます。 <!--endsec-->

* * *

### カレントディレクトリの変更

次に、デスクトップのディレクトリに移動してみましょう。

<!--sec data-title="Change current directory: OS X and Linux" data-id="OSX_Linux_move_to" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    $ cd Desktop
    

<!--endsec-->

<!--sec data-title="Change current directory: Windows" data-id="windows_move_to" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    > cd Desktop
    

<!--endsec-->

本当に変更されたかどうか確認してみてください：

<!--sec data-title="Check if changed: OS X and Linux" data-id="OSX_Linux_pwd2" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    $ pwd
    /Users/olasitarska/Desktop
    

<!--endsec-->

<!--sec data-title="Check if changed: Windows" data-id="windows_cd2" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    > cd
    C:\Users\olasitarska\Desktop
    

<!--endsec-->

できていますね！

> PRO tip: `cd D`と入力して、キーボードの`tab`ボタンを押してください。すると、Dに続く残りの部分が自動的に補完されて入力されます。 もし、Dから始まるディレクトリ名が他にもあれば、`tabボタン`を繰り返し押すと候補が次々と表示されます。入力が楽になりますね。

* * *

### ディレクトリの作成

それでは、Django Girlsのディレクトリをデスクトップに新規作成してみましょう。

<!--sec data-title="Create directory: OS X and Linux" data-id="OSX_Linux_mkdir" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    $ mkdir practice
    

<!--endsec-->

<!--sec data-title="Create directory: Windows" data-id="windows_mkdir" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    > mkdir practice
    

<!--endsec-->

この短いコマンドで、デスクトップにpracticeという名前の新しいフォルダが作成されました。 あなたのデスクトップを見てフォルダが作成されていることを確認してみましょう。あるいは、先ほど学んだコマンド `ls` や `dir` を使って確認しましょう。 やってみてください。 :)

> PRO tip: 同じコマンドを何度もなんども入力したくない時は、上下矢印キー`↑`、`↓`を押せば、先ほどキーボードから入力したものが現れます。内容を修正したい場合には，左右矢印キー←，→を利用して修正したい位置にカーソルを移動させて，修正することができますよ。

* * *

### エクササイズ！

練習をしてみましょう。先ほど作成した`practice`ディレクトリの中に、新たに`test`という名前のディレクトリを作成してください。（使うコマンドは、` cd `と `mkdir` ですよ。）

#### 解答:

<!--sec data-title="Exercise solution: OS X and Linux" data-id="OSX_Linux_test_dir" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    $ cd practice
    $ mkdir test
    $ ls
    test
    

<!--endsec-->

<!--sec data-title="Exercise solution: Windows" data-id="windows_test_dir" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    > cd practice
    > mkdir test
    > dir
    05/08/2014 07:28 PM <DIR>      test
    

<!--endsec-->

おめでとうございます！よくできました！

* * *

### クリーンアップ

練習がおわったら、それをそのままに置いておくと邪魔になりますね。削除しておきましょう。

はじめに、作業するディレクトリをデスクトップに戻しましょう。

<!--sec data-title="Clean up: OS X and Linux" data-id="OSX_Linux_back" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    $ cd ..
    

<!--endsec-->

<!--sec data-title="Clean up: Windows" data-id="windows_back" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    > cd ..
    

<!--endsec-->

`cd` の後にある`..` で、現在の親ディレクトリに移動します。（今作業しているフォルダのひとつ上のフォルダに移動するということですね。）

現在の作業ディレクトリを確認しておきましょう。

<!--sec data-title="Check location: OS X and Linux" data-id="OSX_Linux_pwd3" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    $ pwd
    /Users/olasitarska/Desktop
    

<!--endsec-->

<!--sec data-title="Check location: Windows" data-id="windows_cd3" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    > cd
    C:\Users\olasitarska\Desktop
    

<!--endsec-->

では、practiceディレクトリを削除しましょう。

> **注意！: **　`del`や `rmdir `、`rm` のコマンドを使って削除したファイルは、復活できません。完全に消えてしまいます。 このコマンドを使う時は、よく気をつけてくださいね。

<!--sec data-title="Delete directory: Windows Powershell, OS X and Linux" data-id="OSX_Linux_rm" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    $ rm -r practice
    

<!--endsec-->

<!--sec data-title="Delete directory: Windows Command Prompt" data-id="windows_rmdir" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    > rmdir /S practice
    practice, Are you sure <Y/N>? Y
    

<!--endsec-->

できました! 本当に削除されたか、確認してみましょう。:

<!--sec data-title="Check deletion: OS X and Linux" data-id="OSX_Linux_ls2" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    $ ls
    

<!--endsec-->

<!--sec data-title="Check deletion: Windows" data-id="windows_dir2" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    > dir
    

<!--endsec-->

### 終了

ここまでです。それではコマンドラインを終了しましょう。かっこいいやり方で終わりたいですよね? :)

<!--sec data-title="Exit: OS X and Linux" data-id="OSX_Linux_exit" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    $ exit
    

<!--endsec-->

<!--sec data-title="Exit: Windows" data-id="windows_exit" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    > exit
    

<!--endsec-->

かっこいいですね? :)

## まとめ

ここに学んだコマンドをまとめておきます。

| コマンド (Windows) | コマンド (Mac OS / Linux) | 説明                | 例                                                 |
| -------------- | --------------------- | ----------------- | ------------------------------------------------- |
| exit           | exit                  | ウインドウを閉じる         | **exit**                                          |
| cd             | cd                    | ディレクトリを変更         | **cd test**                                       |
| cd             | pwd                   | 現在のディレクトリを表示      | **cd** (Windows) or **pwd** (Mac OS / Linux)      |
| dir            | ls                    | ディレクトリ/ファイルの一覧を表示 | **dir**                                           |
| copy           | cp                    | ファイルのコピー          | **copy c:\test\test.txt c:\windows\test.txt** |
| move           | mv                    | ファイルを移動           | **move c:\test\test.txt c:\windows\test.txt** |
| mkdir          | mkdir                 | 新しいディレクトリを作成      | **mkdir testdirectory**                           |
| rmdir (or del) | rm                    | ファイルを削除           | **del c:\test\test.txt**                        |
| rmdir /S       | rm -r                 | ディレクトリを削除         | **rm -r testdirectory**                           |

ここで勉強したのはコマンドのほんの一部でしたが、このワークショップで使うコマンドはこれだけです。

もっと勉強したい方は、[ss64.com](http://ss64.com) に各OSのコマンド一覧があります。ご参考までに。

## 準備OK？

よし、次はPythonを勉強していきましょう!