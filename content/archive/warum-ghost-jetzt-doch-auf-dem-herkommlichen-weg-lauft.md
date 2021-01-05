+++
author = "Alexander Grüßung"
date = 2018-02-27T08:16:10Z
description = ""
draft = false
slug = "warum-ghost-jetzt-doch-auf-dem-herkommlichen-weg-lauft"
title = "Warum Ghost jetzt doch auf dem herkömmlichen Weg läuft..."

+++

Vor einigen Tagen habe ich eine kleine Anleitung veröffentlicht, wie du relativ einfach einen [Ghost Blog mit Docker installieren](https://solardorf.eu/2018/02/22/wie-ich-diesen-blog-installiert-habe/) kannst. Zum Testen der Software ist das sicher immernoch eine super Lösung! Das möchte ich garnicht in Frage stellen.

Ich habe jedoch gemerkt, dass bei mehreren Installationen schlicht die Performance leidet, weil eben Docker noch mit werkelt. Ständig kam es zu HTTP 502 Fehlern, weil das Backend einfach nicht rechtzeitig reagiert hat. Das hat genervt.

Daher habe ich, zum Test, jetzt beide Ghost Instanzen ohne Docker installiert.
Als Webserver kommt wieder der NGINX zum Einsatz, welchen ich, wieder, als Reverse Proxy konfiguriert habe. Aber eben dieses mal ohne Docker.

Die Reaktionszeiten der Blogs können sich jetzt echt sehen lassen. Auch dieser Blog hier läuft jetzt "standalone" und ist merklich schneller geworden. Eine zweite Testinstallation mit aktuell rund 400 Blogposts (importiert aus Wordpress) läuft ebenfalls super schnell.

Also: Das ist der Grund, warum ich Ghost nun doch ohne Docker laufen lasse.

