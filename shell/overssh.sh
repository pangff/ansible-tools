#!/bin/bash
ansible-playbook overssh.yml  --extra-vars "host=gm"  --extra-vars "@vars/config.json"