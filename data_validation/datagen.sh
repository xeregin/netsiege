#!/bin/bash

openssl rand -out `hostname`.0 -base64 $(( 10**8 * 3/4 ))
openssl rand -out `hostname`.1 -base64 $(( 10**8 * 3/4 ))
openssl rand -out `hostname`.2 -base64 $(( 10**8 * 3/4 ))
openssl rand -out `hostname`.3 -base64 $(( 10**8 * 3/4 ))
openssl rand -out `hostname`.4 -base64 $(( 10**8 * 3/4 ))
openssl rand -out `hostname`.5 -base64 $(( 10**8 * 3/4 ))
openssl rand -out `hostname`.6 -base64 $(( 10**8 * 3/4 ))
openssl rand -out `hostname`.7 -base64 $(( 10**8 * 3/4 ))
openssl rand -out `hostname`.8 -base64 $(( 10**8 * 3/4 ))
openssl rand -out `hostname`.9 -base64 $(( 10**8 * 3/4 ))
