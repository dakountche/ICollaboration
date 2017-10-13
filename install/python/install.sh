#!/bin/bash
python3 -m pip install virtualenv --user
python3 -m virtualenv -p /usr/bin/python3 icollaboration
source  icollaboration/bin/activate
python -m pip install -r requirements.txt
