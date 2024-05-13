#!/bin/sh

docker-compose -f docker-compose.prod.yml up -d -V --build

sleep 5s
# Prisma migrations
bun prisma db push
bun prisma migrate dev --name init
bun prisma generate
