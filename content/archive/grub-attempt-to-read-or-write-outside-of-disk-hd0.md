+++
author = "Alexander Grüßung"
date = 2018-03-31T16:55:57Z
description = "Die Fehlermeldung \"attempt to read or write outside of disk hd0\" prangte auf meinem Monitor."
draft = false
slug = "grub-attempt-to-read-or-write-outside-of-disk-hd0"
title = "[Update] GRUB \"attempt to read or write outside of disk hd0\""

+++

Ich habe mir auf eBay einen alten HP ProLiant MicroServer G7 N40L geschossen.

Für meine Bedürfnisse reicht der auch gut aus, dennoch habe ich ein interessantes Phänomen.

Wie üblich habe ich Debian als Grundsystem installiert. GRUB lief auch ganz normal durch. Ich habe nach einigen Installationsarbeiten den Server dann von seinem temporären Stellplatz abgekabelt und am vorgesehenen Standort aufgestellt. Power On. Nix. Keine Verbindung zum Netzwerk, nichts.

Also alles zurück an den Monitor und siehe da, GRUB fährt nur in den "rescue mode" hoch. 

Die Fehlermeldung **attempt to read or write outside of disk hd0** prangte auf meinem Monitor.
Als erstes dachte ich an einen Zufall und reparierte GRUB mit meiner Debian DVD. Zum Test nochmal neu hochgefahren, lief.
Also wieder umgestellt und wieder lief nichts. Selber Fehler.
Das Problem? Sobald der Server physisch vom Stromnetz getrennt wird, verliert GRUB seine Konfiguration.

Das hatte ich auch noch nie. 

Ein Beitrag auf  [askubuntu.com](https://askubuntu.com/a/398808) brachte mich dann auf eine Idee:

> 1. Create a 1 GB (1024 MB) ext4 partition on the **beginning** of the disk; mounted in "/boot"
> 2. Create your desired install space in ext4 mounted in "/" **MINUS your swap area**
> 3. Use remaining space for swap. (ALL partitions will be primary)
> 4. In the boot install dropdown menu, select your "/boot" partition. **Not the defaulted drive root!**

![IMG_20180331_185045](/content/images/2018/03/IMG_20180331_185045.jpg)

Ich bin gerade dabei Debian mit diesen Einstellungen neu zu installieren und hoffe natürlich auf Besserung!
Woran das genau liegt kann ich noch nicht sagen. Vielleicht komme ich ja noch drauf :D 

**[Update]**
Das ganze hat nicht wirklich was gebracht. Ein SMART Test lieferte das Ergebnis: kaputte Sektoren. Also doch die Platte hin :)

