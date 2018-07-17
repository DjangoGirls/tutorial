# Administrador de Django

Para agragar, editar y borrar los posts que hemos modelado, usaremos el administrador (admin) de Django.

Abre el archivo `blog/admin.py` y remplaza su contenido con esto:

{% filename %}blog/admin.py{% endfilename %}

```python
from django.contrib import admin
from .models import Post

admin.site.register(Post)
```

Como puedes ver, importamos (incluimos) el modelo Post definido en el capítulo anterior. Para hacer nuestro modelo visible en la página del administrador, tenemos que registrar el modelo con `admin.site.register(Post)`.

Ok, es hora de ver nuestro modelo Post. Recuerda ejecutar `python manage.py runserver` en la consola para correr el servidor web. Ve a tu navegador y escribe la dirección http://127.0.0.1:8000/admin/. Veras una página de inicio de sesión como esta:

![Página de inicio de sesión](images/login_page2.png)

Para iniciar sesión, deberás crear un *superusuario (superuser)*, que es un usuario que tiene control sobre todo el sitio. Vuelve a la línea de comandos, escribe `python manage.py createsuperuser` y pulsa enter.

> Recuerda, para escribir comandos mientras el servidor web esta funcionando, abre una nueva terminal y activa el virtualenv. Revisamos como escribir nuevos comandos en el capitulo **Tu primer proyecto de Django!**, al inicio de la sección **Iniciando el servidor web**.

{% filename %}Mac OS X o Linux:{% endfilename %}

    (myvenv) ~/djangogirls$ python manage.py createsuperuser
    

{% filename %}Windows:{% endfilename %}

    (myvenv) C:\Users\Name\djangogirls> python manage.py createsuperuser
    

Cuando te lo pida, escribe tu nombre de usuario (en minúscula, sin espacios), email y contraseña. **No te preocupes si no puedes ver la contraseña que estás escribiendo, así es como se supone que tiene que ser.** Simplemente escríbela y presiona `enter` para continuar. Luego, verás algo así (Donde username y email serán los que escribiste anteriormente):

    Username: admin
    Email address: admin@admin.com
    Password:
    Password (again):
    Superuser created successfully.
    

Vuelve a tu navegador. Ingresa con las credenciales de super usuario que tu escogiste; verás el panel de administrador de Django.

![Administrador de Django](images/django_admin3.png)

Ve a Post y experimenta un como con él. Agrega cinco o seis posts para tu blog. No te preocupes sobre el contenido - simplemente puedes copiar y pegar algunas palabras de este tutorial para ahorrar tiempo. :)

Asegúrate de que al menos dos o tres posts (pero no todos) tengan la fecha de publicación definida. Esto será muy poderoso después.

![Administrador de Django](images/edit_post3.png)

If you want to know more about Django admin, you should check Django's documentation: https://docs.djangoproject.com/en/2.0/ref/contrib/admin/

Este posiblemente sea un buen momento para tomar un café (o te) o algo para comer y re energizar tu cuerpo. Has creado tu primer modelo en Django - ¡Mereces un pequeño descanso!