# cleancache 🧹

A fast, silent macOS cache and log cleaner for any user — supports 60+ applications across browsers, developer tools, IDEs, creative apps, containers, communication apps, DevOps CLIs, and more.

---

## Features

- ✅ Detects installed apps automatically — **never prompts for software you don't have**
- ✅ Works for **any macOS user** (not hardcoded to a specific home directory)
- ✅ Fully **silent by default** — zero output unless you ask for it
- ✅ `-v` verbose mode shows every file and folder deleted
- ✅ `-i` interactive mode asks plain English questions section by section
- ✅ Config file at `~/.cleancache.conf` to set your own defaults
- ✅ Covers **60+ apps and tools** across every category
- ✅ Detects both **Apple Silicon** (`/opt/homebrew`) and **Intel** (`/usr/local`) Homebrew

---

## Installation

```sh
brew tap sinamedialab/cleancache
brew install cleancache
```

After installing, copy the sample config to your home directory:

```sh
cp "$(brew --prefix)/share/cleancache/cleancache.conf" ~/.cleancache.conf
```

---

## Usage

```sh
sudo cleancache              # Silent full cleanup
sudo cleancache -v           # Show every file and folder being deleted
sudo cleancache -i           # Choose what to clean, section by section
sudo cleancache -v -i        # Interactive with verbose output
cleancache --help            # Show all options
```

> **Note:** `sudo` is required for system-level paths (`/Library/Caches`, `/private/var/log`, etc.).
> All user-level sections work without `sudo` but running the whole script under `sudo` is the
> recommended approach.

---

## Options

| Flag | Description |
|------|-------------|
| `-v`, `--verbose` | Print every deleted path to stdout |
| `-i`, `--interactive` | Ask a plain English yes/no question before each section (default answer: **Yes**) |
| `-h`, `--help` | Show usage information and exit |

---

## Config File

The config file at `~/.cleancache.conf` lets you set permanent defaults without touching the script.

```
# Always show verbose output
VERBOSE=true

# Never clean Docker (even when it's installed)
CLEAN_DOCKER=false

# Never clean Bash history
CLEAN_BASH=false
```

CLI flags always override the config file. The config file always overrides built-in defaults.

**Priority:** CLI flags → `~/.cleancache.conf` → built-in defaults

---

## What Gets Cleaned

### 🖥 System
| Section | What is cleaned |
|---------|----------------|
| System Caches & Logs | `/Library/Caches`, `/private/var/log`, `/private/tmp`, `/Library/Logs` |
| Crash Reports & Diagnostics | `~/Library/Logs/DiagnosticReports`, `/Library/Logs/DiagnosticReports`, `/private/var/folders` temp |

### 🌐 Browsers
| App | What is cleaned |
|-----|----------------|
| Google Chrome | Top-level cache, all profile caches, Code Cache, GPU cache, Service Worker, IndexedDB |
| Firefox | Profile cache2, startup cache, offline cache, thumbnails |
| Safari | Caches, LocalStorage, Databases, Favicon Cache, WebKit GPU/Networking cache |
| Brave | All profile caches, Code Cache, GPU cache, Service Worker |
| Opera | App cache and GPU cache |
| Microsoft Edge | All profile caches, Code Cache, GPU cache, Service Worker |
| Arc | All profile caches, Code Cache, GPU cache, Service Worker |

### 🍎 Apple Apps
| App | What is cleaned |
|-----|----------------|
| User Library | `~/Library/Caches` (all apps), `~/Library/Logs` |
| Apple Mail | Mail downloads, attachments, caches |
| Xcode | DerivedData, archives, iOS/watchOS/tvOS/visionOS device support, simulator caches |
| Swift Package Manager | `~/Library/Caches/org.swift.swiftpm`, `~/.swiftpm/cache` |

### 📦 Build Tools & Package Managers
| Tool | What is cleaned |
|------|----------------|
| Flutter / Dart | SDK cache, Flutter tool state, Dart cache |
| Gradle | Build cache, daemon files, wrapper distributions |
| Maven | Local repository (`~/.m2`) |
| npm | `~/.npm/_cacache`, logs |
| Yarn | `~/Library/Caches/Yarn`, `~/.yarn/cache`, `~/.cache/yarn` |
| pnpm | `~/Library/Caches/pnpm`, `~/.pnpm-store` |
| Bun | `~/.bun/install/cache` |
| Deno | `~/Library/Caches/deno`, `~/.cache/deno` |
| Dart pub | `~/.pub-cache/cache`, hosted packages |
| Cargo (Rust) | Registry cache, registry src, git checkouts |
| Composer (PHP) | `~/.composer/cache` |
| CocoaPods | `~/Library/Caches/CocoaPods`, `~/.cocoapods/cache` |
| Python | pip cache, poetry cache, pyenv downloads, `__pycache__`, `.pyc` files |
| Ruby | Gem cache, Bundler cache, rbenv cache |
| Go | Build cache (`~/.cache/go-build`), module cache (`~/go/pkg/mod/cache`) |
| Rust / Rustup | Rustup downloads and temp files |
| Elixir (Mix/Hex) | Mix archives, Hex packages, rebar3 cache |
| Haskell (Stack/Cabal) | Stack programs, precompiled; Cabal packages and store |
| NVM | `~/.nvm/.cache` |
| RVM | Archives, logs, temp files |
| SDKMAN | Archives and temp files |

### 🐳 Containers & Virtual Machines
| Tool | What is cleaned |
|------|----------------|
| Docker | buildx cache, scout cache, tmp; runs `docker system prune -f` |
| Podman | Container cache; runs `podman system prune -f` |
| Vagrant | `~/.vagrant.d/tmp`, `~/.vagrant.d/cache` |
| VirtualBox | App cache, VM logs |
| VMware Fusion | App cache, VM logs |
| Parallels Desktop | App cache, VM logs |

### 🖊 IDEs & Editors
| App | What is cleaned |
|-----|----------------|
| VS Code | Cache, CachedData, Code Cache, GPU cache, logs, workspaceStorage, History |
| Cursor | Cache, CachedData, Code Cache, GPU cache, logs, workspaceStorage, History |
| JetBrains | Caches and logs for all IDEs (IntelliJ, WebStorm, PyCharm, GoLand, Rider, CLion, etc.) |
| Sublime Text | Caches (versions 3 and 4) |

### 🎮 Game & Creative Engines
| App | What is cleaned |
|-----|----------------|
| Android SDK | Build cache, SDK temp files |
| Unity | Asset store cache, editor cache |
| Unreal Engine | DerivedDataCache, launcher webcache |

### 🎨 Creative Apps
| App | What is cleaned |
|-----|----------------|
| Adobe Creative Cloud | Shared media cache files (used by Premiere, After Effects, etc.), per-app caches |
| Final Cut Pro | Render files, analysis files, app caches |
| Logic Pro / GarageBand | App caches |
| DaVinci Resolve | Logs and caches |
| Sketch | App cache |
| Figma | Cache, Code Cache, GPU cache |

### 💬 Communication & Media
| App | What is cleaned |
|-----|----------------|
| Slack | Cache, Code Cache, GPU cache, Service Worker cache, logs |
| Zoom | Cache and logs |
| Microsoft Teams | Cache, Code Cache, GPU cache, Service Worker cache, logs |
| Discord | Cache, Code Cache, GPU cache |
| Spotify | Persistent cache |
| Telegram | Media cache |
| WhatsApp | Cache |
| Signal | Cache, Code Cache, GPU cache |
| Skype | Cache |
| Viber | Cache |

### 🔌 API & Network Tools
| App | What is cleaned |
|-----|----------------|
| Postman | Cache, Code Cache, GPU cache, logs |
| Insomnia | Cache, Code Cache, GPU cache |
| Charles Proxy | Cache and logs |
| Proxyman | Cache and logs |
| Wireshark | Cache and logs |

### 🗄 Database Tools
| App | What is cleaned |
|-----|----------------|
| TablePlus | Cache and logs |
| Sequel Ace | Cache and logs |
| DBeaver | Cache and metadata logs |
| MySQL Workbench | Cache and logs |

### 🌿 Git Clients
| App | What is cleaned |
|-----|----------------|
| Tower | Cache and logs |
| SourceTree | Cache and logs |
| GitKraken | Cache and logs |

### 🖥 Terminals
| App | What is cleaned |
|-----|----------------|
| iTerm2 | Cache |
| Warp | Cache, Code Cache, GPU cache, logs |
| Hyper | Cache, Code Cache, GPU cache, logs |

### ☁️ Cloud Storage
| App | What is cleaned |
|-----|----------------|
| Dropbox | Cache and logs |
| OneDrive | Cache and logs |
| Google Drive | Cache and logs |

### 🚀 Launchers
| App | What is cleaned |
|-----|----------------|
| Alfred | Cache |
| Raycast | Cache |

### 🔒 VPN
| App | What is cleaned |
|-----|----------------|
| NordVPN | Logs |
| ExpressVPN | Logs |
| Mullvad VPN | Logs |

### ⚙️ DevOps & Cloud CLIs
| App | What is cleaned |
|-----|----------------|
| Terraform | Plugin cache, `.terraform` lock files |
| Ansible | Temp files, cache |
| AWS CLI | CLI cache, SSO credential cache |
| Google Cloud SDK | Logs, update check files |
| Azure CLI | Logs and telemetry |

### 🐚 Shells
| Shell | What is cleaned |
|-------|----------------|
| Zsh | Session files, zcompdump files |
| Bash | History file, session files |
| Fish | Generated completions |

### 🗑 Misc
| Section | What is cleaned |
|---------|----------------|
| Trash | `~/.Trash` |
| Homebrew | `brew cleanup --prune=all` (old versions and cached downloads) |

---

## Config Reference

All available keys in `~/.cleancache.conf`:

```
VERBOSE=false|true
INTERACTIVE=false|true

CLEAN_SYSTEM=true|false
CLEAN_DIAGNOSTICS=true|false
CLEAN_CHROME=true|false
CLEAN_FIREFOX=true|false
CLEAN_SAFARI=true|false
CLEAN_BRAVE=true|false
CLEAN_OPERA=true|false
CLEAN_EDGE=true|false
CLEAN_ARC=true|false
CLEAN_USER_CACHES=true|false
CLEAN_MAIL=true|false
CLEAN_XCODE=true|false
CLEAN_SWIFTPM=true|false
CLEAN_FLUTTER=true|false
CLEAN_GRADLE=true|false
CLEAN_MAVEN=true|false
CLEAN_NPM=true|false
CLEAN_YARN=true|false
CLEAN_PNPM=true|false
CLEAN_BUN=true|false
CLEAN_DENO=true|false
CLEAN_PUB=true|false
CLEAN_CARGO=true|false
CLEAN_COMPOSER=true|false
CLEAN_COCOAPODS=true|false
CLEAN_PYTHON=true|false
CLEAN_RUBY=true|false
CLEAN_GO=true|false
CLEAN_RUST=true|false
CLEAN_ELIXIR=true|false
CLEAN_HASKELL=true|false
CLEAN_NVM=true|false
CLEAN_RVM=true|false
CLEAN_SDKMAN=true|false
CLEAN_DOCKER=true|false
CLEAN_PODMAN=true|false
CLEAN_VAGRANT=true|false
CLEAN_VIRTUALBOX=true|false
CLEAN_VMWARE=true|false
CLEAN_PARALLELS=true|false
CLEAN_VSCODE=true|false
CLEAN_CURSOR=true|false
CLEAN_JETBRAINS=true|false
CLEAN_SUBLIME=true|false
CLEAN_ANDROID=true|false
CLEAN_UNITY=true|false
CLEAN_UNREALENGINE=true|false
CLEAN_ADOBE=true|false
CLEAN_FINALCUT=true|false
CLEAN_LOGIC=true|false
CLEAN_DAVINCI=true|false
CLEAN_SKETCH=true|false
CLEAN_FIGMA=true|false
CLEAN_SLACK=true|false
CLEAN_ZOOM=true|false
CLEAN_TEAMS=true|false
CLEAN_DISCORD=true|false
CLEAN_SPOTIFY=true|false
CLEAN_TELEGRAM=true|false
CLEAN_WHATSAPP=true|false
CLEAN_SIGNAL=true|false
CLEAN_SKYPE=true|false
CLEAN_VIBER=true|false
CLEAN_POSTMAN=true|false
CLEAN_INSOMNIA=true|false
CLEAN_CHARLES=true|false
CLEAN_PROXYMAN=true|false
CLEAN_WIRESHARK=true|false
CLEAN_TABLEPLUS=true|false
CLEAN_SEQUELACE=true|false
CLEAN_DBEAVER=true|false
CLEAN_MYSQLWB=true|false
CLEAN_TOWER=true|false
CLEAN_SOURCETREE=true|false
CLEAN_GITKRAKEN=true|false
CLEAN_ITERM2=true|false
CLEAN_WARP=true|false
CLEAN_HYPER=true|false
CLEAN_DROPBOX=true|false
CLEAN_ONEDRIVE=true|false
CLEAN_GOOGLEDRIVE=true|false
CLEAN_ALFRED=true|false
CLEAN_RAYCAST=true|false
CLEAN_NORDVPN=true|false
CLEAN_EXPRESSVPN=true|false
CLEAN_MULLVAD=true|false
CLEAN_TERRAFORM=true|false
CLEAN_ANSIBLE=true|false
CLEAN_AWS=true|false
CLEAN_GCLOUD=true|false
CLEAN_AZURE=true|false
CLEAN_ZSH=true|false
CLEAN_BASH=true|false
CLEAN_FISH=true|false
CLEAN_TRASH=true|false
CLEAN_HOMEBREW=true|false
```

---

## Uninstall

```sh
brew uninstall cleancache
brew untap sinamedialab/cleancache
rm ~/.cleancache.conf   # optional: remove your config
```

---

## License

MIT © [Sina Media Lab](https://github.com/sinamedialab)