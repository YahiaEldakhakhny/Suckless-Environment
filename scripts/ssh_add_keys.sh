#!/bin/bash
my_keys="$(ls ~/.ssh | grep .pub | sed 's/.pub//g')"

cd ~/.ssh
ssh-add $my_keys
