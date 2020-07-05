# CSS - deixa as coisas bonitas!

O nosso blog ainda parece muito feio, certo? Está na hora de o deixar melhor! Para isso, nós usaremos o CSS.

## O que é CSS?

Cascading Style Sheets (CSS - Folhas de Estilo em Cascata, em português) é uma linguagem utilizada para descrever o visual e a formatação de um website escrito numa linguagem de marcação (como HTML). Vê-la como uma maquilhagem para a nossa página web. :)

Mas nós não queremos começar novamente do zero, certo? Mais uma vez, vamos usar algo que outros programadores lançaram na Internet de gratuitamente. Tu sabes, que reinventar a roda não é divertido.

## Vamos usar o Bootstrap!

Bootstrap é um dos frameworks HTML e CSS mais populares para desenvolver bonitos websites: https://getbootstrap.com/

Foi escrito por programadores que trabalharam no Twitter. Agora é desenvolvido por voluntários espalhados por todo o mundo!

## Instalar o Bootstrap

To install Bootstrap, open up your `.html` file in the code editor and add this to the `<head>` section:

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap-theme.min.css">
```

This doesn't add any files to your project. It just points to files that exist on the Internet. So go ahead, open your website and refresh the page. Here it is!

![Figura 14.1](images/bootstrap1.png)

Já está mais bonita!

## Ficheiros estáticos em Django

Vamos finalmente ver em pormenor o que temos chamado **ficheiros estáticos**. Os arquivos estáticos são todos os teus CSS e imagens. O seu conteúdo não depende do contexto de requisição e será o mesmo para qualquer utilizador.

### Onde colocar os ficheiros estáticos no Django

Django already knows where to find the static files for the built-in "admin" app. Now we need to add some static files for our own app, `blog`.

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

Mas vamos fazer pelo menos um pouco disto. Maybe we could change the color of our headers? Para perceber cores, os computadores usam códigos especiais. Esses códigos começam com `#` e são seguidos de 6 letras (A-F) e números (0-9). Por exemplo, o código para a cor azul é `#0000FF`. Podes encontrar os códigos de diversas cores aqui: http://www.colorpicker.com/. Também podes usar [cores pré-definidas](http://www.w3schools.com/colors/colors_names.asp), como `red` (vermelho), e `green` (verde.

Adiciona o seguinte código ao ficheiro `blog/static/css/blog.css`:

{% filename %}blog/static/css/blog.css{% endfilename %}

```css
h1 a, h2 a {
    color: #FF8833;
}

```

`h1 a` é um selector de CSS. This means we're applying our styles to any `a` element inside of an `h1` element; the `h2 a` selector does the same thing for `h2` elements. Então quando tivermos algo como um `<h1><a href="">link</a></h1>`, o estilo `h1 a` será aplicado. In this case, we're telling it to change its color to `#C25100`, which is a dark orange. Or you can put your own color here, but make sure it has good contrast against a white background!

Num arquivo CSS nós determinamos estilos para os elementos do arquivo HTML. A primeira forma de identificar elementos é pelo o nome do elemento. Podes te lembrar destes como etiquetas da seção HTML. Coisas como `a` `h1` e `body` são exemplos de nomes de elementos. Nós também identificamos elementos pelo atributo `class` ou o atributo `id`. Class e id são nomes que tu mesmo dás ao elemento. As classes definem grupos de elementos, e ids apontam para os elementos específicos. Por exemplo, a tag a seguir pode ser identificada usando a tag de nome `a`, a classe `external_link` ou o id de `link_to_wiki_page`:

```html
<a href="https://en.wikipedia.org/wiki/Django" class="external_link" id="link_to_wiki_page">
```

Podes ler mais sobre [Seletores CSS no w3schools](http://www.w3schools.com/cssref/css_selectors.asp).

We also need to tell our HTML template that we added some CSS. Open the `blog/templates/blog/post_list.html` file in the code editor and add this line at the very beginning of it:

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
{% load static %}
```

Estamos apenas a carregar os arquivos estáticos aqui. :) Entre as tags `<head>` e `</head>`, depois dos links para os arquivos CSS do Bootstrap, adiciona esta linha:

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
<link rel="stylesheet" href="{% static 'css/blog.css' %}">
```

O navegador lê os arquivos na ordem em que são dados, então precisamos de ter a certeza de que isso está no sitio certo. Caso contrário, o código no nosso arquivo pode ser sobrescrito pelo código dos arquivos do Bootstrap. Acabamos de dizer ao nosso template onde se encontra o nosso arquivo CSS.

O teu arquivo deverá ficar parecido como isto:

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
{% load static %}
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
                <h2><a href="">{{ post.title }}</a></h2>
                <p>{{ post.text|linebreaksbr }}</p>
            </div>
        {% endfor %}
    </body>
</html>
```

OK, guarda o arquivo e atualiza o site!

![Figura 14.2](images/color2.png)

Bom trabalho! Talvez nós também queiramos dar um pouco de ar ao nosso site e aumentar a margem do lado esquerdo? Vamos tentar!

{% filename %}blog/static/css/blog.css{% endfilename %}

```css
body {
    padding-left: 15px;
}
```

Adiciona isto ao teu CSS, guarda o arquivo e vê como ele funciona!

![Figura 14.3](images/margin2.png)

Talvez nós possamos personalizar a fonte no nosso cabeçalho? Cola isto no teu `<head>` no `blog/templates/blog/post_list.html` arquivo:

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
<link href="//fonts.googleapis.com/css?family=Lobster&subset=latin,latin-ext" rel="stylesheet" type="text/css">
```

Assim como antes, verifica a ordem e coloca-a antes do link em `blog/static/css/blog.css`. Esta linha importará do Google Fonts (https://www.google.com/fonts) uma fonte chamada *Lobster*.

Encontra o bloco de declaração `h1 a` (o código entre chaves `{` e `}`) no arquivo CSS `blog/static/css/blog.css`. Agora adiciona a linha `font-family: 'Lobster';` entre as chaves e atualiza a página:

{% filename %}blog/static/css/blog.css{% endfilename %}

```css
h1 a, h2 a {
    color: #C25100;
    font-family: 'Lobster';
}
```

![Figura 14.3](images/font.png)

Excelente!

Como mencionado acima, o CSS tem um conceito de classes. Estas permitem que nomeies uma parte do código HTML e apliques estilos apenas para esta parte, sem afetar outras partes. Isto pode ser super útil! Talvez tenhas duas divs que estão a fazer algo diferente (como o teu cabeçalho e o teu post). Uma classe pode ajudar-te a fazê-los parecer diferentes.

Vái em frente e o nomeia algumas partes do código HTML. Adiciona uma classe chamada `page-header` para o teu `div` que contém o cabeçalho, assim:

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
<div class="page-header">
    <h1><a href="/">Django Girls Blog</a></h1>
</div>
```

E agora, adiciona uma classe `post` na tua `div` que contém um post de blog.

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
<div class="post">
    <p>published: {{ post.published_date }}</p>
    <h2><a href="">{{ post.title }}</a></h2>
    <p>{{ post.text|linebreaksbr }}</p>
</div>
```

Agora iremos adicionar blocos de declaração a seletores diferentes. Seletores começando com `.` referem-se às classes. Existem vários manuais de instruções e explicações excelentes sobre CSS na Web que podem te ajudar a entender melhor o seguinte código. For now, copy and paste it into your `blog/static/css/blog.css` file:

{% filename %}blog/static/css/blog.css{% endfilename %}

```css
.page-header {
    background-color: #C25100;
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

.post h2 a, .post h2 a:visited {
    color: #000000;
}
```

Então envolve o código HTML que exibe os posts com declarações de classes. Substitui isto:

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
{% for post in posts %}
    <div class="post">
        <p>published: {{ post.published_date }}</p>
        <h2><a href="">{{ post.title }}</a></h2>
        <p>{{ post.text|linebreaksbr }}</p>
    </div>
{% endfor %}
```

no `blog/templates/blog/post_list.html` por isto:

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
                    <h2><a href="">{{ post.title }}</a></h2>
                    <p>{{ post.text|linebreaksbr }}</p>
                </div>
            {% endfor %}
        </div>
    </div>
</div>
```

Guarda esses arquivos e atualiza o teu site.

![Figura 14.4](images/final.png)

Woohoo! Está incrível, certo? Olha para o código que acabamos de colar para encontrar os locais onde adicionamos as classes no HTML e as usamos no CSS. Onde é que farias a mudança se tu quisesses a data na cor turquesa?

Não tenhas medo de ajustar um pouco com este CSS e de tentar mudar algumas coisas. Brincar com o CSS pode ajudar-te a perceber quais as diferentes coisas se estão a fazer. Se partires alguma coisa, não te preocupes - tu podes sempre desfazê-lo!

We really recommend taking the free online courses "Basic HTML & HTML5" and "Basic CSS" on [freeCodeCamp](https://learn.freecodecamp.org/). They can help you learn all about making your websites prettier with HTML and CSS.

Pronto para o próximo capítulo?! :)