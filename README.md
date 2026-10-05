<div align="center">

# seb-linux-AppImage 🐧

[![GitHub Downloads](https://img.shields.io/github/downloads/Nemo-010/seb-linux-AppImage/total?logo=github&label=GitHub%20Downloads)](https://github.com/Nemo-010/seb-linux-AppImage/releases/latest)
[![CI Build Status](https://github.com/Nemo-010/seb-linux-AppImage/actions/workflows/appimage.yml/badge.svg)](https://github.com/Nemo-010/seb-linux-AppImage/releases/latest)
[![Latest Stable Release](https://img.shields.io/github/v/release/Nemo-010/seb-linux-AppImage)](https://github.com/Nemo-010/seb-linux-AppImage/releases/latest)

| Latest Stable Release | Latest Nightly Release | Upstream URL |
| :---: | :---: | :---: |
| [Click here](https://github.com/Nemo-010/seb-linux-AppImage/releases/latest) | [Click here](https://github.com/Nemo-010/seb-linux-AppImage/releases/tag/nightly) | [Click here](https://github.com/Jvr2022/seb-linux) |

</div>

---

AppImage made using [quick-sharun](https://github.com/pkgforge-dev/Anylinux-AppImages/blob/main/useful-tools/quick-sharun.sh), which makes it extremely easy to turn any binary into a portable package reliably without using containers or similar tricks.

**This AppImage bundles everything and it should work on any Linux distro, including old and musl-based ones.**

This AppImage doesn't require FUSE to run at all, thanks to the [uruntime](https://github.com/VHSgunzo/uruntime).

This AppImage is also supplied with a self-updater by default, so any updates to this application won't be missed.

This packages [Jvr2022/seb-linux](https://github.com/Jvr2022/seb-linux), an unofficial community Linux client
for Safe Exam Browser. It is not affiliated with ETH Zürich or the official Safe Exam Browser project.
Only the Qt WebEngine build is packaged here; upstream's WebKitGTK fallback build is not.

* **Building and deploying this is only sane on Arch Linux.** Do not expect the same tooling to behave on any other distribution.
* **Install the application to `/usr` before deploying**, which is what `get-dependencies.sh` does.

## Known limitations

* The locked-exam-shell and anti-cheat modes re-execute the app through `pkexec`, which strips the environment
  the AppImage needs to find its bundled libraries, so those modes do not work from the AppImage. Install the
  application to `/usr` if you need them.
* Upstream computes the SEB Config Key with `QJsonDocument` serialization rather than the canonical serializer the
  Windows client uses, so an exam server that checks the Config Key will not accept a session unless the value
  produced by this client is registered for the exam. This is an upstream issue, not a packaging one.
