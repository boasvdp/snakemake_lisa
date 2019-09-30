IDS, = glob_wildcards("raw_reads/{id}_1.fastq")

rule all:
	input:
		expand("depth/{sample}.tsv", sample=IDS)

rule bwa:
	input:
		fw = "raw_reads/{sample}_1.fastq",
		rv = "raw_reads/{sample}_2.fastq",
		ref = "ref_genome/ecoli_rel606.fasta"
	output:
		sam = "bwa_out/{sample}.sam"		
	shell:
		"""
		module load bwa/0.7.12
		bwa index {input.ref}
		bwa mem -o {output.sam} {input.ref} {input.fw} {input.rv}
		"""

rule samtools:
	input:
		sam = "bwa_out/{sample}.sam"
	output:
		bam = "samtools_out/{sample}.bam",
		depth = "depth/{sample}.tsv"
	shell:
		"""
		module load samtools/0.1.19
		samtools view {input.sam} > {output.bam}
		samtools depth {output.bam} > {output.depth}
		"""
