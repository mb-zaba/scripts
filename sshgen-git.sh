#!/bin/bash

ssh-keygen -t ed25519 -C "me@zaba.dev"
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_ed25519
