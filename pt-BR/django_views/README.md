# Django views -- hora de criar!

É hora de resolver o bug que criamos no capítulo anterior! :)

Uma *view* é o lugar onde nós colocamos a "lógica" da nossa aplicação. Ela vai extrair informações do `model` que você criou e entregá-las a um `template`. Nós vamos criar um template no próximo capítulo. Views são somente funções Python que são um pouco mais complicadas do que aquelas que criamos no capítulo **Introdução ao Python**.

As views são postas no arquivo `views.py`. Nós vamos adicionar nossas *views* no arquivo `blog/views.py`.

## blog/views.py

OK, vamos abrir o arquivo e ver o que tem nele:

{% filename %}blog/views.py{% endfilename %}

```python
from django.shortcuts import render

# Create your views here.
```

Não há muita coisa por aqui.

Remember that lines starting with `#` are comments – this means that those lines won't be run by Python.

Let's create a *view* as the comment suggests. Add the following minimal view below it:

{% filename %}blog/views.py{% endfilename %}

```python
def post_list(request):
    return render(request, 'blog/post_list.html', {})
```

Como você pode ver, nós criamos um método (`def`) chamada `post_list` que aceita o `request` e `return` um método `render` que irá renderizar (montar) nosso modelo `blog/post_list.html`.

Save the file, go to http://127.0.0.1:8000/ and see what we've got.

Outro erro! Leia o que está acontecendo agora:

![Erro](images/error.png)

Isso mostra que o servidor está em execução novamente, pelo menos, mas ainda não parece certo, não é? Não se preocupe, é apenas uma página de erro, nada a temer! Como as mensagens de erro no console, estas são realmente muito úteis. Você pode ler que *TemplateDoesNotExist*. Vamos corrigir este bug e criar um modelo no próximo capítulo!

> Learn more about Django views by reading the official documentation: https://docs.djangoproject.com/en/2.0/topics/http/views/