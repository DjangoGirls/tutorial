# CSS - deixa as coisas bonitas!

O nosso blog ainda parece muito feio, certo? Está na hora de o deixar melhor! Para isso, nós usaremos o CSS.

## O que é CSS?

Cascading Style Sheets (CSS - Folhas de Estilo em Cascata, em português) é uma linguagem utilizada para descrever o visual e a formatação de um website escrito numa linguagem de marcação (como HTML). Vê-la como uma maquilhagem para a nossa página web. :)

Mas nós não queremos começar novamente do zero, certo? Mais uma vez, vamos usar algo que outros programadores lançaram na Internet de gratuitamente. Tu sabes, que reinventar a roda não é divertido.

## Vamos usar o Bootstrap!

Bootstrap é um dos frameworks HTML e CSS mais populares para desenvolver bonitos websites: https://getbootstrap.com/

Foi escrito por programadores que trabalharam no Twitter. Agora é desenvolvido por voluntários espalhados por todo o mundo!

## Instalar o Bootstrap

Para instalares o Bootstrap, precisas de adicionar isto `<head>` no teu arquivo `.html`:

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap-theme.min.css">
```

Isso não adiciona nenhum arquivo ao teu projeto. Isso apenas aponta para arquivos que existem na Internet. Vai em frente, abre o teu website e atualiza a página. Aqui está!

![Figura 14.1](images/bootstrap1.png)

Já está mais bonita!

## Ficheiros estáticos em Django

Vamos finalmente ver em pormenor o que temos chamado **ficheiros estáticos**. Os arquivos estáticos são todos os teus CSS e imagens. O seu conteúdo não depende do contexto de requisição e será o mesmo para qualquer utilizador.

### Onde colocar os ficheiros estáticos no Django

Django, já sabe onde encontrar os arquivos estáticos para o app pré-instalado "admin". Agora só precisamos adicionar alguns arquivos estáticos para a nossa própria app, `blog`.

Fazemos isso criando uma pasta chamada `static` dentro da aplicação blog:

    djangogirls
    ├── blog
    │   ├── migrations
    │   ├── static
    │   └── templates
    └── mysite
    

O Django vai encontrar automaticamente quaisquer pastas chamadas "static" dentro de quaisquer pastas das tuas apps. Então ele será capaz de usar o seu conteúdo como arquivos estáticos.

## O teu primeiro ficheiro CSS!

Vamos criar agora um arquivo CSS, para adicionar o teu próprio estilo à tua página web. Cria um novo directório chamado `css` dentro da tua pasta `static`. Depois cria um novo ficheiro chamado `blog.css` dentro da pasta `css`. Pronta?

    djangogirls
    └─── blog
         └─── static
              └─── css
                   └─── blog.css
    

Está na altura de escrever CSS! Abre o ficheiro `blog/static/css/blog.css` no teu editor de código.

Não vamos aprofundar muito a personalização e aprendizagem sobre CSS aqui. Existe no final desta página uma recomendação para um curso gratuito de CSS, caso pretendas aprender mais.

Mas vamos fazer pelo menos um pouco disto. Talvez mudar a cor do cabeçalho? Para perceber cores, os computadores usam códigos especiais. Esses códigos começam com `#` e são seguidos de 6 letras (A-F) e números (0-9). Por exemplo, o código para a cor azul é `#0000FF`. Podes encontrar os códigos de diversas cores aqui: http://www.colorpicker.com/. Também podes usar [cores pré-definidas](http://www.w3schools.com/colors/colors_names.asp), como `red` (vermelho), e `green` (verde.

Adiciona o seguinte código ao ficheiro `blog/static/css/blog.css`:

{% filename %}blog/static/css/blog.css{% endfilename %}

```css
h1 a {
    color: #FCA205;
}
```

`h1 a` é um selector de CSS. Isto significa que estamos a aplicar os nossos estilos para qualquer elemento `a` dentro de um elemento `h1`. Então quando tivermos algo como um `<h1><a href="">link</a></h1>`, o estilo `h1 a` será aplicado. Neste caso, nós estamos a dizer para mudar a cor para `#FCA205`, que é laranja. Mas é claro que tu podes colocar a cor que tu quiseres aqui!

Num arquivo CSS nós determinamos estilos para os elementos do arquivo HTML. A primeira forma de identificar elementos é pelo o nome do elemento. Podes te lembrar destes como etiquetas da seção HTML. Coisas como `a` `h1` e `body` são exemplos de nomes de elementos. We also identify elements by the attribute `class` or the attribute `id`. Class and id are names you give the element by yourself. Classes define groups of elements, and ids point to specific elements. For example, you could identify the following tag by using the tag name `a`, the class `external_link`, or the id `link_to_wiki_page`:

```html
<a href="https://en.wikipedia.org/wiki/Django" class="external_link" id="link_to_wiki_page">
```

You can read more about [CSS Selectors at w3schools](http://www.w3schools.com/cssref/css_selectors.asp).

We also need to tell our HTML template that we added some CSS. Open the `blog/templates/blog/post_list.html` file and add this line at the very beginning of it:

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
{% load staticfiles %}
```

We're just loading static files here. :) Between the `<head>` and `</head>` tags, after the links to the Bootstrap CSS files, add this line:

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
<link rel="stylesheet" href="{% static 'css/blog.css' %}">
```

The browser reads the files in the order they're given, so we need to make sure this is in the right place. Otherwise the code in our file may be overriden by code in Bootstrap files. We just told our template where our CSS file is located.

Your file should now look like this:

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
{% load staticfiles %}
<html>
    <head>
        <title>Django Girls blog</title>
        <link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
        <link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap-theme.min.css">
        <link rel="stylesheet" href="{% static 'css/blog.css' %}">
    </head>
    <body>
        <div>
            <h1><a href="/">Django Girls Blog</a></h1>
        </div>

        {% for post in posts %}
            <div>
                <p>published: {{ post.published_date }}</p>
                <h1><a href="">{{ post.title }}</a></h1>
                <p>{{ post.text|linebreaksbr }}</p>
            </div>
        {% endfor %}
    </body>
</html>
```

OK, save the file and refresh the site!

![Figura 14.2](images/color2.png)

Nice work! Maybe we would also like to give our website a little air and increase the margin on the left side? Let's try this!

{% filename %}blog/static/css/blog.css{% endfilename %}

```css
body {
    padding-left: 15px;
}
```

Add that to your CSS, save the file and see how it works!

![Figura 14.3](images/margin2.png)

Maybe we can customize the font in our header? Paste this into your `<head>` in `blog/templates/blog/post_list.html` file:

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
<link href="//fonts.googleapis.com/css?family=Lobster&subset=latin,latin-ext" rel="stylesheet" type="text/css">
```

As before, check the order and place before the link to `blog/static/css/blog.css`. This line will import a font called *Lobster* from Google Fonts (https://www.google.com/fonts).

Find the `h1 a` declaration block (the code between braces `{` and `}`) in the CSS file `blog/static/css/blog.css`. Now add the line `font-family: 'Lobster';` between the braces, and refresh the page:

{% filename %}blog/static/css/blog.css{% endfilename %}

```css
h1 a {
    color: #FCA205;
    font-family: 'Lobster';
}
```

![Figura 14.3](images/font.png)

Great!

As mentioned above, CSS has a concept of classes. These allow you to name a part of the HTML code and apply styles only to this part, without affecting other parts. This can be super helpful! Maybe you have two divs that are doing something different (like your header and your post). A class can help you make them look different.

Go ahead and name some parts of the HTML code. Add a class called `page-header` to your `div` that contains your header, like this:

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
<div class="page-header">
    <h1><a href="/">Django Girls Blog</a></h1>
</div>
```

And now add a class `post` to your `div` containing a blog post.

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
<div class="post">
    <p>published: {{ post.published_date }}</p>
    <h1><a href="">{{ post.title }}</a></h1>
    <p>{{ post.text|linebreaksbr }}</p>
</div>
```

We will now add declaration blocks to different selectors. Selectors starting with `.` relate to classes. There are many great tutorials and explanations about CSS on the Web that can help you understand the following code. For now, just copy and paste it into your `blog/static/css/blog.css` file:

{% filename %}blog/static/css/blog.css{% endfilename %}

```css
.page-header {
    background-color: #ff9400;
    margin-top: 0;
    padding: 20px 20px 20px 40px;
}

.page-header h1, .page-header h1 a, .page-header h1 a:visited, .page-header h1 a:active {
    color: #ffffff;
    font-size: 36pt;
    text-decoration: none;
}

.content {
    margin-left: 40px;
}

h1, h2, h3, h4 {
    font-family: 'Lobster', cursive;
}

.date {
    color: #828282;
}

.save {
    float: right;
}

.post-form textarea, .post-form input {
    width: 100%;
}

.top-menu, .top-menu:hover, .top-menu:visited {
    color: #ffffff;
    float: right;
    font-size: 26pt;
    margin-right: 20px;
}

.post {
    margin-bottom: 70px;
}

.post h1 a, .post h1 a:visited {
    color: #000000;
}
```

Then surround the HTML code which displays the posts with declarations of classes. Replace this:

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
{% for post in posts %}
    <div class="post">
        <p>published: {{ post.published_date }}</p>
        <h1><a href="">{{ post.title }}</a></h1>
        <p>{{ post.text|linebreaksbr }}</p>
    </div>
{% endfor %}
```

in the `blog/templates/blog/post_list.html` with this:

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
<div class="content container">
    <div class="row">
        <div class="col-md-8">
            {% for post in posts %}
                <div class="post">
                    <div class="date">
                        <p>published: {{ post.published_date }}</p>
                    </div>
                    <h1><a href="">{{ post.title }}</a></h1>
                    <p>{{ post.text|linebreaksbr }}</p>
                </div>
            {% endfor %}
        </div>
    </div>
</div>
```

Save those files and refresh your website.

![Figura 14.4](images/final.png)

Woohoo! Looks awesome, right? Look at the code we just pasted to find the places where we added classes in the HTML and used them in the CSS. Where would you make the change if you wanted the date to be turquoise?

Don't be afraid to tinker with this CSS a little bit and try to change some things. Playing with the CSS can help you understand what the different things are doing. If you break something, don't worry – you can always undo it!

We really recommend taking this free online [Codeacademy HTML & CSS course](https://www.codecademy.com/tracks/web). It can help you learn all about making your websites prettier with CSS.

Ready for the next chapter?! :)