#!/usr/bin/env -S fish --no-config --private

command --query yq
    or begin
        echo "yq not found."
        exit 1
    end


set --local Here \
    "$(status filename | path dirname)"


set --local WorkflowName "build-n-push"

set --local GithubWorkflows \
    "$(path resolve "$Here/../.github/workflows/$WorkflowName.yml")"

set --local WorkflowPiecesDir "$Here/workflows"


# At least Mr.Regex won't be lonely anymore.

# 1. expand anchors since Github cannot do it
#
# 2. flatten steps of each jobs
#    since YAML cannot merge arrays with anchors natively
#
# 3. remove temporary objects whose prefix is '_'
#
# 4. remove comments and then indent the result

cat $WorkflowPiecesDir/*.yml \
    | yq 'explode(.)' \
    | yq '.jobs |= map_values( .steps = ( .steps | flatten ) )' \
    | yq 'del( ._* )' \
    | yq --indent 4 '... comments=""' \
    | command sponge "$GithubWorkflows"
