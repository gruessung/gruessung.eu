+++
author = "Alexander Grüßung"
categories = ["docker", "nginx", "server", "selfhosted", "ghost"]
date = 2018-07-13T11:18:59Z
description = ""
draft = false
image = "/images/2018/07/frank-mckenna-252014-unsplash.jpg"
slug = "langsam-werde-ich-mit-docker-warm"
tags = ["docker", "nginx", "server", "selfhosted", "ghost"]
title = "Langsam werde ich mit Docker warm..."

+++

Vor einigen Wochen habe ich davon geschrieben, dass ich Ghost wieder aus seinem [Docker Container befreit](https://solardorf.eu/warum-ghost-jetzt-doch-auf-dem-herkommlichen-weg-lauft/) habe. 
Damals schrieb ich, dass mehrere Ghost Instanzen von Docker sich gegenseitig ausbremsten.
Doch das Problem lag garnicht an Ghost, wie sich in den letzten Wochen zeigte.
Das Problem war der nginx Reverse Proxy, der ebenfalls in einem Docker lief.

Meine aktuelle Konfiguration, mit der ich zu 100% zufrieden bin, sieht dementsprechend jetzt so aus:
Auf dem VPS läuft docker-ce, certbot und ein nginx. Letzterer dient ausschließlich als Reverse Proxy. Die Let's Encrypt Zertifikate, sowie die nginx Konfiguration, [verwalte ich mit einem kleinen Bash Script](https://meaju.de/dyA), was ich für meine Zwecke geschrieben habe.
Alles andere (Ghost, MariaDB, Jenkins, Portainer, ...) läuft in eigenen Docker Containern. Dabei achte ich darauf, dass alle Services, sofern diese mySQL nutzen, meinen MariaDB Container verwenden.

So...und das läuft einfach. Perfekt.

