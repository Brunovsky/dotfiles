# dumb dotfiles

My dotfiles for Arch Linux.

Here you might find...

* Extensive and extensible `git` configuration and aliases.
* Shell aliases and other customization (for all shells).
* Random nord wallpapers plucked shamelessly from reddit.
* Config files for many programs: `nano`, `gdb tui`, `psql`, `ranger`,
  `inputrc`, `dircolors`, `Xresources`...

## Maintenance
--------------

Setup notes
* *interactive* `bash` shells yield to `fish` on startup. See `.bashrc`.
* `zsh` plugin dependencies are imported as submodules and require no configuration.
* oh-my-zsh and oh-my-fish need to be installed manually.
  * oh-my-zsh to `~/.oh-my-zsh`
  * oh-my-fish to `~/.oh-my-fish`
  * install the prompt theme for `fish` with `omf`.
* interesting and safe system files (e.g. those under `/etc`) can be tracked
  under `~/.system` (as hard links).
* `ranger`  might need extra setup to show images, see the documentation.
* `.bash_profile` launches the gnome keyring daemon.

Nord color scheme
* Most customization is not maintainable under a VCS.
  * browsers
    * chromium - extension
    * firefox - extension
  * terminals
    * xterm/Xresources - made available by nord
    * konsole - install through Plasma
  * email
    * mailspring - [nord-dark](https://github.com/carlosal1015/Mailspring-Theme-nord-dark)
  * IDEs
    * vscode - extension
    * idea - extension
  * slack - `#2E3440,#3B4252,#88C0D0,#2E3440,#3B4252,#D8DEE9,#A3BE8C,#81A1C1`
  * gtk - install through Plasma
  * qt - `kde-gtk-config` from Arch
  * dir_colors - made available by nord

Git
* Keep hooks under `~/.hooks` following the usual delegate pattern.
* Keep configuration modular under `~/.config/git`.
  Any divergence from the default behaviour *must* go into `config`.
  * visual - colors and console dump formats (e.g. `status`, `diff`, `log`)
  * alias - aliases and more dump formats.
    * don't make a mess of it - think twice before adding a new alias
    * don't use shorthands for non-trivial commands or commands with options
  * tool - diff and merge tools settings
  * url - shorthands for remote hosts (github, gitlab...)

Shells
* Assume reasonable configuration is set before shell startup, e.g.
  that `bash` reads completions before even entering `.bashrc`.
* Unfortunately there isn't a very good default interactive shell right now.
  * `bash` lacks tons of useful behaviour like **tab-completion** info and
    **syntax highlighting**, not to mention a sensible **plugin manager**.
  * `zsh` is brain-damaged and offers these things only behind misterious and
    confusing options which are already impossible to understand just seven days
    after they've been written. They're all turned off by default despite `zsh`
    not even attempting to emutable `sh` or `bash` by default in the first place.
    I don't understand half of what's in `.zshrc` anymore, nor do I want to.
  * `fish` has these things by default, plus a nice plugin manager which isn't
    difficult to install. However it refrains from having a POSIX compatible
    execution mode and can't even read `.profile`, let alone `.aliases`.
    Three possible solutions:
    * mirror the aliases in `config.fish` -
      the current solution. It's acceptible because all the aliases are simple,
      and the syntax of the commands doesn't change between the two files.
    * use one of the many *hacks* available on GitHub to read the files -
      this can become a nightmare or bug-fiesta *really* easily.
    * don't use aliases, prefer scripts in e.g. `~/bin` -
      overkill since everything is a one-liner.
* Just stick to `python`, `make` or `ruby` if you need to write major scripts.
  Anything longer than one line of shell script is bound to become unmaintainable.
  Corollary: do your part in having interactive `sh` die.

Overview (this *will* become outdated)
* `git` configuration is deep and changes on the fly.
* `nano` is nice currently and the keybindings are (mostly) trustworthy.
* `most` is weird sometimes but `less` doesn't like colors so...
* `fontconfig` is even weirder - sometimes `fc-match` doesn't seem to care.
* `i3/config` is **not** functional - remove it asap.
* `psql` can still be improved - it's very primitive without configuration.
* `gdbinit` is untested.
* `ranger` can still be improved, but currently it's fine.
* `fish` omf theme (pure) lacks virtualenv support.

Brain damage
* Keep your own under `~/.notes` if possible.
* The `redshift` service in Arch will choke if you do anything just slightly
  unusual with your Xsession, e.g. sleeping the kernel or locking the session.
  Perhaps  a location-based setup would get rid of this problem.
* Email clients should come in two types for developers:
  * user friendly - to receive emails from web services etc.
  * dev friendly - to send and receive email patches through git, mostly.
  * I use *mailspring* for the former and will setup *mutt* for the second
    when necessary.

Principles
----------

If you're not me and you've read this far, perhaps you might want to adopt
some of these principles for your personal setup as well. Alternatively you
could contribute your own.

* Keep record of where to find the relevant information concerning
  the configuration option or idea - man pages (sections and greps),
  external resources, dotfiles repositories, blog pages, etc.
* Change default *behaviour* only if it is maintainable in the future: it's
  either absurdly simple and straightforward, or well enough documented that
  you'll be able to forget what it means/does and read up on it again later.
* Trust developers to have released their software with a decent initial
  configuration. Unfortunately this isn't always the case (e.g. `i3`, `zsh`).
* Separate *behaviour* from *personalization* whenever possible and sensible.
  For example, in this repository: `git`, `.Xresources`.
* Avoid desktop software stacks which are not overseen by active communities.
  They're alright for learning the basics but not for daily use.
  That pretty much rules out any DE-less setup.
