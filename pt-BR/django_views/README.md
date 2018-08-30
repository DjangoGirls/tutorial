# Django views -- hora de criar!

É hora de resolver o bug que criamos no capítulo anterior! :)

Uma *view* é o lugar onde nós colocamos a "lógica" da nossa aplicação. Ela vai extrair informações do `model` que você criou e entregá-las a um `template`. Nós vamos criar um template no próximo capítulo. Views são apenas funções Python um pouco mais complicadas do que aquelas que criamos no capítulo **Introdução ao Python**.

As views são colocadas no arquivo `views.py`. Nós vamos adicionar nossas *views* ao arquivo `blog/views.py`.

## blog/views.py

OK, let's open up this file in our code editor and see what's in there:

{% filename %}blog/views.py{% endfilename %}

```python
from django.shortcuts import render

# Create your views here.
```

Ainda não tem muita coisa aqui.

Lembre-se de que as linhas começando com `#` são comentários -- isto significa que elas não serão executadas pelo Python.

Vamos criar uma *view* (como o comentário em inglês acima sugere). Vamos criar uma view simples agora:

{% filename %}blog/views.py{% endfilename %}

```python
def post_list(request):
    return render(request, 'blog/post_list.html', {})
```

Como você pode ver, nós criamos uma função (`def`) chamada `post_list` que recebe um `request`, executa a função `render` que irá renderizar (montar) nosso modelo de acordo com o template `blog/post_list.html`, e retorna (`return`) o resultado.

Salve o arquivo e abra a página http://127.0.0.1:8000/ para ver o que acontece.

Outro erro! Veja o que está acontecendo agora:

![Erro](images/error.png)

O erro mostra que o servidor pelo menos está sendo executado, mas ainda não parece certo, né? Não se preocupe, é apenas uma página de erro: nada a temer! Como as mensagens de erro no console, estas também são muito úteis. Você pode ler *TemplateDoesNotExist*, que significa "template não existe", em inglês. Vamos corrigir este bug e criar um modelo no próximo capítulo!

> Aprenda mais sobre as views do Django lendo a documentação oficial: https://docs.djangoproject.com/en/2.0/topics/http/views/