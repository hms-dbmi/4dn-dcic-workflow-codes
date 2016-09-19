cwlVersion: cwl:draft-3
class: CommandLineTool
hints:
  - class: DockerRequirement
    dockerPull: duplexa/hictool-bam2hdf5:v2
baseCommand: run.sh
inputs:
  - id: input_bam1
    type: File
    inputBinding:
      position: 1
  - id: input_bam2
    type: File
    inputBinding:
      position: 2
  - id: RE_bed
    type: File
    inputBinding:
      position: 3
  - id: output_dir
    type: string
    default: '.'
    inputBinding:
      position: 4

outputs:
  - id: fend_object_hdf5
    type: File
    outputBinding:
      glob: $(inputs.output_dir + '/fend_object.hdf5')
  - id: HiC_data_object_hdf5
    type: File
    outputBinding:
      glob: $(inputs.output_dir + '/HiC_data_object.hdf5')
  - id: HiC_distance_function_hdf5
    type: File
    outputBinding:
      glob: $(inputs.output_dir + '/HiC_distance_function.hdf5')
  - id: HiC_norm_binning_hdf5
    type: File
    outputBinding:
      glob: $(inputs.output_dir + '/HiC_norm_binning.hdf5')
  - id: HiC_project_object_hdf5
    type: File
    outputBinding:
      glob: $(inputs.output_dir + '/HiC_project_object.hdf5')

requirements:
  - class: InlineJavascriptRequirement

