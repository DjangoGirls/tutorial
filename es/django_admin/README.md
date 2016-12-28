# Administrador de Django

Para agregar, editar y borrar los posts que hemos modelado, utilizaremos el administrador de Django.

Vamos a abrir el archivo `blog/admin.py` y reemplazar su contenido con esto:

```python
    from django.contrib import admin
    from .models import Post
    
    admin.site.register(Post)
```

Como puedes ver, importamos (incluimos) el modelo Post definido en el capítulo anterior. Para hacer nuestro modelo visible en la página del administrador, tenemos que registrar el modelo con `admin.site.register(Post)`.

Ok, es hora de ver tu modelo Post. Recuerda ejecutar `python manage.py runserver` en la consola para correr el servidor web. Ve al navegador y tipea la dirección http://127.0.0.1:8000/admin/. Verás una página de ingreso como la que sigue:

![Página de inicio de sesión][1]

 [1]: images/login_page2.png

Para poder ingresar deberás crear un *superusuario* - un usuario que tiene control sobre todo lo que hay en el sitio. Vuelve hacia atrás a tu línea de comandos y tipea `python manage.py createsuperuser`, presiona enter y tipea tu nombre de usuario (en minúsculas, sin espacios), dirección de email y contraseña cuando sean requeridos. No te preocupes que no puedes ver tu contraseña mientras la tipeas - así es como debe ser. Simplemente tipéala y presiona 'Enter' para continuar. La salida de este comando debería verse así (nombre de usuario y email deberían ser los tuyos):

    (myvenv) ~/djangogirls$ python manage.py createsuperuser
    Username: admin
    Email address: admin@admin.com
    Password:
    Password (again):
    Superuser created successfully.
    

Vuelve a tu navegador e ingresa con las credenciales de super usuario que elegiste, ahora deberías poder ver el panel de administración de Django.

![Administrador de Django][2]

 [2]: images/django_admin3.png

Ve a Posts y experimenta un poco con esto. Agrega cinco o seis posts del blog. No te preocupes por el contenido - puedes simplemente copiar y pegar texto de este tutorial en el contenido de tus posts para ahorrar tiempo :).

Asegúrate de que por lo menos dos o tres posts (pero no todos) tienen la fecha de publicación. Será útil luego.

![Administrador de Django][3]

 [3]: images/edit_post3.png

Si quieres saber más sobre el administrador de Django, puedes visitar la documentación de Django: https://docs.djangoproject.com/en/1.8/ref/contrib/admin/

Este probablemente sea un buen momento para tomar un café (o té) o algo para comer y re-energizarte. Creaste tu primer modelo de Django - ¡mereces un pequeño recreo!
