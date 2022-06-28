#!/usr/bin/env fish

set --local BuildRoot "/nixbuild"

set --local OverrideDir "/etc/systemd/system/nix-daemon.service.d"
set --local OverrideConf "$OverrideDir/99-tmpdir.conf"


for dir in "$BuildRoot" "$OverrideDir"
    command sudo mkdir --parent "$dir"
        or exit $status
end

set --local Conf \
    "[Service]" \
    "Environment=TMPDIR=$BuildRoot"

for line in $Conf
    echo "$line" | sudo tee --append "$OverrideConf"
end

sudo systemctl daemon-reload
sudo systemctl restart nix-daemon

sudo systemctl cat nix-daemon
