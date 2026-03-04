#!/bin/bash

DISK=$(df / | awk 'NR==2 {print $5}' | tr -d '%')
echo $DISK


