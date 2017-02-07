# install plugin

at first, clone this reposioty

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
./insall.sh mobz/elasticsearch-HQ hq
```

# start server

create your own index file

```
cp index.sample.html index.html
```

then start the hosting server at default port

```
./startPluginServer.sh
```

now access http://localhost:9100, you will get your customized index page

or at other port:

```
./startPluginServer.sh 9900
```

NOTE: you need python installed because the start shell uses python to service http.

#TODO

I wish there is a proxy server that can handle the api requests, which could allow us access the server without opening the cors option on ES server side.


