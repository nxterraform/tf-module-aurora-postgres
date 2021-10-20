terraform {
  required_version =">= 1.0.5" # see https://releases.hashicorp.com/terraform/
}


locals{
    aws_aurora_psql_name    = format("%s-%s", var.aurora_psql_name, var.suffix)
    tags                    = tolist(toset(var.tags))
    db_master_password      = format("%s-%s", tf, random_string.random)
    
}

resource "aurora_postresql_db" "demo-postresql-db" {
  name                    = "${local.aws_aurora_psql_name}-np"
  engine                  = var.db_engine
  engine_version          = var.engine_version
  instance_type           = var.db_instance_type

  username                = var.db_master_username
  password                = local.db_master_password

  vpc_id                  = var.vpc_id
  subnets                 = var.subnet_ids

  replica_count           = var.db_replica_count
  allowed_security_groups = var.db_security_groups

  storage_encrypted       = var.storage_encrypted
  apply_immediately       = var.apply_immediately
  monitoring_interval     = var.monitoring_interval

  db_parameter_group_name         = var.parameter_group_name
  db_cluster_parameter_group_name = var.db_cluster_parameter_group_name 

  tags = local.tags
}
