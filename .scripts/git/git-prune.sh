#!/bin.sh
# Source: https://gitbetter.substack.com/p/automate-repetitive-tasks-with-custom

git branch --v | grep "\[gone\]" | awk '{print $1}' | xargs git branch -D
