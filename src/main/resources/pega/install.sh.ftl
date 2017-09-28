#!/usr/bin/env sh

set -e

export JAVA_HOME=${deployed.container.javaHome}

echo "Installing Pega package"

if [ -f "${deployed.container.pegaHome}/scripts/utils/prpcUtils.properties" ]; then
	echo "${deployed.container.pegaHome}/scripts/utils/prpcUtils.properties already exists! Is another import running?"
	exit 1
fi

cp pega/prpcUtils.properties ${deployed.container.pegaHome}/scripts/utils/
cd ${deployed.container.pegaHome}/scripts/utils/
./prpcUtils.sh import
