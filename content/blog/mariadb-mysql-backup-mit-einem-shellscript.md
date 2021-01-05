+++
author = "Alexander Grüßung"
categories = ["mysql", "mariadb", "backup", "opensource"]
date = 2019-05-21T06:33:17Z
description = "Kurzes und schnelles Shellscript zum sichern von mySQL und MariaDB Datenbanken."
draft = false
image = "/images/2019/05/server-1235959_1920.jpg"
slug = "mariadb-mysql-backup-mit-einem-shellscript"
tags = ["mysql", "mariadb", "backup", "opensource"]
title = "MariaDB / mySQL Backup mit einem Shellscript"

+++

Kurz und schmerzlos hier ein Shellscript, um alle Datenbanken auf einem MariaDB / mySQL Server zu sichern:

```
#!/bin/bash

USER="root"
PASSWORD="Passw00rd"
HOST="localhost"
PORT=3306
OUTPUT="./db_backup"

#rm "$OUTPUTDIR/*gz" > /dev/null 2>&1

databases=`mysql -h $HOST --port=$PORT -u $USER -p$PASSWORD -e "SHOW DATABASES;" | tr -d "| " | grep -v Database`

for db in $databases; do
    if [[ "$db" != "information_schema" ]] && [[ "$db" != "performance_schema" ]] && [[ "$db" != "mysql" ]] && [[ "$db" != _* ]] ; then
        echo "Dumping database: $db"
        mysqldump -h $HOST --port=$PORT -u $USER -p$PASSWORD --databases $db > $OUTPUT/`date +%Y%m%d`.$db.sql
        #gzip $OUTPUT/`date +%Y%m%d`.$db.sql
    fi
done
```

Viel Spaß damit.

