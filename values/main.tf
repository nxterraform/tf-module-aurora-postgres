resource "random_string" "random" {
  length  = 16
  upper   = false
  lower   = true
  special = true 
  number  = true
}


module "rds-aurora-postresql" {
    source                          = "terraform-aws-modules/rds-aurora/aws"
    name                            = "rds-postgresql"
    engine                          = "aurora-postgresql"
    engine_version                  = "11.9"
    instance_type                   = "db.r6g.large"
    username                        = "rdsadmin4321"
    password                        = "rdstest@21"
    vpc_id                          = ""
    subnets                         = ["subnet-ed0ec3b0" ,"subnet-c99b8782"]
    db_cluster_parameter_group_name = "default.aurora-postgresql11"
    db_parameter_group_name         = "default.aurora-postgresql11"
    monitoring_interval             = "0"
    storage_encrypted               = "true"
    apply_immediately               = "true"
    replica_count                   = "1"
    allowed_security_groups         = ["sg-ec903fb0"]
    tags                            = {dev=true}

}