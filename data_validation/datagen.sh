#!/bin/bash

openssl rand -out `hostname` -base64 $(( 10**9 * 3/4 ))
