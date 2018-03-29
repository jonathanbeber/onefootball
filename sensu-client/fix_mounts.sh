#!/bin/bash

for dir in $(gem env gempath | sed -e 's/:/ /g'); do
    if compgen -G "${dir}/*.rb" > /dev/null; then
        sed -i -e "s|/dev|$HOST_DEV_DIR|g" -e "s|/proc|$HOST_PROC_DIR|g" -e "s|/sys|$HOST_SYS_DIR|g" ${dir}/*.rb
    fi
done
