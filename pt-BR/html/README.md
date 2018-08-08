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

Acabaram-se os erros! Uhuu :) Entretanto, nosso site não mostra nada a não ser uma página em branco. Isso acontece porque o nosso template está vazio. Precisamos consertar isso.

Adicione a seguinte linha ao template:

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
<html>
<body>
    <p>Hi there!</p>
    <p>It works!</p>
</body>
</html>
```

Como está o nosso site agora? Visite a página descobrir: http://127.0.0.1:8000/

![Figura 11.2](images/step3.png)

Funcionou! Bom trabalho :)

* A tag mais básica, `<html>`, estará sempre no começo de qualquer página da web, assim como, `</html>` sempre estará no fim. Todo o conteúdo de um website se encontra entre a tag de início `<html>` e a tag de fim `</html>`
* `<p>` é a tag que inicia um parágrafos; `</p>` determina o fim de um parágrafo

## "Head" e "body"

Cada página HTML também é dividida em dois elementos: **head** (cabeçalho) e **body** (corpo).

* **head** é um elemento que contém informações sobre o documento que não são mostradas na tela.

* **body** é um elemento que contém tudo o que é exibido como parte de uma página da web.

Nós usamos a tag `<head>` para dizer ao navegador quais são as configurações da página. Por sua vez, a tag `<body>` diz ao navegador qual é o conteúdo de fato da página.

Por exemplo, você pode incluir o elemento título de uma página web dentro da tag `<head>`. Veja:

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

Aqui vai um exemplo de um template completo; copie e cole dentro de `blog/templates/blog/post_list.html`:

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
<html>
    <head>
        <title>Blog Django Girls</title>
    </head>
    <body>
        <div>
            <h1><a href="/">Blog Django Girls</a></h1>
        </div>

        <div>
            <p>publicado: 14.06.2014, 12:14</p>
            <h2><a href="">Meu primeiro post</a></h2>
            <p>Aenean eu leo quam. Pellentesque ornare sem lacinia quam venenatis vestibulum. Donec id elit non mi porta gravida at eget metus. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus.</p>
        </div>

        <div>
            <p>publicado: 14.06.2014, 12:14</p>
            <h2><a href="">Meu segundo post</a></h2>
            <p>Aenean eu leo quam. Pellentesque ornare sem lacinia quam venenatis vestibulum. Donec id elit non mi porta gravida at eget metus. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut f.</p>
        </div>
    </body>
</html>
```

Nós criamos três seções `div` aqui.

* O primeiro elemento `div` possui o título do nosso blog - é um título que contêm um link
* Os outros dois elementos `div` possuem nossas postagens com a data de publicação, `h2` com o título clicável da postagem e dois `p`s (parágrafos) de texto, um para a data e outro para o texto da postagem.

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
    

Make sure you're in the `djangogirls` directory and let's tell `git` to include all the changes in this directory:

{% filename %}command-line{% endfilename %}

    $ git add --all .
    

> **Nota** `..--all` significa que `git` também irá reconhecer se você tiver excluído arquivos (por padrão, ele só reconhece arquivos novos/modificados). Lembre-se também (do capítulo 3) que `.` significa o diretório atual.

Antes de fazermos o upload de todos os arquivos, vamos verificar quais arquivos o `git` enviará (todos os arquivos marcados para upload pelo `git` aparecerão em verde):

{% filename %}command-line{% endfilename %}

    $ git status
    

Estamos quase lá! Agora é hora de dizer ao git para salvar essa modificação em seu histórico. Daremos a ele uma "mensagem de commit" onde descrevemos as modificações que foram feitas. Você pode escrever o que você quiser agora, mas é mais útil se você escrever algo descritivo para que possa se lembrar das coisas que fez no futuro.

{% filename %}command-line{% endfilename %}

    $ git commit -m "Changed the HTML for the site."
    

> **Note** Certifique-se que você usou aspas duplas para delimitar a mensagem do commit.

Uma vez feito isso, faremos o upload (push) das nossas mudanças para o Github:

{% filename %}command-line{% endfilename %}

    $ git push
    

### Baixe seu novo código no PythonAnywhere e recarregue o seu aplicativo da web

* Abra a [página de consoles do PythonAnywhere](https://www.pythonanywhere.com/consoles/) e vá para o seu **console Bash** (ou inicie um novo). Em seguida, execute:

{% filename %}PythonAnywhere command-line{% endfilename %}

    $ cd ~/<your-pythonanywhere-username>.pythonanywhere.com
    $ git pull
    [...]
    

(Lembre-se de substituir o `<your-pythonanywhere-username>` com seu username do PythonAnywhere, sem os símbolos < e >).

E veja seu código sendo baixado. Se você quiser verificar que ele já baixou, pode ir para a **aba Files** e ver seu código no PythonAnywhere.

* Finalmente, pule para a aba [Web](https://www.pythonanywhere.com/web_app_setup/) e aperte **Reload** em seu aplicativo.

Sua atualização deve estar no ar! Vá em frente e atualize seu site no navegador. As alterações devem estar visíveis. :)