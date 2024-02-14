# NixOS impressions

## Install notes

### Enabling wifi

The [install guide][NixOS installation guide] advised using `wpa_supplicant "SSID" | sudo tee /etc/wpa_supplicant.conf` then `sudo systemctl restart wpa_supplicant`. I got this error:

    /etc/wpa_supplicant.conf present but ignored. Generated /nix/store/xxx-wpa_supplicant.conf is used instead.

used wpa_cli instead (recommended by installer shell's MOTD)

    wpa_cli
    set_network 0 ssid "MySSID"
    set_network 0 psk "mypassword"
    enable_network 0
    save_config
    quit

### Post-install

Had to create /etc/wpa_supplicant.conf

    wpa_passphrase MySSID | sudo tee /etc/wpa_supplicant.conf
    sudo systemctl restart wpa_supplicant

$PATH is very different in nixos than other Linuxes. Be sure it is set correctly:

    export PATH="/run/wrappers/bin:$HOME/.nix-profile/bin:/nix/profile/bin:$HOME/.local/state/nix/profile/bin:/etc/profiles/per-user/$USER/bin:/nix/var/nix/profiles/default/bin:/run/current-system/sw/bin"

`scrot` returns blank black images, [use `grim` instead][Screenshots]

Had to hunt around a bit before I found [the correct way to set up my keyboard][Input configuration]

[Font packages][Fonts in NixOS] go in their own specific configuration section

## Thoughts
Install was pretty painless (once I found a USB stick that wasn't failing).

Most of the fiddling I had to do was more related to replacing X11 with Wayland than with NixOS itself. The NixOS documentation is very good.

I outlined a series of setup tasks in [todo.txt][] and archived these to [done.txt][] upon completion.

## Questions

Is there a user-specific configuration I can define in my home directory?

> [Home-manager][]

What idiomatic processes exist?

> Check out [Zero to Nix][]

How can I search for packages (in the terminal)?

> [Lots of ways][Searching packages]
> TLDR: `nix --extra-experimental-features 'nix-command flakes' search nixpkgs [package]`

Is there an existing file I can source to get the correct environment variables (eeg `$PATH`)?

> Allegedly [yes][NixOS user environments] but I didn't have this symlink

How do I run an arbitrary package without installing it?

> `nix run nixpkgs#somepkg`

# Resources
* [NixOS installation guide][]
* [NixOS manual][]
* [Input configuration][]
* [Zero to Nix][]

[NixOS installation guide]: https://nixos.wiki/wiki/NixOS_Installation_Guide
[NixOS manual]: https://nixos.org/manual/nixos/stable/
[Input configuration]: https://github.com/swaywm/sway/wiki#input-configuration
[Screenshots]: https://github.com/swaywm/sway/wiki#taking-screenshots
[Searching packages]: https://nixos.wiki/wiki/Searching_packages
[Zero to Nix]: https://zero-to-nix.com/start
[Fonts in NixOS]: https://nixos.wiki/wiki/Fonts
[todo.txt]: ./todo.txt
[done.txt]: ./done.txt
[NixOS user environments]: https://nixos.wiki/wiki/User_Environment
[Home-manager]: https://nixos.wiki/wiki/Home_Manager
