# Administrador de Django

Para agregar, editar y borrar los mensajes que hemos modelamos, utilizaremos el administrador de Django.

Vamos a abrir el archivo `blog/admin.py` y reemplazar su contenido con esto:

    from django.contrib import admin
    from .models import Post
    
    admin.site.register(Post)
    

Como puedes ver, importamos (incluimos) el modelo Post definido en el capítulo anterior. Para hacer nuestro modelo visible en la página del administrador, tenemos que registrar el modelo con `admin.site.register(Post)`.

Es hora de mirar a nuestro modelo de Post. Recuerde que debe ejecutar `python manage.py runserver` en la consola para ejecutar el servidor web. Vaya al navegador y escriba la dirección:

    http://127.0.0.1:8000/admin/
    

Usted verá una página de inicio de sesión como esta:

![Página de inicio de sesión][1]

 [1]: images/login_page2.png

Para poder entrar necesitas crear un *superusuario* - un usuario que tiene control sobre todo en el sitio. Vuelve a la línea de comandos y escribe `python manage.py createsuperuser`, presione enter y escriba su nombre de usuario (en minúscula, sin espacios), dirección de correo electrónico y contraseña cuando te pregunten por ellos. La salida debe ser así (donde nombre de usuario y correo electrónico deben ser los tuyos):

    (myvenv) ~/djangogirls$ python manage.py createsuperuser
    Username: admin
    Email address: admin@admin.com
    Password:
    Password (again):
    Superuser created successfully.
    

Regresa a tu navegador e inicia sesión con las credenciales de superusuario que elegiste, deberías ver el tablero de administración de Django.

![Administrador de Django][2]

 [2]: images/django_admin3.png

Ve a Posts y experimentar un poco con él. Agrega cinco o seis entradas en el blog. No te preocupes por el contenido - puedes simplemente copiar y pegar algún texto de este tutorial como contenido de tus mensajes para ahorrar tiempo :).

Asegúrate que al menos dos o tres entradas (pero no todas) tengan la fecha de publicación. Será de ayuda más tarde.

![Administrador de Django][3]

 [3]: images/edit_post3.png

Sí quieres sabes más sobre Django admin, deberías revisar la documentación de Django: https://docs.djangoproject.com/en/1.8/ref/contrib/admin/

Probablemente sea un buen momento para tomar un café (o té) y comer algo dulce. Haz creado tu primer modelo Django - te mereces un regalito!
