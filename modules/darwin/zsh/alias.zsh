source "$XDG_CONFIG_HOME/zsh-darwin/chpwd.zsh" || :

alias gauth="echo 'gcloud auth login' && gcloud auth login && echo 'gcloud auth application-default login' && gcloud auth application-default login"
alias pauth="gcloud auth print-access-token | podman login asia-docker.pkg.dev -u oauth2accesstoken --password-stdin && gcloud auth print-access-token | podman login gcr.io -u oauth2accesstoken --password-stdin"

bastion() {
  if [[ -z $1 ]] then 
    echo "Usage: bastion <shard>"
    return 1
  fi

  if [[ $(echo -n $1 | wc -m) -ne 8 ]] then
    echo "Invalid shard"
    return 1
  fi

  ssh -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null -o ProxyCommand='gcloud compute start-iap-tunnel bastion-'"${1::-2}"'-vpc-zone-name 22 --project=bigpay-ppc-'"$1"'-id --zone=asia-southeast1-a --listen-on-stdin' -A boonhui_khong_bigpayme_com@jumpoff
}
