# Suivi-de-ligne-virtuelle-par-QR-Code

## Sujet
Ce sujet consiste à réaliser une visualisation de trajectoire par certains QR codes via un robot mobile de l'entreprise Agile.x en utilisant une 
rgbd-caméra. Il demande d'implémenter une visualisation sous ROS des distances et des poses entre le robot et cette trajectoire à n'importe
quelle instant. 

## Planning(Diagram de gantt)


## Hypothse
A l'initialisation et à n'importe quelle position suivante de QR code, on supose que le camera peut observer au moins 2 QR codes(par exemple, un point et 
un point t+1). 

## Les processus
1. A l'initialisation, on place certains nombre de QR codes sous notre hypothèse.
2. Ensuite, on piloter manuellement un robot mobile pour scanner tous amers de QR codes.
3. De plus, on calcul et cherche un meuilleure trajectoire qui permet de passer tous les amers.
4. Finalement, on affiche ce resultat sous Rviz.

## Bibliographie
### 
