#!/bin/bash


if [[ ! -f venv/bin/activate ]]; then
    if [[ -d /venv ]]; then
        ln -s /venv venv
    fi
fi


. venv/bin/activate && python main.py
