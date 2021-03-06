#!/bin/bash

. ./config
FILE="backup-tools_${VERSION}_all"

mkdir -p builds

rm -f ./builds/*.deb
rm -f ./builds/*.rpm

fakeroot dpkg-deb --build ./deb ./builds/${FILE}.deb

cd builds

lintian ./${FILE}.deb
#fakeroot alien --to-rpm --scripts ./${FILE}.deb > /dev/null
fakeroot alien --keep-version --to-tgz --scripts ./${FILE}.deb  > /dev/null
#mv backup-tools-${VERSION_FAKE_TGZ}.tgz backup-tools-${VERSION}.tgz
echo "Save as backup-tools"

cd ..