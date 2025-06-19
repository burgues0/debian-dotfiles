#!/bin/bash

#initial logic                                          FIRST
#> check if current distro is debian-based
#>> if it is not, cancel the script alltogether

#> check if debian-apps.yaml config file exists (function)      SECOND
#>> if exists, check structure to see if it is ok or not
#>> if not, stop the script "missing config.yaml file"

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