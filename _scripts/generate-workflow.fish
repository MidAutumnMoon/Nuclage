#!/usr/bin/env fish

command --query yq
    or begin
        echo "yq not found."
        exit 1
    end


set --local Here \
    "$(status filename | path resolve | path dirname)"


set --local WorkflowName "build-n-push"

set --local WorkflowDir \
    "$(path resolve "$Here/../.github/workflows")"

set --local WorkflowFile \
    "$WorkflowDir/$WorkflowName.yml"


set --local WorkflowPieces "$Here/pieces"

set --local PieceOutline \
    "$WorkflowPieces/outline.yml"

set --local PieceJobsCommon \
    "$WorkflowPieces/jobs-common.yml"

set --local PieceJobsSteps \
    "$WorkflowPieces/jobs-steps.yml"

set --local PieceStepsPrepare \
    "$WorkflowPieces/steps-prepare.yml"

set --local PieceStepsPost \
    "$WorkflowPieces/steps-post.yml"


echo "Backup original workflow."

command cp --verbose \
    "$WorkflowFile" "$Here/$WorkflowName.original.yml"

echo "Composing new workflow from pieces."

# At least Mr.Regex won't be lonely anymore.

cat "$PieceJobsSteps" \
    | yq "map_values( . |= load(\"$PieceJobsCommon\") + { \"steps\": . } )" - \
    | yq "map_values( .steps |= load(\"$PieceStepsPrepare\") + . + load(\"$PieceStepsPost\") )" - \
    | yq "load(\"$PieceOutline\") + { \"jobs\": . }" \
    | yq --indent 4 - \
    | string collect \
    | command tee "$WorkflowFile"

