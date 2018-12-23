#!/bin/sh

set -ex

MONGO="${MONGODB_SERVER:-"mongo"}"
pritunl set-mongodb "mongodb://$MONGO:27017/pritunl"
pritunl start