# bitly
Bitly Un Reductor De Urls

Alguna vez has utilizado Bitly. Esta es una aplicación muy usada en twitter para reducir el tamaño de una url.

En este ejercicio crearemos nuestro propia app tipo Bitly. Tienes alguna idea de como podemos diseñar he implementar esta app. No tiene mucha ciencia ya lo veras.

Antes de empezar te recomendamos si no estas familiarizado con Bitly, usarlo para que comprendas como funciona.

Objetivos Académicos
Comprender como funciona un redirect en HTTP
Empezar a utilizar Active record callbacks
Actividades
Descargar Archivos

Solamente utilizaremos un recurso: Urls. Contempla que deberás tener dos columnas una para la URL original (long_url). Además de la url en tu modelo deberás tener una columna para guardar una url (short_url) o una cadena que será la cual nos redirigirá a la url original.

Deberás tener una ruta dentro de tu controlador que enliste todas las Urls y otra que por medio de un post cree un objeto url.

Los métodos dentro de tu controlador deberán parecerse a lo siguiente:

get '/' do
  # Deja a los usuarios crear una URL reducida y despliega una lista de URLs.
end

post '/urls' do
  # crea una nueva Url
end

# e.g., /q6bda
get '/:short_url' do
  # redirige a la URL original
end
Activerecord callbacks
En la siguiente liga podrás encontrar información de como funcionan los callbacks en active records. Deberás generar la short_url utilizando un before_create y el método deberá de estar dentro de tu modelo.

Agrega un Contador
Agrega una columna click_count a tu tabla Urls, esta columna será un atributo que llevara el conteo de cuantas veces han utilizado la short_url. Para esto una agrega código en tu controlador que al visitar una short_url su contador incremente en 1.

Validaciones
Agrega validaciones a tu modelo Url para que únicamente acepte urls verdaderas. Te recomendamos visitar el siguiente link ActiveRecord validations. Poder validar perfectamente que es una url valida es muy complicado, por lo que la decisión de que es una url valida lo decidirás tu.

Por ejemplo un URL valida contempla:

Un string que no este vació.
También que el string empieze con http:// o https://
Un string que el modulo de ruby URI acepte como valido: (Ruby URI module) Cualquier cosa que responda a un HTTP request, realmente viendo si la URL es accesible vía HTTP.
Manejando el caso de algún Error
A la hora de salvar (crear o actualizar) algún objeto Activerecord puede fallar. Estas fallas suceden si no se le envían los atributos correctos. Existen métodos como create! y save! los cuales regresan excepciones, pero otros como create (sin el !) regresan simplemente el objeto que se les envío sin importar si se guardo o no se guardo en la base de datos. Ahora save regresará true si el objeto es guardado y false si el objeto no pudo ser guardado.

Investiga las diferencias de estos métodos y que regresa cada uno.

Ahora existen otros métodos que puedes utilizar para conocer si un objeto será rechazado por las validaciones.

Utiliza valid? or invalid? para saber si la información que contiene un objeto es valida o invalida.

Utiliza estos métodos o save y despues utiliza el método errors para conocer y poder desplegar al usuario un error en el caso de que mande una url que no sea valida. De esta manera el usuario deberá poder corregir su error y volver a intentar.

Más validaciones
Una vez que conocemos las validaciones empezamos a ponerlas en cualquier cosa que entre a nuestra base de datos. De esta manera podemos estar seguros de que nuestra información se ajusta a ciertas normas. Por ejemplos no hay usuarios sin email o nombre, de esta manera nuestra información siempre tendrá cierta consistencia.

Existen diferentes tipos de restricciones para poder validar la información antes de guardarla. Las restricciones a nivel de base de datos se dicen estar escritas en piedra, ya que son difíciles de cambiar en el largo plazo.

Algunas restricciones comunes son:

Un usuario debe de tener un nombre
Un usuario debe de tener un email
Dos o más usuarios no deben de tener el mismo email, o dicho de otra manera el email de cada usuario debe de ser único.
Una Url debe de ser valida, dentro de la "deficinición" de lo que es una url valida.
En la siguiente tabla podrás ver una comparación de poner la misma validación a nivel de base de datos o en el modelo.

Validation | SQL Land | Ruby Land
Un usuario debe de tener un nombre | NOT NULL constraint on name field | validates :name, :presence => true
Un usuario debe de tener un email | NOT NULL constraint on email field | validates :email, :presence => true
el email de cada usuario debe ser único| UNIQUE INDEX on email field | validates :email, :uniqueness => true
