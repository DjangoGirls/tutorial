# Templates do Django

Hora de exibir algum dado! Django nos dá  __tags de templates__ embutidas bastante úteis para isso.

## O que são tags de template?

Como pode ver, você não pode colocar código Python no HTML, porque os navegadores não irão entender. Eles apenas conhecem HTML. Nós sabemos que HTML é bastante estático, enquanto Python é muito mais dinâmico.

As __Tags de template Django__ nos permite transformar objetos Python em código HTML, para que você possa construir sites dinâmicos de forma mais rápida e mais fácil. Uhuu!

## Template para exibir uma lista de postagens

No capitulo anterior, nós fornecemos ao nosso template uma lista de postagens e a variável <o>posts</o>. Agora vamos exibir essa lista em nosso HTML.

Para exibir uma variável no template do Django, nós usamos colchetes duplos com o nome da variável dentro, por exemplo:

{% filename %}blog/templates/blog/post_list.html{% endfilename %}
```html
{{ posts }}
```

Tentar fazer isso no seu template `blog/templates/blog/post_list.html`. Substitua tudo a partir do segundo `< div >` até o terceiro `< / div >` por `{{ posts }}`. Salve o arquivo e atualize a página para ver os resultados:


![Figure 13.1](images/step1.png)

Como você pode ver, tudo que temos é:

{% filename %}blog/templates/blog/post_list.html{% endfilename %}
```html
<QuerySet [<Post: My second post>, <Post: My first post>]>
```

Isto significa que o Django a entende como uma lista de objetos. Lembra da __Introdução ao Python__ de podemos exibir listas? Sim, com os loops! Em um template do Django, fazemos isso da seguinte maneira:

{% filename %}blog/templates/blog/post_list.html{% endfilename %}
```html
{% for post in posts %}
    {{ post }}
{% endfor %}
```

Tente fazer isso no seu template.

![Figure 13.2](images/step2.png)

Funciona! Mas nós queremos que eles sejam exibidos como os posts estáticos, como os que criamos anteriormente no capítulo de __Introdução a HTML__. Nós podemos misturar HTML com tags de template. O conteúdo da tag `body` ficará assim:


{% filename %}blog/templates/blog/post_list.html{% endfilename %}
```html
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
```

{% raw %}Tudo que você coloca entre `{% for %}` e `{% endfor %}` será repetido para cada objeto na lista. Atualize sua página::{% endraw %}

![Figure 13.3](images/step3.png)

Você notou que dessa vez nós usamos uma notação um pouco diferente `{{ post.title }}` ou `{{ post.text }}`? Nós estamos acessando os dados em cada um dos campos que definimos no model do `Post`. Além disso, `|linebreaksbr` está passando o texto da postagem por um filtro, convertendo quebras de linha em parágrafos.

## Mais uma coisa

Seria bom ver se seu site ainda estará funcionando na internet, certo? Vamos tentar fazer a implantação na PythonAnywhere novamente. Aqui está um resumo dos passos...

*   Primeiro, envie seu código para o Github
   
   {% filename %}command-line{% endfilename %}
   ```
   $ git status
   [...]
   $ git add --all .
   $ git status
   [...]
   $ git commit -m "Modified templates to display posts from database."
   [...]
   $ git push
   ```
   
*   Em seguida, faça login em [PythonAnywhere](https://www.pythonanywhere.com/consoles/) e vá para seu **Bash console** (ou comece um novo) e execute:

    {% filename %}command-line{% endfilename %}
    ```
    $ cd my-first-blog
    $ git pull
    [...] 
    ```

*   Finalmente, pule para a [Web tab](https://www.pythonanywhere.com/web_app_setup/) e aperte **Reload** em seu aplicativo web. Sua atualização deve estar ao vivo!  Se suas postagens do blog em seu site PythonAnywhere não coincidirem com as postagens que aparecem no blog hospedado em seu servidor local, está tudo bem. O banco de dados em seu computador local e o da Python Anywhere não estão sincronizados junto com o resto de seus arquivos.

Parabéns! Agora vá em frente e tente adicionar um novo post em seu Django admin (Lembre-se de adicionar published_date!). Certifique-se que você está no admin do Django de seu site pythonanywhere, https://yourname.pythonanywhere.com/admin. E então atualize sua página para ver se a postagem aparece lá

Funciona como mágica? Estamos orgulhosas! Afaste-se do seu computador um pouco, você ganhou uma pausa. :)

![Figure 13.4](images/donut.png)
