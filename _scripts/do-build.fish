#!/usr/bin/env -S fish --no-config

#
# Arguments:
#
# - $1 : parallel or sequential building
# - $2 : true/false: wether continue building on error
# - $3 : the file contains an attrset
# - $4 : a name in that attrset which contains a list of drvs
#

set --local BuildMode "$argv[1]"
set --local IgnoreError "$argv[2]"
set --local AttrsetFile "$(path resolve "$argv[3]")"
set --local DrvListName "$argv[4]"

set --local Here "$(status filename)"


#
# Checks
#

test (count $argv) != 4
    and begin
        echo "Wrong number of arguments, expecting 4."
        exit 1
    end

string match --quiet --regex -- 'sequential|parallel' "$BuildMode"
    or begin
        echo "Wrong build mode: $BuildMode"
        echo 'Valid options are "sequential", "parallel".'
        exit 1
    end

test "$AttrsetFile" = "" || test "$DrvListName" = ""
    and begin
        echo "Invalid arguments."
        echo "Either \$AttrsetFile or \$DrvListName is empty."
        exit 1
    end

test -f "$AttrsetFile"
    or begin
        echo "$AttrsetFile not found."
        exit 1
    end

command nix eval --impure --json \
        --expr "( import \"$AttrsetFile\" ).\"$DrvListName\"" 1> /dev/null
    or begin
        echo "Selected name \"$DrvListName\" not exists."
        echo "Or nix failed evaluating \"$AttrsetFile\"."
        exit 1
    end

# The type of "$DrvListName" is not checked to
# simplify this script a bit. Assuming it's always a list.

command --query nix-build-uncached
    or begin
        echo "nix-build-uncached not found"
        exit 1
    end

set --local BuildFlags \
    -build-flags \
        '--print-build-logs --option narinfo-cache-negative-ttl 0'



#
# Vanilla (parallel) builds
#

if test "$BuildMode" = "parallel"
    command nix-build-uncached \
        "$AttrsetFile" -A "$DrvListName" \
        $BuildFlags

    test "$status" -ne 0 && test "$IgnoreError" != "true"
        and begin
            echo "Some builds failed."
            exit 1
        end

    echo "Parallel builds done."
    exit 0
end



#
# Sequential builds
#

# Iterate the derivations and do the builds on by one

set --local DrvsToBuild

command nix eval --impure \
        --expr " builtins.length ( import \"$AttrsetFile\" ).\"$DrvListName\" " \
    | read --local DrvListLength

test "$DrvListLength" = 0
    and begin
        echo "Nothing needed to be built."
        exit 0
    end

for index in ( seq 0 (math "$DrvListLength" - 1) )
    command nix-build-uncached \
            --expr "builtins.elemAt ( import \"$AttrsetFile\" ).\"$DrvListName\" $index" \
            --out-link "result-seq-$DrvListName-$index" \
            $BuildFlags
    test "$status" -ne 0 && test "$IgnoreError" != "true"
        and begin
            echo "Built failed and cannot be ignored."
            echo "At index number $index."
            exit 1
        end
end

echo "Sequenti builds done."
