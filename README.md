The data for this project was downloaded from the BioProject: [PRJNA962539](https://www.ncbi.nlm.nih.gov/bioproject/PRJNA962539)  
Link to the BioProject: [https://www.ncbi.nlm.nih.gov/bioproject/PRJNA962539](https://www.ncbi.nlm.nih.gov/bioproject/PRJNA962539)

# The data can either be downloaded `.sra` files using [SRA Toolkit](https://github.com/ncbi/sra-tools/wiki):

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

# OR

If you want to avoid doing any of the above and download the OG data submitted to NCBI by the research group  
you can use NCBI cloud data delivery platform.  
More details on it here: [NCBI Cloud Data Delivery](https://www.ncbi.nlm.nih.gov/Traces/cloud-delivery/)

* You need to have a NCBI account and AWS account for this  
* You will not be charged for transferring data from NCBI AWS to your AWS S3 (S3 to S3 data transfer)  
  but you'll be charged by AWS for the duration of storing the data in your S3 and if you download it to your system  
* Billing details can be found here: [AWS S3 Pricing](https://aws.amazon.com/s3/pricing/?p=pm&c=s3&z=4)

# In progress

