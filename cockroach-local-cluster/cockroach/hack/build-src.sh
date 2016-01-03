#!/bin/sh

GOPATH=$(pwd)/build
go get -d github.com/cockroachdb/cockroach
pushd $GOPATH/src/github.com/cockroachdb/cockroach
make build
popd
cp $GOPATH/src/github.com/cockroachdb/cockroach/cockroach bin/cockroach
# Because github doesn't allow to upload over 100MB file, scp to my file server. Please this line.
scp $GOPATH/src/github.com/cockroachdb/cockroach/cockroach fedorapeople:/home/fedora/kenjiro/public_html/misc/cockroach
