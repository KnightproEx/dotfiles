# =========================
# Colors
# =========================
typeset -A colors=(
  GREEN  $'\e[0;32m'
  BLUE   $'\e[0;34m'
  YELLOW $'\e[1;33m'
  RED    $'\e[0;31m'
  RESET  $'\e[0m'
)

# =========================
# Shards
# =========================
typeset -a shards=(
  # PPC
  mysprd01 mysstg05 mysstg09
  sgpprd00 sgpstg05
  thaprd00 thastg05
  xglprd00 xglstg00

  # BIZ
  biz-mysprd00 biz-mysstg00
)

# =========================
# Bastion Function
# =========================
bastion() {
  local shard="$1"

  [[ -z "$shard" ]] && {
    print "Usage: bastion <shard>"
    return 1
  }

  # Validate shard (fast lookup)
  if (( ! ${shards[(I)$shard]} )); then
    print "Invalid shard"
    return 1
  fi

  local prefix="${shard[1,3]}"
  local env="${shard[4,6]}"
  local project="bigpay-ppc-${shard}-id"
  local instance zone

  case "$prefix" in
    xgl)
      instance="bastion-vpc-xgl-${env}-00"
      zone="asia-southeast1-b"
      ;;
    sgp|tha)
      if [[ "$env" == "prd" ]]; then
        instance="bastion-${shard}-vpc-zone-name"
      else
        instance="bastion-${prefix}${env}-vpc-zone-name"
      fi
      zone="asia-southeast1-a"
      ;;
    biz)
      instance="bastion-${prefix}${shard[4,10]}-vpc-zone-name"
      zone="asia-southeast1-a"
      project="bigpay-${shard}-id"
      ;;
    *)
      instance="bastion-${prefix}${env}-vpc-zone-name"
      zone="asia-southeast1-a"
      ;;
  esac

  # echo "$instance"
  # echo "$zone"
  # echo "$project"

  # UI
  print -P "%F{blue}======================================%f"
  print -P "%F{green}🚀 Bastion Connection Initiated%f"
  print -P "%F{blue}--------------------------------------%f"
  print "Shard   : $shard"
  print "Status  : Resolving..."
  print -P "%F{blue}======================================%f"

  # SSH
  ssh \
    -o StrictHostKeyChecking=no \
    -o UserKnownHostsFile=/dev/null \
    -A \
    -o ProxyCommand="gcloud compute start-iap-tunnel $instance 22 \
      --project=$project --zone=$zone --listen-on-stdin" \
    "boonhui_khong_bigpayme_com@jumpoff"
}

# =========================
# Completion
# =========================
_bastion_complete() {
  local -a matches
  matches=("${shards[@]}")
  compadd -- "$matches[@]"
}
compdef _bastion_complete bastion
