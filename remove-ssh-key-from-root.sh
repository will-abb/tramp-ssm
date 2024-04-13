#!/bin/bash

# Define the public SSH key entry you want to remove
key_to_remove="no-port-forwarding,no-agent-forwarding,no-X11-forwarding ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQCz5LW1RTI98Cykz8q+UtXkDlRV2KyWOMkrjM/iDs2x5XlZfKlVJqgaBmY1ahyJm1pJExgWMl6zFU0Q+wKKShkVZQokwDkCl49V7ZkFwaOY3fFSqpdLxTd03V+qdsZhHKQdxDUqaFJJBDcTitJUd5MEe5sIf2nklS+65aj6+IqtI2NKD1XzOWkPTGExv3NZFcljJpVAJa+/CrCTbkYiyBQCUuibojs1PcYOcb50nDaHOhPMY4fg4oacKpfFrK6t7PEtxt76oc5svG6RCYq7XyZ3TTXJx/CNXBNZZsp4BmT51GruDMl96ZMP5KvzLpk5PEXxFh9tOy4XlBlusR4vqmu6PSG8LBYPRHv8vARizUyiv0GVbG8Cm3Y+N1tYEjxczWYpzbYfhzAD6jQdoxoGkmoP4Rz3ezwkN4Aq/sqscaqvaDBPPTjI+KLHmfI056TA9Gs1frX0BgSDJ86pEwya6f/wI5lhfVWj5++zwHo2e5v1vO87Oa1ok8mfLRdKkOqw1KlHS5sJ8r8aOXdxGFH2rVtp/gdoTVGKM/sEbJZHzzC0jGtIzYfjgXxrgLIUi/OiqZxxZxRiljqFS1pTiP6anXANcJsUQ0L60jSrZRkImnh3yUW14sCpfLwVGTsEFvIM+gmGTZnCwCg07W3h/C8Y2Kjz6WDtHdGD6y63N4iPaXeRSQ== williams.bosch-bello@selectquote.com"

# File location of the authorized_keys
auth_keys_file="/root/.ssh/authorized_keys"

# Use 'grep' to filter out the line containing the key and 'tee' to overwrite the file
grep -vF "$key_to_remove" "$auth_keys_file" | tee "$auth_keys_file"

echo "Specified SSH key has been removed from $auth_keys_file"
