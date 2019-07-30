Machine de dev sous docker

Pour construire l'image de dev : se placer à la racine du projet puis
``` bash
docker build -t registry.okina.fr/mosaic/chouette2-dev:1.0 -f dev/Dockerfile .
```

Puis pour l'utiliser :    
``` bash
docker stop chouette2-dev
docker rm chouette2-dev
docker run --name chouette2-dev \
    -p 3000:3000 \
    -v $PWD:/code \
    --link postgres_okina_ratp_dev:chouette-db \
    --link okina-back-base-ratpdev:chouette-iev \
    -e CHOUETTE_SMTP_HOST=xxxxxx \
    -e CHOUETTE_SMTP_PORT=xxxxxxx \
    -e CHOUETTE_SMTP_DOMAIN=okina.fr \
    -e CHOUETTE_SMTP_USER=xxxxxxxxx \
    -e CHOUETTE_SMTP_PASSWORD=xxxxxxxx \
    -e CHOUETTE_SMTP_SENDER=xxxxxxxx \
    -e CHOUETTE_DOMAIN_NAME=localhost \
    registry.okina.fr/mosaic/chouette2-dev:1.0
```

Les containers postgres_okina_ratp_dev et okina-back-base-ratpdev doivent être lancés avant de lancer la commande.