The data for this project was downloaded from the BioProject: [PRJNA962539](https://www.ncbi.nlm.nih.gov/bioproject/PRJNA962539)  
Link to the BioProject: [Best practices for differential accessibility analysis in single-cell epigenomics (house mouse)](https://www.ncbi.nlm.nih.gov/bioproject/PRJNA962539)
Citation: Skinnider, M. A., Gautier, M., Teo, A. Y. Y., Kathe, C., Hutson, T. H., Laskaratos, A., De Coucy, A., Regazzi, N., Aureli, V., James, N. D., Schneider, B., Sofroniew, M. V., Barraud, Q., Bloch, J., Anderson, M. A., Squair, J. W., & Courtine, G. (2024). Single-cell and spatial atlases of spinal cord injury in the Tabulae Paralytica. Nature, 631(8019), 150–163. https://doi.org/10.1038/s41586-024-07504-y

## The data can either be downloaded `.sra` files using [SRA Toolkit](https://github.com/ncbi/sra-tools/wiki):

```bash
prefetch --max-size 40G SRR24326672 SRR24326673 SRR24326674 SRR24326675 SRR24326676
```

Then splitting the downloaded `.sra` files into fastq files:

```bash
fastq-dump --split-files SRR2432667*.sra
```
You would have to change the naming of the fastq files to match the naming convention of Cell Ranger acceptable version.  
More info here: [10x Genomics FASTQ Input Naming Convention](https://www.10xgenomics.com/support/software/cell-ranger-arc/latest/analysis/inputs/specifying-input-fastq-count)  
But verify that you are matching the OG names with the proper fastq files. 

## OR

If you want to avoid doing any of the above and download the OG data submitted to NCBI by the research group, you can use NCBI cloud data delivery platform.  
More details on it here: [NCBI Cloud Data Delivery](https://www.ncbi.nlm.nih.gov/Traces/cloud-delivery/)

Remember: 
* You need to have an NCBI account and an AWS account for this.  
* You will not be charged for transferring data from NCBI AWS to your AWS S3 (S3 to S3 data transfer), 
  but you'll be charged by AWS for the duration of storing the data in your S3 and if you download it to your system.
* Billing details can be found here: [AWS S3 Pricing](https://aws.amazon.com/s3/pricing/?p=pm&c=s3&z=4)

____________________________

Once the fastq.gz files are downloaded, you should setup your Cellranger-atac package/software on linux for aligning the fastq files to the reference genome.  
Cellranger-atac documentation can be found here: [Cellranger-ATAC](https://www.10xgenomics.com/support/software/cell-ranger-atac/latest)  
I used version 2.2.0 for this project.

## Reference genome

I downloaded the Mouse reference provided by 10x Genomics instead of creating my own.
```bash
wget "https://cf.10xgenomics.com/supp/cell-arc/refdata-cellranger-arc-GRCm39-2024-A.tar.gz"
tar xvf refdata-cellranger-arc-GRCm39-2024-A.tar.gz
```

But if you want to build one, you can follow the Step00 to Step03 bash scripts from the cellranger folder and adjust it according to your needs. Here, I created a zebrafish/Danio rerio reference.

## Generate Counts matrix
Modify the Step04 bash script according to your needs



# Ongoing project
