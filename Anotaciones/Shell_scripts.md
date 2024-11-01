# Shell script
## Introducción
Un shell script es un archivo que contiene una serie de comandos. Al ejecutarse el script, se ejecutarán todos los comandos que contenga. También se puede programar dentro de ellos, variables, ciclos, condiciones, funciones, ...

> Todos los ejercicios se encuentran en __../ejemplo.sh__
## Crear un script
Podemos crearlo usando el explorador de archivos o la terminal, con: _nano <>_, todos los archivos del tipo shell script tienen por extención sh.

Dentro del script, la primer linea es un __shebang (#!)__, con este par de simbolos indicamos el interprete que va a ejecutar el script, en nuestro caso usaremos: /bin/bash

Y listo, solo falta agregar los comandos a ejecutar.

Otorgamos permisos de ejecución, los más comunes son 755 y 700, recordando que los permisos de escritura, lectura y ejecución son para 3 grupos y cada numero tiene un significado. Usamos el comando _chmod 700_ para agregar permisos de ejecución,lectura y escritura para el autor.

Ejecutamos el script con : _./archivo.sh_ o con el interprete: _bash archivo.sh_. Los comandos se ejecutan  de forma descendente, es posible hacer referencia al mismo archivo dentro del script, ejemplo de ello sería un comando: _wc archivo.sh_, escrito dentro del mismo archivo.

>Si tienes un editor de texto como vsc, haste un favor y usalo, no hay necesidad de editar el archivo con nano.

## Variables
Para declarar una variable tenemos: __nombre=valor__, sin espacios en la sentencia. Para hacer uso de esta variable, anteponemos al nombre un signo de dolar: _$nombre_.

## Leer datos del teclado
Con el comando: __read (variable)__, leemos y almacenamos todo lo que el usuario introduzca via teclado, hasta que se presione enter. Después especificamos la variable donde se almacenará esta información.

El comando read tiene la opción o bandera _-p_, con la cual podemos imprimir un mensaje en consola, una similitud de la función input() de python: _read -p "mensaje" variable_

Con la opción: _-s_ el usuario no podrá ver lo que escribe, como al teclear la contraseña de un super-usuario. 
> Se recomienda hacer un salto de linea después de usar esta opción o se verá encimado: echo ""

## stdout
Para el standard output, podemos almacenar la salida de un proceso en una variable: _variable=$(comandos a ejecutar)_ 

## Condicionales
sintaxis:

if [[ condicion ]]; then  
    (comandos)  
else  
    (otros comandos)  
fi

> Se debe respetar los espacios y las tabulaciones o no correrá

Para evaluar en shell script tenemos 4 formas: _(), (()), [], [[]]_. Dependera su uso del tipo de dato a evaluar y la versión de bash utilizada, se recomienda el uso de doble corchete [[]].

Para strings usamos  los operadores de siempre: _==, !=_. Para los enteros usamos: _>, <, >=, <=, ==, !=_.
PERO, al estar en un shell script, lo recomendado es usar comandos: gt (>), lt (<), ge (>=), le (<=), eq (==), ne (!=). Cada comando tiene el prefijo: (-) como si de una bandera se tratase. Ejemplo: if [[ 5 -ne 10 ]]

También se puede usar operadores lógicos and y or: &&, ||

## Ciclos
### For
sintaxis:

for (variable) in (colección)
do
    (comandos)
done

Las operaciones aritmeticas van dentro de: _$((operacion))_ si vamos a usar una variable dentro de esta operación, ya no es necesario que se coloque el signo de dolar porque ya se colocó.

Ejemplo: $(( numero % 5 ))

### While
sintaxis:

while (condicion); do
    (comandos)
done

Casi lo mismo.

Para modificar el valor de una variable que ya existe, usamos la palabra reservada: _let "nuevo-valor"_. Ejemplo: let "contador=contador+1"

## Argumentos
Los argumentos se pasan al momento de ejecutar el programa: __bash ejemplo.sh argumento1 argumento2__. Estos se utilizarán dentro del bash script.

Para obtener sus valores podemos obtenerlos por medio de su posición: _$1_ para el primer argumento, _$2_ para el segundo argumento y así. La posición 0 es el archivo que se ejecuta

Para obtener todos los argumentos usamos: _$@_ con esto obtenemos una colección de argumentos. Se puede iterar directamente de los argumentos de esta manera.