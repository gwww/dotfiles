# dotfiles

Dotfile repository. Files "managed" and deployment handled by [yadm](https://github.com/TheLocehiliosan/yadm).

## Bootstrap New Host:

```
curl -fLo /tmp/yadm https://github.com/TheLocehiliosan/yadm/raw/master/yadm
chmod a+x /tmp/yadm
cd ~
/tmp/yadm clone https://github.com/gwww/dotfiles.git
```

This will run `~/.config/yadm/bootstrap` script which in turn runs
`brew bundle` to install a list of HomeBrew packages, including `yadm`.

After ssh keys are installed the yadm repository can be switched
to ssh instead of https with the following command:
```
yadm remote set-url origin git@github.com:gwww/dotfiles.git
```
