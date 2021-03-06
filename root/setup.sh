#!/bin/bash

/start.sh

PORTS=(${HAPROXY_PORTS// / })

echo "Generating configuration templates..."
for portcfg in ${PORTS[*]}; do
  aport=(${portcfg//-/ })
  port=${aport[0]}
  cfg=${aport[1]}
  portpadded=$(printf "%04d" $port)
  porthigh="2${portpadded}"
  if [ ! -f "/opt/tools/confd/etc/conf.d/frontend_${port}.cfg.toml" ]; then
    sed -e "s/%port%/$port/g" /opt/tools/confd/etc.tmpl/conf.d/frontend_%port%.cfg.toml > /opt/tools/confd/etc/conf.d/frontend_${port}.cfg.toml
    if [ "$cfg" == "ssl" ]; then 
      sed -e "s/%port%/$port/g" -e "s/%porthigh%/$porthigh/g" -e "s/%ssl%/true/g" /opt/tools/confd/etc.tmpl/templates/10-frontend_%port%.cfg.tmpl > /opt/tools/confd/etc/templates/10-frontend_${port}.cfg.tmpl
    else 
      sed -e "s/%port%/$port/g" -e "s/%porthigh%/$porthigh/g" -e "s/%ssl%/false/g" /opt/tools/confd/etc.tmpl/templates/10-frontend_%port%.cfg.tmpl > /opt/tools/confd/etc/templates/10-frontend_${port}.cfg.tmpl
    fi
  else
    echo "Configuration for port $port already exists."
  fi
done
