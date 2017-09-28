<#--

    Copyright 2017 XEBIALABS

    Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

    The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

    THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

-->
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
