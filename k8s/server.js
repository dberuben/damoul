var http = require('http');

http.createServer(function (req, res) {
  res.writeHead(200, {'Content-Type': 'text/html'});
  res.end("<!DOCTYPE html><html><head></head><body><h1>SSENSE : Hello World DevOps Power MothaFucka</h1></body></html>\n");
}).listen( 80 );

console.log('Server running on port ' + 80);
