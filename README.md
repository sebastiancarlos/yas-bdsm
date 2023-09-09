# YAS-BDSM (Yet Another Stow-Based Dotfiles System Manager)

This `dotfiles` folder was bootstrapped, managed, and whipped into submission by `YAS-BDSM`.

## Features

YAS-BDSM is a minimal, UNIX-based, cross-platform, hierarchical dotfiles manager.

Our core principles and safewords are:

- Minimal dependencies: Only Bash and GNU Stow.
- Symlink-based: Don't be a simp; Symlinks in your home folder
  are the ultimate way to organize your dotfiles.
- Cross-platform: With built-in platform detection, you can install your
  dotfiles on Linux and MacOS.
- Hierarchical directory structure: Who is your daddy? The `base` directory.
  Then the dotfiles in either the `linux` or `macos` folder will be installed
  too. (A tertiary hierarchy for Linux distros is planned for a future release.)
- Colorful CLI interface: Taste the rainbow, m\*\*er.
- Self-contained: The entire system is in a single folder, making it easy to
  clone and install. The `yas-dbsm` executable is right next to your dotfiles.
- Non-destructive: Your existing dotfiles will not be touched unless you
  explicitly tell YAS-BDSM to do so.
- Keep your boots on: YAS-BDSM pushes the symlinks and gets out of the
  way. It's up to you to handle version control of your dotfiles.

## Installation

### Prerequisites

- Install GNU Stow
  - MacOS: `brew install stow`
  - Linux: `sudo apt-get install stow`
  - Arch (btw): `sudo pacman -S stow`

### Install YAS-BDSM

- Clone YAS-BDSM: `git clone XXX`
- Go into your new dotfiles directory: `cd yas-bdsm`
- Run `./yas-bdsm`
  - Or, if you want to truly submit to YAS-BDSM, add it to your path with `make
    install` and then run `yas-bdsm`.
- Be a good boy and follow the instructions.

## File Structure

```
- yas-bdsm
  - base/    (cross-platform dotfiles)
  - linux/   (linux-only dotfiles)
  - macos/   (macos dotfiles)
  - yas-bdsm (executable)
  - Makefile
```

## Technical Details

YAS-BDSM is a folder structure and a shell script on top of GNU Stow (a symlink manager). It works like this:

1. Put your dotfiles into the `base`, `linux`, and `macos` folders as needed.
2. Run `./yas-bdsm install`, which will detect your platform and create
   symlinks in your home directory pointing to the dotfiles. This is done with
   GNU Stow, which also creates folders as needed.
3. If your dotfiles change in any way, run `./yas-bdsm install` again to sync
   the changes to your home folder.

## The yas-bdsm command

TODO

## Best practices

When using YAS-BDSM, its dotfile folders are the source of truth. Your home directory contains only symlinks.

This implies the following:

### If you want to edit a dotfile...
Do it as usual: `vim ~/.config/some-dotfile`. It will follow the symlink and edit the source file.

### If you want to add, delete, or move dotfiles...
You will need to do it in the source folder, and then run `yas-bdsm install` to sync the changes. The symlinks for the deleted file will be removed.

### If you want dotfiles in your home folder that are not managed by `yas-bdsm`...

You can do it. `yas-bdsm` won't touch them. If you want, you can add them to `yas-bdsm` later.

## FAQ

1. Should I store my dotfiles online?

Yas. That way, it's easy to install your dotfiles in any new system with internet access.

We recommend a private repo. If you want to use a public repo,set up a
`.gitignore` file to avoid exposing your sensitive bits.

2. What if there is a conflict between dotfiles in `base` and `linux`

The dotfiles in `linux` will override the dotfiles in `base` with the same name.

3. Is Windows supported?

Patience, my corporate slave. That feature will be added soon. But, as this is a UNIX tool, it will only support WLS.

4. Should I put most of my dotfiles in `base`?

Yas! We believe that overriding files by platform should be kept to a minimum, to ease maintainability. 

Indeed, we suggest that Bash scripts within dotfiles perform platform detection by themselves at runtime and use conditional statements.

Dotfiles are lightweight, so there's no harm in installing extra dotfiles that the platform doesn't need if that eases maintainability. It is better to ask forgiveness than permission!

5. How does the backup system work?

The first time you run `yas-bdsm install`, it will ask you to back up your current dotfiles that conflict with those to be installed. If you accept, a `backup` folder will be created in the `yas-bdsm` folder, which can be restored to your home directory at any time by running `yas-bdsm restore-backup`.

6. How does the eject system work?

You can think of `yas-bdsm eject` as your safeword. It will turn all your symlinked dotfiles in your home folder into full-fledged files. Then you are on your own.

8. Why not YADM?

I don't particularly appreciate that it wraps around git. YAS-BDSM let's you handle the version control as you please.

9. Why not chezmoi?

Because I'm not a trendy gopher, I'm an old-school UNIX-head.

7. Is this repo a joke?

Yes, but it's also my daily driver for dot files. Feel free to use it (or get used by it).

