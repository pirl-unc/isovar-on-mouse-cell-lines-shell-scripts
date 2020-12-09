#!/bin/bash

for var in "$@";
	do 
		if [[ $var == *.vcf ]]; then 
        		echo "Compressing $var for bcftools"
			gzip $var 
			zcat $var | bgzip -c > "new."$var".gz" && tabix "new."$var".gz"
			zipped="new."$var".gz"
			

		elif [[ $var == *.gz ]]; then
			echo 
			zcat $var | bgzip -c > "new."$var && tabix "new."$var	
			zipped="new."$var
	   	fi

		echo "Filtering Alt Mouse Contigs in" $var

		bcftools view $zipped \
		--regions chr1,chr2,chr3,chr4,chr5,chr6,chr7,chr8,chr9,chr10,chr11,chr12,chr13,chr14,chr15,chr16,chr17,chr18,chr19,chrX,chrY,chrM \
		> $var".filtered.vcf"

		echo "Done!"
	done;
