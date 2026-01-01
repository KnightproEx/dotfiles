auto_venv() {
  venv_dir="$HOME/venvs/localdev"
  dir="$PWD"
  bp_repo="$HOME/repo/bigpay"

  if [[ "$dir" == "$bp_repo"* ]]; then
    if [[ -z $VIRTUAL_ENV ]]; source "$venv_dir/bin/activate" || :
    return
  elif [[ -n "$VIRTUAL_ENV" ]]; then
    deactivate || :
  fi
}

add-zsh-hook chpwd auto_venv
