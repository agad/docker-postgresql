NAME:=postgresql
RUNNING:=$(shell docker ps | grep $(NAME) | cut -f 1 -d ' ')
DATA_DIR:=/srv/docker/postgresql

build:
        rm -rf $(DATA_DIR)
        mkdir -p $(DATA_DIR)
        cp ~/.init/postgresqlinit.sh ./scripts/postgresqlinit.sh
        docker build -t="postgresql" .
        rm ./scripts/postgresqlinit.sh

