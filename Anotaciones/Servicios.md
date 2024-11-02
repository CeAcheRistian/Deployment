# Servicios
> Todo lo que ocurre en la consola es dentro del servidor, no en local.
## Introducción
__Systemd__ es el encargado de gestionar todos los servicios en el sistema operativo cuando el kernel inicia. Pero no es un estándar global, esto es en las versiones recientes.

Systemd trabaja con _unidades_, objetos que contienen instrucciones sobre cómo iniciar tareas comunes, como lo pueden ser los demonios. Además no spermiten almacenar dependencias que pueden ser utilziadas por otras unidades.

Existen diferentes tipos de unidades:
- Service units
- Target units
- Socket units
- Mount units

Como administradores usaremos la interfaz: __Systemctl__, con la cual podremos interactuar con Systemd.

Comandos más últiles:
- sysmctl list-units 
- sysmctl start (unidad)
- sysmctl stop (unidad)
- sysmctl restart (unidad)
- sysmctl status (unidad)

## Crear demonios
Creamos un script con la fecha actual, importamos datetime y time y dentro del if name = main, tenemos un bucle infinito donde llamamos a now y a strftime para darle el formato (Y,m,d H:M:S). Abrimos el archivo donde se almacenarán las fechas, con append claro, y escribirmos la fecha con el formato y un salto de linea. Dormimos el proceso durante 5 segundos.

Ejecutamos: _sudo nano /etc/systemd/system/(nombre servicio).service_ creamos un servicio. Dentro hay tres apartados [Unit], [Service] e [Install] Son como encabezados que todo archivo del tipo servicio debe tener, debajo de Unit usaremos la varaible _Description=_ y le damos una descripcion sencilla del servicio. Debajo de Service, indicamos con la varaible _WorkingDirectory=_ la ruta donde se encuentra nuestro archivo py, con  _ExecStart=_ indicamos el comando que ejecutamos, como: python3 archivo.py. Debajo de Install, la variable _WantedBy=default.target_ indicando que se va a iniciar cuando el sistema inicie.

Para iniciar el servicio llamamos a __Systemctl__ con: _sudo systemctl enable (nombre servicio)_ y lo iniciamos con: _sudo systemctl start (nombre servicio)_, para verificar si todo va bien: _sudo systemctl status (nombre servicio)_, nos debe indicar que está activo y en ejecución. Para deterlo cambiamos status por stop en el comando.

Si queremos modificar algo del archivo .service, lo editamos. Vemos lo reiniciamos, checamos el status, lo finalizamos y al finalizar ejecutamos el comando: _sudo systemctl daemon-reload_

## Journald
Herramienta que es un servicio encargado de almacenar todos los _logs_ de todos los servicios. Es una base de datos centralizadas de logs. La información se amacena en archivos binarios en el directorio /run/log/format. Con la interfaz __Journalctl__ podremos interactuar con Journald. Muy similar que systemd y systemctl pero con logs.

## Módulo logging
Es un módulo de python para testear el código, es la sustitución a los prints en consola para saber que el código va bien. EL módulo logging maneja 5 tipos de mensajes:

- debug (10): permiten testear cierta parte del código
- info (20): los mensajes normales en el flujo de ejecución
- warning (30): mensajes de alerta
- error (40): errores como exepciones
- critical (50): alertas de que algo fallo y no se puede continuar.

Depende de las necesidades se usará el tipo de mensaje. Tal cual se sustituye un print por un: __logging.debug()__ o por un __logging.info()__, ... Obviamente se debe importar el módulo. 

Cada tipo de mensaje tiene un número asociado que es su importancia, debug es 10, info 20, ... critical 50. Siendo critical el más importante, esto es importante ya que logging está configurado  para mostrar solo mensajes en consola con un nivel 40 o 50. Para cambiar esta configuración hacemos: __logging.basicConfig(level=(##))__ modificamos la configuración para que sí muestre los mensajes del tipo que queremos, especificando el numero del nivel desde el cual se mostraran los mensajes. O mejor aún, le pasamos una constante _level=logging.DEBUG_ para que se lea mejor.

Dentro de la llamada de la configuración, exite otro parámetro: _format=_ con el cual podemos modificar el formato que se visualiza en la consola, para conocer el tipo de mensaje y el mensaje: _'%(levelname)s - %(message)s'_, para la fecha exacta de impresión: _asctime_, nombre del hilo: _threadName_, nombre del proceso: _processName_.

Para almacenar todos los mensajes creados en un archivo, usamos otros dos paráemtros: _filename='nombre-archivo.log'_ y _filemode='a'_. Especificando el nombre del archivo para los logs y el tipo de escritura. 

## Scipts pt 2

