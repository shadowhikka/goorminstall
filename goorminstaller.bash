#!/bin/bash

# █▀ █░█ ▄▀█ █▀▄ █▀█ █░█░█
# ▄█ █▀█ █▀█ █▄▀ █▄█ ▀▄▀▄▀

# Copyleft 2022 t.me/shadow_modules
# This module is free software
# You can edit this module

# root check
if [[ $EUID -ne 0 ]]; then
    echo "This script must be run as root"
    echo "Запускайте этот скрипт только от рута"
exit 1;
fi

printf "\n  _____   ___ ______  ______  ____  ____    ____  _____ "
printf "\n / ___/  /  _]      ||      ||    ||    \  /    |/ ___/"
printf "\n (   \_  /  [_|      ||      | |  | |  _  ||   __(   \_ "
printf "\n  \__  ||    _]_|  |_||_|  |_| |  | |  |  ||  |  |\__  |"
printf "\n  /  \ ||   [_  |  |    |  |   |  | |  |  ||  |_ |/  \ |"
printf "\n  \    ||     | |  |    |  |   |  | |  |  ||     |\    |"
printf "\n   \___||_____| |__|    |__|  |____||__|__||___,_| \___|"

#language choose
echo -e "\n\nВыберите язык:\nChoose language:"
echo -e "1. English\n2. Русский"
echo -e "Ввод:\nInput:"
read lang

#installation method
if (echo "$lang" | grep -E -q "1"); then
    echo -e "Installation methods:\n1. No web\n2. Web"
    echo "Enter installation method:"
    read installsp
else
    echo -e "Введите способ установки:\n1. Без веб сайта\n2. С веб сайтом"
    echo "Введите способ установки:"
    read installsp
fi

clear

# installer print
printf "\n ____  ____   _____ ______   ____  _      _        ___  ____   "
printf "\n|    ||    \ / ___/|      | /    || |    | |      /  _]|    \  "
printf "\n |  | |  _  (   \_ |      ||  o  || |    | |     /  [_ |  D  ) "
printf "\n |  | |  |  |\__  ||_|  |_||     || |___ | |___ |    _]|    /  "
printf "\n |  | |  |  |/  \ |  |  |  |  _  ||     ||     ||   [_ |    \  "
printf "\n |  | |  |  |\    |  |  |  |  |  ||     ||     ||     ||  .  \ "
printf "\n|____||__|__| \___|  |__|  |__|__||_____||_____||_____||__|\_| "

clear

# start hikka for --no-web
if (echo "$installsp" | grep -E -q "1"); then
    sed -i 's/Dialog.OK/True/g' hikka/configurator.py
    python3.8 -m hikka --no-web
fi


if (echo "$installsp" | grep -E -q "2"); then
    clear
    python3 -m hikka &
    ngrok http 8080
