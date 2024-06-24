# ZSH Theme - Preview: http://cl.ly/350F0F0k1M2y3A2i3p1S

PROMPT='%(!.%{%F{red}%}λ%{$reset_color%}.λ) '
RPROMPT='%~/$(git_prompt)$(current_time)'

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[green]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"

git_custom_status() {
    local cb=$(current_branch)
    if [ -n "$cb" ]; then
        echo "$(parse_git_dirty)$ZSH_THEME_GIT_PROMPT_PREFIX$(current_branch)$ZSH_THEME_GIT_PROMPT_SUFFIX"
    fi
}

function git_prompt {
  if git rev-parse --git-dir > /dev/null 2>&1; then
    if [[ $(git log 2>&1 > /dev/null | grep -c "^fatal") == 0 ]]; then
      echo " $(minutes_since_last_commit) $(git_prompt_info) $(current_rev)%{$reset_color%}"
    else
      echo " %{%F{124}%}(no commits)%{%f%}"
    fi
  fi
}

function current_time {
  echo " %{%F{10}%}[%*]%{%f%}"
}

function minutes_since_last_commit {
    if git rev-parse --git-dir > /dev/null 2>&1; then
        if [[ $(git log 2>&1 > /dev/null | grep -c "^fatal: bad default revision") == 0 ]]; then
            now=`date +%s`
            last_commit=`git log --pretty=format:'%at' -1 2>/dev/null`
            seconds=$((now-last_commit))
            minutes=$((seconds/60))
            hours=$((seconds/3600))
            days=$((seconds/86400))
            if [ "$minutes" -gt 30 ]; then
                COLOR="red"
            elif [ "$minutes" -gt 10 ]; then
                COLOR="yellow"
            else
                COLOR="green"
            fi
            if [ "$hours" -gt 24 ]; then
                echo "%{%F{$COLOR}%}${days}d%{$reset_color%}"
            elif [ "$minutes" -gt 60 ]; then
                echo "%{%F{$COLOR}%}${hours}h%{$reset_color%}"
            else
                echo "%{%F{$COLOR}%}${minutes}m%{$reset_color%}"
            fi
        fi
    fi
}

function current_rev {
    if git rev-parse --git-dir > /dev/null 2>&1; then
        git rev-parse --short HEAD
    fi
}
