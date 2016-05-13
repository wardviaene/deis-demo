#!/bin/bash
if [ ! -f /usr/local/bin/deis ] ; then
  curl -sSL http://deis.io/deis-cli/install-v2.sh | bash
  sudo mv deis /usr/local/bin/
fi

