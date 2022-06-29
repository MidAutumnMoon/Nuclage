#!/usr/bin/env -S fish --no-config --private

#
# $1: setup/finish: the action to take
#   - setup: after the ccache action restored caches,
#            properly setup /var/cache/ccache for nix
#   - finish: sync new caches for the ccache action to
#             save
#


set --query GITHUB_WORKSPACE
    or begin
        echo "Not inside Github Actions environment."
        exit 1
    end

command --query rsync
    or begin
        echo "rsync not found"
        exit 1
    end

command getent group nixbld 1> /dev/null 2>&1
test $status -eq 0
    or begin
        echo "nix is not setup properly, missing nixbld group."
        exit 1
    end

set --local Here "$(status filename | path dirname)"

set --local CcacheConfigfile "$Here/ccache/config"
set --local CcacheSystemDir "/var/cache/ccache"
set --local CcacheReadableDir "$HOME/ccache"

set --local ScriptAction "$argv[1]"


string match --quiet --regex -- 'setup|finish' "$ScriptAction"
    or begin
        echo "Unknown action: $ScriptAction"
        exit 1
    end

test -d "$CcacheReadableDir"
    or begin
        echo "No readable caches dir, creating it."
        mkdir --parent "$CcacheReadableDir"
    end


#
# Setup
#

if test "$ScriptAction" = "setup"

    echo "Setup ccache for nix."

    test -d "$CcacheSystemDir"
        and begin
            echo "System wide ccache alreay exists."
            echo "Removing it..."
            command sudo rm -rf "$CcacheSystemDir"
        end

    echo "Restore cached ccache caches"

    command sudo rsync --force --recursive \
            "$CcacheReadableDir/" "$CcacheSystemDir"
        or exit $status

    command sudo cp --verbose --force \
            "$CcacheConfigfile" "$CcacheSystemDir/ccache.conf"
        or exit $status

    command sudo chown --recursive \
            "root:nixbld" "$CcacheSystemDir"
        or exit $status

    command sudo chmod --verbose \
            "0770" "$CcacheSystemDir"
        or exit $status

    echo "Caches restored."

    # See ./pieces/steps-prepare.yml for reasons

    echo "Configuring nix"

    command sudo sed --in-place \
            '/extra-sandbox-paths.*/d' "/etc/nix/nix.conf"
        or exit 1

    echo "extra-sandbox-paths = /var/cache/ccache" \
            | command sudo tee --append "/etc/nix/nix.conf"
        or exit 1

    command sudo systemctl restart nix-daemon

    exit 0

end



#
# Finish
#

if test "$ScriptAction" = "finish"

    echo "Saving system wide ccache."

    echo "Removing stale cache"

    command rm -rf "$CcacheReadableDir"
        or exit 1

    echo "Saving fresh caches"

    command sudo rsync --force --recursive \
            "$CcacheSystemDir/" "$CcacheReadableDir"
        or exit 1

    command sudo chown --recursive \
            "$(id --user):$(id --group)" "$CcacheReadableDir"
        or exit 1

    command rm --recursive --force \
            "$CcacheReadableDir/tmp"
        or exit 1

    exit 0

end

echo "Weird."

exit 2

