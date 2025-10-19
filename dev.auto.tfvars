# Environment
environment = "dev"
project     = "Mayotiqa"
region      = "us-east-1 "

# VPC Configuration
vpc_name = "Mayotiqa-dev-vpc"
vpc_cidr = "10.0.0.0/16"

enable_dns_hostnames = true
enable_dns_support   = true

###############################################################################
availability_zones = ["us-east-1a", "us-east-1b"]
###############################################################################################################
# Subnets

public_subnets = {
  "public-subnet-1a" = {
    cidr = "10.0.1.0/24"
    az   = "us-east-1a"
  }
  "public-subnet-1b" = {
    cidr = "10.0.2.0/24"
    az   = "us-east-1b"
  }
}

private_subnets = {
  "private-subnet-1a" = {
    cidr = "10.0.3.0/24"
    az   = "us-east-1a"
  }
  "private-subnet-1b" = {
    cidr = "10.0.4.0/24"
    az   = "us-east-1b"
  }
}

###############################################################################################################
# Internet Gateway
# internet_gateway = {
#   name = "Mayotiqa-dev-igw"
# }
#########################################################Route tables######################################################

# Route Tables
route_tables = {
  public = {
    name = "Mayotiqa-dev-public-rt"
    routes = [
      {
        cidr_block = "0.0.0.0/0"
        gateway_id = "internet_gateway"  # Reference to IGW
      }
    ]
  }
  private_1a = {
    name = "Mayotiqa-dev-private-rt-1a"
    routes = [
      {
        cidr_block     = "0.0.0.0/0"
        nat_gateway_id = "nat-gw-1a"  # Reference to NAT GW
      }
    ]
  }
  private_1b = {
    name = "Mayotiqa-dev-private-rt-1b"
    routes = [
      {
        cidr_block     = "0.0.0.0/0"
        nat_gateway_id = "nat-gw-1b"  # Reference to NAT GW
      }
    ]
  }
}

###############################################################################################################
# Route Table Associations
route_table_associations = {
  public = {
    "public-subnet-1a" = "public"
    "public-subnet-1b" = "public"
  }
  private = {
    "private-subnet-1a" = "private_1a"
    "private-subnet-1b" = "private_1b"
  }
}

# EKS Cluster Configuration
# =============================================
cluster_name = "Mayotiqa-dev-eks-cluster"
cluster_version = "1.29"

# EKS Node Groups
node_groups = {
  main = {
    desired_size   = 2
    max_size       = 4
    min_size       = 1
    instance_types = ["t3.medium"]
    disk_size      = 20
    capacity_type  = "ON_DEMAND"
  }
  
  spot = {
    desired_size   = 1
    max_size       = 3
    min_size       = 1
    instance_types = ["t3.medium", "t3.small"]
    disk_size      = 20
    capacity_type  = "ON_DEMAND"
  }
}

# Tags
tags = {
  Environment = "dev"
  Project     = "Mayotiqa"
  Terraform   = "true"
}