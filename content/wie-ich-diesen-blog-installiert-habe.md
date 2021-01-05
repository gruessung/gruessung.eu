+++
author = "Alexander Grüßung"
categories = ["docker", "ghost", "opensource", "selfhosted", "server"]
date = 2018-02-22T17:52:17Z
description = "Wie du in 5 Minuten deinen Blog mit Ghost, Docker und Let's Encrypt installierst!"
draft = false
image = "/images/2019/03/hamburg-3021820_1280.jpg"
slug = "wie-ich-diesen-blog-installiert-habe"
tags = ["docker", "ghost", "opensource", "selfhosted", "server"]
title = "Docker + Ghost + Let's Encrypt"

+++

In meinem letzten Abriss schrieb ich, dass ich weniger Zeit mit der Administration meiner Blogsoftware verbringen will. Das stimmt nach wie vor.
Dennoch war die Installation dieses Blogs nicht ganz so einfach, wie ich mir das Anfangs vorgestellt habe.
Wenn man sich die [offizielle Anleitung](https://docs.ghost.org/docs/install) anschaut, wird man auch ersteinmal erschlagen.
Da ist die Installation von [WordPress](https://wordpress.org) doch um einiges einfacher!

#Aber...!
Ich habe mir letzten Monat einen vServer bei [Contabo](https://contabo.de) geholt, um dort ein wenig mit Docker zu experimentieren. Und eine Idee, die mich schon seit Monaten verfolgt, war eben der Umstieg auf Ghost als Blogplattform. Doch ist dies bei meinem Webspace Anbieter [All-Inkl.com](https://all-inkl.com) nicht möglich :( 

#Zwei Container
Da ich in Zukunft mehrere Projekt auf dem vServer laufen haben möchte, brauche ich für jedes Projekt eine eigene (Sub)Domain. Natürlich sollen diese über ein SSL Zertifikat verfügen. Ich bevorzuge da Let's Encrypt.
Also googlelte ich nach Möglichkeiten dies mittels Docker auch zu automatisieren. Denn das ständige Erzeugen der Zertifikate innerhalb der Container wäre mir auf Dauer zu aufwendig.
Da bin ich auf zwei Docker Container gestoßen, die meine Aufmerksamkeit erregt haben:
* jwilder/nginx-proxy
* jrcs/letsencrypt-nginx-proxy-companion

##nginx-proxy
Dieser Container beinhaltet einen nginx Webserver, welcher *alle* Anfragen von außen ersteinmal annimmt und dann, wie ein Proxy, an den korrekten Container auf den richtigen Port weiterleitet. 

##letsencrypt-nginx-proxy-companion 
Wird beim Aufruf festgestellt, dass eine SSL Verbindung benötigt wird, das Zertifikat aber abgelaufen (oder nicht vorhanden) ist, leitet dieser Container alles in die Wege, damit die entsprechende Domain ein Let's Encrypt Zertifikat erhält.

[![schema](https://github.com/JrCs/docker-letsencrypt-nginx-proxy-companion/raw/master/schema.png)](https://github.com/JrCs/docker-letsencrypt-nginx-proxy-companion)

#tl;dr Die Installation

## Erst der Proxy
Um das Grundgerüst aufzubauen müssen wir die zwei Container starten, die sich um die Domains kümmern:

Als erstes starten wir den nginx-proxy. Dieser lauscht nun auf Port 80 und 443 auf einkommende Anfragen. Dabei spielt es **keine Rolle**, ob euer Appcontainer auch diese Ports benutzt!
```
$ docker run -d -p 80:80 -p 443:443 \
    --name nginx-proxy \
    -v /path/to/certs:/etc/nginx/certs:ro \
    -v /etc/nginx/vhost.d \
    -v /usr/share/nginx/html \
    -v /var/run/docker.sock:/tmp/docker.sock:ro \
    --label com.github.jrcs.letsencrypt_nginx_proxy_companion.nginx_proxy \
    jwilder/nginx-proxy
```
Und als zweites den LE Container:

```
$ docker run -d \
    -v /path/to/certs:/etc/nginx/certs:rw \
    -v /var/run/docker.sock:/var/run/docker.sock:ro \
    --volumes-from nginx-proxy \
    jrcs/letsencrypt-nginx-proxy-companion
```
## Dann Ghost (oder ein anderer Container)
Um Ghost zu starten nutzen wir ganz einfach den folgenden Befehl, wobei ihr die Enviroment Variablen natürlich euren Bedürfnissen anpassen müsst:

```
$ docker run -d --name ghost_production -e VIRTUAL_HOST="solardorf.eu,www.solardorf.eu" -e VIRTUAL_PORT=2368 -e LETSENCRYPT_HOST="solardorf.eu,www.solardorf.eu" -e LETSENCRYPT_EMAIL="deine@mail.de" ghost
```
Achtet darauf, dass **VIRTUAL_HOST** und **LETSENCRYPT_HOST** den selben Inhalt haben!
**VIRTUAL_PORT** gibt an, auf welchen Port innerhalb des Containers die Anfragen von Port 80 und 443 weitergeleitet werden sollen. Bei Ghost ist dies standardmäßig Port 2368.

Das war es auch schon! So schnell läuft euer Ghost Blog mit Docker :)

_Kleiner Tipp: Mithilfe der vorgestellten Enviroment Variablen kannst du jeden Docker Container mit einer HTTPS Domain ansprechen :)_

Wenn euch dieser Artikel gefallen hat, [dann gebt mir doch was aus](https://paypal.me/agruessung/5) und abnonniert diesen Blog.

