#!/bin/bash

name=$1
pluginName=$2

echo goint to install $name

owner=${name%%/*}

subPath=${name#*/}

prjName=${subPath%%/*}

if [ X"" = X"$pluginName" ];
then
    pluginName=${prjName#elasticsearch-}
fi

suffix=${subPath#$prjName}
suffix=${suffix#/}

if [ X"" = X"$suffix" ];
then
    suffix="master"
fi

downloadFile=https://github.com/$owner/$prjName/archive/$suffix.zip
unzipFolderName=$prjName-${suffix/\//-}

echo owner: $owner
echo subPath: $subPath
echo prjName: $prjName
echo pluginName: $pluginName
echo suffix: $suffix
echo downloadFile: $downloadFile
echo unzipFolderName: $unzipFolderName

cd _plugin

wget -O ${pluginName}.zip $downloadFile

unzip ${pluginName}.zip



mv $unzipFolderName/_site ./$pluginName


rm -r ${pluginName}.zip
rm -r $unzipFolderName
