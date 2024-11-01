# Protocolo SSH
## Introducción
Protocolo de administración remota que permite a los usuarios poder gestionar servidores remotos de forma segura.

SSH utiliza el modelo cliente-servidor. Un cliente realiza peticiones al servidor y este responde a las peticiones. 

El protocolo SSH se basa en 3 principios clave, la __autenticación, cifrado e integridad__. Tanto el cliente como el servidor antes de enviar cualquier tipo de información, deben _autenticarse_. Al hacerlo se podrá mantener una conexión, la información transmitida a través de este protocolo debe ser _cifrada_, para que cualquier entidad externa al cliente o servidor no sepa que información se está transmitiendo. Esto mantiene la _integridad_ de los datos mandados y recibidos.

Estructura para la conexión a servidores remotos: __ssh (usuario)@(ip)__, podemos agregar al final la opcion: _-p_ que es el puerto que queremoa utilizar, por defecto es el puerto 22.

## Droplet en Digital Ocean
Creamos una cuenta en Digital Ocean, en el apartado de droplet se especifica que tipo de servidor queremos, el s.o y las características de rendimiento del pc, el país donde se encuentre el servidor y la autenticación por medio de una contraseña y listo.

Después de haberse creado, copiamos la dirección ip del servidor creado y en la terminal colocamos: __ssh root@(ip)__, la ip la sacamos de la página de digital ocean, solo existe un único usuario en este momento que es root. COlocamos la contraseña y estariamos en el servidor remoto.

Con los comandos: _whoami_ y _ip r_ podremos saber el usuario y la ip del servidor. Con el comando: _exit_ regresamos a la terminal de nuestra pc

## Crear usuario Unix
Con el comando: _adduser (nombre)_ podremos crear un nuevo usuario, con este usuario se harán los desplieguies por cuestion de seguridad. Rellenamos los campos que nos solicitan.

Para añadir al usuario al grupo de administradores: _usermod -aG sudo (nombre)_

Para cambiar entre usuarios: _su (nombre)_

Para comprobar que todo sale bien, nos autenticamos con el usuario y no con root.

## Autenticación por llaves
Se sustituye el uso de contraseñas por llaves SSH para la autenticación. Dentro de la carpeta oculta ssh. (En mi caso es ~/.ssh) Ejecutamos el comando: _ssh-keygen -t rsa -b 4096_, se usa el algoritmo rsa y la longitud del cifrado. Nos pregunta si vamos a almacenar esta llave y le damos a que si, nos pide una frase, puede ser vacia. Y listo, tendremos la llave pública y otra privada. Con este juego de llaves podremos autenticarnos con el servidor.

Enviamos las llaves al usuario creado en el servidor para logearnos con esas llaves: _ssh-copy-id (nombre)@(ip)_, nos pedirá la contraseña del usuario, nos logemamos como siempre: _ssh usuario@ip_ y listo.

Obligaremos al servuidor que todas las conexiones sean con llaves ssh. Ingresamos al archivo de configuración: _sudo nano /etc/ssh/sshd-config_, en el apartado de "PasswordAuthentication" escribimos que no, desabilitando la autenticación con contraseña, solo por llaves ssh.

Reiniciamos el servicio de ssh: _sudo service ssh restart_ y nos volvemos a autenticar.

## Autenticación por alias
Nuevamente ingresamos a la carpeta oculta .ssh dentro de la carpeta raíz. Crearemos un archivo para la configuración, ejecutamos: _sudo nano config_, dentro especificaremos todos los servidores con los que desemos autenticarnos. 

Primero colocamos el _Host_, que sería el alias del usuario del servidor, después como _Hostname_ la ip del servidor. Después _User_, el usuario del servidor, seguido de _PubKeyAuthentication_ y el valor de yes y  _IdentifyFile_, el directorio donde está la llave. Y listo, podremos autenticarnos con un alias para no tener que escribir el usuario y la ip. Tal cual:

Host alias  
Hostname la_ip  
User usuario_servidor  
PubKeyAuthentication yes  
IdentifyFile ~/.ssh.id_rsa

Para ingresar al servidor hacemos: _ssh alias_ y listo.

## Cargar archivos
Ejecutamos: _scp (archivo local) (alias):(directorio remoto)_, la parte de alias se puede sustituir por el usuario y la ip, si no se tiene un alias.

Con esto cargamos archvios al servidor.

## Descargar archivos
Usamos igualmente scp pero en orden diferente: _scp (alias):(directorio remoto) (directorio local)_

## Configuraciones de seguridad
Ingresamos al servidor y accedemos al archivo sshd_config, modificamos la variable _PermitRootLogin_ a no, para evitar problemas de seguridad, con _ClientAliveInterval_ colcoamos un tiempo máximo para que un usuario puede estar inactivo, colocamos 300, se toma como segundos. Y Añadimos la variable _AllowUsers_, definimos que usuarios pueden autenticarse con el servidor y acceder directamente a el, como valor colocamos el nombre del usuario del servidor. Reiniciamos el servicio de ssh: _sudo service ssh restart_ y nos volvemos a autenticar.

Se recomienda autenticarnos con otra terminal antes de salir, por si la configuración no quedó bien. Esto siempre que se modifiquen las configuraciones.