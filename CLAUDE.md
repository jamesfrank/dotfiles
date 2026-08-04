# Dotfiles — Notes for Future Sessions

Portable personal dotfiles. Primary use is macOS (bash), with a stated goal of
staying compatible with Linux (RHEL/Rocky). Everything is plain bash/vim/tmux
config — no framework, no package manager, no submodules.

## Layout

The repo is cloned to `~/.dotfiles`. Files here are **sourced or symlinked** from
their real home-directory locations rather than copied, so edits in the repo take
effect live.

| File                  | Role |
|-----------------------|------|
| `install.py`          | Idempotent installer. Appends `source` lines, sets git includes, creates symlinks, seeds config. Python 3. |
| `bashrc`              | Main entrypoint. Loads config, detects OS, sources the other bash pieces, sets prompt/history/less colors. |
| `bash_alias`          | Aliases + shell functions (ls variants, tmux helpers, `sshcd`, safety aliases). Sourced by `bashrc`. |
| `dotfiles.cfg.default`| Feature-flag template. Copied to `dotfiles.cfg` at install. |
| `dotfiles.cfg`        | **Machine-local, git-ignored** (see `.gitignore`). Holds the active feature flags. Never commit it. |
| `vimrc`               | Vim config. Sourced into `~/.vimrc`. Assumes drmikehenry/vimfiles plugins (Powerline, syntastic, tagbar, multiple-cursors, ultisnips, ctrl-p). |
| `tmux.conf`           | Symlinked to `~/.tmux.conf`. Custom status bar, vi keys, pane/window bindings. |
| `inputrc`             | Symlinked to `~/.inputrc`. readline: vi editing mode, case-insensitive completion. |
| `gitconfig`           | Included via git `include.path` (not symlinked). Colors + `unstage`/`ignored` aliases. |
| `LESS_TERMCAP`        | `tput`-based color codes for `less`/`man`. Sourced by `bashrc`. |
| `README.md`           | User-facing install docs (automated + manual steps). |

## How installation wires up

`install.py` (run once per machine):
1. Appends `source ~/.dotfiles/bashrc` to both `~/.bashrc` **and** `~/.bash_profile`
   (macOS interactive login shells read `.bash_profile`; Linux non-login read
   `.bashrc` — covering both is intentional). Guarded so it won't duplicate.
2. Appends `source ~/.dotfiles/vimrc` to `~/.vimrc`.
3. `git config --global core.excludesfile` → `gitignore`
   and `git config --global include.path` → `gitconfig`.
   (`gitignore` = global excludes for OS/editor cruft; `.gitignore` = this repo's own ignores.)
4. Symlinks `tmux.conf` → `~/.tmux.conf`, `inputrc` → `~/.inputrc` (`ln -sf`).
5. `mkdir -p ~/.vim-swap ~/.vim-tmp` (vim backup/swap dirs — vimrc requires them).
6. Copies `dotfiles.cfg.default` → `dotfiles.cfg` (only if it doesn't already exist).

## Config flags (`dotfiles.cfg`)

Sourced early in `bashrc`. Flags: `dotfiles_colorize`, `dotfiles_bashmarks`,
`dotfiles_fuzzy_completion`, `dotfiles_fancy_characters`. `fancy_characters`
switches the prompt glyph (`❯` vs `>`) and Powerline symbol set in vim.

## OS detection

`bashrc` sets `DF_OS` from `$OSTYPE` (`mac`, `linux`, `cygwin`, `windows`,
`freebsd`, `unknown`). `bash_alias` branches on it for GNU vs BSD `ls` flags
(`--color=auto` vs `-G`). When adding OS-specific behavior, reuse `DF_OS`.

## ⚠️ Known bugs / rough edges (verify before "fixing"; some are load-bearing-by-accident)

- **`dotfiles_bashmarks` is dead.** Set in the config but never read anywhere in
  `bashrc`. Either wire it up (source a bashmarks script) or drop it.

### Fixed / cleaned up (kept here as history)
- Removed the entire `include/` machinery. `bashrc` used to reference three
  third-party tools that were never committed (manual git clones under `include/`,
  not submodules — there was never a `.gitmodules`). Identified for the record:
  - `when-changed` → [joh/when-changed](https://github.com/joh/when-changed) (Python file-watcher). Discarded — unused.
  - `colorize.sh` → [dhbaird/colorize](https://github.com/dhbaird/colorize) (sed-based make/GCC colorizer). Discarded — user no longer runs `make` manually.
  - `fuzzy_bash_completion` → [mgalgs/fuzzy_bash_completion](https://github.com/mgalgs/fuzzy_bash_completion). Removed; README now points to [fzf](https://github.com/junegunn/fzf) as the modern, Mac+RHEL-compatible replacement.
  Along with these, the `INCLUDE_PATH` var, the `when-changed` alias, the colorize
  block, the fuzzy block, and the now-orphaned `dotfiles_colorize` /
  `dotfiles_fuzzy_completion` flags in `dotfiles.cfg.default` were all deleted.
- `bashrc:31` typo `$DOTFILSE_PATH` → `$DOTFILES_PATH`; `LESS_TERMCAP` now sources,
  enabling `less`/`man` colors.
- `install.py` now only seeds `dotfiles.cfg` when absent, so re-running the installer
  no longer clobbers local config.
- Added a real `gitignore` file (OS/editor cruft) so the global `core.excludesfile`
  reference resolves.

## Conventions to follow when editing

- Keep bash POSIX-ish and dual-platform (macOS/BSD *and* GNU/Linux). Gate anything
  platform-specific on `DF_OS`. Don't assume GNU coreutils flags on macOS.
- New optional features should get a `dotfiles_*` flag in `dotfiles.cfg.default`
  and a guard in `bashrc` — and must actually be consumed (avoid another dead flag).
- Config is British-spelled in places (`colour`, `colorize`) — match surrounding style.
- Don't commit `dotfiles.cfg` (machine-local).
- `tmux.conf` and `vimrc` carry lots of commented-out legacy blocks kept as
  reference for older tmux/vim versions; leave them unless explicitly cleaning up.
