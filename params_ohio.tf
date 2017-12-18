provider "aws" {
  alias  = "ohio"
  region = "us-east-2"
}

resource "aws_ssm_parameter" "s3_bucket_ohio" {
  provider  = "aws.ohio"
  name      = "${var.param_tfstate_s3_bucket}"
  type      = "String"
  value     = "${aws_s3_bucket.terraform_state.id}"
  overwrite = true
}

resource "aws_ssm_parameter" "dynamodb_table_ohio" {
  provider  = "aws.ohio"
  name      = "${var.param_tfstate_dynamodb}"
  type      = "String"
  value     = "${aws_dynamodb_table.terraform_statelock.id}"
  overwrite = true
}

resource "aws_ssm_parameter" "backend_region_ohio" {
  provider  = "aws.ohio"
  name      = "${var.param_tfstate_region}"
  type      = "String"
  value     = "${data.aws_region.current.name}"
  overwrite = true
}
