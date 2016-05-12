#!/bin/bash
if [ ! -f /usr/local/bin/helmc ] ; then
  curl -s https://get.helm.sh | bash
  sudo mv helmc /usr/local/bin/
fi
helmc repo add deis https://github.com/deis/charts
helmc fetch deis/workflow-beta3
helmc generate -x manifests workflow-beta3
helmc install workflow-beta3
