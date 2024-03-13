#!/bin/bash


touch /usr/local/bin/cron_force.sh
chmod a+x /usr/local/bin/cron_force.sh
cat >/usr/local/bin/cron_force.sh <<"EOF"
#!/bin/bash

L=/tmp/cron_force_log

#get uptime seconds
U=$(cat /proc/uptime | cut -d '.' -f 1)

#make sure it is a number
((U=U+1))

# up for more than 2 minutes.... do the check...
if [[ $U -gt 120 ]]; then
    # check if tmux there already
    TMUXCOUNT=$(tmux ls | wc -l)
    if [[ $TMUXCOUNT = "0" ]]; then
        echo "`date` no tmux found - starting one" >>$L

        tmux new-session -d -t CRONFORCE
        tmux send-keys -t CRONFORCE "wdr2" ENTER
        tmux new-window -t CRONFORCE
        tmux send-keys -t CRONFORCE "player_loop" ENTER

    fi
else
    echo "`date` still to early ($U)" >>$L
fi


EOF
