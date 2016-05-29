#!/bin/bash
if [ ! -f /usr/local/bin/helmc ] ; then
  curl -s https://get.helm.sh | bash
  sudo mv helmc /usr/local/bin/
fi
helmc repo add deis https://github.com/deis/charts
helmc fetch deis/workflow-rc1
helmc generate -x manifests workflow-rc1
helmc install workflow-rc1
