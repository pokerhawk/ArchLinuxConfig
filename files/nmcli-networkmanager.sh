#!/bin/bash

clear
nmcli dev status
wait
nmcli radio wifi
wait
nmcli radio wifi on &&
wait
sleep 1
clear
#(timeout 3 nmcli dev wifi list)
output=$(nmcli dev wifi list;wait;2>&1)
echo "$output"
#echo "$output"|awk '{print $2}'
#echo "$output"|awk '{for(i=2;i<=NF;i++) printf "%s ", $i; printf "\n"}'
wait
#kill %1
echo -e "\n\n\n"
echo "Digite o nome da rede a ser conectada"
read network_name
wait
echo "Digite a senha da rede"
read network_password
wait
clear
echo -e "\n\n\n"
echo "Conectando..."
sudo nmcli dev wifi connect $network_name password $network_password
wait
echo "Conectado"
