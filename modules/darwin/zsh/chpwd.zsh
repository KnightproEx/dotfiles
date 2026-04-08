auto_venv() {
  venv_dir="$HOME/venvs/bp-venv"
  dir="$PWD"
  bp_repo="$HOME/repo/bigpay"

  if [[ "$dir" == "$bp_repo"* ]]; then
    if [[ -z $VIRTUAL_ENV ]]; source "$venv_dir/bin/activate" || :
    return
  elif [[ -n "$VIRTUAL_ENV" ]]; then
    deactivate 2> /dev/null || :
  fi
}

add-zsh-hook chpwd auto_venv
auto_venv
