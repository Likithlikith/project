module "networking" {
  source = "./networking"
  
  # Pass networking variables - FIXED variable names
  vpc_name             = var.vpc_name
  vpc_cidr             = var.vpc_cidr
  enable_dns_hostnames = var.enable_dns_hostnames
  enable_dns_support   = var.enable_dns_support
  public_subnets       = var.public_subnets
  private_subnets      = var.private_subnets
  availability_zones   = var.availability_zones
  environment          = var.environment
  project              = var.project
  region               = var.region
  tags                 = var.tags
}

# EKS Module
 module "eks" {
     source = "./eks"
  
  # EKS Configuration
   cluster_name    = var.cluster_name
   cluster_version = var.cluster_version
   node_groups     = var.node_groups
  
   # Networking dependencies
   vpc_id          = module.networking.vpc_id
   private_subnets = module.networking.private_subnet_ids
   public_subnets  = module.networking.public_subnet_ids
  
   # Environment variables
   environment     = var.environment
   project         = var.project
   region          = var.region
   tags            = var.tags
  
   depends_on = [module.networking]
    }