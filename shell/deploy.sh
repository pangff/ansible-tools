#!/bin/bash
ansible-playbook install.yml  --extra-vars "host=elk"  --extra-vars "@vars/config.json"
ansible-playbook start.yml  --extra-vars "host=elk"  --extra-vars "@vars/config.json"