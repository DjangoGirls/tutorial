# Views Do Django - hora de criar!

É hora de resolver o bug que criamos no capítulo anterior :)

Uma *view* é um lugar onde nós colocamos a "lógica" da nossa aplicação. Ela irá solicitar informações que estão no `model` que você criou anteriormente e passá-las para um `template`. Nós vamos criar um template no próximo capítulo. Views são apenas funções Python que são um pouco mais complicadas do que aquelas que fizemos no capítulo **Introdução ao Python**.

As views são postas no arquivo `views.py`. Nós vamos adicionar nossas *views* no arquivo `blog/views.py`.

## blog/views.py

OK, vamos abrir esse arquivo e ver o que tem nele:

{% filename %}blog/views.py{% endfilename %}
```python
from django.shortcuts import render

# Create your views here.
```

Não tem muita coisa ainda.

Lembre-se que as linhas iniciadas com `#` são comentários – isso significa que essas linhas não serão executadas pelo Python.

A *view* mais simples pode se parecer com isso:

{% filename %}blog/views.py{% endfilename %}
```python
def post_list(request):
    return render(request, 'blog/post_list.html', {})
```

Como você pode ver, nós criamos uma função (`def`) chamada `post_list` que recebe um `request` e `retorna (return)` uma função `render` será irá renderizar (montar) nosso modelo `blog/post_list.html`.

Salve o arquivo, vá para http://127.0.0.1:8000 / e veja o que temos agora.

Outro erro! Leia o que está acontecendo agora:

![Error](images/error.png)

Esse mostra que o servidor está, pelo menos, rodando novamente. Mas ainda não é o suficiente, ou é? Não se preocupe, é apenas uma página de erro, nada para se ter medo! Assim como nas mensagens de erro em um console, elas são muito úteis. Você pode ler que o template não existe - *TemplateDoesNotExist*. Vamos consertar esse bug e criar um template no próximo capítulo!

> Aprenda mais sobre as views do Django lendo a documentação oficial:  https://docs.djangoproject.com/en/1.9/topics/http/views/
