[![Coverage Status](https://coveralls.io/github/exam-rncp/shipping/badge.svg?branch=main)](https://coveralls.io/github/exam-rncp/shipping?branch=main)
[![ci](https://github.com/exam-rncp/shipping/actions/workflows/main.yml/badge.svg)](https://github.com/exam-rncp/shipping/actions/workflows/main.yml)

# DEPRECATED: shipping
A microservices-demo service that provides shipping capabilities.

This build is built, tested and released by travis.

# Build

## Java

`mvn -DskipTests package`

## Docker

`GROUP=weaveworksdemos COMMIT=test ./scripts/build.sh`

# Test

`./test/test.sh < python testing file >`. For example: `./test/test.sh unit.py`

# Run

`mvn spring-boot:run`

# Check

`curl http://localhost:8080/health`

# Use

`curl http://localhost:8080`

# Push

`GROUP=weaveworksdemos COMMIT=test ./scripts/push.sh`
