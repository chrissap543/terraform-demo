module "create" {
  source = "../create"
}

resource "aws_ec2_instance_state" "test" {
  instance_id = module.create.instance_id
  state = "stopped"
}
