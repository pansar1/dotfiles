#
# Executes commands at login pre-zshrc.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

#
# Browser
#

if [[ "$OSTYPE" == darwin* ]]; then
  export BROWSER='open'
fi

#
# Editors
#

export EDITOR='nano'
export VISUAL='nano'
export PAGER='less'

#
# Language
#

if [[ -z "$LANG" ]]; then
  export LANG='en_US.UTF-8'
fi

#
# Paths
#

# Ensure path arrays do not contain duplicates.
typeset -gU cdpath fpath mailpath path

# Set the list of directories that cd searches.
# cdpath=(
#   $cdpath
# )

# Set the list of directories that Zsh searches for programs.
path=(
  /opt/homebrew/{bin,sbin}
  $path
)

# Less
#

# Set the default Less options.
# Mouse-wheel scrolling has been disabled by -X (disable screen clearing).
# Remove -X to enable it.
export LESS='-g -i -M -R -S -w -X -z-4'

# Set the Less input preprocessor.
# Try both `lesspipe` and `lesspipe.sh` as either might exist on a system.
if (( $#commands[(i)lesspipe(|.sh)] )); then
  export LESSOPEN="| /usr/bin/env $commands[(i)lesspipe(|.sh)] %s 2>&-"
fi
eval "$(/opt/homebrew/bin/brew shellenv)"


alias activities-port-forwards-chi="kubectl port-forward --namespace chi deployment/chi-resultbox 5555:3000 & kubectl port-forward --namespace chi deployment/chi-educational-material 3000:3000 & kubectl port-forward --namespace chi deployment/chi-core-api 8080:80"
alias activities-port-forwards-stage="kubectl port-forward deployment/stage-resultbox 5555:3000 & kubectl port-forward deployment/stage-educational-material 3000:3000 & kubectl port-forward deployment/stage-core-api 8080:80"
alias contex-port-forwards-stage="kubectl port-forward deployment/stage-resultbox 5555:3000 & kubectl port-forward deployment/stage-core-api 8080:80"
alias contex-port-forwards-chi="kubectl port-forward --namespace chi deployment/chi-resultbox 5555:3000 & kubectl port-forward --namespace chi deployment/chi-core-api 8080:80 & kubectl port-forward --namespace chi deploy/chi-admin-proxy 5432:postgres & kubectl port-forward --namespace chi deploy/chi-admin-proxy 6379:redis"
alias api-backend-port-forwards-chi="kubectl port-forward --namespace chi deploy/chi-core-api 8080:80 & kubectl port-forward --namespace chi deploy/chi-admin-proxy 5440:postgres & kubectl port-forward --namespace chi deploy/chi-admin-proxy 6379:redis & kubectl port-forward --namespace chi deploy/chi-admin-proxy 4433:opensearch"
alias kimg="kubectl get deploy -o jsonpath='{...image}' | tr '[[:space:]]' '\n' | sed -e 's@.*[^/]/@@g' |  tr ':' ' ' | column -t"
# Set current kubernetes cluster
alias kx="kubectx"
# Set current kubernetes namespace
alias kns="kubens"
# Check which namespace is currently configurated
alias knconf="kubectl config view --minify --output 'jsonpath={..namespace}'; echo"
export AUTH_SECRET=dGC3rhSL6xbcpfbq