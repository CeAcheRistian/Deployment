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
En un entorno especial para poder ejecutar un programa, es creado y administrado por el sistema operativo y es la instancia de un programa. 

Cuando hacemos doble click en un icono ejecutable, se inicia un proceso de ese programa. Al hacer el comando -ls -l- también se inicia un proceso.

Todos los procesos en Unix tienen 4 __atributos__:
- __PID (Process ID)__: identificador único, para cada uno de los procesos. Número de hasta 5 caracteres, se puede reutilizar el id, siempre y cuando se haya terminado el proceso.

- __PPID (Parent Process ID)__: Un proceso es iniciado por otro proceso. Es una referencia al proceso padre.

- __TTY__: La terminal asociada al proceso. No todos los procesos son o pueden ser iniciados desde una terminal.

- __UID (User ID)__: El usuario propietario del proceso.

Existe el proceso raiz o padre de padres, de nombre __Init Process (PID 1)__, se ejecuta cuando el sistema se inicia, a aprtir de este, todos los demás se crean.

- __ps__: Para conocer todos los procesos existentes.
  - _-f_: más información de los procesos.
  - _-u_: AUN MÁS información de los procesos. Aca ya vemos cuanto se usó de cpu, de memoria, cantidad de memoria y memoria virtual utilizadas por el proceso, un códido de estado del procesos y su fecha de inicio.

- __top__: para monitorear los procesos activos del sistema. Vemos el PID, user, CPU, MEM, ... 

Podremos identificar algún tipo de cuello de botella o problema con esta información.

Se pueden crear procesos en primer y segundo plano. Por default, cada proceso que se cree será en primer plano, pudiendo ingresar datos, interactual con el, salir de el. Ejemplo de esto es correr un script de pyton, este programa inicia un proceso el cual estará en primer plano. Al tener un programa en primer plano, no podremos interactuar con esa terminal, hasta que el programa finalice.

### Primer y segundo plano
Para finalizar un proceso en primer plano se usa el caracter __&__, ejemplo: nano &, con esto se le indica a la terminal que queremos iniciar ese proceso en _segundo plano_.

Para traer un proceso a primer plano primero debemos de saber los trabajos activos. Con el comando: __jobs__ vemos los programas pausados de segundo plano y su id.

Para traer un proceso a primer plano: __fg %<id>__ el id se conoce con el comando anterior. Y con esto se ejecuta en primer plano el programa seleccionado.

### Finalizando procesos
Para finalizar un proceso en primer plano se usa la señal o _signal_: __Ctrl + C__. Interrumpimos de forma abrupta el programa.

Para eliminar un proceso en segundo plano se usa el comando: __kill #__, especificando el id del proceso (PID), para conocer el PID usamos el comando: __ps__. En el comando kill usamos la bandera o signal _-9_ y el PID para matarlo.

## Streams
Cuando se cree un nuevo proceso, este se inicializará con 3 canales de datos o streams: 
- __Stdin__ (Standard input)
- __Stdout__ (Standard output)
- __Stderr__ (Standard error)

Mediante estos 3 canales el usuario puede interactual con el programa. Para enviar y recibir información. Con el stdin el usuario manda datos al programa a través del teclado, siempre y cuando el programa esté en ejecución, el programa al recibir y procesar estos datos dara una salida, el stdout o el stderr, la diferencia es el tipo de mensaje a mostrar, mensajes normales de la ejecución del programa o mensajes de error en la ejecución del programa.

Los streams tienen un número por defecto que los caracteriza, van del 0 al 2 en el orden de aparición de la lista anterior.

### Redireccion de las salidas de programas
Para almacenar los mensajes de la salida estandar colocamos el operador: _>_ mayor que, seguido del nombre del archivo donde se van a almacenar esos mensajes.

Ejemplo: _echo "Hola mundo" __>__ archivo.txt_ Redirigimos los mensajes stdout a un archivo específico.

Con el operador ">" se remplaza el contenido del archivo, para añadirlo al final, usamos el operador: _>>_

Para redirigir el standar error usamos el operador: _2>_ seguido del nombre del archivo. Es dos porque cada stream tiene un numero asociado, el 2 es para el stderr. Para concatenar los mensajes y no sustituirlos, usamos:  _2>>_.

Para redirigir en conjunto el stdout y el stderr usamos los operadores uno tras otro:
- ls archivo.txt >> mensajes.txt 2>> errores.txt
almacenamos en archivos diferentes la salida de mensajes y de errores del archivo indicado.

#### stdin
Es posible almacenar los datos de entrada o el stdin en un archivo. En python es con un input(). En otro archivo de texto plano o txt, almacenamos los datos a pasar en el input del archivo python. Para pasarle estos datos hacemos:

_python3 archivo.py < stdin.txt_: Y con esto le estamos pasando los datos que espera la funcion input() desde un archivo txt.

## GREP
Global Regular Expression Print. comando para buscar diferentes patrones sobre los diferentes archivos en el sistema. Para ejecutarlo su sintaxis sería algo así: __grep {opciones} <patrón> (archivo)__. Como un ejemplo: _"grep martes dias.txt"_ Suponiendo que existe un texto que almacene los días de la semana, en consola veríamos todo el texto pero con la palabra "martes" resaltada. Veremos el patron como palabra sola o como parte de una palabra.

- Para buscar solo palabras y no caracteres de palabras usamos la bandera: _-w_. 
> Se diferencia minúsculas de mayúsculas. 
- Para que busque sin importar si es minúsculas o mayúsculas usamos la bandera: _-i_.
- Podemos saber en qué número de linea se encuentra el patron, con la bandera: _-n_.
- Para saber solo la cantidad de lineas, usamos la bandera: _-c_.
- Para encontrar todas las lineas donde NO se encuentre el patron: _-v_.
- Para saber un limitado numero de lineas usamos _-m #_ pero especificamos cuantas lineas a mostrar.
- Podemos varias palabras o sentencias, usando comillas dobles: _grep -inm 10 "hola mundo" archivo.txt_. 
- Para obtener lineas antes (_-B #_) o después (_-A #_) del patrón buscado o antes y después (_-C #_). Esto para darnos un mayor contexto. 
- Podemos buscar múltiples patrones sobre un mismo archivo: _-e <patron>_ y después vienen las opciones del siguiente patrón: _grep -wine hola -Cin MUNDO archivo.txt_
>Para más opciones usar el manual > man grep

## Pipe
Es la forma en la cual tomamos el stdout de un proceso y lo utlizamos en el stdin de otro proceso. Como la concatencación de procesos. Los datos de salida de un proceso son los datos de entrada de otro de forma secuencial.

ejemplo: _tail archivo.txt | wc_. De las ultimas 10 lineas del archivo cuenta los renglones, palabras y caracteres.

_tail archivo.txt | grep -win hola_. De las ultimas 10 lineas del archivo, muestra las lineas que cumplan con el patron y las opciones dadas.

## Cron
Un demonio son los procesos los cuales se ejecuten en segundo plano e inicien junto con el sistema operativo.

Cron es un demonio del sistema, el cual permite ejecutar procesos en intervalos de tiempo. Podemos ejecutar un comando cada 10 minutos/segundos/dias automaticamente o cada lunes a las 10 am: Hay 6 campos a especificar antes del comando a ejecutar: _* * * * * comando a ejecutar_, de izquierda a derecha.
- minuto (0 - 59)
- hora (0 - 23)
- día del mes (1 - 31)
- mes (1 - 12)
- día de la semana (0 - 6) domingo = 0, sabado = 6

Ejemplos:
- _5 17 * * sun /ruta/script.sh_, Ejecutar script cada 5 min después de las 5pm del domingo.
- _15 21 1 ** /ruta/script.sh_, ejecutar script todos los días primero de cada mes a las 9:15 pm.
- _0 9 * * * /ruta/script.sh_, Ejecutar script todos los días a las 9 am.

Para iniciar la programación de comandos usamos el comando : __crontab -e__, se abrirá el editor nano para añadir los comandos a ejecutar y en qué momento. Usaremos como ejemplo el comando:
- __*/5 * * * * * echo "Buenos dias" *>>* /home/ceacheristian/Curso_deployment/Deployment/saludo.txt__

Se ejecutarác cada 5 minutos, lo especificamos con una diagonal y el numero.

Almacenamos el comando en un archivo, especificando la ruta, para almacenarlo usamos el doble mayor que ( >> ).
Si no se especifica ningun valor en los asteriscos, crontab entiene que se va a ejecutar ese archivo cada minuto por siempre.

Para saber que comandos tiene crontab usamos la bandera: _crontab -l_.

También es posible ejecutar scripts de python o iniciar un servidor cada tanto tiempo o almacenar mensajes en un txt.

> Si se quiere guardar la impresion en consola de un archivo python que es ejecutado con crontab y no se especifica la ruta de donde se encuentra dicho archivo txt con los mensajes, por defecto será en /home/nombre_del_usuario.

## Zip
Para trabajar con archivos zip, debemos comprobar que si está en nuestro sistema con el comando: _zip_, sino se instala.
- Para generar un archivo zip a partir de otros archivos: _zip archivo.zip archivo-base_, especificamos el nombre que llevará el archivo zip y el archivo base de donde se creará el zip.
- Para comprimir una carpeta o fichero: _zip -r carpeta.zip carpeta-base_, usamos la bandera _-r_ denotando que va a ser una compreción de manera recursiva.
- Para conocer todos los elementos de un zip sin descromprimirlo: _zipinfo archivo.zip_.
- Para añadir nuevos elementos a un zip: _zip -u archivo.zip archivo-base_, usamos la bandera _-u_
- Para descomprimir: _unzip archivo.zip_

## Algunos comandos más
- _bc_: accederemos a una calculadora en la consola.
- _date_: conocemos la fecha actual __del sistema__. Con la bandera _-d ""_ podemos añadir o restar días: -d "+7 days".
- _sleep #_: pausamos la ejecución de un proceso a partir de un intervalo de tiempo.  Se debe especficiar un numero y si son segundos (s), minutos (m), horas (h), dias (d).