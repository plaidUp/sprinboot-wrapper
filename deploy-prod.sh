#!/bin/bash

ssh -i public-site.pem -o StrictHostKeyChecking=no ec2-user@www.astontech.com -T <<"ENDSSH"

    sudo su
    cd /app/com.astontech.public.site
    git checkout master --force
    git pull
    mvn clean install -Pprod
    kill $(netstat -tlnp | awk '/:443 */ {split($NF,a,"/"); print a[1]}')

    cp -a /app/com.astontech.public.site/nohup.out "/app/logs/$(date +"%m.%d.%y_%r")_nohup.out"
    rm nohup.out -f

    nohup java -jar target/com.astontech.public.site-2.0.war &> /app/com.astontech.public.site/nohup.out & tail -f nohup.out

ENDSSH
