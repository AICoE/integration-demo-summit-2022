#!/bin/bash
cd ~/mycar
source ~/.bashrc
micromamba activate donkey
./manage.py drive --model=models/mypilot.h5
