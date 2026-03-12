#!/bin/bash

set -ouex pipefail

### Install packages

# Packages can be installed from any enabled yum repo on the image.
# RPMfusion repos are available by default in ublue main images
# List of rpmfusion packages can be found here:
# https://mirrors.rpmfusion.org/mirrorlist?path=free/fedora/updates/39/x86_64/repoview/index.html&protocol=https&redirect=1

# install additional packages
dnf5 install -y snapper
dnf5 install -y dovecot dovecot-pigeonhole
dnf5 install -y opensmtpd
dnf5 install -y firewall-config
dnf5 install -y plasma-login-manager

# getting more SELinux related  man pages and documentation for SELinux policy modules
dnf5 install -y selinux-policy-doc

dnf5 install -y bsdtar

# Use a COPR Example:
#
# dnf5 -y copr enable ublue-os/staging

#  https://copr.fedorainfracloud.org/coprs/lukenukem/asus-linux/
dnf5 copr -y enable lukenukem/asus-linux fedora-43-x86_64
dnf5 install -y asusctl asusctl-rog-gui

# wezterm-nightly: https://copr.fedorainfracloud.org/coprs/wezfurlong/wezterm-nightly
#  we remove it here as we can get wezterm via a `brew` cask
# dnf5 -y copr enable wezfurlong/wezterm-nightly
# dnf5 -y install wezterm

# # _copr:copr.fedorainfracloud.org:scottames:ghostty.repo
dnf5 copr -y enable scottames/ghostty fedora-43-x86_64
dnf5 install -y ghostty

# want to use a newer fish version which is on brew
dnf5 remove -y fish

# remove package which is meant for Framwork laptops
dnf5 remove -y fw-fanctrl

# dnf5 -y install package
# Disable COPRs so they don't end up enabled on the final image:
# dnf5 -y copr disable ublue-os/staging

#### Example for enabling a System Unit File

systemctl enable podman.socket
