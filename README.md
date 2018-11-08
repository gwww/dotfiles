# dotfiles

Dotfile repository. Files "managed" and deployment handled by [yadm](https://github.com/TheLocehiliosan/yadm).

## Bootstrap New Host:

```
curl -fLo /tmp/yadm https://github.com/TheLocehiliosan/yadm/raw/master/yadm
chmod a+x /tmp/yadm
/tmp/yadm clone https://github.com/gwww/dotfiles.git
```

After ssh keys are installed the yadm repository can be switched
to ssh instead of https with the following command:
```
yadm remote set-url origin git@github.com:gwww/dotfiles.git
```
