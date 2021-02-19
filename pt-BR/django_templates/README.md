# Templates do Django

Hora de exibir dados! O Django já vem com algumas **tags de template** que são úteis pra isso.

## O que são tags de template?

Sabe, em HTML não podemos incluir código Python porque os browsers só entendem HTML. Sabemos que o HTML é bem estático, enquanto o Python é muito mais dinâmico.

**Tags de template Django** nos permitem transformar código similar a Python em código HTML para que você possa construir sites dinâmicos mais rápido e mais facilmente. Legal!

## Templates para lista de posts

No capítulo anterior, fornecemos para o nosso template uma lista de postagens e a variável <o>posts</o>. Agora vamos exibi-las em HTML.

Pra mostrar uma variável em um template do Django, usamos chaves duplas com o nome da variável, assim:

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
{{ posts }}
```

Tente fazer isso no seu template `blog/templates/blog/post_list.html`. Abra-o no editor de código e substitua tudo desde o segundo `<div>` até o terceiro `</div>` com `{{ posts }}`. Salve o arquivo e atualize a página para ver o resultado:

![Figura 13.1](images/step1.png)

Como você pode ver, obtivemos apenas:

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
<QuerySet [<Post: My second post>, <Post: My first post>]>
```

Isto significa que o Django entende essa variável como uma lista de objetos. Em **Introdução ao Python** aprendemos como exibir listas, lembra? Sim, com laços "for"! Em um template do Django você pode criá-los assim:

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
{% for post in posts %}
    {{ post }}
{% endfor %}
```

Tente fazer isso no seu template.

![Figura 13.2](images/step2.png)

Funciona! Mas nós queremos que eles sejam exibidos como os posts estáticos que criamos anteriormente no capítulo de **Introdução a HTML**. Nós podemos misturar HTML com tags de template. O conteúdo da tag `body` ficará assim:

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
<header>
    <h1><a href="/">Django Girls Blog</a></h1>
</header>

{% for post in posts %}
    <article>
        <time>published: {{ post.published_date }}</time>
        <h2><a href="">{{ post.title }}</a></h2>
        <p>{{ post.text|linebreaksbr }}</p>
    </article>
{% endfor %}
```

{% raw %}Tudo o que você colocar entre `{% for %}` e `{% endfor %}` será repetido para cada objeto na lista. Atualize a página:{% endraw %}

![Figura 13.3](images/step3.png)

Você notou que dessa vez nós usamos uma notação um pouco diferente (`{{ post.title }}` ou `{{ post.text }}`)? Estamos acessando os dados em cada um dos campos que definimos no modelo do `Post`. Além disso, `|linebreaks` está passando o texto do post por um filtro, convertendo quebras de linha em parágrafos.

## Mais uma coisa

Seria bom ver se seu site ainda funciona na internet, né? Vamos tentar implantar a PythonAnywhere novamente. Aqui está um resumo dos passos…

* Primeiro, envie seu código para o Github

{% filename %}command-line{% endfilename %}

    $ git status
    [...]
    $ git add .
    $ git status
    [...]
    $ git commit -m "Modified templates to display posts from database."
    [...]
    $ git push
    

* Em seguida, faça login em [PythonAnywhere](https://www.pythonanywhere.com/consoles/) e vá para seu **console de Bash** (ou comece um novo) e execute:

{% filename %}PythonAnywhere command-line{% endfilename %}

    $ cd <your-pythonanywhere-domain>.pythonanywhere.com
    $ git pull
    [...]
    

(Lembre-se de substituir `<your-pythonanywhere-domain>` pelo seu subdomínio PythonAnywhere, mas sem os colchetes angulares, ou seja, sem < e >).

* Finalmente, pule para a aba ["Web" page](https://www.pythonanywhere.com/web_app_setup/) e aperte **Reload** em sua aplicação. (Para acessar outras páginas do PythonAnywhere a partir do console, utilize o botão do menu na parte superior direita). A sua atualização deve estar ativa em https://subdomain.pythonanywhere.com - confira pelo navegador! Tudo bem se as postagens em seu site PythonAnywhere não coincidirem com as postagens que aparecem no blog hospedado no seu servidor local. Os bancos de dados em seu computador local e no Python Anywhere não sincronizam com o resto de seus arquivos.

Parabéns! Agora vá em frente e tente adicionar um novo post no seu administrador Django (lembre-se de adicionar published_data!). Assegure-se que você está no administrador Django do seu site pythonanywhere, https://subdomain.pythonanywhere.com/admin. E então, recarregue a página para verificar se o seu post é mostrado.

Funciona? Estamos orgulhosas! Saia do seu computador um pouquinho - você merece um descanso. :3

![Figura 13.4](images/donut.png)