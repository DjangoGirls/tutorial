# Modelos do Django

Hora de exibir dados! O Django já vem com algumas **tags de template** que são úteis pra isso.

## O que são tags de template?

Sabe, em HTML não podemos incluir código Python porque os browsers só entendem HTML. Sabemos que o HTML é bem estático, enquanto o Python é muito mais dinâmico.

**Tags de template Django** nos permite transformar código que se parece Python em código HTML, para que você possa construir sites dinâmicos mais rápido e mais fácilmente. Uhuu!

## Modelo de lista de post de exibição

No capitulo anterior, nós fornecemos ao nosso template uma lista de postagens e a variável <o>posts</o>. Agora vamos exibir em nosso HTML.

Pra mostrar uma variável dentro de um template do Django, nós usamos chaves duplas com o nome da variável dentro, assim:

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
{{ posts }}
```

Tente fazer isso no seu template `blog/templates/blog/post_list.html`. Substitua tudo desde o segundo `<div>` até o terceiro `</div>` com `{{ posts }}`. Salve o arquivo, e atualize a página para ver o resultado:

![Figura 13.1](images/step1.png)

Você pode ver, tudo que temos é:

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
<QuerySet [<Post: My second post>, <Post: My first post>]>
```

Isto significa que o Django a entende como uma lista de objetos. Lembre-se de **introdução ao Python** como podemos exibir listas? Sim, com laços "for"! Em um template do Django você pode criá-los assim:

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
{% for post in posts %}
    {{ post }}
{% endfor %}
```

Tente fazer isso no seu template.

![Figura 13.2](images/step2.png)

Funciona! Mas nós queremos que eles sejam exibidos como os posts estáticos, como os que criamos anteriormente no capítulo de **Introdução a HTML**. Nós podemos misturar HTML com tags de template. O conteúdo da tag `body` ficará assim:

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
<div>
    <h1><a href="/">Django Girls Blog</a></h1>
</div>

{% for post in posts %}
    <div>
        <p>publicado em: {{ post.published_date }}</p>
        <h1><a href="">{{ post.title }}</a></h1>
        <p>{{ post.text|linebreaksbr }}</p>
    </div>
{% endfor %}
```

{% raw %}Tudo o que você colocar entre `{% for %}` e `{% endfor %}` será repetido para cada objeto na lista. Atualize a página:{% endraw %}

![Figura 13.3](images/step3.png)

Você notou que dessa vez nós usamos uma notação um pouco diferente (`{{ post.title }}` ou `{{ post.text }}`)? Nós estamos acessando os dados em cada um dos campos que definimos no model do `Post`. Além disso, `|linebreaks` está passando o texto do post por um filtro, convertendo quebras de linha em parágrafos.

## Mais uma coisa

Seria bom ver se seu site ainda funciona na internet, certo? Vamos tentar implantar a PythonAnywhere novamente. Aqui está um resumo dos passos…

* Primeiro, envie seu código para o Github

{% filename %}command-line{% endfilename %}

    $ git status
    [...]
    $ git add --all .
    $ git status
    [...]
    $ git commit -m "Modified templates to display posts from database."
    [...]
    $ git push
    

* Em seguida, faça login em [PythonAnywhere](https://www.pythonanywhere.com/consoles/) e vá para seu **Bash console** (ou comece um novo) e execute:

{% filename %}PythonAnywhere command-line{% endfilename %}

    $ cd $USER.pythonanywhere.com
    $ git pull
    [...]
    

* Finalmente, vá para a aba [Web app setup](https://www.pythonanywhere.com/web_app_setup/) e aperte **Reload** em seu aplicativo Web. Sua atualização deve ter aparecido! If the blog posts on your PythonAnywhere site don't match the posts appearing on the blog hosted on your local server, that's OK. Os bancos de dados em seu computador local e Python Anywhere não sincronizam com o resto de seus arquivos.

Parabéns! Now go ahead and try adding a new post in your Django admin (remember to add published_date!) Make sure you are in the Django admin for your pythonanywhere site, https://yourname.pythonanywhere.com/admin. Then refresh your page to see if the post appears there.

Works like a charm? We're proud! Step away from your computer for a bit – you have earned a break. :)

![Figura 13.4](images/donut.png)