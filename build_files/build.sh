#!/bin/bash

set -ouex pipefail

### Install packages

# Packages can be installed from any enabled yum repo on the image.
# RPMfusion repos are available by default in ublue main images
# List of rpmfusion packages can be found here:
# https://mirrors.rpmfusion.org/mirrorlist?path=free/fedora/updates/39/x86_64/repoview/index.html&protocol=https&redirect=1

# this installs a package from fedora repos
#dnf5 install -y ghostty asusctl asusctl-rog-gui dovecot dovecot-pigeonhole opensmtpd snapper
dnf5 install -y snapper dovecot dovecot-pigeonhole opensmtpd

dnf5 install -y okular
# Use a COPR Example:
#
# dnf5 -y copr enable ublue-os/staging

#  https://copr.fedorainfracloud.org/coprs/lukenukem/asus-linux/
dnf5 copr -y enable lukenukem/asus-linux
dnf5 install -y asusctl asusctl-rog-gui

# wezterm-nightly: https://copr.fedorainfracloud.org/coprs/wezfurlong/wezterm-nightly
dnf5 -y copr enable wezfurlong/wezterm-nightly
dnf5 -y install wezterm

# # _copr:copr.fedorainfracloud.org:scottames:ghostty.repo
dnf5 copr -y enable scottames/ghostty
dnf5 install -y ghostty

# dnf5 -y install package
# Disable COPRs so they don't end up enabled on the final image:
# dnf5 -y copr disable ublue-os/staging

#### Example for enabling a System Unit File

systemctl enable podman.socket
