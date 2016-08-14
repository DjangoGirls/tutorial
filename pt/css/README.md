# CSS - Deixe mais bonito!

Nosso blog ainda parece feio, certo? Está na hora de deixar ele melhor! Para isso nós usaremos o CSS.

## O que é CSS?

Do inglês "Cascading Style Sheets", CSS é uma linguagem usada para descrever o aspecto e a formatação de um website escrito numa linguagem de marcação (como HTML). Imagine ele como sendo um tipo de "maquiagem" para nosso site ;).

Mas nós não queremos iniciar do zero de novo, certo? Nós tentaremos, mais uma vez, usar algo que foi feito e disponibilizado de graça por programadores na internet. Você sabe, reinventar a roda não é nada divertido.

## Vamos usar o Bootstrap!

Bootstrap é um dos mais famosos e populares frameworks de HTML e CSS para desenvolver sites bonitos: https://getbootstrap.com/

Foi escrito por programadores que trabalharam no Twitter e agora é desenvolvido por voluntários de todo o mundo.

## Instalar Bootstrap

Para instalar o Bootstrap, você precisa adicionar ao seu cabeçalho (na tag `<head>` dentro do seu arquivo `.html`)(`blog/templates/blog/post_list.html`):

```html
<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap-theme.min.css">
```
    

Isso não adiciona nenhum arquivo ao seu projeto. O código apenas aponta para arquivos que existem na internet. Apenas siga em frente, abra seu site e atualize a página. Aqui ele está!

![Figura 14.1][1]

 [1]: images/bootstrap1.png

Já parecendo melhor!

## Arquivos estáticos no Django

Finalmente nós teremos um olhar mais atento nessas coisas que chamamos **arquivos estáticos**. Arquivos estáticos são todas as suas imagens e arquivos CSS -- arquivos que não são dinâmicos, então seu conteúdo não depende do contexto da requisição e será o mesmo para todos os usuários.

### Onde colocar os arquivos estáticos para Django

Como você viu quando rodamos `collectstatic` no servidor, Django já sabe onde encontrar os arquivos estáticos para o built-in "admin" app. Agora só precisamos adicionar alguns arquivos estáticos para nosso próprio app, `blog`.

Fazemos isso através da criação de uma pasta chamada `static` dentro do aplicativo do blog:

    djangogirls
    ├── blog
    │   ├── migrations
    │   └── static
    └── mysite
    

Django encontrará automaticamente todas as pastas chamadas "static" dentro de qualquer uma das pastas dos seus apps, e será capaz de usar seu conteúdo como arquivos estáticos.

## Seu primeiro arquivo CSS!

Vamos criar um arquivo CSS agora, para adicionar seu próprio estilo para sua página da web. Crie um novo diretório chamado `css` dentro de seu diretório `static`. Em seguida, crie um novo arquivo chamado `blog.css` dentro do diretório `css`. Pronto?

    djangogirls
    └─── blog
         └─── static
              └─── css
                   └─── blog.css
    

Hora de escrever CSS! Abra o arquivo `static/css/blog.css` no seu editor de código.

Não vamos nos aprofundar muito em customizar e aprender sobre CSS aqui, porque é bem fácil e você pode aprender no seu próprio após este workshop. Recomendamos fortemente fazer este [Codeacademy HTML & CSS couse][2] para aprender tudo o que você precisa saber sobre como tornar seus sites mais bonitos com CSS.

 [2]: https://www.codecademy.com/tracks/web

Mas vamos fazer pelo menos um pouco. Talvez possamos mudar a cor do nosso cabeçalho? Para entender as cores, computadores usam códigos especiais. Eles começam com `#` e são seguidos por 6 letras (A-F) e números (0-9). Você pode encontrar exemplos de códigos de cores aqui: http://www.colorpicker.com/. Você pode também usar [cores predefinidas][3], como `red` e `green`.

 [3]: http://www.w3schools.com/cssref/css_colornames.asp

Em seu arquivo `static/css/blog.css` você deve adicionar o seguinte código:

```css
h1 a {
    color: #FCA205;
}
```
    

`h1 a` é um seletor de CSS. Isso significa que nós estamos aplicando nossos estilos para qualquer elemento `a` dentro de um elemento `h1`(i.e. quando tivermos no código algo como: `<h1><a href="">link</a></h1>`). Neste caso nós estamos dizendo para mudar a cor para `#FCA205`, que é laranja. Claro, você pode colocar a cor que você quiser aqui!

Em um arquivo CSS podemos determinar estilos para elementos no arquivo HTML. Os elementos são identificados pelo nome do elemento (ou seja, `a`, `h1`, `body`), o atributo de `class` ou o atributo `id`. Classe e id são nomes que você mesmo dá ao elemento. Classes definem grupos de elementos, e ids apontam para elementos específicos. Por exemplo, a seguinte tag pode ser identificada por CSS usando a tag de nome `a`, a classe `link_externo` ou a identificação de `link_para_a_pagina_wiki`:

```html
<a href="https://en.wikipedia.org/wiki/Django" class="external_link" id="link_to_wiki_page">
```
    

Leia sobre [Seletores CSS em w3schools][4].

 [4]: http://www.w3schools.com/cssref/css_selectors.asp

Então, precisamos também contar o nosso template HTML que nós adicionamos CSS. Abra o arquivo `blog/templates/blog/post_list.html` e adicione essa linha no início do mesmo:

```html
{% load staticfiles %}
```
    

Estamos apenas carregando arquivos estáticos aqui :). Depois, entre o `<head>` `e/</head>`, depois dos links para os arquivos de CSS do Bootstrap (o navegador lê os arquivos na ordem que eles são dados, então o código em nosso arquivo pode substituir o código em arquivos de inicialização), adicione esta linha:

```html
<link rel="stylesheet" href="{% static 'css/blog.css' %}">
```
    

Só dissemos que nosso modelo onde se encontra nosso arquivo CSS.

Agora, seu arquivo deve ficar assim:

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
    

OK, salve o arquivo e atualize o site!

![Figura 14.2][5]

 [5]: images/color2.png

Bom trabalho! Talvez a gente também queira dar um pouco de ar ao nosso site e aumentar a margem do lado esquerdo? Vamos tentar!

```css
body {
    padding-left: 15px;
}
```
    

Adicione isto ao seu arquivo CSS, salve e veja como ele funciona!

![Figura 14.3][6]

 [6]: images/margin2.png

Talvez a gente possa customizar a fonte no nosso cabeçalho? Cole na seção `<head>` do arquivo `blog/templates/blog/post_list.html` o seguinte:

```html
<link href="https://fonts.googleapis.com/css?family=Lobster&subset=latin,latin-ext" rel="stylesheet" type="text/css">
```
    

Essa linha irá importar uma fonte chamada *Lobster* do Google Fonts (https://www.google.com/fonts).

Agora adicione a linha `font-family: 'Lobster';` no CSS do arquivo `static/css/blog.css` dentro do bloco de declaração `h1 a` (o código entre as chaves `{` e `}`) e atualize a página:

```css
h1 a {
    color: #FCA205;
    font-family: 'Lobster';
}
```
    

![Figura 14.3][7]

 [7]: images/font.png

Incrível!

Como mencionado acima, CSS usa o conceito de classes, que basicamente permite que você nomeie parte do código HTML e aplique estilos apenas à esta parte, sem afetar as outras. É super útil se você tiver duas divs, mas eles estão fazendo algo muito diferente (como o seu cabeçalho e seu post), então você não quer que eles fiquem parecidos.

Vá em frente e o nomeie algumas partes do código HTML. Adicione uma classe chamada de `page-header` para o `div` que contém o cabeçalho, assim:

```html
<div class="page-header">
    <h1><a href="/">Django Girls Blog</a></h1>
</div>
```
    

E agora, adicione uma classe `post` em sua `div` que contém um post de blog.

```html
<div class="post">
    <p>published: {{ post.published_date }}</p>
    <h1><a href="">{{ post.title }}</a></h1>
    <p>{{ post.text|linebreaksbr }}</p>
</div>
```
    

Agora adicionaremos blocos de declaração de seletores diferentes. Seletores começando com `.` se referem às classes. Existem muitos tutoriais e explicações sobre CSS na Web para ajudar você a entender o código a seguir. Por enquanto, basta copiar e colá-lo em seu arquivo `mysite/static/css/blog.css`:

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
    float: right;
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
    

Então envolva o código HTML que exibe as mensagens com declarações de classes. Substitua isto:

```html
{% for post in posts %}
    <div class="post">
        <p>published: {{ post.published_date }}</p>
        <h1><a href="">{{ post.title }}</a></h1>
        <p>{{ post.text|linebreaksbr }}</p>
    </div>
{% endfor %}
```
    

no arquivo `blog/templates/blog/post_list.html` por isto:

```html
<div class="content container">
    <div class="row">
        <div class="col-md-8">
            {% for post in posts %}
                <div class="post">
                    <div class="date">
                        {{ post.published_date }}
                    </div>
                    <h1><a href="">{{ post.title }}</a></h1>
                    <p>{{ post.text|linebreaksbr }}</p>
                </div>
            {% endfor %}
        </div>
    </div>
</div>
```
    

Salve esses arquivos e atualize seu site.

![Figura 14.4][8]

 [8]: images/final.png

Uhuu! Ficou incrível, né? O código que nós acabamos de colar não é tão difícil de entender e você deve ser capaz de entender a maior parte apenas lendo.

Não tenha medo de mexer um pouco com esse CSS e tentar mudar algumas coisas. Se você quebrar alguma coisa, não se preocupe, você sempre pode desfazê-lo!

De qualquer forma, recomendamos que faça esse curso on-line [Codeacademy HTML & CSS Course][2] como dever de casa pós-workshop para aprender tudo o que você precisa saber sobre como tornar seus sites mais bonitos com CSS.

Pronto para o próximo capítulo?! :)
