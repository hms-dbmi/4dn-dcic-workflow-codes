cwlVersion: cwl:draft-3
class: CommandLineTool
hints:
  - class: DockerRequirement
    dockerPull: hms-dbmi/gatk-docker:v2
baseCommand: gvcf.sh
inputs:
  - id: BAM
    type: File
    inputBinding:
      position: 1
  - id: FASTA
    type: File
    inputBinding:
      position: 2
  - id: FASTA_FAI
    type: File
  - id: FASTA_DICT
    type: File
  - id: dbSNP
    type: File
    inputBinding:
      position: 3
  - id: region
    type: string
    inputBinding:
      position: 4
  - id: prefix
    type: string
    inputBinding:
      position: 5
  - id: ncore
    type: int
    default: 2
    inputBinding:
      position: 6
  - id: mem
    type: string
    default: '4G'
    inputBinding:
      position: 7
  - id: GATKversion
    type: string
    default: '3.5n'
    inputBinding:
      position: 8
  - id: output_dir
    type: string
    default: '.'  

outputs:
  - id: out_gvcf
    type: File
    outputBinding:
      glob: $(inputs.output_dir + '/' + $inputs.prefix + '.' + $inputs.region + '.g.vcf')

requirements:
  - class: InlineJavascriptRequirement

