#!/usr/bin/env bash
docker build -t notloadingdb .
docker run --rm --name notloadingdb -p 5432:5432 -e POSTGRES_USER=testing -e POSTGRES_PASSWORD=testing123 -e POSTGRES_DB=notloading -d notloadingdb