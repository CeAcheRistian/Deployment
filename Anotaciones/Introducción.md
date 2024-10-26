# Fundamentos de unix programming
## Directorios
El file system es la estructura de los directorios o carpetas, poseen una estructura de árbil, los directorios pueden poseer hermanos, padres, abuelos. El directorio raíz o route siempre será _/_. De este se desprenden todos los subdirectorios del sistema.

### Comandos:
- __pwd__: Nos piermite saber la ruta donde los posicionamos actualmente
- __ls__: Mediante este comando podremos saber el contenido del directorio actual. 
  - _-l_: Con la bandera veremos más información, como la cantidad de archivos, su fecha de creación, quien lo creo, si se puede leer, editar o sobrescribir.
- __cd #__: Change directory es para movernos de directorio después del comando se debe especificar a donde te quieres mover.
    - Si colocamos un punto nos movemos a la carpeta padre, con dos puntos nos movemos al abuelo.
- __clear__: limpiamos la pantalla, también con  ctrl + l se hace lo mismo.
- __mkdir #__: Creamos una nueva carpeta, se debe especificar el nombre de la carpeta.
- __echo #__: Imprime con mensaje en consola, dentro de unas comillas dobles se especifica el mensaje.
    - Si colocamos el operador relacional _>_ almacenaremos en un archivo el mensaje. Si no existe, se crea, si existe, se remplaza.
- __cat #__: Conocemos todo el contenido de un archivo. Se debe especificar el nombre.
- __touch #__: Crea archivos, se especifica el nombre del archivo.
- __nano #__: Abre un editor de texto en la misma consola, se debe especficiar el nombre del archivo a editar.
- __head #__: Conocemos las primeras 10 lineas de un archivo.
- __tail #__: Conocemos la últimas 10 lineas del archivo.