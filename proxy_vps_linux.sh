#!/bin/bash
apt-get update
apt-get install squid3 -y
apt-get install figlet -y
apt-get install nano -y

clear

figlet JuanMRC
figlet CatchingVPN
sleep 4s

echo "Escriba La IP de su VPS ? (despues de escribirla presione enter y espere)"
read ip

hostname=$(hostname)

cd /etc/squid*

echo "http_port 81"  > squid.conf
echo "http_port 8080" >> squid.conf
echo "http_port 8000" >> squid.conf
echo "http_port 3128" >> squid.conf
echo "visible_hostname $hostname" >> squid.conf
echo "acl block url_regex -i zxc.pm" >> squid.conf
echo "acl block url_regex -i zxc.rm" >> squid.conf
echo "acl block url_regex -i vba.nz" >> squid.conf
echo "acl block url_regex -i vba.pw" >> squid.conf
echo "acl block url_regex -i .xyz" >> squid.conf
echo "acl block url_regex -i ddns.net" >> squid.conf
echo "acl accept url_regex -i $ip" >> squid.conf
echo "acl all src 0.0.0.0/0.0.0.0" >> squid.conf
echo "http_access deny block" >> squid.conf
echo "http_access allow accept" >> squid.conf
echo "http_access deny all" >> squid.conf

echo "http_port 81"  > squid3.conf
echo "http_port 8080" >> squid3.conf
echo "http_port 8000" >> squid3.conf
echo "http_port 3128" >> squid3.conf
echo "visible_hostname $hostname" >> squid3.conf
echo "acl block url_regex -i zxc.pm" >> squid3.conf
echo "acl block url_regex -i zxc.rm" >> squid3.conf
echo "acl block url_regex -i vba.nz" >> squid3.conf
echo "acl block url_regex -i vba.pw" >> squid3.conf
echo "acl block url_regex -i .xyz" >> squid3.conf
echo "acl block url_regex -i ddns.net" >> squid3.conf
echo "acl accept url_regex -i $ip" >> squid3.conf
echo "acl all src 0.0.0.0/0.0.0.0" >> squid3.conf
echo "http_access deny block" >> squid3.conf
echo "http_access allow accept" >> squid3.conf
echo "http_access deny all" >> squid3.conf

echo "Port 443" >> /etc/ssh/sshd_config

service ssh restart 

service squid3 restart

echo "Configuraciones Terminadas Ya Puede Crear Usuarios"

echo "Creador: JuanMRC" 
echo "Para agregar un usuário:"
echo "useradd -M -s /bin/false nombreuser" 
echo "Para Agregar Contraseña:"
echo "passwd  nombreuser"
echo "nombreuser (debe ser remplazado por el usuario que va a crear y que le agregara la contraseña)"