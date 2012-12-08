cat notify.filter | grep -Ev '^#|^$' | tr '\n' '|' | sed -e 's/|/ OR /g' > notify.filter.txt
