# IPFSChef
IPFS stream

Install ffmpeg
mkdir stream

# Go dependencies
https://github.com/giorgisio/goav

```
$ go get github.com/giorgisio/goav
```

https://github.com/ipfs/go-ipfs#build-from-source

```
$ go get -u -d github.com/ipfs/go-ipfs

$ cd $GOPATH/src/github.com/ipfs/go-ipfs
$ make install
```

https://github.com/zencoder/go-dash

```
mkdir -p $GOPATH/src/github.com/zencoder
cd $GOPATH/src/github.com/zencoder
git clone https://github.com/zencoder/go-dash
cd go-dash
glide install
go install ./...
```
