pwd := $(shell pwd)

image:
	docker build -t moravianlibrary/cpk-ncip-proxy .

push: image
	docker tag moravianlibrary/cpk-ncip-proxy moravianlibrary/cpk-ncip-proxy:devel
	docker push moravianlibrary/cpk-ncip-proxy:devel

run:
	docker-compose up

shell:
	docker-compose exec squid sh

testme:
	env http_proxy=https://localhost:3129/  curl -X GET "http://httpbin.org/ip" -H "accept: application/json" --proxy-insecure
	env https_proxy=https://localhost:3129/  curl -X GET "https://httpbin.org/ip" -H "accept: application/json" --proxy-insecure


certs:
	openssl req -x509 -newkey rsa:4096 -keyout pki/squid.key -out pki/squid.pem -days 3650 -nodes -subj '/C=XX/O=Dummy Certificate/CN=localhost/'
