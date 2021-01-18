Script que escanea la red y lanza el ataque contra todos los dispositivos conectados.
Para realizar esta versión del ataque se debe de añadir a poc.py:
	import sys

y modificar v6_dst:
	v6_dst = sys.argv[1]


Para su ejecución:
	chmod +x BadNeighborImproved_vNetwork.sh
	./BadNeighborImproved_vNetwork
