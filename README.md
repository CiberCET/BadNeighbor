# BadNeighbor CVE-2020-16898

Se trata de una vulnerabilidad de diseño, que se fundamenta en un error del controlador de la pila TCP/IP de Windows, ***tcpip.sys***, que es un controlador de kernel. Entre otras cosas, esta pila analiza paquetes ICMPv6 de *Router Advisement* que utilizan la opción de servidor *DNS recursivo*. Cuando se recibe uno de estos paquetes con una longitud par, los últimos 8 bytes del paquete de DNS recursivo se interpretan erróneamente, concretamente como los 8 primeros bytes de una segunda opción, pudiendo así realizar un desbordamiento de búfer o *buffer overflow* (BO). 

Esto puede utilizarse tanto para ataques de **DoS** o denegación de servicio (que será nuestro caso, pues provocaremos un BSOD, afectando así a la **disponibilidad**), como para ataques de ejecución remota de código (RCE). Además, se cree que esta vulnerabilidad podría convertirse en wormable, de ahí su criticidad.


## ¿Qué versiones son vulnerables?
|Release date                                                                  |Product     |Platform         |Impact   |Severity|Article           |Download          |Details                                                              |
|------------------------------------------------------------------------------|------------|-----------------|---------|--------|------------------|------------------|---------------------------------------------------------------------|
|10/13/2020                                                                    |Windows Server, version 2004 (Server Core installation)|                 |Remote Code Execution|Critical|https://support.microsoft.com/help/4579311|https://catalog.update.microsoft.com/v7/site/Search.aspx?q=KB4579311|https://msrc.microsoft.com//update-guide/vulnerability/CVE-2020-16898|
|10/13/2020                                                                    |Windows 10 Version 2004 for x64-based Systems|                 |Remote Code Execution|Critical|https://support.microsoft.com/help/4579311|https://catalog.update.microsoft.com/v7/site/Search.aspx?q=KB4579311|https://msrc.microsoft.com//update-guide/vulnerability/CVE-2020-16898|
|10/13/2020                                                                    |Windows 10 Version 2004 for ARM64-based Systems|                 |Remote Code Execution|Critical|https://support.microsoft.com/help/4579311|https://catalog.update.microsoft.com/v7/site/Search.aspx?q=KB4579311|https://msrc.microsoft.com//update-guide/vulnerability/CVE-2020-16898|
|10/13/2020                                                                    |Windows 10 Version 2004 for 32-bit Systems|                 |Remote Code Execution|Critical|https://support.microsoft.com/help/4579311|https://catalog.update.microsoft.com/v7/site/Search.aspx?q=KB4579311|https://msrc.microsoft.com//update-guide/vulnerability/CVE-2020-16898|
|10/13/2020                                                                    |Windows Server, version 1903 (Server Core installation)|                 |Remote Code Execution|Critical|https://support.microsoft.com/help/4577671|https://catalog.update.microsoft.com/v7/site/Search.aspx?q=KB4577671|https://msrc.microsoft.com//update-guide/vulnerability/CVE-2020-16898|
|10/13/2020                                                                    |Windows 10 Version 1903 for ARM64-based Systems|                 |Remote Code Execution|Critical|https://support.microsoft.com/help/4577671|https://catalog.update.microsoft.com/v7/site/Search.aspx?q=KB4577671|https://msrc.microsoft.com//update-guide/vulnerability/CVE-2020-16898|
|10/13/2020                                                                    |Windows 10 Version 1903 for x64-based Systems|                 |Remote Code Execution|Critical|https://support.microsoft.com/help/4577671|https://catalog.update.microsoft.com/v7/site/Search.aspx?q=KB4577671|https://msrc.microsoft.com//update-guide/vulnerability/CVE-2020-16898|
|10/13/2020                                                                    |Windows 10 Version 1903 for 32-bit Systems|                 |Remote Code Execution|Critical|https://support.microsoft.com/help/4577671|https://catalog.update.microsoft.com/v7/site/Search.aspx?q=KB4577671|https://msrc.microsoft.com//update-guide/vulnerability/CVE-2020-16898|
|10/13/2020                                                                    |Windows 10 Version 1709 for ARM64-based Systems|                 |Remote Code Execution|Critical|https://support.microsoft.com/help/4580328|https://catalog.update.microsoft.com/v7/site/Search.aspx?q=KB4580328|https://msrc.microsoft.com//update-guide/vulnerability/CVE-2020-16898|
|10/13/2020                                                                    |Windows 10 Version 1709 for x64-based Systems|                 |Remote Code Execution|Critical|https://support.microsoft.com/help/4580328|https://catalog.update.microsoft.com/v7/site/Search.aspx?q=KB4580328|https://msrc.microsoft.com//update-guide/vulnerability/CVE-2020-16898|
|10/13/2020                                                                    |Windows 10 Version 1709 for 32-bit Systems|                 |Remote Code Execution|Critical|https://support.microsoft.com/help/4580328|https://catalog.update.microsoft.com/v7/site/Search.aspx?q=KB4580328|https://msrc.microsoft.com//update-guide/vulnerability/CVE-2020-16898|
|10/13/2020                                                                    |Windows Server, version 1909 (Server Core installation)|                 |Remote Code Execution|Critical|https://support.microsoft.com/help/4577671|https://catalog.update.microsoft.com/v7/site/Search.aspx?q=KB4577671|https://msrc.microsoft.com//update-guide/vulnerability/CVE-2020-16898|
|10/13/2020                                                                    |Windows 10 Version 1909 for ARM64-based Systems|                 |Remote Code Execution|Critical|https://support.microsoft.com/help/4577671|https://catalog.update.microsoft.com/v7/site/Search.aspx?q=KB4577671|https://msrc.microsoft.com//update-guide/vulnerability/CVE-2020-16898|
|10/13/2020                                                                    |Windows 10 Version 1909 for x64-based Systems|                 |Remote Code Execution|Critical|https://support.microsoft.com/help/4577671|https://catalog.update.microsoft.com/v7/site/Search.aspx?q=KB4577671|https://msrc.microsoft.com//update-guide/vulnerability/CVE-2020-16898|
|10/13/2020                                                                    |Windows 10 Version 1909 for 32-bit Systems|                 |Remote Code Execution|Critical|https://support.microsoft.com/help/4577671|https://catalog.update.microsoft.com/v7/site/Search.aspx?q=KB4577671|https://msrc.microsoft.com//update-guide/vulnerability/CVE-2020-16898|
|10/13/2020                                                                    |Windows Server 2019  (Server Core installation)|                 |Remote Code Execution|Critical|https://support.microsoft.com/help/4577668|https://catalog.update.microsoft.com/v7/site/Search.aspx?q=KB4577668|https://msrc.microsoft.com//update-guide/vulnerability/CVE-2020-16898|
|10/13/2020                                                                    |Windows Server 2019|                 |Remote Code Execution|Critical|https://support.microsoft.com/help/4577668|https://catalog.update.microsoft.com/v7/site/Search.aspx?q=KB4577668|https://msrc.microsoft.com//update-guide/vulnerability/CVE-2020-16898|
|10/13/2020                                                                    |Windows 10 Version 1809 for ARM64-based Systems|                 |Remote Code Execution|Critical|https://support.microsoft.com/help/4577668|https://catalog.update.microsoft.com/v7/site/Search.aspx?q=KB4577668|https://msrc.microsoft.com//update-guide/vulnerability/CVE-2020-16898|
|10/13/2020                                                                    |Windows 10 Version 1809 for x64-based Systems|                 |Remote Code Execution|Critical|https://support.microsoft.com/help/4577668|https://catalog.update.microsoft.com/v7/site/Search.aspx?q=KB4577668|https://msrc.microsoft.com//update-guide/vulnerability/CVE-2020-16898|
|10/13/2020                                                                    |Windows 10 Version 1809 for 32-bit Systems|                 |Remote Code Execution|Critical|https://support.microsoft.com/help/4577668|https://catalog.update.microsoft.com/v7/site/Search.aspx?q=KB4577668|https://msrc.microsoft.com//update-guide/vulnerability/CVE-2020-16898|
|10/13/2020                                                                    |Windows 10 Version 1803 for ARM64-based Systems|                 |Remote Code Execution|Critical|https://support.microsoft.com/help/4580330|https://catalog.update.microsoft.com/v7/site/Search.aspx?q=KB4580330|https://msrc.microsoft.com//update-guide/vulnerability/CVE-2020-16898|
|10/13/2020                                                                    |Windows 10 Version 1803 for x64-based Systems|                 |Remote Code Execution|Critical|https://support.microsoft.com/help/4580330|https://catalog.update.microsoft.com/v7/site/Search.aspx?q=KB4580330|https://msrc.microsoft.com//update-guide/vulnerability/CVE-2020-16898|
|10/13/2020                                                                    |Windows 10 Version 1803 for 32-bit Systems|                 |Remote Code Execution|Critical|https://support.microsoft.com/help/4580330|https://catalog.update.microsoft.com/v7/site/Search.aspx?q=KB4580330|https://msrc.microsoft.com//update-guide/vulnerability/CVE-2020-16898|


## ¿Qué necesitamos?

**Máquina virtual**
Necesitamos montar el laboratorio (Windows 10 v2004):
https://bit.ly/3nTxWNP

**Herramientas necesarias**

 1. Herramientas para el escaneo de la red: nmap, netscan, fing, etc. También podemos hacer uso de scripts de reconocimiento de dispositivos en la red local, como los que adjuntamos o los que ofrece nmap, por ejemplo.
 2. Consola de comandos e intérprete de python3 para ejecutar nuestro exploit.
 3. Se hace uso de la librería Scapy de python, que permite crear, modificar y enviar diferentes paquetes de red (IPv6, ICMPv6…)
 4. Herramientas para analizar el tráfico de red, como Wireshark, para poder ver e interpretar el tráfico de paquetes por la red (no es necesario para su explotación).
 5. Herramientas que nos permitan realizar ingeniería inversa sobre tcpip.sys para poder entender el funcionamiento de la pila (no es necesario para su explotación).

## ¿Cómo se ejecuta el exploit?
Para escanear la IPv6:
   

     sudo arp-scan --interface=eth0 –localnet
    ./ipv4a6.sh direccion_IPv4

Para ver nuestra propia IP:

 - Si es Windows:
   
       ipconfig 
 - Si es Linux:
   
       sudo ifconfig

Ejecutamos el exploit:

    sudo python3 poc.py


