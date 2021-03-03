#!/bin/bash
DIRNAME="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

mkdir -p $DIRNAME/output
cd $DIRNAME/output

cwltool ../codex-pipeline/pipeline.cwl --data_dir $1
cwltool ../sprm/pipeline.cwl --image_dir stitched/expressions --mask_dir stitched/mask
cwltool ../create-vis-symlink-archive/pipeline.cwl --ometiff_dir stitched --sprm_output sprm_outputs
