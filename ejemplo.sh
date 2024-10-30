#!bin/bash

nombre="Chris"
edad=27
echo "Hola" $nombre "tu edad es" $edad

echo "Ingresa tu nombre: "
read nombre
echo "Hola" $nombre

read -p "Ingresa tu edad: " edad
read -sp "Ingresa tu contrasenia: " password
echo ""
echo $password

stdout=$(wc ejemplo.sh)
echo $stdout

