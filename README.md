# KBFS messenger (proof of concept)

A handful of shell- and python-scripts that allows you to communicate
securely (sign and encrypt) with somebody, using the [Keybase
filesystem](https://keybase.io/docs/kbfs) (KBFS) as transport- and
storage-medium.

## Requirements

* Bash (tested with v4.3.46)
  * tmux (tested with v2.2)
  * stat (from coreutils)
* Python 3 (tested with v3.5.2)
  * [python-dateutil](https://pypi.python.org/pypi/python-dateutil/)
  * [humanize](https://pypi.python.org/pypi/humanize/)

## Quickstart

Put all of the scripts from the
[…/src](https://github.com/kseistrup/kbmsgr/tree/master/src]
directory somewhere in your $PATH, then launch `kbmsgr`
(`/keybase` should be mounted, of course):

```sh
$ kbmsgr ${my_keybase_username} ${their_keybase_username}
```

:smile:
