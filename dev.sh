#!/bin/bash

pushd ../audimance
npm run build
go generate
go build
go install
popd
~/go/bin/audimance -debug
