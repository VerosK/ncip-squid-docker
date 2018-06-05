pwd := $(shell pwd)

image:
	docker build -t mzk/ncip-proxy .


run:
	#docker-compose up
	docker run -it --rm -p 3128:3128 -p 3129:3129 --volume $(pwd)/config/squid.conf:/etc/squid/squid.conf -v $(pwd)/pki/:/etc/pki  mzk/ncip-proxy

run-sh:
	#docker-compose up
	docker run -it --rm --entrypoint sh --publish 3128 mzk/ncip-proxy

testme:
	ienv http_proxy=https://localhost:3129/  curl -X GET "https://httpbin.org/ip" -H "accept: application/json" --proxy-insecure

certs:
	openssl req -x509 -newkey rsa:4096 -keyout pki/squid.key -out pki/squid.pem -days 3650 -nodes -subj '/C=XX/O=Dummy Certificate/CN=dummy'
