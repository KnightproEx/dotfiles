alias gauth="gcloud auth login --update-adc"
alias pauth="t=\$(gcloud auth print-access-token); for r in asia-docker.pkg.dev gcr.io; do printf \"%s\n\" \"\$t\" | podman login \"\$r\" -u oauth2accesstoken --password-stdin; done"
alias dauth="t=\$(gcloud auth print-access-token); for r in asia-docker.pkg.dev gcr.io; do printf \"%s\n\" \"\$t\" | docker login \"\$r\" -u oauth2accesstoken --password-stdin; done"
