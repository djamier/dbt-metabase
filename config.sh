#!/bin/bash
if [ ! -d 'venv' ]
then
    echo 'creating venv'
    python -m venv venv
fi

echo 'activating venv'
source venv/bin/activate

echo 'update latest pip'
pip install --upgrade pip

echo 'installing other packages'
pip install -r requirements.txt

source .env