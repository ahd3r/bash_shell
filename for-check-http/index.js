const http = require('http');

let data = [];

http.createServer((req,res)=>{
    res.setHeader('Access-Control-Request-Origin','*');
    res.setHeader('Access-Control-Request-Methods', '*');
    
    if (req.method === 'GET') {
        // res.write(JSON.stringify(data)); // do not need to use write, because insert only one line, write use only when you need some line write in response by using 'sending'
        res.end(JSON.stringify(data));
    }
    if (req.method === 'POST') {
        req.on('data',(body)=>{
            console.log(JSON.parse(body.toString()));
        });
        if(!data.length){
            data.push({id:'1'});
            res.end(JSON.stringify({id:'1'}));
        } else {
            const lastId = data[data.length-1].id;
            const newElem = {id:(parseInt(lastId)+1).toString()};
            data.push(newElem);
            res.end(JSON.stringify(newElem));
        }
    }
    if (req.method === 'DELETE') {
        const id = req.url.slice(1);
        if (id) {
            const resIndex = data.findIndex(d=>d.id === id);
            if(resIndex===0 || resIndex){
                const resBody = data[resIndex];
                data.splice(resIndex, 1);
                res.end(JSON.stringify(resBody));
            }
        }
    }
    if (req.method === 'PUT') {
        req.on('data',(body)=>{
            console.log(JSON.parse(body.toString()));
        });
        res.end(JSON.stringify({msg:'I dunno what to say, so it is just a put request'}));
    }
    if (req.method === 'PATCH') {
        req.on('data',(body)=>{
            console.log(JSON.parse(body.toString()));
        });
        res.end(JSON.stringify({msg:'I dunno what to say, so it is just a patch request'}));
    }
    if (req.method === 'HEAD'/** It is like get, but in response no place for body */) {
        const id = req.url.slice(1);
        if (id) {
            const resIndex = data.findIndex(d=>d.id===id);
            if(resIndex){
                res.end();
            }
        }
    }
    if (req.method === 'OPTIONS' /** Response without body, but with header, where is options of responsing server (how and what it may to answer for you) (Just send set up of responsing server) */) {
        res.end(JSON.stringify(res.getHeaders()));
    }
    res.end(JSON.stringify({error:'Not Found. 404'}));
}).listen(4000, ()=>{
    console.log('Running on port 4000...');
});
