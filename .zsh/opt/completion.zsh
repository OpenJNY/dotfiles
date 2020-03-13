# auto completion: az
[[ -f "~/az.completion" ]] && source ~/az.completion

# auto completion: kubectl
command -v kubectl >/dev/null && source <(kubectl completion zsh)
