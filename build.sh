#!/bin/bash

if [ -z "${1}" ]; then
   echo "Usage:"
   echo "$0 <comit comment>"
   exit 1
fi

rm files.tar.gz 2>/dev/null
pushd /home/eduabati/NetBeansProjects/ParseXMLGeneral/ && ant && popd
cp -v /home/eduabati/NetBeansProjects/ParseXMLGeneral/dist/GetXmlInfo.jar files/scripts/

cp -rfvv /home/eduabati/NetBeansProjects/ParseXMLGeneral/dist/lib files/scripts/

pushd files
tar cvzf files.tar.gz *
mv files.tar.gz ../
popd

#Github
git init
git checkout ra 
git commit -a -m "${1}"
git status
git push -u origin ra 
