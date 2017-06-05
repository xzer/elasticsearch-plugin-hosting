const express = require('express');
const app = express();
const path = require('path');
const proxy = require('http-proxy-middleware');
const fs = require('fs');


const servers = JSON.parse(fs.readFileSync("servers.json"));


app.get('/', function(req, res) {
  res.sendFile(path.join(__dirname + "/index.html"));
});

const plugin = __dirname + "/_plugin/";
app.use('/_plugin', express.static(plugin));

/*

var router = express.Router();

router.all('/:target/*', function(req, res) {
    var apiProxy = proxy('http://127.0.0.1/es/'+req.params.target);
    res.send('hello ' + req.params.target + '!');
});
*/

for(let serv in servers){ 
    const ctxPath = '/es/' + serv; 
    const proxyDef = {
        target: servers[serv], 
        pathRewrite: {},
        changeOrigin: true
    };
    proxyDef.pathRewrite['^'+ctxPath] = '';// remove ctx path
    
    app.use(ctxPath, proxy(proxyDef));
}

let port = process.argv[2]

if(!port){
    port = 9100;
}

console.log('server is listening at ', port);

app.listen(port);
