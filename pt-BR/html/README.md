# Introdução ao HTML

Você pode se perguntar: e o que é um template?

A template is a file that we can re-use to present different information in a consistent format – for example, you could use a template to help you write a letter, because although each letter might contain a different message and be addressed to a different person, they will share the same format.

A Django template's format is described in a language called HTML (that's the HTML we mentioned in the first chapter, **How the Internet works**).

## O que é HTML?

HTML is a code that is interpreted by your web browser – such as Chrome, Firefox or Safari – to display a web page for the user.

HTML significa "HyperText Markup Language". **HiperText** significa que é um tipo de texto que suporta hiperlinks entre páginas. **Marcação** nada mais é que marcar um documento com códigos que dizem para alguém (nesse caso, o navegador web) como a página deverá ser interpretada. Código em HTML é feito com **tags**, cada uma começando com `<` e terminando com `>`. Estas tags representam **elementos de marcação**.

## Seu primeiro template!

Criar um template significa criar um arquivo de template. Tudo é um arquivo, certo? Provavelmente você já deve ter notado isso.

Os templates são salvos no diretório `blog/templates`. Logo, crie um diretório chamado `templates` dentro do diretório do seu blog. Em seguida, crie outro diretório chamado `blog` dentro da diretório templates:

    blog
    └───templates
        └───blog
    

(You might wonder why we need two directories both called `blog` – as you will discover later, this is simply a useful naming convention that makes life easier when things start to get more complicated.)

E agora nós criamos o arquivo `post_list.html` (deixe-o em branco por agora) dentro do diretório `blog/templates/blog`.

Veja como o nosso site está se parecendo agora: http://127.0.0.1:8000/

> Se você ainda tem um erro `TemplateDoesNotExist`, tente reiniciar o seu servidor. Go into command line, stop the server by pressing Ctrl+C (Control and C keys together) and start it again by running a `python manage.py runserver` command.

![Figura 11.1](images/step1.png)

Acabaram-se os erros! Parabéns :) Entretanto, nosso site não mostra nada a não ser uma página em branco. Isso porque o nosso template está vazio. Então precisamos consertar isso.

Adicione a seguinte linha dentro do template:

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
<html>
    <p>Hi there!</p>
    <p>It works!</p>
</html>
```

So how does your website look now? Visit it to find out: http://127.0.0.1:8000/

![Figura 11.2](images/step3.png)

Funcionou! Bom trabalho :)

* The most basic tag, `<html>`, is always the beginning of any web page and `</html>` is always the end. Como você pode ver, todo o conteúdo de um website se encontra entre a tag de início `<html>` e entre a tag de fim `</html>`
* `<p>` é a tag que denomina parágrafos; `</p>` determina o fim de cada parágrafo

## Head and body

Cada página HTML também é dividida em dois elementos: **head** (cabeça) e **body** (corpo.

* **head** é um elemento que contém informações sobre o documento que não são mostradas na tela.

* **body** é um elemento que contém tudo o que é exibido como parte de uma página de um site.

Nós usamos a tag `<head>` para dizer ao navegador sobre as configurações da página. Por sua vez, a tag `<body>` diz ao navegador o que há de verdade na página.

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
* Os outros dois elementos `div` possuem nossas postagens com a data de publicação, `h2` com o título da postagem que é clicável e dois `p`s (parágrafos) de texto, um para a data e outro para o texto da postagem.

Isso nos dá o seguinte efeito:

![Figura 11.4](images/step6.png)

Yaaay! But so far, our template only ever displays exactly **the same information** – whereas earlier we were talking about templates as allowing us to display **different** information in the **same format**.

What we really want to do is display real posts added in our Django admin – and that's where we're going next.

## Mais uma coisa: implantação (deploy)!

Seria bom ver tudo isto na Internet, certo? Vamos fazer outro deploy no PythonAnywhere:

### Commit, e dê push para subir seu código no GitHub

Primeiro de tudo, vamos ver que arquivos foram modificados desde que nós fizemos a última implantação (execute esses comandos localmente, não no PythonAnywhere):

{% filename %}command-line{% endfilename %}

    $ git status
    

Verifique se você está no diretório `djangogirls` e vamos dizer ao `git` para incluir todas as mudanças dentro deste diretório:

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

{% filename %}command-line{% endfilename %}

    $ cd ~/my-first-blog
    $ git pull
    [...]
    

E veja seu código sendo baixado. Se você deseja verificar que ele já baixou, pode ir para a **aba Files** e ver seu código no PythonAnywhere.

* Finalmente, pule para a [aba Web](https://www.pythonanywhere.com/web_app_setup/) e aperte **Reload** em seu aplicativo web.

Sua atualização deve estar no ar! Vá em frente e atualize seu site no navegador. As alterações devem ser visíveis. :)