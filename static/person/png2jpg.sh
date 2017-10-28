#!/bin/sh

# ./$0 basename

parallel guetzli {} {.}.jpg ::: "$1"-*.png && rm "$1"-*.png
