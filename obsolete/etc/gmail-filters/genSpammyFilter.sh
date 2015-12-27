cat spammy.filter | grep -Ev '^#|^$' | tr '\n' '|' | sed -e 's/|/ OR /g' > spammy.filter.txt
