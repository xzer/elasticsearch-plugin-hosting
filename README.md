This tool can be used to install and host the old site plugins. Also, you do not need to enable http.cors on sever side, thus this tool is compatible with aws elasticsearch.

# Why this tool?

- shipped with an install script which can be used to install the old plugins more easily.
- out of box built-in reverse proxy to address http cors issue.

NOTE: you need nodejs to be installed at first.

# install plugin

at first, clone or download this reposioty

```
git clone git://github.com/xzer/elasticsearch-plugin-hosting.git
cd elasticsearch-plugin-hosting
```
then eg. to install head

```
./insall.sh mobz/elasticsearch-head
```

second parameter to specify plugin name to override the default name from install path (eg. HQ):

```
./insall.sh royrusso/elasticsearch-HQ hq
```

# start server

create your own servers.json, the key of json will be used as es server address to the plugins, and the value of key will be treated as the real es server address.

```
cp servers.sample.json servers.json
```bash

then create your own index file

```
cp index.sample.html index.html
```bash

edit the index.html to your own servers configuration, then start the hosting server at default port

```
npm install
./startPluginServer.sh
```bash

now access http://localhost:9100, you will get your customized index page

or at other port:

```
./startPluginServer.sh 9900
```




