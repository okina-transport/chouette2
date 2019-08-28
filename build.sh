#!/usr/bin/env bash
VERSION=1.4
docker build -t registry.okina.fr/mosaic/chouette2:${VERSION} .
docker push registry.okina.fr/mosaic/chouette2:${VERSION}