resource "aws_instance" "controlplane" {
  count         = var.number_instances_cp
  ami           = var.aws_ami
  instance_type = var.instance_type
  user_data     = file("user-data.sh")
  tags = {
    Name = "Control Plane"
  Project = "Control Plane do cluster K8S" }
  key_name               = aws_key_pair.this.key_name
  vpc_security_group_ids = [aws_security_group.security_group.id]
}

resource "aws_instance" "worker" {
  count         = var.number_instances_worker
  ami           = var.aws_ami
  instance_type = var.instance_type
  user_data     = file("user-data.sh")
  tags = {
    Name = "worker-${count.index}"
  Project = "Worker Cluster K8S" }
  key_name               = aws_key_pair.this.key_name
  vpc_security_group_ids = [aws_security_group.security_group.id]
}

resource "aws_key_pair" "this" {
  key_name   = "aws-instance-key"
  public_key = file("~/.ssh/id_rsa.pub")
}