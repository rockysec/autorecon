1- RockyEnum.sh dominio.com toma datos con sublister / assetfinder, luego saca los duplicados del output y hace un test de dominios con http-prode

2- RockyResponse.sh alive.txt Toma response header de los host vivos mediante curl

3- RockyGetJS toma los archivos js del cuerpo del response

4- RockyGetURL.sh toma posibles endpoint nuevos en los js

5- RockyNmap.sh domains.txt realiza nmap a todos los host dominios

6- Aquatone toma screeshot a las paginas y toma informacion importante cat alive.txt | aquatone -out ~/example.com/screenshots/

7- RockySearch.sh -h Realiza una busqueda via expresion regular, usar comando -h
