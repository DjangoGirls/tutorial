PythonAnywhereはクラウド上のサーバーでPythonのコードを走らせるためのサービスです。私たちのサイトをホスティングして、インターネット上で動かし続けるために使います。

今までの章で作ったブログをPythonAnywhere上にホスティングします。PythonAnywhereの「Beginner」アカウントを作成しましょう(アカウントは無料枠で大丈夫です。クレジットカードは必要ありません)。

* [www.pythonanywhere.com](https://www.pythonanywhere.com/)

![PythonAnywhereの登録ページ。無料の「Beginner」アカウントを作るためのボタンがあります。](../deploy/images/pythonanywhere_beginner_account_button.png)

> **注意** ユーザー名をつけるとき、ユーザー名が `yourusername.pythonanywhere.com` というようにブログのURLに反映されることに注意しましょう。なので、あなたのニックネームかブログの名前をユーザー名とするようにしてください。 パスワードは忘れないようにしてください。(パスワードマネージャーを使っているなら覚えさせておくのも良いでしょう。)

## PythonAnywhere APIトークンの作成

トークンは一度だけ作ればよいです。PythonAnywhereの登録が終わるとダッシュボード画面に移動します。「Account」ページへのリンクはページ右上のバーの中にあります。

![ページ右上にあるAccountページへのリンク](../deploy/images/pythonanywhere_account.png)

「Account」ページに移動したら、「API Token」というタブを選んで、「Create new API token」のボタンを押してください。

![Accountページの「API Token」のタブ](../deploy/images/pythonanywhere_create_api_token.png)