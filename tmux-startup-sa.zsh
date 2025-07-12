#! /bin/bash

SESSION="SA"
SESSIONEXISTS=$(tmux list-sessions | grep $SESSION)

# Only create tmux session if it doesn't already exist
if [ "$SESSIONEXISTS" = "" ]
then
    # Start New Session with our name
    tmux new-session -d -s $SESSION

    # Name first Pane and start zsh
    tmux rename-window -t 0 'Vim'
    tmux send-keys -t 'Vim' 'cd repos/strength_assistant' C-m
    tmux send-keys -t 'Vim' 'cl' C-m
    tmux send-keys -t 'Vim' "vim" C-m

fi

# Attach Session, on the Main window
tmux attach-session -t $SESSION:0
