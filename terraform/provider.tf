terraform {
   required_providers {
     aws = {
       source = "hashicorp/aws"
       version = "~> 5.0"
     }
   }

   # This stores your infrastructure state in S3 so it is not lost
   backend "s3" {
     bucket = "devops-bootcamp-terraform-cyborgr2333" # Must match bucket created above
     key    = "state/terraform.tfstate"
     region = "ap-southeast-1"
   }
}

provider "aws" {
  region = "ap-southeast-1"  # Required region
}
