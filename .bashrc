# Enhanced Terminal Style with JetBrains Nerd Font Icons
# Colors
BRIGHT_WHITE='\[\033[97m\]'
BRIGHT_YELLOW='\[\033[93m\]'
BRIGHT_CYAN='\[\033[96m\]'
BRIGHT_MAGENTA='\[\033[95m\]'
BRIGHT_GREEN='\[\033[92m\]'
BRIGHT_RED='\[\033[91m\]'
BRIGHT_BLUE='\[\033[94m\]'
ORANGE='\[\033[38;5;208m\]'

# Background Colors
BG_MAGENTA='\[\033[45m\]'
BG_GREEN='\[\033[42m\]'
BG_YELLOW='\[\033[43m\]'
BG_CYAN='\[\033[46m\]'
BG_BLUE='\[\033[44m\]'
BG_RED='\[\033[41m\]'
BG_BLACK='\[\033[40m\]'

# Reset
COLOR_RESET='\[\033[0m\]'
BOLD='\[\033[1m\]'

# Prompt Settings
PROMPT_DIRTRIM=4

# Nerd Font Icons
USER_ICON=" "  
DIR_ICON=" "   
CLOCK_ICON="󰥔 " 
GIT_ICON=" "   
BRANCH_ICON=" " 
CHECK_ICON="󰘽 "   
ERROR_ICON=" "
ARROW_ICON=" "   
GEAR_ICON=" "    
SERVER_ICON=" " 

if test -z "$WINELOADERNOEXEC"; then
    GIT_EXEC_PATH="$(git --exec-path 2>/dev/null)"
    COMPLETION_PATH="${GIT_EXEC_PATH%/libexec/git-core}/share/git/completion"
    if test -f "COMPLETION_PATH/git-prompt.sh"; then
        . "$COMPLETION_PATH/git-completion.bash"
        . "$COMPLETION_PATH/git-prompt.sh"
    fi
fi

# Git Status Options
export GIT_PS1_SHOWSTASHSTATE=true
export GIT_PS1_SHOWDIRTYSTATE=true
export GIT_PS1_SHOWUNTRACKEDFILES=true
export GIT_PS1_SHOWUPSTREAM="auto verbose"

function set_prompt {
    local EXIT_STATUS=$?
    
    # Window Title
    PS1="\[\033]0;${USER_ICON} \u@\h: \w\007\]"
    
    # First Line: Time + User + Dir
    PS1+="\n"
    PS1+="${BG_MAGENTA}${BRIGHT_WHITE} ${CLOCK_ICON} \A ${COLOR_RESET} "
    PS1+="${BG_GREEN}${BRIGHT_WHITE} ${USER_ICON} \u ${COLOR_RESET} "
    PS1+="${BG_YELLOW}${BRIGHT_WHITE} ${DIR_ICON} \w ${COLOR_RESET} "
    
    # Exit Status
    if [ $EXIT_STATUS -eq 0 ]; then
        PS1+="${BG_CYAN}${BRIGHT_WHITE} ${CHECK_ICON} $EXIT_STATUS ${COLOR_RESET}"
    else
        PS1+="${BG_RED}${BRIGHT_WHITE} ${ERROR_ICON} $EXIT_STATUS ${COLOR_RESET}"
    fi
    
    # Second Line: Git Info
    PS1+="\n"
    
    if git rev-parse --is-inside-work-tree >/dev/null 2>&1; then
        local git_status="$(git status --porcelain 2>/dev/null)"
        local branch_name="$(git branch --show-current 2>/dev/null || __git_ps1 "%s")"
        local ahead_behind=""
        
        # Count different types of changes
        local unstaged_count=$(grep -c '^ M\|^ M' <<< "$git_status")
        local staged_count=$(grep -c '^M \|^A \|^D \|^R ' <<< "$git_status")
        local untracked_count=$(grep -c '^??' <<< "$git_status")
        local stash_count=$(git stash list | wc -l)
        
        # Ahead/Behind detection
        local upstream_status="$(git status -sb 2>/dev/null)"
        if [[ "$upstream_status" =~ ahead ]]; then
            ahead_behind+=" ${BRIGHT_GREEN}↑$(grep -o 'ahead [0-9]\+' <<< "$upstream_status" | grep -o '[0-9]\+')"
        fi
        if [[ "$upstream_status" =~ behind ]]; then
            ahead_behind+=" ${BRIGHT_RED}↓$(grep -o 'behind [0-9]\+' <<< "$upstream_status" | grep -o '[0-9]\+')"
        fi
        
        PS1+="${BG_BLUE}${BRIGHT_WHITE} ${GIT_ICON} "
        
        # Start with branch name
        PS1+="${BRIGHT_WHITE}${BRANCH_ICON} ${branch_name}"
        
        # Add all status indicators that exist
        local status_indicators=()
        [ $staged_count -gt 0 ] && status_indicators+=("${BRIGHT_YELLOW}${staged_count} staged")
        [ $unstaged_count -gt 0 ] && status_indicators+=("${BRIGHT_RED}${unstaged_count} unstaged")
        [ $untracked_count -gt 0 ] && status_indicators+=("${BRIGHT_MAGENTA}${untracked_count} untracked")
        [ $stash_count -gt 0 ] && status_indicators+=("${ORANGE}${stash_count} stashed")
        
        # If there are any changes, display them
        if [ ${#status_indicators[@]} -gt 0 ]; then
            PS1+=" (${status_indicators[0]}"
            for ((i=1; i<${#status_indicators[@]}; i++)); do
                PS1+=", ${status_indicators[$i]}"
            done
            PS1+="${BRIGHT_WHITE})"
        fi
        
        # Add ahead/behind indicators
        PS1+="${ahead_behind}"
        
        PS1+=" ${COLOR_RESET}"
    fi
    
    # Final Line: Prompt
    PS1+="\n${BRIGHT_GREEN}${ARROW_ICON}${BRIGHT_CYAN}${ARROW_ICON}${BRIGHT_MAGENTA}${ARROW_ICON} ${COLOR_RESET}$"
}

# THIS IS CRUCIAL - Activates your prompt function
PROMPT_COMMAND=set_prompt
alias deval='cd ~/Desktop/learningCoding/projects/devalProjects && source ~/navigate.sh && navigate'
alias other='cd ~/Desktop/learningCoding/otherDevs && source ~/navigate.sh && navigate'
alias hackathon='cd ~/Desktop/learningCoding/hackathon && source ~/navigate.sh && navigate'
alias intern='cd ~/Desktop/learningCoding/attachmentsAndInternships && source ~/navigate.sh && navigate'
alias projects='cd ~/Desktop/learningCoding/projects && source ~/navigate.sh && navigate'
alias learn='cd ~/Desktop/learningCoding/learning && source ~/navigate.sh && navigate'
alias client='cd ~/Desktop/learningCoding/clientsWork/ && source ~/navigate.sh && navigate'
alias csk='cd ~/Desktop/learningCoding/projects/cskWebApp && source ~/navigate.sh && navigate'
alias nav='source ~/navigate.sh && navigate'
alias reload='source ~/.bashrc && source ~/navigate.sh && echo -e "${BRIGHT_GREEN}${GEAR_ICON} Bash configuration reloaded!${COLOR_RESET}"'

# Enhanced Aliases
alias ls='ls --color=auto'
alias ll='ls -la'
alias la='ls -A'
alias l='ls -CF'
alias grep='grep --color=auto'
alias cls='clear'

# Git Shortcuts
alias gs='git status'
alias gi='git init'
alias ga='git add'
alias gc='git commit -m'
alias gp='git push'
alias gl='git pull'
alias gco='git checkout'
alias gb='git branch'
alias gbm='git branch -M main'
alias gm='git merge'
alias gf='git fetch'
alias grb='git rebase'
alias gst='git stash'
alias gd='git diff'
alias glg='git log --graph --oneline --decorate'
alias gar='git remote add origin'
alias grr='git remote set-url'

# NPM Shortcuts
alias nps='npm start'
alias npd='npm run dev'
alias npt='npm test'
alias npi='npm install'
alias npb='npm run build'
alias npl='npm run lint'

# PNPM Shortcuts
alias pns='pnpm start'
alias pnsd='pnpm start:dev'
alias pnd='pnpm dev'
alias pnt='pnpm test'
alias pni='pnpm install'
alias pna='pnpm add'
alias pnb='pnpm build'
alias pnl='pnpm lint'
alias pnx='pnpm dlx'
alias pnup='pnpm up'
alias png='pnpm add -g'

#Docker Alias 

alias d='docker'
alias di='docker images'
alias dps='docker ps'
alias dpsa='docker ps -a'
alias dstart='docker start'
alias dstop='docker stop'
alias drm='docker rm'
alias drmi='docker rmi'
alias dexec='docker exec -it'
alias dlogs='docker logs -f'
alias dprune='docker system prune -a'

#Docker Compose Alias

alias dc='docker compose'
alias dcb='docker compose build'
alias dcup='docker compose up'
alias dcupd='docker compose up -d'
alias dcdown='docker compose down'
alias dclog='docker compose logs'
alias dclogf='docker compose logs -f'
alias dce='docker compose exec'
alias dcrun='docker compose run'
alias dcps='docker compose ps'
alias dcrestart='docker compose restart'
alias dcpull='docker compose pull'
alias dckill='docker compose kill'


alias hi='helm install'                       # install chart
alias hu='helm upgrade'                       # upgrade release
alias hru='helm upgrade --install'            # upgrade or install if not exists
alias hls='helm list'                         # list releases
alias hlsn='helm list -n'                     # list releases in namespace
alias hdel='helm uninstall'                   # uninstall release
alias hdep='helm dependency update'           # update chart dependencies
alias hval='helm show values'                 # show default chart values
alias htpl='helm template'                    # render chart templates locally
alias hhist='helm history'                    # release revision history
alias hget='helm get all'                     # get full info of a release
alias hlint='helm lint'                       # lint the chart

alias k='kubectl'
alias kg='kubectl get'
alias kgp='kubectl get pods'
alias kgs='kubectl get svc'
alias kgd='kubectl get deployments'
alias kgn='kubectl get nodes'
alias kgns='kubectl get namespaces'
alias kd='kubectl describe'
alias kdp='kubectl describe pod'
alias kdd='kubectl describe deployment'
alias kl='kubectl logs'
alias klf='kubectl logs -f'
alias ke='kubectl exec -it'
alias kaf='kubectl apply -f'
alias kdf='kubectl delete -f'
alias kr='kubectl rollout restart'
alias kctx='kubectl config use-context'
alias kcn='kubectl config set-context'
alias kcur='kubectl config current-context'
alias kns='kubectl config set-context --current --namespace'
alias kpf='kubectl port-forward'                   # Basic port-forward
alias kpfp='kubectl port-forward pod'              # Port-forward specific pod
alias kpfsvc='kubectl port-forward svc'            # Port-forward a service
alias kgsct='kubectl get secret'                   # Get all secrets
alias kgcm='kubectl get configmap'                 # Get all config maps
alias kdsc='kubectl describe secret'               # Describe secret
alias kdcmp='kubectl describe configmap'           # Describe configmap
alias ktop='kubectl top pod'                       # View pod resource usage
alias ktd='kubectl top deployment'                 # View deployment resource usage
alias krun='kubectl run debug --rm -i --tty --image=alpine -- bash'  # Temporary debug pod
alias kedit='kubectl edit'                         # Edit resources like pods, deployments, etc.
alias kruncurl='kubectl run tmp-curl --rm -i --tty --image=curlimages/curl --'
alias kcnl='kubectl config set-context --current --namespace='  # Quick change namespace
alias knsc='kubectl create namespace'                          # Create a namespace
alias kcp='kubectl cp'   # Copy files between pod and local

# System Aliases
alias update='sudo apt update && sudo apt upgrade -y'
alias pcds='df -h'
alias memory='free -m'

alias runds='ollama run deepseek-r1'
#Extras
alias run='~/terminal-runner.sh'

MSYS2_PS1="$PS1"

# Display a cool welcome message
echo -e "${BRIGHT_CYAN}Welcome to your enhanced terminal!${COLOR_RESET}"
echo -e "${BRIGHT_MAGENTA}${SERVER_ICON} $(date +"%A, %B %d, %Y | %I:%M %p")${COLOR_RESET}"
echo -e "${BRIGHT_GREEN}${GEAR_ICON} System: $(uname -srm)${COLOR_RESET}"
echo -e "${BRIGHT_YELLOW}${USER_ICON} User: $(whoami)${COLOR_RESET}"
echo -e "${BRIGHT_BLUE}${DIR_ICON} Working Directory: $(pwd)${COLOR_RESET}"
echo ""

unalias decodesecret 2>/dev/null
decodesecret() {
  kubectl get secret "$1" -o jsonpath="{.data.$2}" | base64 --decode; echo
}
