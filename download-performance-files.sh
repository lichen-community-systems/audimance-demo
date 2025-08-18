#!/bin/bash

EXTENSIONS=("mp3" "webm")

download_files() {
    local base_url=$1
    shift
    local prefixes=("$@")

    for prefix in "${prefixes[@]}"; do
        for ext in "${EXTENSIONS[@]}"; do
            filename="${prefix}.${ext}"
            url="${base_url}/${filename}"

            if ! curl -f -s -S -O "$url"; then
                echo "Download failed: $filename"
                rm -f "$filename"
            fi
        done
    done

    echo "All files downloaded."
}

PERFORMANCE_CUES=(
    "1-0-a-a"
    "1-0-a-b"
    "1-0-a-d"
    "1-0-a-e"
    "1-0-a-g"

    "1-1-a-a"
    "1-1-a-b"
    "1-1-a-d"
    "1-1-a-e"
    "1-1-a-g"
    "1-1-b-a"
    "1-1-b-b"
    "1-1-b-d"
    "1-1-b-e"
    "1-1-b-g"

    "1-2-a-a"
    "1-2-a-b"
    "1-2-a-d"
    "1-2-a-e"
    "1-2-a-g"

    "1-3-a-a"
    "1-3-a-b"
    "1-3-a-d"
    "1-3-a-e"
    "1-3-a-g"
    "1-3-b-a"
    "1-3-b-b"
    "1-3-b-d"
    "1-3-b-e"
    "1-3-b-g"
    "1-3-c-a"
    "1-3-c-b"
    "1-3-c-d"
    "1-3-c-e"
    "1-3-c-g"

    "1-4-a-a"
    "1-4-a-b"
    "1-4-a-d"
    "1-4-a-e"
    "1-4-a-g"

    "1-5-a-a"
    "1-5-a-b"
    "1-5-a-d"
    "1-5-a-e"
    "1-5-a-g"

    "1-6-a-a"
    "1-6-a-b"
    "1-6-a-d"
    "1-6-a-e"
    "1-6-a-g"
    "1-6-b-a"
    "1-6-b-b"
    "1-6-b-d"
    "1-6-b-e"
    "1-6-b-g"

    "1-7-a-a"
    "1-7-a-b"
    "1-7-a-d"
    "1-7-a-e"
    "1-7-a-g"
    "1-7-b-a"
    "1-7-b-b"
    "1-7-b-d"
    "1-7-b-e"
    "1-7-b-g"

    "1-8-a-a"
    "1-8-a-b"
    "1-8-a-d"
    "1-8-a-e"
    "1-8-a-g"

    "1-9-a-a"
    "1-9-a-b"
    "1-9-a-d"
    "1-9-a-e"
    "1-9-a-g"
    "1-9-b-a"
    "1-9-b-b"
    "1-9-b-d"
    "1-9-b-e"
    "1-9-b-g"
    "1-9-c-a"
    "1-9-c-b"
    "1-9-c-d"
    "1-9-c-e"
    "1-9-c-g"

    "2-1-a-a"
    "2-1-a-b"
    "2-1-a-d"
    "2-1-a-e"
    "2-1-a-g"
    "2-1-b-a"
    "2-1-b-b"
    "2-1-b-d"
    "2-1-b-e"
    "2-1-b-g"
    "2-1-c-a"
    "2-1-c-b"
    "2-1-c-d"
    "2-1-c-e"
    "2-1-c-g"
    "2-1-d-a"
    "2-1-d-b"
    "2-1-d-d"
    "2-1-d-e"
    "2-1-d-g"

    "2-2-a-a"
    "2-2-a-b"
    "2-2-a-d"
    "2-2-a-e"
    "2-2-a-g"
    "2-2-b-a"
    "2-2-b-b"
    "2-2-b-d"
    "2-2-b-e"
    "2-2-b-g"
    "2-2-c-a"
    "2-2-c-b"
    "2-2-c-d"
    "2-2-c-e"
    "2-2-c-g"
    "2-2-d-a"
    "2-2-d-b"
    "2-2-d-d"
    "2-2-d-e"
    "2-2-d-g"

    "2-3-a-a"
    "2-3-a-b"
    "2-3-a-d"
    "2-3-a-e"
    "2-3-a-g"
    "2-3-b-a"
    "2-3-b-b"
    "2-3-b-d"
    "2-3-b-e"
    "2-3-b-g"

    "2-4-a-a"
    "2-4-a-b"
    "2-4-a-d"
    "2-4-a-e"
    "2-4-a-g"

    "2-5-a-a"
    "2-5-a-b"
    "2-5-a-d"
    "2-5-a-e"
    "2-5-a-g"
    "2-5-b-a"
    "2-5-b-b"
    "2-5-b-d"
    "2-5-b-e"
    "2-5-b-g"

    "3-0-a-d"
)

# mkdir -p media/performance
# pushd media/performance
# download_files "https://s3.cycore.io/kineticlight/wired/performance" "${PERFORMANCE_CUES[@]}"
# popd

# Download the static media files
PROGRAM_AUDIO=(
    "front-cover"
    "curators-notes"
    "curators-note-access-summary"
    "bios"
    "funders"
    "back-cover"
)

mkdir -p media/static
pushd media/static
download_files "https://s3.cycore.io/kineticlight/wired" "${PROGRAM_AUDIO[@]}"
popd
