#!/bin/bash

# --- LOAD CONFIG (if present) ---
CONFIG_FILE="$HOME/.cleancache.conf"
if [ -f "$CONFIG_FILE" ]; then
  while IFS='=' read -r key value; do
    [[ "$key" =~ ^[[:space:]]*# ]] && continue
    [[ -z "${key// }" ]] && continue
    key="${key// /}"
    value="${value%%#*}"
    value="${value// /}"
    case "$key" in
      VERBOSE|INTERACTIVE| \
      CLEAN_SYSTEM|CLEAN_CHROME|CLEAN_FIREFOX|CLEAN_SAFARI|CLEAN_BRAVE| \
      CLEAN_OPERA|CLEAN_EDGE|CLEAN_ARC|CLEAN_USER_CACHES|CLEAN_MAIL| \
      CLEAN_XCODE|CLEAN_SWIFTPM|CLEAN_FLUTTER|CLEAN_GRADLE|CLEAN_MAVEN| \
      CLEAN_NPM|CLEAN_YARN|CLEAN_PNPM|CLEAN_BUN|CLEAN_DENO| \
      CLEAN_PUB|CLEAN_CARGO|CLEAN_COMPOSER|CLEAN_COCOAPODS| \
      CLEAN_PYTHON|CLEAN_RUBY|CLEAN_GO|CLEAN_RUST| \
      CLEAN_ELIXIR|CLEAN_HASKELL|CLEAN_NVM|CLEAN_RVM|CLEAN_SDKMAN| \
      CLEAN_DOCKER|CLEAN_PODMAN|CLEAN_VAGRANT| \
      CLEAN_VSCODE|CLEAN_CURSOR|CLEAN_JETBRAINS|CLEAN_SUBLIME| \
      CLEAN_ANDROID|CLEAN_UNITY|CLEAN_UNREALENGINE| \
      CLEAN_ADOBE|CLEAN_FINALCUT|CLEAN_LOGIC|CLEAN_DAVINCI|CLEAN_SKETCH|CLEAN_FIGMA| \
      CLEAN_SLACK|CLEAN_ZOOM|CLEAN_TEAMS|CLEAN_DISCORD|CLEAN_SPOTIFY| \
      CLEAN_TELEGRAM|CLEAN_WHATSAPP|CLEAN_SIGNAL|CLEAN_SKYPE|CLEAN_VIBER| \
      CLEAN_POSTMAN|CLEAN_INSOMNIA|CLEAN_CHARLES|CLEAN_PROXYMAN|CLEAN_WIRESHARK| \
      CLEAN_TABLEPLUS|CLEAN_SEQUELACE|CLEAN_DBEAVER|CLEAN_MYSQLWB| \
      CLEAN_TOWER|CLEAN_SOURCETREE|CLEAN_GITKRAKEN| \
      CLEAN_ITERM2|CLEAN_WARP|CLEAN_HYPER| \
      CLEAN_DROPBOX|CLEAN_ONEDRIVE|CLEAN_GOOGLEDRIVE| \
      CLEAN_ALFRED|CLEAN_RAYCAST| \
      CLEAN_VIRTUALBOX|CLEAN_VMWARE|CLEAN_PARALLELS| \
      CLEAN_NORDVPN|CLEAN_EXPRESSVPN|CLEAN_MULLVAD| \
      CLEAN_TERRAFORM|CLEAN_ANSIBLE|CLEAN_AWS|CLEAN_GCLOUD|CLEAN_AZURE| \
      CLEAN_ZSH|CLEAN_BASH|CLEAN_FISH| \
      CLEAN_DIAGNOSTICS|CLEAN_TRASH|CLEAN_HOMEBREW)
        declare "$key=$value" ;;
    esac
  done < "$CONFIG_FILE"
fi

# --- DEFAULTS ---
VERBOSE="${VERBOSE:-false}"
INTERACTIVE="${INTERACTIVE:-false}"

# System
CLEAN_SYSTEM="${CLEAN_SYSTEM:-true}"
CLEAN_DIAGNOSTICS="${CLEAN_DIAGNOSTICS:-true}"

# Browsers
CLEAN_CHROME="${CLEAN_CHROME:-true}"
CLEAN_FIREFOX="${CLEAN_FIREFOX:-true}"
CLEAN_SAFARI="${CLEAN_SAFARI:-true}"
CLEAN_BRAVE="${CLEAN_BRAVE:-true}"
CLEAN_OPERA="${CLEAN_OPERA:-true}"
CLEAN_EDGE="${CLEAN_EDGE:-true}"
CLEAN_ARC="${CLEAN_ARC:-true}"

# Apple apps
CLEAN_MAIL="${CLEAN_MAIL:-true}"
CLEAN_USER_CACHES="${CLEAN_USER_CACHES:-true}"

# Apple dev
CLEAN_XCODE="${CLEAN_XCODE:-true}"
CLEAN_SWIFTPM="${CLEAN_SWIFTPM:-true}"

# Build / package managers
CLEAN_FLUTTER="${CLEAN_FLUTTER:-true}"
CLEAN_GRADLE="${CLEAN_GRADLE:-true}"
CLEAN_MAVEN="${CLEAN_MAVEN:-true}"
CLEAN_NPM="${CLEAN_NPM:-true}"
CLEAN_YARN="${CLEAN_YARN:-true}"
CLEAN_PNPM="${CLEAN_PNPM:-true}"
CLEAN_BUN="${CLEAN_BUN:-true}"
CLEAN_DENO="${CLEAN_DENO:-true}"
CLEAN_PUB="${CLEAN_PUB:-true}"
CLEAN_CARGO="${CLEAN_CARGO:-true}"
CLEAN_COMPOSER="${CLEAN_COMPOSER:-true}"
CLEAN_COCOAPODS="${CLEAN_COCOAPODS:-true}"
CLEAN_PYTHON="${CLEAN_PYTHON:-true}"
CLEAN_RUBY="${CLEAN_RUBY:-true}"
CLEAN_GO="${CLEAN_GO:-true}"
CLEAN_RUST="${CLEAN_RUST:-true}"
CLEAN_ELIXIR="${CLEAN_ELIXIR:-true}"
CLEAN_HASKELL="${CLEAN_HASKELL:-true}"
CLEAN_NVM="${CLEAN_NVM:-true}"
CLEAN_RVM="${CLEAN_RVM:-true}"
CLEAN_SDKMAN="${CLEAN_SDKMAN:-true}"

# Containers & VMs
CLEAN_DOCKER="${CLEAN_DOCKER:-true}"
CLEAN_PODMAN="${CLEAN_PODMAN:-true}"
CLEAN_VAGRANT="${CLEAN_VAGRANT:-true}"
CLEAN_VIRTUALBOX="${CLEAN_VIRTUALBOX:-true}"
CLEAN_VMWARE="${CLEAN_VMWARE:-true}"
CLEAN_PARALLELS="${CLEAN_PARALLELS:-true}"

# IDEs & editors
CLEAN_VSCODE="${CLEAN_VSCODE:-true}"
CLEAN_CURSOR="${CLEAN_CURSOR:-true}"
CLEAN_JETBRAINS="${CLEAN_JETBRAINS:-true}"
CLEAN_SUBLIME="${CLEAN_SUBLIME:-true}"

# Game / creative engines
CLEAN_ANDROID="${CLEAN_ANDROID:-true}"
CLEAN_UNITY="${CLEAN_UNITY:-true}"
CLEAN_UNREALENGINE="${CLEAN_UNREALENGINE:-true}"

# Creative apps
CLEAN_ADOBE="${CLEAN_ADOBE:-true}"
CLEAN_FINALCUT="${CLEAN_FINALCUT:-true}"
CLEAN_LOGIC="${CLEAN_LOGIC:-true}"
CLEAN_DAVINCI="${CLEAN_DAVINCI:-true}"
CLEAN_SKETCH="${CLEAN_SKETCH:-true}"
CLEAN_FIGMA="${CLEAN_FIGMA:-true}"

# Communication & media
CLEAN_SLACK="${CLEAN_SLACK:-true}"
CLEAN_ZOOM="${CLEAN_ZOOM:-true}"
CLEAN_TEAMS="${CLEAN_TEAMS:-true}"
CLEAN_DISCORD="${CLEAN_DISCORD:-true}"
CLEAN_SPOTIFY="${CLEAN_SPOTIFY:-true}"
CLEAN_TELEGRAM="${CLEAN_TELEGRAM:-true}"
CLEAN_WHATSAPP="${CLEAN_WHATSAPP:-true}"
CLEAN_SIGNAL="${CLEAN_SIGNAL:-true}"
CLEAN_SKYPE="${CLEAN_SKYPE:-true}"
CLEAN_VIBER="${CLEAN_VIBER:-true}"

# API / network tools
CLEAN_POSTMAN="${CLEAN_POSTMAN:-true}"
CLEAN_INSOMNIA="${CLEAN_INSOMNIA:-true}"
CLEAN_CHARLES="${CLEAN_CHARLES:-true}"
CLEAN_PROXYMAN="${CLEAN_PROXYMAN:-true}"
CLEAN_WIRESHARK="${CLEAN_WIRESHARK:-true}"

# Database tools
CLEAN_TABLEPLUS="${CLEAN_TABLEPLUS:-true}"
CLEAN_SEQUELACE="${CLEAN_SEQUELACE:-true}"
CLEAN_DBEAVER="${CLEAN_DBEAVER:-true}"
CLEAN_MYSQLWB="${CLEAN_MYSQLWB:-true}"

# Git clients
CLEAN_TOWER="${CLEAN_TOWER:-true}"
CLEAN_SOURCETREE="${CLEAN_SOURCETREE:-true}"
CLEAN_GITKRAKEN="${CLEAN_GITKRAKEN:-true}"

# Terminals
CLEAN_ITERM2="${CLEAN_ITERM2:-true}"
CLEAN_WARP="${CLEAN_WARP:-true}"
CLEAN_HYPER="${CLEAN_HYPER:-true}"

# Cloud storage
CLEAN_DROPBOX="${CLEAN_DROPBOX:-true}"
CLEAN_ONEDRIVE="${CLEAN_ONEDRIVE:-true}"
CLEAN_GOOGLEDRIVE="${CLEAN_GOOGLEDRIVE:-true}"

# Launchers
CLEAN_ALFRED="${CLEAN_ALFRED:-true}"
CLEAN_RAYCAST="${CLEAN_RAYCAST:-true}"

# VPN
CLEAN_NORDVPN="${CLEAN_NORDVPN:-true}"
CLEAN_EXPRESSVPN="${CLEAN_EXPRESSVPN:-true}"
CLEAN_MULLVAD="${CLEAN_MULLVAD:-true}"

# DevOps / cloud CLIs
CLEAN_TERRAFORM="${CLEAN_TERRAFORM:-true}"
CLEAN_ANSIBLE="${CLEAN_ANSIBLE:-true}"
CLEAN_AWS="${CLEAN_AWS:-true}"
CLEAN_GCLOUD="${CLEAN_GCLOUD:-true}"
CLEAN_AZURE="${CLEAN_AZURE:-true}"

# Shells
CLEAN_ZSH="${CLEAN_ZSH:-true}"
CLEAN_BASH="${CLEAN_BASH:-true}"
CLEAN_FISH="${CLEAN_FISH:-true}"

# Misc
CLEAN_TRASH="${CLEAN_TRASH:-true}"
CLEAN_HOMEBREW="${CLEAN_HOMEBREW:-true}"

# --- OPTIONS ---
usage() {
  cat << EOF
Usage: cleancache [OPTIONS]

Clean macOS caches, logs, and dev artifacts for the current user.
Only sections where relevant apps or folders are detected will be shown.

Options:
  -v, --verbose      Show each file/folder as it is deleted
  -i, --interactive  Prompt for confirmation before each section
  -h, --help         Show this help message and exit

Config file:
  ~/.cleancache.conf   Set default options and toggle sections on/off.
  A sample config is installed at:
    \$(brew --prefix)/share/cleancache/cleancache.conf
  Copy it with:
    cp "\$(brew --prefix)/share/cleancache/cleancache.conf" ~/.cleancache.conf

Notes:
  - Must be run with sudo for system-level cleanup (/Library/Caches, etc.)
  - Sections are skipped silently if the relevant app or folder is not found
  - Homebrew cleanup is run as the logged-in user automatically
  - CLI flags always override config file settings

Examples:
  sudo cleancache
  sudo cleancache -v
  sudo cleancache -i
  sudo cleancache -v -i
EOF
  exit 0
}

for arg in "$@"; do
  case "$arg" in
    -v|--verbose)     VERBOSE=true ;;
    -i|--interactive) INTERACTIVE=true ;;
    -h|--help)        usage ;;
    *)
      echo "Unknown option: $arg" >&2
      echo "Run 'cleancache --help' for usage." >&2
      exit 1
      ;;
  esac
done

# --- HELPERS ---

USER_HOME=$(eval echo "~$(logname 2>/dev/null || echo "$USER")")

_any_exist() {
  for p in "$@"; do [ -e "$p" ] && return 0; done
  return 1
}

_ask() {
  printf "\n%s [Y/n] " "$1"
  read -r answer </dev/tty
  case "$answer" in
    [nN][oO]|[nN]) return 1 ;;
    *) return 0 ;;
  esac
}

_ask_section() {
  $INTERACTIVE && { _ask "$1" || return 1; }
  return 0
}

_rm() {
  [ -e "$1" ] || return
  rm -rf "$1" 2>/dev/null
  $VERBOSE && echo "  Deleted: $1"
}

_rm_glob() {
  [ -d "$1" ] || return
  for entry in "$1"/* "$1"/.[!.]* "$1"/..?*; do
    [ -e "$entry" ] || continue
    rm -rf "$entry" 2>/dev/null
    $VERBOSE && echo "  Deleted: $entry"
  done
}

_section() {
  $VERBOSE && echo $'\n'"==> $1"
}

# Run a section only if relevant paths exist; optionally prompt
_run_section() {
  local label="$1" question="$2"; shift 2
  local check_paths=()
  while [[ "$1" != "--" ]]; do check_paths+=("$1"); shift; done; shift
  _any_exist "${check_paths[@]}" || return
  _ask_section "$question" || { $VERBOSE && echo "  Skipped: $label"; return; }
  _section "$label"
  "$@"
}

# ============================================================
# CLEANUP FUNCTIONS
# ============================================================

# --- SYSTEM ---
_clean_system() {
  _rm_glob /Library/Caches
  _rm_glob /private/var/log
  _rm_glob /private/tmp
  _rm_glob /Library/Logs
}

_clean_diagnostics() {
  _rm_glob "$USER_HOME/Library/Logs/DiagnosticReports"
  _rm_glob /Library/Logs/DiagnosticReports
  _rm_glob "$USER_HOME/Library/CrashReporter"
  find /private/var/folders -mindepth 3 -maxdepth 4 \
    \( -name "C" -o -name "T" \) -type d \
    -exec rm -rf {}/* \; 2>/dev/null
}

# --- BROWSERS ---
_clean_chrome() {
  _rm_glob "$USER_HOME/Library/Caches/Google/Chrome"
  if [ -d "$USER_HOME/Library/Application Support/Google/Chrome" ]; then
    for profile in "$USER_HOME/Library/Application Support/Google/Chrome"/*/; do
      [ -d "$profile" ] || continue
      _rm_glob "${profile}Cache"
      _rm_glob "${profile}Code Cache"
      _rm_glob "${profile}GPUCache"
      _rm_glob "${profile}Service Worker"
      _rm_glob "${profile}File System"
      _rm_glob "${profile}IndexedDB"
      _rm_glob "${profile}Application Cache"
    done
  fi
  _rm "$USER_HOME/Library/Application Support/Google/Chrome/optimization_guide_model_store"
  _rm "$USER_HOME/Library/Application Support/Google/GoogleUpdater/crx_cache"
  _rm_glob "$USER_HOME/Library/Application Support/Google/Chrome/component_crx_cache"
  _rm "$USER_HOME/Library/Application Support/Google/Chrome/OptGuideOnDeviceModel"
}

_clean_firefox() {
  _rm_glob "$USER_HOME/Library/Caches/Firefox"
  if [ -d "$USER_HOME/Library/Application Support/Firefox/Profiles" ]; then
    for profile in "$USER_HOME/Library/Application Support/Firefox/Profiles"/*/; do
      [ -d "$profile" ] || continue
      _rm_glob "${profile}cache2"
      _rm_glob "${profile}startupCache"
      _rm_glob "${profile}OfflineCache"
      _rm_glob "${profile}thumbnails"
      _rm      "${profile}places.sqlite-wal"
      _rm      "${profile}favicons.sqlite-wal"
    done
  fi
}

_clean_safari() {
  _rm_glob "$USER_HOME/Library/Caches/com.apple.Safari"
  _rm_glob "$USER_HOME/Library/Safari/LocalStorage"
  _rm_glob "$USER_HOME/Library/Safari/Databases"
  _rm_glob "$USER_HOME/Library/Safari/Favicon Cache"
  _rm_glob "$USER_HOME/Library/Caches/com.apple.WebKit.WebContent"
  _rm_glob "$USER_HOME/Library/Caches/com.apple.WebKit.Networking"
  _rm_glob "$USER_HOME/Library/Caches/com.apple.WebKit.GPU"
}

_clean_brave() {
  _rm_glob "$USER_HOME/Library/Caches/BraveSoftware/Brave-Browser"
  if [ -d "$USER_HOME/Library/Application Support/BraveSoftware/Brave-Browser" ]; then
    for profile in "$USER_HOME/Library/Application Support/BraveSoftware/Brave-Browser"/*/; do
      [ -d "$profile" ] || continue
      _rm_glob "${profile}Cache"
      _rm_glob "${profile}Code Cache"
      _rm_glob "${profile}GPUCache"
      _rm_glob "${profile}Service Worker"
      _rm_glob "${profile}IndexedDB"
    done
  fi
}

_clean_opera() {
  _rm_glob "$USER_HOME/Library/Caches/com.operasoftware.Opera"
  _rm_glob "$USER_HOME/Library/Application Support/com.operasoftware.Opera/Cache"
  _rm_glob "$USER_HOME/Library/Application Support/com.operasoftware.Opera/GPUCache"
}

_clean_edge() {
  _rm_glob "$USER_HOME/Library/Caches/Microsoft Edge"
  if [ -d "$USER_HOME/Library/Application Support/Microsoft Edge" ]; then
    for profile in "$USER_HOME/Library/Application Support/Microsoft Edge"/*/; do
      [ -d "$profile" ] || continue
      _rm_glob "${profile}Cache"
      _rm_glob "${profile}Code Cache"
      _rm_glob "${profile}GPUCache"
      _rm_glob "${profile}Service Worker"
    done
  fi
}

_clean_arc() {
  _rm_glob "$USER_HOME/Library/Caches/company.thebrowser.Browser"
  if [ -d "$USER_HOME/Library/Application Support/Arc/User Data" ]; then
    for profile in "$USER_HOME/Library/Application Support/Arc/User Data"/*/; do
      [ -d "$profile" ] || continue
      _rm_glob "${profile}Cache"
      _rm_glob "${profile}Code Cache"
      _rm_glob "${profile}GPUCache"
      _rm_glob "${profile}Service Worker"
    done
  fi
}

# --- APPLE APPS ---
_clean_user_caches() {
  _rm_glob "$USER_HOME/Library/Caches"
  _rm_glob "$USER_HOME/Library/Logs"
}

_clean_mail() {
  _rm_glob "$USER_HOME/Library/Containers/com.apple.mail/Data/Library/Mail Downloads"
  _rm_glob "$USER_HOME/Library/Containers/com.apple.mail/Data/Library/Caches"
  _rm_glob "$USER_HOME/Library/Mail/V10/MailData/Attachments"
}

# --- APPLE DEV ---
_clean_xcode() {
  _rm_glob "$USER_HOME/Library/Developer/Xcode/DerivedData"
  _rm_glob "$USER_HOME/Library/Developer/Xcode/Archives"
  _rm_glob "$USER_HOME/Library/Developer/Xcode/iOS DeviceSupport"
  _rm_glob "$USER_HOME/Library/Developer/Xcode/watchOS DeviceSupport"
  _rm_glob "$USER_HOME/Library/Developer/Xcode/tvOS DeviceSupport"
  _rm_glob "$USER_HOME/Library/Developer/Xcode/visionOS DeviceSupport"
  _rm_glob "$USER_HOME/Library/Developer/CoreSimulator/Caches"
  _rm_glob "$USER_HOME/Library/Caches/com.apple.dt.Xcode"
  _rm_glob "$USER_HOME/Library/Caches/com.apple.dt.instruments"
}

_clean_swiftpm() {
  _rm_glob "$USER_HOME/Library/Caches/org.swift.swiftpm"
  _rm_glob "$USER_HOME/.swiftpm/cache"
}

# --- BUILD / PACKAGE MANAGERS ---
_clean_flutter() {
  _rm "$USER_HOME/development/flutter/bin/cache"
  _rm "$USER_HOME/.flutter"
  _rm_glob "$USER_HOME/.flutter_tool_state"
  _rm_glob "$USER_HOME/.dart"
}

_clean_gradle() {
  _rm "$USER_HOME/.gradle/caches"
  _rm "$USER_HOME/.gradle/daemon"
  _rm "$USER_HOME/.gradle/wrapper/dists"
  _rm_glob "$USER_HOME/.gradle/notifications"
}

_clean_maven() {
  _rm_glob "$USER_HOME/.m2/repository"
  _rm_glob "$USER_HOME/.m2/.cache"
}

_clean_npm() {
  _rm "$USER_HOME/.npm/_cacache"
  _rm "$USER_HOME/.npm/_logs"
  _rm_glob "$USER_HOME/Library/Caches/npm"
}

_clean_yarn() {
  _rm_glob "$USER_HOME/Library/Caches/Yarn"
  _rm_glob "$USER_HOME/.yarn/cache"
  _rm_glob "$USER_HOME/.cache/yarn"
}

_clean_pnpm() {
  _rm_glob "$USER_HOME/Library/Caches/pnpm"
  _rm_glob "$USER_HOME/.pnpm-store"
  _rm_glob "$USER_HOME/.local/share/pnpm/store"
}

_clean_bun() {
  _rm_glob "$USER_HOME/.bun/install/cache"
}

_clean_deno() {
  _rm_glob "$USER_HOME/Library/Caches/deno"
  _rm_glob "$USER_HOME/.cache/deno"
}

_clean_pub() {
  _rm "$USER_HOME/.pub-cache/cache"
  _rm_glob "$USER_HOME/.pub-cache/hosted"
}

_clean_cargo() {
  _rm "$USER_HOME/.cargo/registry/cache"
  _rm "$USER_HOME/.cargo/registry/src"
  _rm "$USER_HOME/.cargo/git/checkouts"
}

_clean_composer() {
  _rm_glob "$USER_HOME/.composer/cache"
  _rm_glob "$USER_HOME/Library/Caches/composer"
}

_clean_cocoapods() {
  _rm_glob "$USER_HOME/Library/Caches/CocoaPods"
  _rm_glob "$USER_HOME/.cocoapods/cache"
}

_clean_python() {
  _rm_glob "$USER_HOME/Library/Caches/pip"
  _rm_glob "$USER_HOME/.cache/pip"
  _rm_glob "$USER_HOME/.pyenv/cache"
  _rm_glob "$USER_HOME/.cache/pypoetry"
  _rm_glob "$USER_HOME/Library/Caches/pypoetry"
  find "$USER_HOME" -maxdepth 8 -type d -name "__pycache__" \
    -not -path "*/.git/*" -exec rm -rf {} + 2>/dev/null
  find "$USER_HOME" -maxdepth 8 -type d -name "*.egg-info" \
    -not -path "*/.git/*" -exec rm -rf {} + 2>/dev/null
  find "$USER_HOME" -maxdepth 8 -name "*.pyc" \
    -not -path "*/.git/*" -delete 2>/dev/null
}

_clean_ruby() {
  _rm_glob "$USER_HOME/.gem/cache"
  _rm_glob "$USER_HOME/.bundle/cache"
  _rm_glob "$USER_HOME/.rbenv/cache"
  _rm_glob "$USER_HOME/Library/Caches/rbenv"
}

_clean_go() {
  _rm_glob "$USER_HOME/.cache/go-build"
  _rm_glob "$USER_HOME/Library/Caches/go-build"
  _rm_glob "$USER_HOME/go/pkg/mod/cache"
}

_clean_rust() {
  _rm_glob "$USER_HOME/.rustup/tmp"
  _rm_glob "$USER_HOME/.rustup/download"
}

_clean_elixir() {
  _rm_glob "$USER_HOME/.mix/archives"
  _rm_glob "$USER_HOME/.hex/packages"
  _rm_glob "$USER_HOME/.cache/rebar3"
}

_clean_haskell() {
  _rm_glob "$USER_HOME/.stack/programs"
  _rm_glob "$USER_HOME/.stack/precompiled"
  _rm_glob "$USER_HOME/.cabal/packages"
  _rm_glob "$USER_HOME/.cabal/store"
  _rm_glob "$USER_HOME/.cache/cabal"
}

_clean_nvm() {
  _rm_glob "$USER_HOME/.nvm/.cache"
}

_clean_rvm() {
  _rm_glob "$USER_HOME/.rvm/archives"
  _rm_glob "$USER_HOME/.rvm/log"
  _rm_glob "$USER_HOME/.rvm/tmp"
}

_clean_sdkman() {
  _rm_glob "$USER_HOME/.sdkman/archives"
  _rm_glob "$USER_HOME/.sdkman/tmp"
}

# --- CONTAINERS & VMs ---
_clean_docker() {
  _rm "$USER_HOME/.docker/buildx"
  _rm "$USER_HOME/.docker/scout"
  _rm_glob "$USER_HOME/.docker/tmp"
  if command -v docker &>/dev/null; then
    docker system prune -f >/dev/null 2>&1
    $VERBOSE && echo "  Ran: docker system prune -f"
  fi
}

_clean_podman() {
  _rm_glob "$USER_HOME/.local/share/containers/cache"
  if command -v podman &>/dev/null; then
    podman system prune -f >/dev/null 2>&1
    $VERBOSE && echo "  Ran: podman system prune -f"
  fi
}

_clean_vagrant() {
  _rm_glob "$USER_HOME/.vagrant.d/tmp"
  _rm_glob "$USER_HOME/.vagrant.d/cache"
}

_clean_virtualbox() {
  _rm_glob "$USER_HOME/Library/Logs/VirtualBox"
  _rm_glob "$USER_HOME/Library/Caches/org.virtualbox.app.VirtualBox"
  find "$USER_HOME/VirtualBox VMs" -maxdepth 3 \
    -type d -name "Logs" -exec rm -rf {}/* \; 2>/dev/null
}

_clean_vmware() {
  _rm_glob "$USER_HOME/Library/Caches/com.vmware.fusion"
  _rm_glob "$USER_HOME/Library/Logs/VMware Fusion"
  find "$USER_HOME/Documents/Virtual Machines.localized" -maxdepth 3 \
    -name "vmware*.log" -delete 2>/dev/null
}

_clean_parallels() {
  _rm_glob "$USER_HOME/Library/Caches/com.parallels.desktop.console"
  _rm_glob "$USER_HOME/Library/Logs/Parallels"
  find "$USER_HOME/Parallels" -maxdepth 3 \
    -name "parallels*.log" -delete 2>/dev/null
}

# --- IDEs & EDITORS ---
_clean_vscode() {
  _rm_glob "$USER_HOME/Library/Application Support/Code/Cache"
  _rm_glob "$USER_HOME/Library/Application Support/Code/CachedData"
  _rm_glob "$USER_HOME/Library/Application Support/Code/CachedExtensionVSIXs"
  _rm_glob "$USER_HOME/Library/Application Support/Code/Code Cache"
  _rm_glob "$USER_HOME/Library/Application Support/Code/GPUCache"
  _rm_glob "$USER_HOME/Library/Application Support/Code/logs"
  _rm_glob "$USER_HOME/Library/Application Support/Code/User/workspaceStorage"
  _rm_glob "$USER_HOME/Library/Application Support/Code/User/History"
}

_clean_cursor() {
  _rm_glob "$USER_HOME/Library/Application Support/Cursor/Cache"
  _rm_glob "$USER_HOME/Library/Application Support/Cursor/CachedData"
  _rm_glob "$USER_HOME/Library/Application Support/Cursor/Code Cache"
  _rm_glob "$USER_HOME/Library/Application Support/Cursor/GPUCache"
  _rm_glob "$USER_HOME/Library/Application Support/Cursor/logs"
  _rm_glob "$USER_HOME/.cursor/User/workspaceStorage"
  _rm_glob "$USER_HOME/.cursor/User/History"
}

_clean_jetbrains() {
  for dir in "$USER_HOME/Library/Caches/JetBrains"/*/; do
    [ -d "$dir" ] && _rm_glob "$dir"
  done
  for dir in "$USER_HOME/Library/Logs/JetBrains"/*/; do
    [ -d "$dir" ] && _rm_glob "$dir"
  done
  for dir in "$USER_HOME/Library/Application Support/JetBrains"/*/; do
    [ -d "$dir" ] || continue
    _rm_glob "${dir}caches"
    _rm_glob "${dir}index"
    _rm_glob "${dir}log"
  done
}

_clean_sublime() {
  _rm_glob "$USER_HOME/Library/Application Support/Sublime Text/Cache"
  _rm_glob "$USER_HOME/Library/Application Support/Sublime Text 3/Cache"
  _rm_glob "$USER_HOME/Library/Caches/com.sublimetext.4"
  _rm_glob "$USER_HOME/Library/Caches/com.sublimehq.sublime-text"
}

# --- GAME / CREATIVE ENGINES ---
_clean_android() {
  _rm_glob "$USER_HOME/.android/cache"
  _rm_glob "$USER_HOME/.android/build-cache"
  _rm_glob "$USER_HOME/Library/Android/sdk/.temp"
}

_clean_unity() {
  _rm_glob "$USER_HOME/Library/Caches/Unity"
  _rm_glob "$USER_HOME/Library/Unity/Asset Store-5.x"
  _rm_glob "$USER_HOME/Library/Application Support/Unity/Asset Store-5.x"
}

_clean_unrealengine() {
  _rm_glob "$USER_HOME/Library/Application Support/Epic/EpicGamesLauncher/Saved/webcache"
  _rm_glob "$USER_HOME/Library/Caches/com.epicgames.launcher"
  find "$USER_HOME" -maxdepth 6 -type d \
    -name "DerivedDataCache" -path "*/UnrealEngine/*" \
    -exec rm -rf {} + 2>/dev/null
}

# --- CREATIVE APPS ---
_clean_adobe() {
  _rm_glob "$USER_HOME/Library/Application Support/Adobe/Common/Media Cache Files"
  _rm_glob "$USER_HOME/Library/Application Support/Adobe/Common/Media Cache"
  _rm_glob "$USER_HOME/Library/Application Support/Adobe/Common/Peak Files"
  for dir in "$USER_HOME/Library/Caches/Adobe"/*/; do
    [ -d "$dir" ] && _rm_glob "$dir"
  done
  for dir in "$USER_HOME/Library/Application Support/Adobe"/*/; do
    [ -d "$dir" ] || continue
    _rm_glob "${dir}Cache"
    _rm_glob "${dir}Caches"
  done
}

_clean_finalcut() {
  _rm_glob "$USER_HOME/Library/Caches/com.apple.FinalCut"
  _rm_glob "$USER_HOME/Library/Application Support/ProApps/Final Cut Pro"
  _rm_glob "$USER_HOME/Library/Application Support/Motion"
  find "$USER_HOME/Movies" -maxdepth 4 \
    -type d -name "Render Files" -exec rm -rf {}/* \; 2>/dev/null
  find "$USER_HOME/Movies" -maxdepth 4 \
    -type d -name "Analysis Files" -exec rm -rf {}/* \; 2>/dev/null
}

_clean_logic() {
  _rm_glob "$USER_HOME/Library/Caches/com.apple.logic10"
  _rm_glob "$USER_HOME/Library/Application Support/Logic"
  _rm_glob "$USER_HOME/Library/Caches/com.apple.garageband10"
}

_clean_davinci() {
  _rm_glob "$USER_HOME/Library/Application Support/Blackmagic Design/DaVinci Resolve/logs"
  _rm_glob "$USER_HOME/Library/Caches/com.blackmagic-design.DaVinciResolve"
}

_clean_sketch() {
  _rm_glob "$USER_HOME/Library/Caches/com.bohemiancoding.sketch3"
  _rm_glob "$USER_HOME/Library/Application Support/com.bohemiancoding.sketch3/Cache"
}

_clean_figma() {
  _rm_glob "$USER_HOME/Library/Caches/com.figma.Desktop"
  _rm_glob "$USER_HOME/Library/Application Support/Figma/Cache"
  _rm_glob "$USER_HOME/Library/Application Support/Figma/Code Cache"
  _rm_glob "$USER_HOME/Library/Application Support/Figma/GPUCache"
}

# --- COMMUNICATION & MEDIA ---
_clean_slack() {
  _rm_glob "$USER_HOME/Library/Application Support/Slack/Cache"
  _rm_glob "$USER_HOME/Library/Application Support/Slack/Code Cache"
  _rm_glob "$USER_HOME/Library/Application Support/Slack/GPUCache"
  _rm_glob "$USER_HOME/Library/Application Support/Slack/Service Worker/CacheStorage"
  _rm_glob "$USER_HOME/Library/Application Support/Slack/logs"
  _rm_glob "$USER_HOME/Library/Caches/com.tinyspeck.slackmacgap"
}

_clean_zoom() {
  _rm_glob "$USER_HOME/Library/Application Support/zoom.us/Cache"
  _rm_glob "$USER_HOME/Library/Caches/us.zoom.xos"
  _rm_glob "$USER_HOME/Library/Logs/zoom.us"
}

_clean_teams() {
  _rm_glob "$USER_HOME/Library/Application Support/Microsoft/Teams/Cache"
  _rm_glob "$USER_HOME/Library/Application Support/Microsoft/Teams/Code Cache"
  _rm_glob "$USER_HOME/Library/Application Support/Microsoft/Teams/GPUCache"
  _rm_glob "$USER_HOME/Library/Application Support/Microsoft/Teams/Service Worker/CacheStorage"
  _rm_glob "$USER_HOME/Library/Application Support/Microsoft/Teams/logs"
}

_clean_discord() {
  _rm_glob "$USER_HOME/Library/Application Support/discord/Cache"
  _rm_glob "$USER_HOME/Library/Application Support/discord/Code Cache"
  _rm_glob "$USER_HOME/Library/Application Support/discord/GPUCache"
  _rm_glob "$USER_HOME/Library/Caches/com.hnc.Discord"
}

_clean_spotify() {
  _rm_glob "$USER_HOME/Library/Application Support/Spotify/PersistentCache"
  _rm_glob "$USER_HOME/Library/Caches/com.spotify.client"
}

_clean_telegram() {
  _rm_glob "$USER_HOME/Library/Application Support/Telegram Desktop/tdata/user_data/media_cache"
  _rm_glob "$USER_HOME/Library/Caches/ru.keepcoder.Telegram"
  _rm_glob "$USER_HOME/Library/Caches/com.telegram.desktop"
}

_clean_whatsapp() {
  _rm_glob "$USER_HOME/Library/Application Support/WhatsApp/Cache"
  _rm_glob "$USER_HOME/Library/Application Support/WhatsApp/Code Cache"
  _rm_glob "$USER_HOME/Library/Caches/net.whatsapp.WhatsApp"
}

_clean_signal() {
  _rm_glob "$USER_HOME/Library/Application Support/Signal/Cache"
  _rm_glob "$USER_HOME/Library/Application Support/Signal/Code Cache"
  _rm_glob "$USER_HOME/Library/Application Support/Signal/GPUCache"
}

_clean_skype() {
  _rm_glob "$USER_HOME/Library/Application Support/Skype/Cache"
  _rm_glob "$USER_HOME/Library/Caches/com.skype.skype"
}

_clean_viber() {
  _rm_glob "$USER_HOME/Library/Caches/com.viber.desktop"
  _rm_glob "$USER_HOME/Library/Application Support/Viber/Cache"
}

# --- API / NETWORK TOOLS ---
_clean_postman() {
  _rm_glob "$USER_HOME/Library/Application Support/Postman/Cache"
  _rm_glob "$USER_HOME/Library/Application Support/Postman/Code Cache"
  _rm_glob "$USER_HOME/Library/Application Support/Postman/GPUCache"
  _rm_glob "$USER_HOME/Library/Application Support/Postman/logs"
}

_clean_insomnia() {
  _rm_glob "$USER_HOME/Library/Application Support/Insomnia/Cache"
  _rm_glob "$USER_HOME/Library/Application Support/Insomnia/Code Cache"
  _rm_glob "$USER_HOME/Library/Application Support/Insomnia/GPUCache"
}

_clean_charles() {
  _rm_glob "$USER_HOME/Library/Caches/com.xk72.charles.config"
  _rm_glob "$USER_HOME/Library/Logs/Charles"
}

_clean_proxyman() {
  _rm_glob "$USER_HOME/Library/Caches/com.proxyman.NSApp"
  _rm_glob "$USER_HOME/Library/Logs/Proxyman"
}

_clean_wireshark() {
  _rm_glob "$USER_HOME/Library/Caches/org.wireshark.Wireshark"
  _rm_glob "$USER_HOME/Library/Logs/Wireshark"
}

# --- DATABASE TOOLS ---
_clean_tableplus() {
  _rm_glob "$USER_HOME/Library/Caches/com.tinyapp.TablePlus"
  _rm_glob "$USER_HOME/Library/Logs/TablePlus"
}

_clean_sequelace() {
  _rm_glob "$USER_HOME/Library/Caches/com.sequel-ace.sequel-ace"
  _rm_glob "$USER_HOME/Library/Logs/Sequel Ace"
}

_clean_dbeaver() {
  _rm_glob "$USER_HOME/Library/Caches/dbeaver4"
  _rm_glob "$USER_HOME/.local/share/DBeaverData/workspace6/.metadata"
}

_clean_mysqlwb() {
  _rm_glob "$USER_HOME/Library/Caches/com.oracle.mysql.workbench"
  _rm_glob "$USER_HOME/Library/Application Support/MySQL/Workbench/log"
}

# --- GIT CLIENTS ---
_clean_tower() {
  _rm_glob "$USER_HOME/Library/Caches/com.fournova.Tower2"
  _rm_glob "$USER_HOME/Library/Caches/com.fournova.Tower3"
  _rm_glob "$USER_HOME/Library/Logs/com.fournova.Tower2"
}

_clean_sourcetree() {
  _rm_glob "$USER_HOME/Library/Caches/com.torusknot.SourceTreeNotMAS"
  _rm      "$USER_HOME/Library/Logs/SourceTree.log"
}

_clean_gitkraken() {
  _rm_glob "$USER_HOME/Library/Application Support/GitKraken/Cache"
  _rm_glob "$USER_HOME/Library/Application Support/GitKraken/logs"
}

# --- TERMINALS ---
_clean_iterm2() {
  _rm_glob "$USER_HOME/Library/Caches/com.googlecode.iterm2"
  _rm_glob "$USER_HOME/Library/Application Support/iTerm2/Cache"
}

_clean_warp() {
  _rm_glob "$USER_HOME/Library/Application Support/Warp/Cache"
  _rm_glob "$USER_HOME/Library/Application Support/Warp/Code Cache"
  _rm_glob "$USER_HOME/Library/Application Support/Warp/GPUCache"
  _rm_glob "$USER_HOME/Library/Logs/Warp"
}

_clean_hyper() {
  _rm_glob "$USER_HOME/Library/Application Support/Hyper/Cache"
  _rm_glob "$USER_HOME/Library/Application Support/Hyper/Code Cache"
  _rm_glob "$USER_HOME/Library/Application Support/Hyper/GPUCache"
  _rm_glob "$USER_HOME/Library/Logs/Hyper"
}

# --- CLOUD STORAGE ---
_clean_dropbox() {
  _rm_glob "$USER_HOME/Library/Caches/com.getdropbox.dropbox"
  _rm_glob "$USER_HOME/Library/Application Support/Dropbox/logs"
}

_clean_onedrive() {
  _rm_glob "$USER_HOME/Library/Caches/com.microsoft.OneDrive"
  _rm_glob "$USER_HOME/Library/Logs/OneDrive"
}

_clean_googledrive() {
  _rm_glob "$USER_HOME/Library/Caches/com.google.GoogleDrive"
  _rm_glob "$USER_HOME/Library/Application Support/Google/DriveFS/Logs"
}

# --- LAUNCHERS ---
_clean_alfred() {
  _rm_glob "$USER_HOME/Library/Caches/com.runningwithcrayons.Alfred"
  _rm_glob "$USER_HOME/Library/Application Support/Alfred/Cache"
}

_clean_raycast() {
  _rm_glob "$USER_HOME/Library/Caches/com.raycast.macos"
  _rm_glob "$USER_HOME/Library/Application Support/com.raycast.macos/Cache"
}

# --- VPN ---
_clean_nordvpn() {
  _rm_glob "$USER_HOME/Library/Logs/NordVPN"
  _rm_glob "$USER_HOME/Library/Application Support/NordVPN/logs"
}

_clean_expressvpn() {
  _rm_glob "$USER_HOME/Library/Logs/ExpressVPN"
  _rm_glob "$USER_HOME/Library/Application Support/ExpressVPN/logs"
}

_clean_mullvad() {
  _rm_glob "$USER_HOME/Library/Logs/Mullvad VPN"
  _rm_glob "$USER_HOME/Library/Application Support/Mullvad VPN/logs"
}

# --- DEVOPS / CLOUD CLIs ---
_clean_terraform() {
  _rm_glob "$USER_HOME/.terraform.d/plugin-cache"
  find "$USER_HOME" -maxdepth 6 -type d \
    -name ".terraform" -not -path "*/.git/*" \
    -exec rm -rf {}/.terraform.lock.hcl {} + 2>/dev/null
}

_clean_ansible() {
  _rm_glob "$USER_HOME/.ansible/tmp"
  _rm_glob "$USER_HOME/.ansible/cache"
  _rm_glob "$USER_HOME/.cache/ansible-compat"
}

_clean_aws() {
  _rm_glob "$USER_HOME/.aws/cli/cache"
  _rm_glob "$USER_HOME/.aws/sso/cache"
}

_clean_gcloud() {
  _rm_glob "$USER_HOME/.config/gcloud/logs"
  _rm_glob "$USER_HOME/Library/Caches/google-cloud-tools-python"
  _rm      "$USER_HOME/.config/gcloud/.last_survey_prompt.yaml"
  _rm      "$USER_HOME/.config/gcloud/.last_update_check.json"
}

_clean_azure() {
  _rm_glob "$USER_HOME/.azure/logs"
  _rm_glob "$USER_HOME/.azure/telemetry"
  _rm_glob "$USER_HOME/Library/Caches/com.microsoft.azure-cli"
}

# --- SHELLS ---
_clean_zsh() {
  _rm_glob "$USER_HOME/.zsh_sessions"
  for f in "$USER_HOME"/.zcompdump*; do
    [ -e "$f" ] || continue
    rm -f "$f" 2>/dev/null
    $VERBOSE && echo "  Deleted: $f"
  done
}

_clean_bash() {
  _rm_glob "$USER_HOME/.bash_sessions"
  _rm      "$USER_HOME/.bash_history"
}

_clean_fish() {
  _rm_glob "$USER_HOME/.local/share/fish/generated_completions"
}

# --- MISC ---
_clean_trash() {
  _rm_glob "$USER_HOME/.Trash"
}

_clean_homebrew() {
  BREW_BIN=""
  [ -x /opt/homebrew/bin/brew ] && BREW_BIN=/opt/homebrew/bin/brew
  [ -x /usr/local/bin/brew ]    && BREW_BIN=/usr/local/bin/brew
  [ -z "$BREW_BIN" ] && return
  REAL_USER="$(logname 2>/dev/null || echo "$USER")"
  if $VERBOSE; then
    echo "  Running: brew cleanup --prune=all"
    HOMEBREW_NO_AUTO_UPDATE=1 \
      sudo -u "$REAL_USER" "$BREW_BIN" cleanup --prune=all 2>/dev/null
  else
    HOMEBREW_NO_AUTO_UPDATE=1 \
      sudo -u "$REAL_USER" "$BREW_BIN" cleanup --prune=all >/dev/null 2>&1
  fi
}

# ============================================================
# RUN SECTIONS
# ============================================================

# --- SYSTEM ---
$CLEAN_SYSTEM && _run_section \
  "System Caches & Logs" \
  "Clean system caches and logs? (/Library/Caches, /private/var/log, /private/tmp)" \
  /Library/Caches /private/var/log /private/tmp -- _clean_system

$CLEAN_DIAGNOSTICS && _run_section \
  "Crash Reports & Diagnostics" \
  "Delete crash reports and diagnostic logs?" \
  "$USER_HOME/Library/Logs/DiagnosticReports" /Library/Logs/DiagnosticReports -- _clean_diagnostics

# --- BROWSERS ---
$CLEAN_CHROME && _run_section \
  "Google Chrome" \
  "Clean Google Chrome caches and browsing data? (You will stay logged in)" \
  "$USER_HOME/Library/Application Support/Google/Chrome" \
  "$USER_HOME/Library/Caches/Google/Chrome" -- _clean_chrome

$CLEAN_FIREFOX && _run_section \
  "Firefox" \
  "Clean Firefox caches and session data? (You will stay logged in)" \
  "$USER_HOME/Library/Application Support/Firefox" \
  "$USER_HOME/Library/Caches/Firefox" -- _clean_firefox

$CLEAN_SAFARI && _run_section \
  "Safari" \
  "Clean Safari caches, databases, and local storage?" \
  "$USER_HOME/Library/Caches/com.apple.Safari" \
  "$USER_HOME/Library/Safari" -- _clean_safari

$CLEAN_BRAVE && _run_section \
  "Brave Browser" \
  "Clean Brave Browser caches and browsing data? (You will stay logged in)" \
  "$USER_HOME/Library/Application Support/BraveSoftware/Brave-Browser" -- _clean_brave

$CLEAN_OPERA && _run_section \
  "Opera" \
  "Clean Opera caches?" \
  "$USER_HOME/Library/Application Support/com.operasoftware.Opera" -- _clean_opera

$CLEAN_EDGE && _run_section \
  "Microsoft Edge" \
  "Clean Microsoft Edge caches and browsing data? (You will stay logged in)" \
  "$USER_HOME/Library/Application Support/Microsoft Edge" -- _clean_edge

$CLEAN_ARC && _run_section \
  "Arc Browser" \
  "Clean Arc Browser caches and browsing data? (You will stay logged in)" \
  "$USER_HOME/Library/Application Support/Arc" -- _clean_arc

# --- APPLE APPS ---
$CLEAN_USER_CACHES && _run_section \
  "User Library Caches & Logs" \
  "Clean all user library caches and logs? (~/Library/Caches, ~/Library/Logs)" \
  "$USER_HOME/Library/Caches" "$USER_HOME/Library/Logs" -- _clean_user_caches

$CLEAN_MAIL && _run_section \
  "Apple Mail" \
  "Clean Apple Mail downloads, attachments cache, and mail caches?" \
  "$USER_HOME/Library/Containers/com.apple.mail" -- _clean_mail

# --- APPLE DEV ---
$CLEAN_XCODE && _run_section \
  "Xcode" \
  "Clean Xcode DerivedData, archives, device support files, and simulator caches?" \
  "$USER_HOME/Library/Developer/Xcode" -- _clean_xcode

$CLEAN_SWIFTPM && _run_section \
  "Swift Package Manager" \
  "Clean Swift Package Manager cache?" \
  "$USER_HOME/Library/Caches/org.swift.swiftpm" "$USER_HOME/.swiftpm" -- _clean_swiftpm

# --- BUILD / PACKAGE MANAGERS ---
$CLEAN_FLUTTER && _run_section \
  "Flutter / Dart" \
  "Clean Flutter SDK and Dart tool caches?" \
  "$USER_HOME/development/flutter" "$USER_HOME/.flutter" "$USER_HOME/.dart" -- _clean_flutter

$CLEAN_GRADLE && _run_section \
  "Gradle" \
  "Clean Gradle build caches, daemon files, and wrapper distributions?" \
  "$USER_HOME/.gradle" -- _clean_gradle

$CLEAN_MAVEN && _run_section \
  "Maven" \
  "Clean Maven local repository and caches?" \
  "$USER_HOME/.m2" -- _clean_maven

$CLEAN_NPM && _run_section \
  "npm" \
  "Clean npm package cache and logs?" \
  "$USER_HOME/.npm" -- _clean_npm

$CLEAN_YARN && _run_section \
  "Yarn" \
  "Clean Yarn package cache?" \
  "$USER_HOME/Library/Caches/Yarn" "$USER_HOME/.yarn" "$USER_HOME/.cache/yarn" -- _clean_yarn

$CLEAN_PNPM && _run_section \
  "pnpm" \
  "Clean pnpm package store and cache?" \
  "$USER_HOME/Library/Caches/pnpm" "$USER_HOME/.pnpm-store" -- _clean_pnpm

$CLEAN_BUN && _run_section \
  "Bun" \
  "Clean Bun install cache?" \
  "$USER_HOME/.bun/install/cache" -- _clean_bun

$CLEAN_DENO && _run_section \
  "Deno" \
  "Clean Deno module cache?" \
  "$USER_HOME/Library/Caches/deno" "$USER_HOME/.cache/deno" -- _clean_deno

$CLEAN_PUB && _run_section \
  "Dart / pub" \
  "Clean Dart pub package cache?" \
  "$USER_HOME/.pub-cache" -- _clean_pub

$CLEAN_CARGO && _run_section \
  "Rust / Cargo" \
  "Clean Cargo registry and source caches?" \
  "$USER_HOME/.cargo" -- _clean_cargo

$CLEAN_COMPOSER && _run_section \
  "PHP / Composer" \
  "Clean Composer package cache?" \
  "$USER_HOME/.composer" -- _clean_composer

$CLEAN_COCOAPODS && _run_section \
  "CocoaPods" \
  "Clean CocoaPods download and spec cache?" \
  "$USER_HOME/Library/Caches/CocoaPods" "$USER_HOME/.cocoapods" -- _clean_cocoapods

$CLEAN_PYTHON && _run_section \
  "Python (pip / poetry / pyenv)" \
  "Clean Python pip cache, poetry cache, pyenv downloads, and __pycache__ files?" \
  "$USER_HOME/Library/Caches/pip" "$USER_HOME/.cache/pip" "$USER_HOME/.pyenv" -- _clean_python

$CLEAN_RUBY && _run_section \
  "Ruby / Gems / Bundler" \
  "Clean Ruby gem cache and Bundler cache?" \
  "$USER_HOME/.gem" "$USER_HOME/.bundle" "$USER_HOME/.rbenv" -- _clean_ruby

$CLEAN_GO && _run_section \
  "Go" \
  "Clean Go build cache and module cache?" \
  "$USER_HOME/.cache/go-build" "$USER_HOME/go/pkg/mod/cache" -- _clean_go

$CLEAN_RUST && _run_section \
  "Rust / Rustup" \
  "Clean Rustup downloads and temp files?" \
  "$USER_HOME/.rustup" -- _clean_rust

$CLEAN_ELIXIR && _run_section \
  "Elixir / Mix / Hex" \
  "Clean Elixir Mix archives and Hex package cache?" \
  "$USER_HOME/.mix" "$USER_HOME/.hex" -- _clean_elixir

$CLEAN_HASKELL && _run_section \
  "Haskell (Stack / Cabal)" \
  "Clean Haskell Stack and Cabal package stores and build caches?" \
  "$USER_HOME/.stack" "$USER_HOME/.cabal" -- _clean_haskell

$CLEAN_NVM && _run_section \
  "NVM (Node Version Manager)" \
  "Clean NVM internal cache?" \
  "$USER_HOME/.nvm" -- _clean_nvm

$CLEAN_RVM && _run_section \
  "RVM (Ruby Version Manager)" \
  "Clean RVM archives, logs, and temp files?" \
  "$USER_HOME/.rvm" -- _clean_rvm

$CLEAN_SDKMAN && _run_section \
  "SDKMAN" \
  "Clean SDKMAN archives and temp files?" \
  "$USER_HOME/.sdkman" -- _clean_sdkman

# --- CONTAINERS & VMs ---
$CLEAN_DOCKER && _run_section \
  "Docker" \
  "Clean Docker build caches and run 'docker system prune'? (Stopped containers and dangling images will be removed)" \
  "$USER_HOME/.docker" -- _clean_docker

$CLEAN_PODMAN && _run_section \
  "Podman" \
  "Clean Podman caches and run 'podman system prune'?" \
  "$USER_HOME/.local/share/containers" -- _clean_podman

$CLEAN_VAGRANT && _run_section \
  "Vagrant" \
  "Clean Vagrant temp and cache files?" \
  "$USER_HOME/.vagrant.d" -- _clean_vagrant

$CLEAN_VIRTUALBOX && _run_section \
  "VirtualBox" \
  "Clean VirtualBox caches and VM logs?" \
  "$USER_HOME/Library/Caches/org.virtualbox.app.VirtualBox" \
  "$USER_HOME/VirtualBox VMs" -- _clean_virtualbox

$CLEAN_VMWARE && _run_section \
  "VMware Fusion" \
  "Clean VMware Fusion caches and VM logs?" \
  "$USER_HOME/Library/Caches/com.vmware.fusion" -- _clean_vmware

$CLEAN_PARALLELS && _run_section \
  "Parallels Desktop" \
  "Clean Parallels Desktop caches and VM logs?" \
  "$USER_HOME/Library/Caches/com.parallels.desktop.console" -- _clean_parallels

# --- IDEs & EDITORS ---
$CLEAN_VSCODE && _run_section \
  "Visual Studio Code" \
  "Clean VS Code caches, GPU cache, and workspace storage?" \
  "$USER_HOME/Library/Application Support/Code" -- _clean_vscode

$CLEAN_CURSOR && _run_section \
  "Cursor" \
  "Clean Cursor IDE caches and workspace storage?" \
  "$USER_HOME/Library/Application Support/Cursor" "$USER_HOME/.cursor" -- _clean_cursor

$CLEAN_JETBRAINS && _run_section \
  "JetBrains IDEs" \
  "Clean JetBrains caches and logs? (IntelliJ, WebStorm, PyCharm, GoLand, Rider, CLion, etc.)" \
  "$USER_HOME/Library/Caches/JetBrains" -- _clean_jetbrains

$CLEAN_SUBLIME && _run_section \
  "Sublime Text" \
  "Clean Sublime Text caches?" \
  "$USER_HOME/Library/Application Support/Sublime Text" -- _clean_sublime

# --- GAME / CREATIVE ENGINES ---
$CLEAN_ANDROID && _run_section \
  "Android SDK" \
  "Clean Android build cache and SDK temp files?" \
  "$USER_HOME/.android" "$USER_HOME/Library/Android" -- _clean_android

$CLEAN_UNITY && _run_section \
  "Unity" \
  "Clean Unity asset store cache and editor caches?" \
  "$USER_HOME/Library/Caches/Unity" "$USER_HOME/Library/Unity" -- _clean_unity

$CLEAN_UNREALENGINE && _run_section \
  "Unreal Engine" \
  "Clean Unreal Engine DerivedDataCache and launcher webcache?" \
  "$USER_HOME/Library/Application Support/Epic" -- _clean_unrealengine

# --- CREATIVE APPS ---
$CLEAN_ADOBE && _run_section \
  "Adobe Creative Cloud" \
  "Clean Adobe shared media cache files and app caches? (Premiere, After Effects, etc.)" \
  "$USER_HOME/Library/Application Support/Adobe" \
  "$USER_HOME/Library/Caches/Adobe" -- _clean_adobe

$CLEAN_FINALCUT && _run_section \
  "Final Cut Pro / Motion" \
  "Clean Final Cut Pro render files, analysis files, and caches?" \
  "$USER_HOME/Library/Caches/com.apple.FinalCut" \
  "$USER_HOME/Library/Application Support/ProApps" -- _clean_finalcut

$CLEAN_LOGIC && _run_section \
  "Logic Pro / GarageBand" \
  "Clean Logic Pro and GarageBand caches?" \
  "$USER_HOME/Library/Caches/com.apple.logic10" \
  "$USER_HOME/Library/Caches/com.apple.garageband10" -- _clean_logic

$CLEAN_DAVINCI && _run_section \
  "DaVinci Resolve" \
  "Clean DaVinci Resolve logs and caches?" \
  "$USER_HOME/Library/Application Support/Blackmagic Design/DaVinci Resolve" -- _clean_davinci

$CLEAN_SKETCH && _run_section \
  "Sketch" \
  "Clean Sketch caches?" \
  "$USER_HOME/Library/Caches/com.bohemiancoding.sketch3" -- _clean_sketch

$CLEAN_FIGMA && _run_section \
  "Figma" \
  "Clean Figma caches and GPU cache?" \
  "$USER_HOME/Library/Caches/com.figma.Desktop" \
  "$USER_HOME/Library/Application Support/Figma" -- _clean_figma

# --- COMMUNICATION & MEDIA ---
$CLEAN_SLACK && _run_section \
  "Slack" \
  "Clean Slack caches and logs?" \
  "$USER_HOME/Library/Application Support/Slack" -- _clean_slack

$CLEAN_ZOOM && _run_section \
  "Zoom" \
  "Clean Zoom caches and logs?" \
  "$USER_HOME/Library/Application Support/zoom.us" \
  "$USER_HOME/Library/Caches/us.zoom.xos" -- _clean_zoom

$CLEAN_TEAMS && _run_section \
  "Microsoft Teams" \
  "Clean Microsoft Teams caches and logs?" \
  "$USER_HOME/Library/Application Support/Microsoft/Teams" -- _clean_teams

$CLEAN_DISCORD && _run_section \
  "Discord" \
  "Clean Discord caches and GPU cache?" \
  "$USER_HOME/Library/Application Support/discord" -- _clean_discord

$CLEAN_SPOTIFY && _run_section \
  "Spotify" \
  "Clean Spotify persistent cache?" \
  "$USER_HOME/Library/Application Support/Spotify/PersistentCache" \
  "$USER_HOME/Library/Caches/com.spotify.client" -- _clean_spotify

$CLEAN_TELEGRAM && _run_section \
  "Telegram" \
  "Clean Telegram media cache?" \
  "$USER_HOME/Library/Caches/ru.keepcoder.Telegram" \
  "$USER_HOME/Library/Caches/com.telegram.desktop" -- _clean_telegram

$CLEAN_WHATSAPP && _run_section \
  "WhatsApp" \
  "Clean WhatsApp caches?" \
  "$USER_HOME/Library/Application Support/WhatsApp" \
  "$USER_HOME/Library/Caches/net.whatsapp.WhatsApp" -- _clean_whatsapp

$CLEAN_SIGNAL && _run_section \
  "Signal" \
  "Clean Signal caches?" \
  "$USER_HOME/Library/Application Support/Signal" -- _clean_signal

$CLEAN_SKYPE && _run_section \
  "Skype" \
  "Clean Skype caches?" \
  "$USER_HOME/Library/Application Support/Skype" \
  "$USER_HOME/Library/Caches/com.skype.skype" -- _clean_skype

$CLEAN_VIBER && _run_section \
  "Viber" \
  "Clean Viber caches?" \
  "$USER_HOME/Library/Caches/com.viber.desktop" -- _clean_viber

# --- API / NETWORK TOOLS ---
$CLEAN_POSTMAN && _run_section \
  "Postman" \
  "Clean Postman caches and logs?" \
  "$USER_HOME/Library/Application Support/Postman" -- _clean_postman

$CLEAN_INSOMNIA && _run_section \
  "Insomnia" \
  "Clean Insomnia caches?" \
  "$USER_HOME/Library/Application Support/Insomnia" -- _clean_insomnia

$CLEAN_CHARLES && _run_section \
  "Charles Proxy" \
  "Clean Charles Proxy caches and logs?" \
  "$USER_HOME/Library/Caches/com.xk72.charles.config" \
  "$USER_HOME/Library/Logs/Charles" -- _clean_charles

$CLEAN_PROXYMAN && _run_section \
  "Proxyman" \
  "Clean Proxyman caches and logs?" \
  "$USER_HOME/Library/Caches/com.proxyman.NSApp" \
  "$USER_HOME/Library/Logs/Proxyman" -- _clean_proxyman

$CLEAN_WIRESHARK && _run_section \
  "Wireshark" \
  "Clean Wireshark caches and logs?" \
  "$USER_HOME/Library/Caches/org.wireshark.Wireshark" -- _clean_wireshark

# --- DATABASE TOOLS ---
$CLEAN_TABLEPLUS && _run_section \
  "TablePlus" \
  "Clean TablePlus caches and logs?" \
  "$USER_HOME/Library/Caches/com.tinyapp.TablePlus" -- _clean_tableplus

$CLEAN_SEQUELACE && _run_section \
  "Sequel Ace" \
  "Clean Sequel Ace caches and logs?" \
  "$USER_HOME/Library/Caches/com.sequel-ace.sequel-ace" -- _clean_sequelace

$CLEAN_DBEAVER && _run_section \
  "DBeaver" \
  "Clean DBeaver caches and metadata logs?" \
  "$USER_HOME/Library/Caches/dbeaver4" -- _clean_dbeaver

$CLEAN_MYSQLWB && _run_section \
  "MySQL Workbench" \
  "Clean MySQL Workbench caches and logs?" \
  "$USER_HOME/Library/Caches/com.oracle.mysql.workbench" -- _clean_mysqlwb

# --- GIT CLIENTS ---
$CLEAN_TOWER && _run_section \
  "Tower (Git client)" \
  "Clean Tower caches and logs?" \
  "$USER_HOME/Library/Caches/com.fournova.Tower2" \
  "$USER_HOME/Library/Caches/com.fournova.Tower3" -- _clean_tower

$CLEAN_SOURCETREE && _run_section \
  "SourceTree" \
  "Clean SourceTree caches and logs?" \
  "$USER_HOME/Library/Caches/com.torusknot.SourceTreeNotMAS" -- _clean_sourcetree

$CLEAN_GITKRAKEN && _run_section \
  "GitKraken" \
  "Clean GitKraken caches and logs?" \
  "$USER_HOME/Library/Application Support/GitKraken" -- _clean_gitkraken

# --- TERMINALS ---
$CLEAN_ITERM2 && _run_section \
  "iTerm2" \
  "Clean iTerm2 caches?" \
  "$USER_HOME/Library/Caches/com.googlecode.iterm2" -- _clean_iterm2

$CLEAN_WARP && _run_section \
  "Warp" \
  "Clean Warp terminal caches and logs?" \
  "$USER_HOME/Library/Application Support/Warp" -- _clean_warp

$CLEAN_HYPER && _run_section \
  "Hyper" \
  "Clean Hyper terminal caches and logs?" \
  "$USER_HOME/Library/Application Support/Hyper" -- _clean_hyper

# --- CLOUD STORAGE ---
$CLEAN_DROPBOX && _run_section \
  "Dropbox" \
  "Clean Dropbox caches and logs?" \
  "$USER_HOME/Library/Caches/com.getdropbox.dropbox" -- _clean_dropbox

$CLEAN_ONEDRIVE && _run_section \
  "OneDrive" \
  "Clean OneDrive caches and logs?" \
  "$USER_HOME/Library/Caches/com.microsoft.OneDrive" -- _clean_onedrive

$CLEAN_GOOGLEDRIVE && _run_section \
  "Google Drive" \
  "Clean Google Drive caches and logs?" \
  "$USER_HOME/Library/Caches/com.google.GoogleDrive" -- _clean_googledrive

# --- LAUNCHERS ---
$CLEAN_ALFRED && _run_section \
  "Alfred" \
  "Clean Alfred caches?" \
  "$USER_HOME/Library/Caches/com.runningwithcrayons.Alfred" -- _clean_alfred

$CLEAN_RAYCAST && _run_section \
  "Raycast" \
  "Clean Raycast caches?" \
  "$USER_HOME/Library/Caches/com.raycast.macos" -- _clean_raycast

# --- VPN ---
$CLEAN_NORDVPN && _run_section \
  "NordVPN" \
  "Clean NordVPN logs?" \
  "$USER_HOME/Library/Logs/NordVPN" \
  "$USER_HOME/Library/Application Support/NordVPN" -- _clean_nordvpn

$CLEAN_EXPRESSVPN && _run_section \
  "ExpressVPN" \
  "Clean ExpressVPN logs?" \
  "$USER_HOME/Library/Logs/ExpressVPN" \
  "$USER_HOME/Library/Application Support/ExpressVPN" -- _clean_expressvpn

$CLEAN_MULLVAD && _run_section \
  "Mullvad VPN" \
  "Clean Mullvad VPN logs?" \
  "$USER_HOME/Library/Logs/Mullvad VPN" \
  "$USER_HOME/Library/Application Support/Mullvad VPN" -- _clean_mullvad

# --- DEVOPS / CLOUD CLIs ---
$CLEAN_TERRAFORM && _run_section \
  "Terraform" \
  "Clean Terraform plugin cache and .terraform lock files?" \
  "$USER_HOME/.terraform.d" -- _clean_terraform

$CLEAN_ANSIBLE && _run_section \
  "Ansible" \
  "Clean Ansible temp and cache files?" \
  "$USER_HOME/.ansible" -- _clean_ansible

$CLEAN_AWS && _run_section \
  "AWS CLI" \
  "Clean AWS CLI and SSO credential caches?" \
  "$USER_HOME/.aws/cli/cache" "$USER_HOME/.aws/sso/cache" -- _clean_aws

$CLEAN_GCLOUD && _run_section \
  "Google Cloud SDK" \
  "Clean Google Cloud SDK logs and update check files?" \
  "$USER_HOME/.config/gcloud" -- _clean_gcloud

$CLEAN_AZURE && _run_section \
  "Azure CLI" \
  "Clean Azure CLI logs and telemetry?" \
  "$USER_HOME/.azure" -- _clean_azure

# --- SHELLS ---
$CLEAN_ZSH && _run_section \
  "Zsh" \
  "Clean Zsh session files and completion dumps?" \
  "$USER_HOME/.zsh_sessions" -- _clean_zsh

$CLEAN_BASH && _run_section \
  "Bash" \
  "Clean Bash history and session files?" \
  "$USER_HOME/.bash_history" "$USER_HOME/.bash_sessions" -- _clean_bash

$CLEAN_FISH && _run_section \
  "Fish Shell" \
  "Clean Fish shell generated completions?" \
  "$USER_HOME/.local/share/fish/generated_completions" -- _clean_fish

# --- MISC ---
$CLEAN_TRASH && _run_section \
  "Trash" \
  "Empty the Trash?" \
  "$USER_HOME/.Trash" -- _clean_trash

BREW_BIN=""
[ -x /opt/homebrew/bin/brew ] && BREW_BIN=/opt/homebrew/bin/brew
[ -x /usr/local/bin/brew ]    && BREW_BIN=/usr/local/bin/brew
$CLEAN_HOMEBREW && [ -n "$BREW_BIN" ] && _run_section \
  "Homebrew" \
  "Run Homebrew cleanup to remove old versions and cached downloads?" \
  "$BREW_BIN" -- _clean_homebrew