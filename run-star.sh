RNA_DIR="/home/cyogodzi/datasets/wintRot/BBN963/BBN963/RNA"

for i in $(ls $RNA_DIR); do STAR --genomeDir /home/cyogodzi/datasets/wintRot/alignments/mm10/star-genome-124 \
--outSAMtype BAM SortedByCoordinate \
--outSAMstrandField intronMotif \
--outSAMattributes NH HI NM MD \
--outSAMmapqUnique 60 \
--outSAMunmapped Within \
--outSAMattrRGline ID:$i \
--outFileNamePrefix out5/$i \
--readFilesIn $RNA_DIR/$i \
--readFilesCommand gunzip \
-c ; done

