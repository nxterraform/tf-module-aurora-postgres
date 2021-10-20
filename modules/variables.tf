#-----------------------------------------------------------
# REQUIRED PARAMETERS
#-----------------------------------------------------------

variable "suffix" {
    description     = "An arbitrary suffix that will hat will be added to the resource name(s).For example: an environment name, a business-case name, a numeric id, etc, "
    type            = string
    validation {
      condition     = length(var.suffix) <= 14
      error_message = "A max of 14 character(s) are allowed."


    }  
}


variable "aurora_psql_name" {
  description       = "Name of the application, e.g. app"
  type              = string
}

variable "vpc_id" {
  type        = string
  description = "The VPC ID, in the case that you do not want terraform to create a VPC with the default network settings on your behalf. If this setting is present, you should also have at least a 2 other subnets, each in a different availability zone, in the same region specified in aws_region."
}

variable "engine_version" {
  description = "Aurora database engine version."
  type        = string
}  

variable "db_instance_type" {
  type    = string
  description = "EC2 instance type for postgres"
}

variable "db_replica_count" {
  description = "How many replicas for the database"
  type        = number
}

variable "db_master_username" {
  type    = string
  description = "Postres admin user name" 
}

variable "tags" {
  type = map(string)
  description = "A map of tags to add to all resources."
}

variable "db_engine" {
  description = "Aurora database engine type, currently aurora, aurora-mysql or aurora-postgresql"
  type = string
}

variable "db_security_groups" {
  type = list(string)
  description = "A list of Security Group ID's to allow access to"
}

variable "subnet_ids" {
  type = list(string)
  description = "List of subnet IDs used by database subnet group created"
}

variable "db_cluster_parameter_group_name" {
  type = string
  description = "The name of a DB Cluster parameter group to use"
}

variable "db_parameter_group_name" {
  type = string
  description = "The name of a DB parameter group to use"
}

variable "monitoring_interval" {
  type = number
  description = "The interval (seconds) between points when Enhanced Monitoring metrics are collected"
}

variable "storage_encrypted" {
  type = bool
  description = "Specifies whether the underlying storage layer should be encrypted"
}

variable "apply_immediately" {
  type = bool
  description = "Determines whether or not any DB modifications are applied immediately, or during the maintenance window"
}