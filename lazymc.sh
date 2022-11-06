#!/bin/sh

echo 'Starting lazymc'
echo 'Checking whether configuration exists... '

if test -f "/lazymc/lazymc.toml"; then
    echo "Config found, handing command over to lazymc!"
else
    echo "It doesn't! Generating..."
    lazymc config generate
    echo "If it doesn't work, please look into the documentation of lazymc to see how to generate or adapt the config."
fi

# Update start command to run docker instead
sed -i '/command = /s/".*"/"docker start '"$MC_CONTAINER_NAME"'"/' /lazymc/lazymc.toml

lazymc
