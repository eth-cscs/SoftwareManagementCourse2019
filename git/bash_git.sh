source ~/.bash/git-completion.sh
source ~/.bash/git-prompt.sh
source ~/.bash/git-ps1.sh

SCREEN_PROMPT=$(if [[ ! -z $STY ]]; then echo '(s) '; fi)                                                                                                              
export PROMPT_COMMAND='__git_ps1 "$Yellow$SCREEN_PROMPT$On_IPurple$Hostname$Red:$Cyan\w$White" "\$ "'                                                                  
