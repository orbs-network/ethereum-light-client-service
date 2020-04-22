# Ethereum light client service

## Running

```
docker run -d --name eth-light -v $(pwd)/cache:/opt/orbs/cache -p 8545:8545 -p 30303:30303 orbsnetwork/ethereum-light-client-service
```

## Building

```
./docker-build.sh
```
