# KBFS messenger (proof of concept)

Inspired by the [twtxt](https://github.com/buckket/twtxt) file format, here's
a handful of shell- and python-scripts that will let you communicate securely
(sign and encrypt) with somebody, using the [Keybase](https://keybase.io/)
filesystem ([KBFS](https://keybase.io/docs/kbfs)) as transport- and
storage-medium.

## Requirements

* Keybase
* Bash (tested with v4.3.46, v4.4.5)
  * awk
  * lockfile (from procmail)
  * stat (from coreutils)
  * tmux 1.9+  (tested with v1.9, v2.2+)
* Python 3 (tested with v3.5.2+)
  * [python-dateutil](https://pypi.python.org/pypi/python-dateutil/)
  * [humanize](https://pypi.python.org/pypi/humanize/)

## Quickstart

Put all of the scripts from the
[…/src](https://github.com/kseistrup/kbmsgr/tree/master/src)
directory somewhere in your $PATH, then launch `kbmsgr`
(`/keybase` should be mounted, of course):

```sh
$ kbmsgr ${their_keybase_username}
```

## Caveat

This is *alpha* quality software, use at your own peril.

:smile:
