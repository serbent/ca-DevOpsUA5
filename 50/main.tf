locals {
  bucket_name = "${var.bucket_name}-${var.env}-devopsua5"
  instance_count = var.env == "prod" ? 3 : 1
  instance_type = {
    dev  = "t3.micro"
    syst = "t3.micro"
    prod = "t3.medium"
  }
  short_env_names = {
    development  = "dev"
    systemtest = "syst"
    production = "prod"
  }

    instance_type_selected = lookup(local.instance_type, var.env, "t3.micro")
    env_short = lookup(local.short_env_names, var.env, "dev")
}


resource "aws_s3_bucket" "oidc_bucket" {
  bucket = local.bucket_name

  tags = {
    Name = local.bucket_name
    Env  = var.env
  }
}

resource "aws_instance" "oidc_instance" {
  count         = local.instance_count
  ami           = "ami-0c55b159cbfafe1f0" # Example AMI, replace with a valid one
  instance_type = local.instance_type_selected

  tags = {
    Name = "${local.bucket_name}-instance-${count.index + 1}"
    Env  = var.env
  }
}
