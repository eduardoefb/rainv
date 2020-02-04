#!/bin/bash

#export SERVER=eduabati@10.9.0.2
rm files.tar.gz 2>/dev/null
#pushd /home/eduabati/NetBeansProjects/Data2ExcelCli/ && ant && popd
#cp -v /home/eduabati/NetBeansProjects/Data2ExcelCli/dist/Data2ExcelCli.jar files/scripts/

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
git commit -a -m "radio_access_db_extractor"
git status
git push -u origin ra 
