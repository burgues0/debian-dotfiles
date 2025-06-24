#!/bin/bash

ROOT_DIR='.'
CONFIG_FILE='config.yaml'
CONFIG_PATH="$ROOT_DIR/$CONFIG_FILE"

greetings(){
    echo "=== Debian Dotfiles ===."
    echo "> Created by burgues0."
    echo "> Please clone the repository and alter the script the way it suits you best."
    echo "> Check the README.md for references on how to tinker with the script."
    echo ""
    #sleep 3
    #clear
}

print_success(){
    echo -e "> \033[1;32m$1\033[0m"
}

print_error(){
    echo -e "> \033[1;31m$1\033[0m"
}

check_debian(){
    grep -iE 'debian|buntu|mint' /etc/*release > /dev/null 2>&1
    if [ $? -ne 0 ]; then
        print_error "Error: current distro is not Debian based."
        exit 1
    fi
    print_success "Success: current distro is Debian based."
}

check_config_file(){
    ext=${CONFIG_FILE##*.}
    if [ ! -f "$CONFIG_PATH" ]; then
        print_error "Error: config.yaml file does not exist in the project's root folder."
        exit 1
    fi
    if [ "$ext" != "yaml" ]; then
        print_error "Error: config.yaml file is not of type 'yaml'."
        exit 1
    fi
    print_success "Success: file $CONFIG_FILE exists in the project's root folder."
}

validate_yaml(){
    dpkg -s yamllint > /dev/null 2>&1
    if [ $? -ne 0 ]; then
        print_error "Error: yamllint is not installed."
        print_error "Please install it with 'sudo apt install yamllint'."
        exit 1
    fi
    print_success "Success: package yamllint is installed."

    yamllint $CONFIG_PATH > /dev/null 2>&1
    if [ $? -ne 0 ]; then
        print_error "Error: invalid .yaml formatting."
        print_error "Please run 'yamllint $CONFIG_PATH' to check for errors."
        exit 1
    fi
    print_success "Success: $CONFIG_FILE is formatted correctly."
}

# FIRST
greetings
echo "+ Initializing Dotfiles +"
check_debian

# SECOND
echo "+ Validating Configuration Files +"
check_config_file
validate_yaml

#> check internet connection because of updates + installations (function)      THIRD (define functions to be used in main logic)
#> create file structure (function)
#> update apt packages (function)
#> cronjobs ex.: ssd trim (function)
#> add script path to .bash_profile

#> create function to install apps                      FOURTH
#>> arguments
#>>> -d or --default | installs selection of default apps
#>>>>> youre about to install X apps; (print all), proceed? if you wish to remove any from the selection, please use the -r flag
#>>> -r or --remove="app1 app2" | removes specific default apps
#>>>>> if app in argument is not in default, stop execution (default app not found: $app)
#>>> -o or --optional="app1 app2 app3" | installs specific apps from the optional section in the config file
#>>>>> if app is not defined in optional, stop execution (optional app not found: $app)

#> post install procedures (update again, etc etc)