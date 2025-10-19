variable "environment" {}

variable "project" {}

variable "region" {}

variable "vpc_name" {}

variable "vpc_cidr" {}

variable "enable_dns_hostnames" {}

variable "enable_dns_support" {}

variable "public_subnets" {}

variable "private_subnets" {}

variable "route_tables" {}

#variable "internet_gateway" {}

variable "route_table_associations" {}

variable "availability_zones" {}


# EKS Configuration Variables
variable "cluster_name" {}

variable "cluster_version" {}

variable "node_groups" {}

variable "tags" {}
