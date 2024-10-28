# Fundamentos de unix programming
## Directorios
El file system es la estructura de los directorios o carpetas, poseen una estructura de árbil, los directorios pueden poseer hermanos, padres, abuelos. El directorio raíz o route siempre será _/_. De este se desprenden todos los subdirectorios del sistema.

### Comandos:
- __pwd__: Nos piermite saber la ruta donde los posicionamos actualmente.
- 
- __ls__: Mediante este comando podremos saber el contenido del directorio actual. 
  - _-l_: Con la bandera veremos más información: permisos del archivo (lectura, escritura,...), cantidad de referencias a este archivo, autor/propietario,grupo al cual pertenece al archivo, tamaño del archivo en bytes, última fecha de modificación y hora y el nombre del archivo.
  - _-a_: Concemos los ficheros ocultos que posee el directorio. Dentro del listado veremos una referencia al fichero actual (.) y al padre (..).
  - _-la_: Es posible usar en conjunto las opciones, se suman sus funciones.
  - _-r_: Ordena de forma descendente por nombre del archivo.
  - _-t_: Ordena por última fecha de modificación. Se pude sumar con l y r quedando _-ltr_.
  - _-X_: Ordena los archivos por su extención.
  - _-S_: Ordena por el tamaño.
  - _-Sh_: Ordena por tamaño y muestra el tamaño el kiloBytes.

- __cd #__: Change directory es para movernos de directorio después del comando se debe especificar a donde te quieres mover.
    - Si colocamos un punto nos movemos a la carpeta padre, con dos puntos nos movemos al abuelo.

- __clear__: limpiamos la pantalla, también con  ctrl + l se hace lo mismo.

- __mkdir #__: Creamos una nueva carpeta, se debe especificar el nombre de la carpeta.

- __echo #__: Imprime con mensaje en consola, dentro de unas comillas dobles se especifica el mensaje.
    - Si colocamos el operador relacional _>_ almacenaremos en un archivo el mensaje. Si no existe, se crea, si existe, se remplaza.

- __cat #__: Conocemos todo el contenido de un archivo. Se debe especificar el nombre.

- __touch #__: Crea archivos, se especifica el nombre del archivo.

- __nano #__: Abre un editor de texto en la misma consola, se debe especficiar el nombre del archivo a editar.

- __head #__: Conocemos las primeras 10 lineas de un archivo. Para conocer la n cantidad de lineas usamos la bandera _-n_ seguido del numero de lineas, lo mismo para tail. 

- __tail #__: Conocemos la últimas 10 lineas del archivo.

- __wc #__: Word count de un archivo. Imprimime 3 numeros los cuales indican: la cantidad de líneas, palabras, caracteres.
  - _-m_: Cuenta los caracteres solamente.
  - _-c_: cantidad de bytes.
  - _-w_: cantidad de palabras.
  - _-l_: cantida de lineas.

- __man #__: Accedemos a la documentación de cualquier comando que se le indique.


Los __wildcarts__ son caracteres que nos permiten representar a otros caracteres.
- __*__: Permite representar 1 o más ocurrencias de un caracter.
- __?__: Representa 1 coincidencia de un caracter.
- __[ ]__: Agrugan 1 o más coincidencias de caracteres.
Ejemplos: _ls *.txt_ o  bien: _ls archivo.*_. También: _ls archi??.txt_.
_ls [ar]*.txt_: Todos los archivos que empiecen con a o con r y que su extención sera txt.

- __mv # <>__: Movemos de lugar un archivo al fichero que se le especifique.
  - Con Wildcarts podemos mover varios archivos a la vez, mientras compartan algo que los identifique a todos.: _mv *.txt carpeta/_
  - Es posible renombrar un archivo si en vez de especificar la ruta le pasamos el nuevo nombre y su extensión.

- __cp # <>__: Copiamos un archivo y la ruta a donde se pegará la copia.

- __rm #__: Eliminamos un archivo especificado, de forma permanente.
  - _-rf <>_: Para eliminar todos los archivos de una carpeta de forma recursiva y todo lo que tenga dentro.

- __ln -s # <>__: Crea enlaces simbólicos, un apuntador a otro archivo, un acceso directo. Se especifica el archivo y la ruta a donde se colocará el enlace simbólico. 


### Permisos de ficheros
Existen 3 tipos de permisos: __Lectura (r) Escritura (w) Ejecución (x)__, Con el comando _ls -l_ podremos ver en la primer columna los permisos que posee el archivo y el tipo de archivo. El primer caracter nos indica si es un archivo o un fichero o un link, ... los otros 9 pueden ser r,w o x. Son 9 caracteres ya que se expresa los permisos que tiene el autor/propietario, el grupo y los usuarios.

Para modificar los permisos hay dos opciones: la representación de número octal y la representación simbólica. La representación de número octal es la numeración base 8 y cada número tiene un significado en binario y en permiso.
- 0 --- ningun permiso
- 1 --x solo Ejecución
- 2 -w- solo escritura
- 3 -rwx 
- 4 r--
- 5 r-x
- 6 rw-
- 7 rwx

Para modificar los permisos de un archivo se usa el comando: __chmod nnn #__, especificando los permisos para el autor,grupo,usuarios y el archivo.

Un archivo __bash__ es un tipo de archivo que almacena comandos. Tiene por extención __.sh__. Se ejecuta con la llamada al interprete bash antes del archivo o con ./

- __./archivo__: Para ejecutar un archivo se pone un punto y la ruta del archivo, si se está en el fichero solo se coloca el nombre del archivo.

- __whoami__: regresa el usuario que está en ese momento en la consola.

## Procesos

