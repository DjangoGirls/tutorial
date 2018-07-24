# Introdução ao HTML

Você pode se perguntar: e o que é um template?

Template é um arquivo que nós podemos reutilizar para apresentar diferentes informações em um formato consistente – por exemplo, você pode usar um template para te ajudar a escrever uma carta, pois mesmo que cada carta contenha mensagens diferentes e ser endereçada a pessoas diferentes, elas estarão compartilhando o mesmo formato.

O formato do template do Django é descrito em uma linguagem chamada HTML (esse é o mesm HTML que mencionamos no primeiro capítulo **Como a Internet funciona**).

## O que é HTML?

HTML é um código interpretado pelo seu navegador - como Chrome, Firefox ou Safari - para exibir uma página web ao usuário.

HTML significa "HyperText Markup Language". **HiperText** significa que é um tipo de texto que suporta hiperlinks entre páginas. **Marcação** nada mais é que marcar um documento com códigos que dizem para alguém (nesse caso, o navegador web) como a página deverá ser interpretada. Código em HTML é feito com **tags**, cada uma começando com `<` e terminando com `>`. Estas tags representam **elementos de marcação**.

## Seu primeiro template!

Criar um template significa criar um arquivo de template. Tudo é um arquivo, certo? Provavelmente você já deve ter notado isso.

Os templates são salvos no diretório `blog/templates`. Assim, crie um diretório chamado `templates` dentro do diretório do seu blog. Em seguida, crie outro diretório chamado `blog` dentro da diretório templates:

    blog
    └───templates
        └───blog
    

(Você deve estar se perguntando porque nós precisamos de dois diretórios chamados `blog` - como você descobrirá mais para frente, essa é uma convenção que facilita a nossa vida quando as coisas começarem a ficar mais complicadas.)

E agora nós criamos o arquivo `post_list.html` (deixe-o em branco por enquanto) dentro do diretório `blog/templates/blog`.

Veja como o nosso site está se parecendo agora: http://127.0.0.1:8000/

> Se você ainda tem um erro `TemplateDoesNotExist`, tente reiniciar o seu servidor. Entre na linha de comando, interrompa o servidor pressionando Ctrl+C (Control seguido da tecla C, juntas) e reinicie-o rodando `python manage.py runserver`.

![Figura 11.1](images/step1.png)

Acabaram-se os erros! Parabéns :) Entretanto, nosso site não mostra nada a não ser uma página em branco. Isso porque o nosso template está vazio. Então precisamos consertar isso.

Adicione a seguinte linha dentro do template:

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
<html>
<body>
    <p>Hi there!</p>
    <p>It works!</p>
</body>
</html>
```

Como nosso site se parece agora? Visite a página descobrir: http://127.0.0.1:8000/

![Figura 11.2](images/step3.png)

Funcionou! Bom trabalho :)

* A tag mais básica, `<html>`, estará sempre no começo de qualquer página da web, assim como, `</html>` sempre estará no fim. Como você pode ver, todo o conteúdo de um website se encontra entre a tag de início `<html>` e entre a tag de fim `</html>`
* `<p>` é a tag que denomina parágrafos; `</p>` determina o fim de cada parágrafo

## "Head" e "body"

Cada página HTML também é dividida em dois elementos: **head** (cabeça) e **body** (corpo.

* **head** é um elemento que contém informações sobre o documento que não são mostradas na tela.

* **body** é um elemento que contém tudo o que é exibido como parte de uma página de um site.

Nós usamos a tag `<head>` para dizer ao navegador sobre as configurações da página. Por sua vez, a tag `<body>` diz ao navegador qual é o conteúdo de fato da página.

For example, you can put a web page title element inside the `<head>`, like this:

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
<html>
    <head>
        <title>Ola's blog</title>
    </head>
    <body>
        <p>Hi there!</p>
        <p>It works!</p>
    </body>
</html>
```

Salve o arquivo e atualize sua página.

![Figura 11.3](images/step4.png)

Viu como o navegador entendeu que "Ola's blog" é o título da página? Ele interpretou `<title>Ola's blog</title>` e colocou o texto na barra de título do seu navegador (e também será usado para os favoritos e outras coisas mais).

Provavelmente você já deve ter notado que cada tag de abertura casa com uma *tag de fechamento*, com uma `/`, e que os elementos estão *aninhados* (ex.: você não pode fechar um tag em particular antes que todas as outras tags que estiverem dentro dela já estejam fechadas).

É como colocar coisas dentro de caixas. Você tem uma grande caixa, `<html></html>`; dentro dela há `<body></body>`, sendo que esta ainda contém caixas menors: `<p></p>`.

You need to follow these rules of *closing* tags, and of *nesting* elements – if you don't, the browser may not be able to interpret them properly and your page will display incorrectly.

## Customize seu template

Agora você pode se divertir um pouco tentando customizar o seu template! Aqui estão algumas tags úteis para isso:

* `<h1>A heading</h1>` for your most important heading
* `<h2>Um sub-título</h2>` para um título um nível abaixo
* `<h3>A sub-sub-heading</h3>` …and so on, up to `<h6>`
* `<p>A paragraph of text</p>`
* `<em>texto</em>` enfatiza seu texto
* `<strong>text</strong>` enfatiza fortemente seu texto
* `<br>` goes to another line (you can't put anything inside br and there's no closing tag)
* `<a href="https://djangogirls.org">link</a>` cria um link
* `<ul><li>primeiro item</li><li>segundo item</li></ul>` cria uma lista, exatamente como essa!
* `<div></div>` define uma seção da página

Here's an example of a full template, copy and paste it into `blog/templates/blog/post_list.html`:

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
<html>
    <head>
        <title>Django Girls blog</title>
    </head>
    <body>
        <div>
            <h1><a href="/">Django Girls Blog</a></h1>
        </div>

        <div>
            <p>published: 14.06.2014, 12:14</p>
            <h2><a href="">My first post</a></h2>
            <p>Aenean eu leo quam. Pellentesque ornare sem lacinia quam venenatis vestibulum. Donec id elit non mi porta gravida at eget metus. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus.</p>
        </div>

        <div>
            <p>published: 14.06.2014, 12:14</p>
            <h2><a href="">My second post</a></h2>
            <p>Aenean eu leo quam. Pellentesque ornare sem lacinia quam venenatis vestibulum. Donec id elit non mi porta gravida at eget metus. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut f.</p>
        </div>
    </body>
</html>
```

Nós criamos três seções `div` aqui.

* The first `div` element contains the title of our blog – it's a heading and a link
* Another two `div` elements contain our blog posts with a published date, `h2` with a post title that is clickable and two `p`s (paragraph) of text, one for the date and one for our blog post.

Isso nos dá o seguinte efeito:

![Figura 11.4](images/step6.png)

Yaaay! But so far, our template only ever displays exactly **the same information** – whereas earlier we were talking about templates as allowing us to display **different** information in the **same format**.

What we really want to do is display real posts added in our Django admin – and that's where we're going next.

## Mais uma coisa: implantação (deploy)!

Seria bom ver tudo isto na Internet, certo? Vamos fazer outro deploy no PythonAnywhere:

### Commit, and push your code up to GitHub

Primeiro de tudo, vamos ver que arquivos foram modificados desde que nós fizemos a última implantação (execute esses comandos localmente, não no PythonAnywhere):

{% filename %}command-line{% endfilename %}

    $ git status
    

Make sure you're in the `djangogirls` directory and let's tell `git` to include all the changes in this directory:

{% filename %}command-line{% endfilename %}

    $ git add --all .
    

> **Nota** `..--all` significa que `git` também irá reconhecer se você tiver excluído arquivos (por padrão, ele só reconhece arquivos novos/modificados). Lembre-se também (do capítulo 3) que `.` significa o diretório atual.

Antes de nós fazermos o upload de todos os arquivos, chequemos o que o `git` enviará (todos os arquivos que o `git` enviará deverão agora aparecer em verde):

{% filename %}command-line{% endfilename %}

    $ git status
    

Estamos quase lá! Agora é hora de dizer a ele para salvar essa modificação em seu histórico. Nós daremos a ele uma "mensagem de commit" onde nós descrevemos as modificações que fizemos. Você pode escrever o que você quiser agora, mas será mais útil se você escrever algo descritivo, então você poderá se lembrar das coisas que fez no futuro.

{% filename %}command-line{% endfilename %}

    $ git commit -m "Changed the HTML for the site."
    

> **Note** Certifique-se que você usou aspas duplas para delimitar a mensagem do commit.

Once we've done that, we upload (push) our changes up to GitHub:

{% filename %}command-line{% endfilename %}

    $ git push
    

### Baixe seu novo código no PythonAnywhere e recarregue o seu aplicativo da web

* Abra a [página de consoles do PythonAnywhere](https://www.pythonanywhere.com/consoles/) e vá para o seu **console Bash** (ou inicie um novo). Em seguida, execute:

{% filename %}PythonAnywhere command-line{% endfilename %}

    $ cd ~/<your-pythonanywhere-username>.pythonanywhere.com
    $ git pull
    [...]
    

(Remember to substitute `<your-pythonanywhere-username>` with your actual PythonAnywhere username, without the angle-brackets).

And watch your code get downloaded. If you want to check that it's arrived, you can hop over to the **Files tab** and view your code on PythonAnywhere.

* Finalmente, pule para a [aba Web](https://www.pythonanywhere.com/web_app_setup/) e aperte **Reload** em seu aplicativo web.

Your update should be live! Go ahead and refresh your website in the browser. Changes should be visible. :)