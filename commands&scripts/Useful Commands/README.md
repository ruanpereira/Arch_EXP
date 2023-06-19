#    NMCLI
## to connect to a wifi, if you don't have any GUI interfaces.

### To see the AP name (scan for networks)
```
$ nmcli dev wifi
```

### To connect (normal WPA2 passwords)
```
$ nmcli device wifi connect *APname* password *password*
```

### To connect (tls certificate connections WPA1)
First, we are gonna add the SSID, type of security, tipe of autentication, certification path, private-key path

```
$ nmcli connection modify *SSID-of-network* 802-1x.eap tls 802-1x.client-cert ~/*path*/*to*/*certificate* 802-1x.private-key ~/*path*/*to*/*certificate*
```
 after that, we are gonna save the certification
```
$ nmcli connection modify *SSID* 802-1x.ca-cert ~/*path*/*to*/*certificate*
```
 save your user, the identifier

```
$ nmcli connection modify *SSID* 802-1x.identity *your user*
```
and save the password
```
$ nmcli connection modify *SSID* 802-1x.private-key-password *password*
```

### for connecting
```
$ nmcli connection up *SSID* --ask
```
put your password, aaaaand done ><

##### htop #####

#see the process with 1s atualization
$ htop

##### route #####
#see all the kernel ip routing table
$ route


