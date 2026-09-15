<div align="center">

<img src="./images/webserv-planche.png" width="100%" />
<br><br>
4 2 P a r i s · W e b s e r v

</div>

## 0 1 — P R O J E C T 

Webserv is a custom HTTP server that supports:

1. Handling multiple simultaneous clients
2. Parsing HTTP requests (`GET`, `POST`)
3. Serving static files with correct MIME types
4. Returning proper HTTP status codes for errors
5. Executing CGI scripts for dynamic content
6. Logging requests (optional)
   
## 0 2 — S K I L L S

- TCP/IP networking and socket programming
- HTTP request parsing and response handling
- Multi-client handling with `poll()`
- File serving and MIME types
- Error handling (400, 404, 500 HTTP errors)
- Basic server-side scripting support (CGI)


## 0 3 — S E T U P 

### Clone & Build
```bash
git clone https://github.com/Loreenbh/webserv.git
cd webserv
make
```
### Run the server
```bash
./webserv configs/default.conf
```
- Replace `configs/default.conf` with your own configuration if needed.
- Open a browser or use `curl` to test the server:
```bash
curl http://localhost:8080
```

### Example Usage
```bash
$ ./webserv configs/default.conf
Server started on port 8080
Client connected: 127.0.0.1
Request: GET /index.html HTTP/1.1
Response: 200 OK
```
