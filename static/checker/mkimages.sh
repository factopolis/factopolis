#!/bin/sh

# $0 input-image prefix

for s in 32 48 64 128 256; do
	convert $1 -resize ${s}x${s} $2-${s}x.png && \
	pngwolf --in=$2-${s}x.png --out=$2-${s}x.png
done
