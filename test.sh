#!/bin/bash
set -o pipefail
set -e
set -u

DIRNAME="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

mkdir -p $DIRNAME/output
cd $DIRNAME/output

cwltool --timestamps ../codex-pipeline/pipeline.cwl --data_dir "$1"
cwltool --timestamps ../sprm/pipeline.cwl --enable_manhole --image_dir stitched/expressions --mask_dir stitched/mask
cwltool --timestamps ../create-vis-symlink-archive/pipeline.cwl --ometiff_dir stitched --sprm_output sprm_outputs
