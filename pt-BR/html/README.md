# Introdução ao HTML

Você pode se perguntar: o que é um template?

Template é um arquivo que nós podemos reutilizar para apresentar diferentes informações em um formato consistente – por exemplo, você pode usar um template para te ajudar a escrever uma carta, pois mesmo que cada carta contenha mensagens diferentes e possa estar endereçada a pessoas diferentes, elas compartilharão o mesmo formato.

O formato do template do Django é descrito em uma linguagem chamada HTML (esse é o mesm HTML que mencionamos no primeiro capítulo -- **Como a Internet funciona**).

## O que é HTML?

HTML é um código interpretado pelo seu navegador - como Chrome, Firefox ou Safari - para exibir uma página web ao usuário.

HTML significa "HyperText Markup Language". **HiperText** significa que é um tipo de texto que suporta hiperlinks entre páginas. **Marcação** nada mais é que marcar um documento com códigos que dizem para alguém (nesse caso, o navegador web) como a página deverá ser interpretada. Códigos em HTML são feitos com **tags**, cada uma começando com `<` e terminando com `>`. Estas tags representam **elementos de marcação**.

## Seu primeiro template!

Criar um template significa criar um arquivo de template. Tudo é um arquivo, certo? Provavelmente você já deve ter notado isso.

Os templates são salvos no diretório `blog/templates`. Então, crie um diretório chamado `templates` dentro do diretório do seu blog. Em seguida, crie outro diretório chamado `blog` dentro do diretório templates:

    blog
    └───templates
        └───blog
    

(Você deve estar se perguntando porque nós precisamos de dois diretórios chamados `blog` - como você descobrirá mais para frente, essa é uma convenção que facilita a nossa vida quando as coisas começam a ficar mais complicadas.)

E agora nós criamos o arquivo `post_list.html` (deixe-o em branco por enquanto) dentro do diretório `blog/templates/blog`.

Veja como o nosso site está agora: http://127.0.0.1:8000/

> Se você ainda tem um erro `TemplateDoesNotExist`, tente reiniciar o seu servidor. Entre na linha de comando, interrompa o servidor pressionando Ctrl+C (Control seguido da tecla C, juntas) e reinicie-o rodando `python manage.py runserver`.

![Figura 11.1](images/step1.png)

No error anymore! Congratulations! :) However, your website isn't actually publishing anything except an empty page, because your template is empty too. We need to fix that.

Abra o novo arquivo no editor de código e adicione o seguinte:

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
<!DOCTYPE html>
<html>
<body>
    <p>Hi there!</p>
    <p>It works!</p>
</body>
</html>
```

Como está o nosso site agora? Visite a página descobrir: http://127.0.0.1:8000/

![Figura 11.2](images/step3.png)

It worked. Nice work there! :)

* The line `<!DOCTYPE html>` is not a HTML tag. It only declares the document type. Here, it informs the browser that document type is [HTML5](https://html.spec.whatwg.org/#the-doctype). This is always the beginning of any HTML5 file.
* The most basic tag, `<html>`, is always the beginning of html content and `</html>` is always the end. As you can see, the whole content of the website goes between the beginning tag `<html>` and closing tag `</html>`
* `<p>` is a tag for paragraph elements; `</p>` closes each paragraph

## "Head" e "body"

Cada página HTML também é dividida em dois elementos: **head** (cabeçalho) e **body** (corpo).

* **head** é um elemento que contém informações sobre o documento que não são mostradas na tela.

* **body** é um elemento que contém tudo o que é exibido como parte de uma página da web.

Nós usamos a tag `<head>` para dizer ao navegador quais são as configurações da página. Por sua vez, a tag `<body>` diz ao navegador qual é o conteúdo de fato da página.

Por exemplo, você pode incluir o elemento título de uma página web dentro da tag `<head>`. Veja:

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
<!DOCTYPE html>
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

Salve o arquivo e atualize a página.

![Figura 11.3](images/step4.png)

Viu como o navegador entendeu que "Ola's blog" é o título da página? Ele interpretou `<title>Ola's blog</title>` e colocou o texto na barra de título do seu navegador (o texto também será usado nos favoritos e outras coisas mais).

Provavelmente você já deve ter notado que cada tag de abertura casa com uma *tag de fechamento*, com uma `/`, e que os elementos estão *aninhados* (ex.: você não pode fechar uma tag específica antes que todas as outras tags dentro dela estejam fechadas).

É como colocar coisas dentro de caixas. Você tem uma grande caixa, `<html></html>`; dentro dela há `<body></body>`, e esta contém caixas ainda menores: `<p></p>`.

Você precisa seguir essas regras de *fechamento* de tags, e de *aninhamento* de elementos - se não fizer isso, o navegador provavelmente não interpretará seu código da maneira correta e sua página será exibida incorretamente.

## Personalize seu template

Agora você pode se divertir um pouco tentando personalizar o seu template! Aqui estão algumas tags úteis para isso:

* `<h1>Um título</h1>` para o título da seção principal exibido na página
* `<h2>Um sub-título</h2>` para um título um nível abaixo
* `<h3>Um sub-sub-título</h3>` ... e por aí vai, até `<h6>`
* `<p>Um parágrafo de texto</p>`
* `<em>texto</em>` enfatiza seu texto
* `<strong>text</strong>` enfatiza fortemente seu texto
* `<br>` quebra a linha (você não pode digitar nada dentro da tag br e ela não possui uma tag de fechamento correspondente)
* `<a href="https://djangogirls.org">link</a>` cria um link
* `<ul><li>primeiro item</li><li>segundo item</li></ul>` cria uma lista, exatamente como essa!
* `<div></div>` define uma seção da página
* `<nav></nav>` defines a set of navigation links
* `<article></article>` specifies independent, self-contained content
* `<section></section>` defines a section in a document
* `<header></header>` specifies a header for a document or section
* `<main></main>` specifies the main content of a document
* `<aside></aside>` defines some content aside from the content it is placed in (like a sidebar)
* `<footer></footer>` defines a footer for a document or section
* `<time></time>` defines a specific time (or datetime)

Aqui vai um exemplo de um template completo; copie e cole dentro de `blog/templates/blog/post_list.html`:

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
<!DOCTYPE html>
<html>
    <head>
        <title>Django Girls blog</title>
    </head>
    <body>
        <header>
            <h1><a href="/">Django Girls Blog</a></h1>
        </header>

        <article>
            <time>published: 14.06.2014, 12:14</time>
            <h2><a href="">My first post</a></h2>
            <p>Aenean eu leo quam. Pellentesque ornare sem lacinia quam venenatis vestibulum. Donec id elit non mi porta gravida at eget metus. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus.</p>
        </article>

        <article>
            <time>published: 14.06.2014, 12:14</time>
            <h2><a href="">My second post</a></h2>
            <p>Aenean eu leo quam. Pellentesque ornare sem lacinia quam venenatis vestibulum. Donec id elit non mi porta gravida at eget metus. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut f.</p>
        </article>
    </body>
</html>
```

We've created one `header` section and two `article` section here.

* The `header` element contains the title of our blog – it's a heading and a link
* Another two `article` elements contain our blog posts with a published date in `time` element, `h2` with a post title that is clickable and a `p` (paragraph) of text for our blog post.

Isso nos dá o seguinte efeito:

![Figura 11.4](images/step6.png)

Uhuu! Mas, até o momento, nosso template mostra **sempre a mesma informação** - sendo que, anteriormente, nós falávamos sobre templates como uma maneira para exibir informações **diferentes** em um **mesmo formato**.

O que nós realmente queremos fazer é exibir as postagens reais que foram adicionadas no Django admin - e isso é o que faremos em seguida.

## Mais uma coisa: implantação (deploy)!

Seria bom ver tudo isto na Internet, certo? Vamos fazer mais um deploy no PythonAnywhere:

### Commit, e dê push para subir seu código no GitHub

Antes de tudo, vamos ver que arquivos foram modificados desde que nós fizemos a última implantação (execute esses comandos localmente, não no PythonAnywhere):

{% filename %}command-line{% endfilename %}

    $ git status
    

Assegure-se de que você está no diretório `djangogirls` e vamos dizer ao `git` para incluir todas as mudanças feitas nele:

{% filename %}command-line{% endfilename %}

    $ git add .
    

Antes de fazermos o upload de todos os arquivos, vamos verificar quais deles o `git` enviará (todos os arquivos marcados para upload pelo `git` aparecerão em verde):

{% filename %}command-line{% endfilename %}

    $ git status
    

Estamos quase lá! Agora é hora de dizer ao git para salvar essa modificação em seu histórico. Daremos a ele uma "mensagem de commit" em que descrevemos as modificações que foram feitas. Você pode escrever o que quiser agora, mas é mais útil escrever algo descritivo que te ajude no futuro a lembrar das coisas que fez.

{% filename %}command-line{% endfilename %}

    $ git commit -m "Changed the HTML for the site."
    

> **Note** Make sure you use double quotes around the commit message.

Uma vez feito isso, faremos o upload (push) das nossas mudanças para o Github:

{% filename %}command-line{% endfilename %}

    $ git push
    

### Baixe seu novo código no PythonAnywhere e recarregue o seu aplicativo da web

* Abra a [página de consoles do PythonAnywhere](https://www.pythonanywhere.com/consoles/) e vá para o seu **console do Bash** (ou inicie um novo). Em seguida, execute:

{% filename %}PythonAnywhere command-line{% endfilename %}

    $ cd ~/<your-pythonanywhere-domain>.pythonanywhere.com
    $ git pull
    [...]
    

Você precisará substituir `<your-pythonanywhere-domain>` com o seu subdomínio PythonAnywhere, sem os colchetes angulares (< >). O nome do seu subdomínio normalmente é o mesmo nome de usuário do seu PythonAnywhere, mas em alguns casos este pode ser um pouco diferente (por exemplo, se o nome possuir letras maísculas). Sendo assim, caso o comando não funcione, utilize o comando `ls` (lista de arquivos) para encontrar o seu subdomínio/nome da pasta e então execute `cd` para acessá-lo.

Agora veja o seu código ser baixado. Se você quiser verificar se ele chegou, você pode pular para a **página "Arquivos"**e visualizar seu código no PythonAnywhere (você pode acessar outras páginas do PythonAnywhere a partir do botão de menu na página do console).

* Finalmente, pule para a aba ["Web" page](https://www.pythonanywhere.com/web_app_setup/) e aperte **Reload** em sua aplicação.

Sua atualização deve estar no ar! Vá em frente e atualize seu site no navegador. As alterações devem estar visíveis. :)