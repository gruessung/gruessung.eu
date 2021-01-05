+++
author = "Alexander Grüßung"
categories = ["faq", "datenbank", "opensource"]
date = 2020-04-24T22:00:00Z
description = ""
image = "/uploads/kevin-ku-w7ZyuGYNpRQ-unsplash.jpg"
slug = ""
tags = []
title = "mysqldump: Unknown table 'COLUMN_STATISTICS' "

+++
Heute erhielt ich mit mysqldump folgenden Fehler:

> Unknown table 'COLUMN_STATISTICS' in information_schema (1109)

Dies ist einfach mit folgender Option für mysqldump zu umgehen:

    --column-statistics=0