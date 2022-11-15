#!/bin/bash

export MYURL="https://raw.githubusercontent.com/Vasiliy-Basov/GCP/main/install_ruby.sh"
bash -c "$(curl -L $MYURL )

export MYURL1="https://raw.githubusercontent.com/Vasiliy-Basov/GCP/main/install_mnogodb.sh"
bash -c "$(curl -L $MYURL1 )

export MYURL2="https://raw.githubusercontent.com/Vasiliy-Basov/GCP/main/deploy.sh"
bash -c "$(curl -L $MYURL2 )
