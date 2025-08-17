#!/bin/bash
set -e

pushd ../audimance
if ! command -v nvm >/dev/null 2>&1; then
    if [ -s "$HOME/.nvm/nvm.sh" ]; then
        source "$HOME/.nvm/nvm.sh"
    fi

    nvm use
fi

npm run build
go generate
go build
go install
popd

~/go/bin/audimance -debug
