#!/bin/sh

# ./$0 input-image prefix
parallel 'convert '"$1"' -resize {}x{} '"$2"'-{}x{}.png && pngwolf --in='"$2-{}x{}.png"' --out='"$2-{}x{}.png"'' ::: 32 64 128 256
