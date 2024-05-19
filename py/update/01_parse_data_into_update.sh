#!/bin/bash


A=$(cat data | jq -r ".[] | .name")


(

    echo -en "#!/bin/bash\n\n\n"

for P in $A; do
    echo "vpip install --upgrade $P"
done

    ) >"03update.sh"
