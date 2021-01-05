+++
author = "Alexander Grüßung"
categories = ["opensource", "linux"]
date = 2020-04-01T10:00:00Z
description = ""
draft = false
image = "https://img.gruessung.eu/?f=1586074562.png"
slug = "bugdie-reparatur"
tags = ["opensource", "linux"]
title = "Bugdie reparieren"
+++

Heute morgen habe ich mit `sudo apt autoremove` mal wieder unnötige Pakete entfernt.

Dabei habe ich anscheinend mehr gelöscht, als mir lieb war und ich konnte mich nicht mehr in die grafische Oberfläche einloggen. Es kam immer folgende Meldung:

> Starten der grafischen Sitzung fehlgeschlagen.

Da ich etwas länge nach der Lösung suchen musste, möchte ich den einfachen Weg zum Glück mit euch teilen:

```sudo apt install --reinstall ubuntu-budgie-desktop budgie-desktop budgie-core gnome-control-center```

Und schon läuft wieder alles :)



