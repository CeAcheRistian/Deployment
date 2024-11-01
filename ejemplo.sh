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

## Condicionales
read -p "Tu nombre: " username

if [[ $username == "Chris" ]]
then
	echo "Hola Chris"
else
	echo "Hola usuario"
fi

read -p "Tu edad: " edad
if [[ $edad -le 18 ]]; then
	echo "jaja, eres menor de edad."
else
	echo "jaja, ya estás viejo."
fi

## Ciclo FOR
for num in 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15; do
	if [[ $(( num % 3 )) -eq 0 && $(( num % 5 )) -eq 0 ]]; then
		echo "fizzbuzz"
	else
		if [[ $(( num % 3 )) -eq 0 ]]; then
			echo 'fizz'
		else
			if [[ $(( num % 5 )) -eq 0 ]]; then
				echo "buzz"
			else
				echo $num
			fi
		fi
	fi
done

## Argumentos
for arg in $@; do
	echo $arg
done
echo "argumento 1: " $1