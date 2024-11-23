#!/bin/bash
for i in {0..255}; do echo -e "\033[48;5;${i}mColor ${i}\033[0m"; done
