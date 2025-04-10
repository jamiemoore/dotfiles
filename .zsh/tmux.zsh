################################################################################
# tmux
################################################################################

# If we are starting vscode (not the terminal within vscode), don't start tmux
if [[ ! "$VSCODE_PID" = "" ]]; then
    exit
fi

# If the shell is interactive and we are not in a tmux session
if [[ -o interactive ]]; then
    if [ "$TERM_PROGRAM" != "tmux" ]; then
        # Set the session name 
        session_name="default"
        if [ "$TERM_PROGRAM" == "vscode" ]; then
            session_name=vscode
        fi

        # If the session does not exist, create it
        # else, create a new window
        tmux has-session -t "$session_name" 2>/dev/null
        if [ $? != 0 ]; then
            tmux new-session -d -s ${session_name}
        else
            tmux new-window -t ${session_name}:
        fi
        tmux attach-session -d -t ${session_name}
        exit
    fi
fi