#!/bin/bash

name=$1
pluginName=$2

echo goint to install $name

subPath=${name#*/}

prjName=${subPath%/*}

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

downloadFile=https://github.com/$name/archive/$suffix.zip
unzipFolderName=$prjName-$suffix

echo subPath: $subPath
echo prjName: $prjName
echo pluginName: $pluginName
echo suffix: $suffix
echo downloadFile: $downloadFile



cd _plugin

wget -O ${pluginName}.zip https://github.com/$name/archive/master.zip

unzip ${pluginName}.zip



mv $unzipFolderName/_site ./$pluginName


rm -r ${pluginName}.zip
rm -r $unzipFolderName