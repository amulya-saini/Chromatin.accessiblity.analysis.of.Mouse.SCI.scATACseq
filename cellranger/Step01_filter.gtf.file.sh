# Define input/output
gtf_original="Danio_rerio.GRCz11.114.gtf"
gtf_modified="gtf_no_par_or_readthrough.gtf"
gtf_filtered="Danio_rerio.GRCz11.114.filtered.gtf"

# 1. Remove "readthrough_transcript" and "PAR" tags (if present)
grep -v 'tag "readthrough_transcript"' "$gtf_original" | grep -v 'tag "PAR"' > "$gtf_modified"

# 2. Define allowed biotypes (Cell Ranger ARC standard)
BIOTYPE_PATTERN='(protein_coding|lincRNA|IG_C_gene|IG_D_gene|IG_J_gene|IG_V_gene|IG_V_pseudogene|IG_J_pseudogene|IG_C_pseudogene|TR_D_gene|TR_J_gene|TR_V_gene|TR_V_pseudogene)'
GENE_PATTERN='gene_biotype "'$BIOTYPE_PATTERN'"'
TX_PATTERN='transcript_biotype "'$BIOTYPE_PATTERN'"'

# 3. Extract gene_id allowlist from transcripts matching allowed biotypes
awk -v gene_pat="$GENE_PATTERN" -v tx_pat="$TX_PATTERN" '
$3 == "transcript" && $0 ~ gene_pat && $0 ~ tx_pat {
  match($0, /gene_id "([^"]+)"/, arr);
  if (arr[1] != "") print arr[1];
}' "$gtf_modified" | sort -u > gene_allowlist

# 4. Filter GTF to retain only genes/transcripts/exons for allowed genes
awk '
BEGIN {
  while ((getline line < "gene_allowlist") > 0) {
    allow[line] = 1;
  }
}
{
  if ($0 ~ /^#/) { print; next }  # Preserve GTF headers
  match($0, /gene_id "([^"]+)"/, arr);
  if (arr[1] in allow) print $0;
}
' "$gtf_modified" > "$gtf_filtered"

echo "✅ Filtered GTF written to: $gtf_filtered"

# check the biotype available in the gtf file
grep -v '^#' Danio_rerio.GRCz11.114.filtered.gtf | cut -f9 | grep -o 'gene_biotype "[^"]*"' | sort | uniq -c