# Squid as NCIP proxy

## How to test

    # build docker image
    make image

    # prepare fake PKI certs
    make certs

    # run container
    make run

    # try to access httpbin through proxy
    env http_proxy=https://localhost:3129/  curl -X GET "https://httpbin.org/ip" -H "accept: application/json" --proxy-insecure

## How to add user account

    htpasswd config/passwd login
