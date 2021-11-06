#!/usr/bin/env zsh

work_dir=$(mktemp -d /tmp/rebuild.XXXXXX)

function executable_exists() {command -v $1 >/dev/null 2>&1 }

step_number=1
function step() {
  echo "$fg[green]${step_number}. ========== ${1}$reset_color"
  let step_number=step_number+1
}
function note() {printf "Note: %s\n" "$fg[blue]$*$reset_color" }
function info() {printf "%s\n" "$fg[green]$*$reset_color" }
function warn() {printf "%s\n" "$fg[yellow]$*$reset_color" }
function error() {
  printf "Error: %s\n" "$fg[red]$*$reset_color"
  exit 1
}

function run() {
  echo "Run:" $*
  if [[ $dryrun == 0 ]]; then
    eval $*
  fi
}

function install_language() {
  language=$1
  version=$2

  info "Installing $language version $version (using asdf)..."
  run asdf plugin install ${language:l}
  run asdf install python $version
  run asdf global python $version
  run rehash
}

function install_dmg() {
  dmg_name=$1
  dmg_url=$2
  dmg_file=${1}.dmg

  info "Downloading ${dmg_name}..."
  run curl -L ${dmg_url} --output ${work_dir}/${dmg_file}
  info "Opening ${dmg_name} installer, press Enter when installed..."
  if [[ $dryrun == 0 ]]; then
    open ${work_dir}/${dmg_file}
    read
  fi
}

function update_shells() {
  shell=$1
  bin=$(brew --prefix ${shell})/bin/${shell}

  if [[ -x ${bin} ]]; then
    if ! grep -q "^${bin}$" /etc/shells; then
      info "Adding ${bin} to /etc/shells"
      run 'sudo printf ${bin} >> /etc/shells'
    else
      info "${bin} already in /etc/shells; all good!"
    fi
  else
    warn "${shell} not found; not updating /etc/shells"
  fi
}
