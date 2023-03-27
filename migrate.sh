#!/bin/sh

#database="postgres://postgres:password@db/greenlight?sslmode=disable"          

#funcionou apenas pelo ip
#para descobrir o ip do container do postgres:
# comando: docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' postgres

database="postgres://postgres:password@172.21.0.2/greenlight?sslmode=disable"          
migrations_dir="./migrations"


case "$1" in
    migration-create)
        cd greenlight
        migrate create -dir $migrations_dir -ext=sql -seq $2
        ;;
    migrations-up)
        cd greenlight
        migrate -database $database -path=$migrations_dir up
        ;;
    migrations-down)
        cd greenlight
        migrate -database $database -path=$migrations_dir down
        ;;
    *)
    
        echo "Usage: $0 {migration-create <name> | migrations-up}"
        exit 1
        ;;
esac

exit 0  

