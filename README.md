# btSearch A torrent search engine implemented in golang
<p align="center">
  <a href="https://pkg.go.dev/github.com/Bmixo/btSearch"><img src="https://pkg.go.dev/badge/github.com/Bmixo/btSearch" alt="PkgGoDev"></a>
  <a href="https://goreportcard.com/report/github.com/Bmixo/btSearch"><img src="https://goreportcard.com/badge/github.com/Bmixo/btSearch" alt="Go Report Card"></a>
  <a href="https://github.com/Bmixo/btSearch"><img src="https://img.shields.io/badge/License-Apache-green.svg" alt="License: Apache"></a>
</p>
<br>

<div align="center">
<strong>
<samp>

[English](README.md) · [简体中文](README_CN.md)

</samp>
</strong>
</div>

## 1.Web Interface

![image](https://raw.githubusercontent.com/Bmixo/btSearch/master/example/index_old.png)
![image](https://raw.githubusercontent.com/Bmixo/btSearch/master/example/index.PNG)
![image](https://raw.githubusercontent.com/Bmixo/btSearch/master/example/detail.PNG)

## 2.Program Architecture

Name   |  Usage
|------------:|-----------
server |  Collect torrent data
worker |  Collect hash information
web    |  Data Display
Tool   |  tools

![image](https://raw.githubusercontent.com/Bmixo/btSearch/master/example/framework.png)

## Notice:
1.The project uses the reuseport system feature to monitor the port, please keep the new linux kernel version (above 4.9)

2.The docker one-click installation is only for development testing and demonstration program functions, and should not be used in the production environment.

3.To use this program in production environment, the author assumes that all users will use Golang, please Fork any version of the master branch code for development, and do not merge the subsequent main branch code. The master branch code does not guarantee that incompatible changes will not be made.

## Installation (docker one-click installation)：
```
git clone https://github.com/Bmixo/btSearch.git && cd btSearch/docker && docker-compose up 
```
After waiting for a while for the system to initialize, start collecting data. The program web interface is available at http://127.0.0.1:8080

## Dependent environment
* Make sure the server running the program is reachable by hosts outside the Internet
* Recommended server hardware configuration: 16 cores 3.8Ghz 32G memory
```
apt update
apt install curl git docker.io -y
```



## Set Elasticsearch default tokenizer to ik tokenizer (optional)

```
curl --user elastic:changeme -XPUT http://localhost:9200/bavbt -H 'Content-Type: application/json'
curl --user elastic:changeme -XPOST 'localhost:9200/bavbt/_close'
curl --user elastic:changeme -XPUT localhost:9200/bavbt/_settings?pretty -d '{
"index":{
"analysis" : {
            "analyzer" : {
                "default" : {
                    "type" : "ik_max_word"
                }
            },
			"search_analyzer" : {
                "default" : {
                    "type" : "ik_max_word"
                }
            }
        }
    }
}'
curl --user elastic:changeme -XPOST 'localhost:9200/bavbt/_open'
```

## TODO

- [ ] impl admin dashboard BI data display
- [x] provide docker image
- [ ] Provide k8s high availability deployment solution (mongodb sharding + stateless load balancing master + etcd)
- [ ] gin migrate to iris
- [x] Switch to the official mongodb driver
- [ ] support postgres and mysql






