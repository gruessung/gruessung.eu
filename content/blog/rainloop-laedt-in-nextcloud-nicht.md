+++
author = "Alexander Grüßung"
categories = ["nginx", "selfhosted", "nextcloud", "rainloop", "docker", "opensource"]
date = 2018-10-30T10:25:26Z
description = ""
draft = false
image = "/images/2018/10/safety-2890768_1920.jpg"
slug = "rainloop-laedt-in-nextcloud-nicht"
tags = ["nginx", "selfhosted", "nextcloud", "rainloop", "docker", "opensource"]
title = "RainLoop lädt in Nextcloud nicht"

+++

Ich habe meine Nextcloud vor ein paar Tagen in einen Docker Container migriert. Dabei ist mir aufgefallen, dass mein Let's Encrypt Snippet einen inhaltlichen Fehler hat.

Ich setze für jeden neuen vHost folgende Einstellung:

```
add_header X-Frame-Options DENY;
```

Dies führte bei dem RainLoop Plugin für Nextcloud nun zu dem Problem, dass der iFrame nicht geladen wurde, da Nextcloud per PHP ein

```
X-Frame-Options SAMEORIGIN
```

sendet.

Daher habe ich mein Snippet für Let's Encrypt angepasst und setze nun auch dort SAMEORIGIN.

[Mein Script auf Github Gist ist ebenfalls aktualisiert.](https://gist.github.com/gruessung/8aa6746e4a5ba559ee7720829592d40d)

