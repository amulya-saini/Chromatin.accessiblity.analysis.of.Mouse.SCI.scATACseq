# Download the reference genome and gtf file from ensembl
wget https://ftp.ensembl.org/pub/release-114/fasta/danio_rerio/dna/Danio_rerio.GRCz11.dna.primary_assembly.fa.gz
wget https://ftp.ensembl.org/pub/release-114/gtf/danio_rerio/Danio_rerio.GRCz11.114.gtf.gz

# unzip the files
gunzip Danio_rerio.GRCz11.114.gtf.gz Danio_rerio.GRCz11.dna.primary_assembly.fa.gz

# check the biotype available in the gtf file
grep -v '^#' Danio_rerio.GRCz11.114.gtf | cut -f9 | grep -o 'gene_biotype "[^"]*"' | sort | uniq -c