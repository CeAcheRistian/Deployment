# Shell script
## Introducción
Un shell script es un archivo que contiene una serie de comandos. Al ejecutarse el script, se ejecutarán todos los comandos que contenga. También se puede programar dentro de ellos, variables, ciclos, condiciones, funciones, ...

## Crear un script
Podemos crearlo usando el explorador de archivos o la terminal, con: _nano <>_, todos los archivos del tipo shell script tienen por extención sh.

Dentro del script, la primer linea es un __shebang (#!)__, con este par de simbolos indicamos el interprete que va a ejecutar el script, en nuestro caso usaremos: /bin/bash

Y listo, solo falta agregar los comandos a ejecutar.

Otorgamos permisos de ejecución, los más comunes son 755 y 700, recordando que los permisos de escritura, lectura y ejecución son para 3 grupos y cada numero tiene un significado. Usamos el comando _chmod 700_ para agregar permisos de ejecución,lectura y escritura para el autor.

Ejecutamos el script con : _./archivo.sh_ o con el interprete: _bash archivo.sh_. Los comandos se ejecutan  de forma descendente, es posible hacer referencia al mismo archivo dentro del script, ejemplo de ello sería un comando: _wc archivo.sh_, escrito dentro del mismo archivo.

## Variables
Para declarar una variable tenemos: __nombre=valor__, sin espacios en la sentencia. Para hacer uso de esta variable, anteponemos al nombre un signo de dolar: _$nombre_.

## Leer datos del teclado
Con el comando: __read (variable)__, leemos y almacenamos todo lo que el usuario introduzca via teclado, hasta que se presione enter. Después especificamos la variable donde se almacenará esta información.

El comando read tiene la opción o bandera _-p_, con la cual podemos imprimir un mensaje en consola, una similitud de la función input() de python: _read -p "mensaje" variable_

Con la opción: _-s_ el usuario no podrá ver lo que escribe, como al teclear la contraseña de un super-usuario. 
> Se recomienda hacer un salto de linea después de usar esta opción o se verá encimado: echo ""

## stdout
Para el standard output, podemos almacenar la salida de un proceso en una variable: _variable=$(comandos a ejecutar)_ 