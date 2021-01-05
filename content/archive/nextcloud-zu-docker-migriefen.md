+++
author = "Alexander Grüßung"
date = 2018-10-22T12:32:50Z
description = ""
draft = true
slug = "nextcloud-zu-docker-migriefen"
title = "Nextcloud zu Docker migrieren"

+++

Schon lange war ich auf der Suche nach einer privaten Cloud und bin vor einem Jahr nun bei Nextcloud gelandet. Mir war auch ownCloud bekannt, doch früher schlicht zu instabil.

So installierte ich meine Nextcloud auf meinem Webspace bei all-inkl.com. Jetzt soll die Nextcloud mit auf den VPS wandern und gleichzeitig über einen Dockercontainer betrieben werden.

Zwar gibt es eine [Anleitung dafür auf github](https://github.com/nextcloud/docker#migrating-an-existing-installation), dennoch möchte ich hier einfach ein paar Notizen machen, wie ich die Migration durchgeführt habe. Vielleicht hilft es ja dem einen oder anderen in der Zukunft.

## Meine Konfiguration

Bevor wir starten möchte ich erst einmal meine aktuelle Konfiguration aufschlüsseln.

* Nextcloud: 14.x.x.x
* PHP: 7.x.x
* mySQL: x.x
* Aktivierte Apps: anzahl

Insgesamt müssen 4 Nutzer mit rund 100GB an Daten migriert werden. Im Vornherein habe ich bereits die Verschlüsselung deaktiviert. Dies geht auf der Konsole mit:

```
php occ encryption:decrypt-all
```

* max upload size im nginx proxy um http 413 zu verhindern
* kalender export über datenbank, ics import schlägt fehl
* apt-get updates && apt-get install cron -> vorsicht bei docker image updates!
* umstellen in einstellungen auf crontab
* 

