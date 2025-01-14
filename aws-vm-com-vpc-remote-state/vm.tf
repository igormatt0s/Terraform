resource "aws_key_pair" "key" {
  key_name   = "aws-key"
  public_key = file("./aws-key.pub")
}

resource "aws_instance" "vm" {
  ami                         = "ami-0fc5d935ebf8bc3bc"
  instance_type               = "t2.micro"
  key_name                    = aws_key_pair.key.key_name
  subnet_id                   = data.terraform_remote_state.vpc.outputs.subnet_id
  vpc_security_group_ids      = [data.terraform_remote_state.vpc.outputs.security_group_id]
  associate_public_ip_address = true

  volume_tags = {
    Name       = "vm-terraform"
    Project    = "teste"
    CostCenter = "teste"
  }

  tags = {
    Name       = "vm-terraform"
    Project    = "teste"
    CostCenter = "teste"
  }
}