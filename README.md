# idac_xbee_bin
idac xbee binary

## INSTALAR OS:
1) Descargar Raspberry pi imager
2) seleccionar raspbian lite 32 bits
3) grabar la sd card
4) en la raiz de la sd crear un archivo sin extension llamado "ssh" , si esta en windows lo puede hacer creando un archivo de texto y borrando el .txt
5) Inserte la sd card a la rpi. 
conectese por ssh con :
 login:pi
 password:raspberry ( cambiarla despues)
 hostname:raspberrypi



6) Conectar el conversor  USB-Serial RS232 al puerto usb de la RPI. ver puertos con el comando `ls /dev/`

7) ir a la carpeta /idac_xbee_bin
8) copiar el comando `chmod +x install.sh`
9)
###############################################################################

Correr el instalador `./install.sh `
Este copia los archivos a la raiz del usuario  y le da los permisos al sistema.

###############################################################################





## OPCIONAL
### MODIFICAR ARGUMENTOS DE ENTRADA:
10) 
Si quiere modificar el baud rate o el tty -> ir a idac_xbee_bin/
    `sudo nano idac_xbee_serial.service`
    En la linea "ExecStart" modificar ttyUSB0 por ttyUSBx y 19200 por baudrate especifico a cambiar

Si quiere modificar argumentos de entrada del cliente ir a idac_xbee_bin/
    `sudo nano idac_xbee_client.service`
    
    En la linea "ExecStart" se pueden modificar los argumentos:
    
     - @param1 tiempo de transmisión. ( debe ser mayor o igual a 5 seg).
     - @param2 no usar ( default 0 )
     - @param3 url_server ( default null)
     - @param4 Auth_token ( default null)
    
     Luego:
    - correr de nuevo el instalador ./install
    - sudo reboot


11) se puede verificar los pid de los programas corriendo y el arbol con sudo systemctl status idac_xbee_client.service  y sudo systemctl status idac_xbee_serial.service ,
donde los PID deben estar fijos cada vez que se lanza el comando a menos que  un proceso no se haya levantado.

12) se puede verificar en ~/idac_xbee_bin deben estar todos los ejecutables.



email:thejbte@gmail.com
