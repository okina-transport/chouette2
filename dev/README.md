Machine de dev sous docker

docker run --name chouette2-dev \
    -p 3000:3000 
    -v $PWD:/code 
    --link postgres_chouette_mosaic:chouette-db
    --link container_chouette-iev:chouette-iev