#!/usr/bin/env -S fish --no-config

#
# Arguments:
#
# - $1: true/false: wether continue building on error
# - $2: the file contains an attrset
# - $3: a name in that attrset which contains a list of drvs
#

set --local IgnoreError "$argv[1]"
set --local AttrsetFile "$(path resolve "$argv[2]")"
set --local DrvListName "$argv[3]"

test (count $argv) != 3
    and begin
        echo "Wrong number of arguments."
        exit 1
    end

test "$AttrsetFile" = "" || test "$DrvListName" = ""
    and begin
        echo "Invalid arguments."
        exit 1
    end

test -f "$AttrsetFile"
    or begin
        echo "That file $AttrsetFile was not found."
        exit 1
    end

command nix eval --impure \
        --expr "( import \"$AttrsetFile\" ) ? \"$DrvListName\"" \
    | read --local IsTheNameExist

test "$IsTheNameExist" = false
    and begin
        echo "Selected attrset name $DrvListName does not exist."
        exit 1
    end



# Iterate the derivations
# and do the builds on by one

set --local DrvsToBuild

command nix eval --impure \
        --expr " builtins.length ( import \"$AttrsetFile\" ).\"$DrvListName\" " \
    | read --local DrvListLength

test "$DrvListLength" = 0
    and begin
        echo "Nothing needed to be built."
        exit 0
    end

for index in (seq 1 "$DrvListLength")
    command nix-build-uncached \
            --expr "with import <nixpkgs> {}; lib.last ( lib.take "$index" (import \"$AttrsetFile\").\"$DrvListName\"  )" \
            --out-link "result-seq-$index" \
            -build-flags '--print-build-logs'
    test "$status" -gt 0 && test "$IgnoreError" != "true"
        and begin
            echo "Built failed and cannot be ignored."
            exit 1
        end
end

echo "All built."
