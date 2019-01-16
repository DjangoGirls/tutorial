# Представления в Django – время создавать!

Пришло время избавиться от ошибки, на которую мы наткнулись в прошлой главе! :)

*view* это то место, где мы разместим "логику" работы нашего приложения. Оно запросит информацию из `модели`, которую мы создали ранее, и передаст её в `шаблон`. Шаблонами мы займёмся в следующей главе. Представления (views) это просто функции Python, которые лишь чуть сложнее чем те, которые мы написали в главе **Введение в Python**.

Представления размещаются в файле `views.py`. Мы добавим свои *представления* в файл `blog/views.py`.

## blog/views.py

Хорошо, давай откроем этот файл в нашем редакторе кода и посмотрим на его содержимое:

{% filename %}blog/views.py{% endfilename %}

```python
from django.shortcuts import render

# Create your views here.
```

Пока еще здесь есть немного содержимого.

Помните, что строки, начиная с `#` - это комментарии; то есть это значит, что эти строки не будут работать на Python.

Давайте создадим *представление* как комментарий. Добавьте следующее минимальное представление ниже:

{% filename %}blog/views.py{% endfilename %}

```python
def post_list(request):
    return render(request, 'blog/post_list.html', {})
```

Как видишь, мы создали метод (`def`) с именем `post_list`, который принимает `request` в качестве аргумента и `return` (возвращает) результат работы метода `render`, который соберет наш шаблон страницы `blog/post_list.html`.

Сохрани файл, перейди по адресу http://127.0.0.1:8000/ и посмотри что у нас получилось.

Другая ошибка! Читаем, что произошло:

![Ошибка](images/error.png)

Нам показывают, что сервер снова работает, по крайней мере; но ход его работы все еще выглядит неправильно, так ведь? Не стоит беспокоиться, это всего лишь страница ошибки, бояться нечего! Just like the error messages in the console, these are actually pretty useful. You can read that the *TemplateDoesNotExist*. Let's fix this bug and create a template in the next chapter!

> Learn more about Django views by reading the official documentation: https://docs.djangoproject.com/en/2.0/topics/http/views/