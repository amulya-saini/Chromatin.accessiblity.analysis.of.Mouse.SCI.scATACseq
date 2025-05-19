# Check for non_nuclear_contigs before creating a configuration file. Non nuclear contigs examples include mitochondrial DNA.
# Non nuclear contigs which are not part of the nuclear genome must be included from peak calling as they donot have chromatin or nucleosome or histones
# including them will lead to false peaks/biased results and wasted computational resources.

cat <<EOF > danio_rerio_GRCz11.config
{
  organism: "Zebrafish"
  genome: ["GRCz11"]
  input_fasta: ["Danio_rerio.GRCz11.dna.primary_assembly.fa"]
  input_gtf: ["Danio_rerio.GRCz11.114.filtered.gtf"]
  non_nuclear_contigs: ["MT"]
}
EOF
