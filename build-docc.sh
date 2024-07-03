##!/bin/sh

xcrun xcodebuild docbuild \
    -scheme doctest \
    -destination 'generic/platform=iOS Simulator' \
    -derivedDataPath "$PWD/.derivedData"

xcrun docc process-archive transform-for-static-hosting \
    "$PWD/.derivedData/Build/Products/Debug-iphonesimulator/doctest.doccarchive" \
    --output-path ".docs" \
    --hosting-base-path "https://bilaldurnagol.github.io" # add your repo name later

echo '<script>window.location.href += "/documentation/doctest"</script>' > .docs/index.html
