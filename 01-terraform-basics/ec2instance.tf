resource "aws_instance" "demo_instance" {
    ami = data.aws_ami.amz_linux_2023.id
    instance_type = var.instance_type_map["test"] # Map reference
    key_name = var.instance_keypair
    vpc_security_group_ids = [ aws_security_group.allow_tls.id ]
    # user_data = file("${path.module}/scripts/install-httpd.sh")
    for_each = toset(data.aws_availability_zones.current_azs.zone_ids)
    availability_zone = each.key
    tags = {
      "Name" = "demo_ct_server${each.key}"
    }
}

resource "aws_security_group" "allow_tls" {
  name        = "allow_tls"
  description = "Allow TLS inbound traffic and all outbound traffic"
  tags = {
    Name = "allow_tls"
  }
}

resource "aws_vpc_security_group_ingress_rule" "allow_port_22" {
  security_group_id = aws_security_group.allow_tls.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 22
  ip_protocol       = "tcp"
  to_port           = 22
}
resource "aws_vpc_security_group_ingress_rule" "allow_port_80" {
  security_group_id = aws_security_group.allow_tls.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 80
  ip_protocol       = "tcp"
  to_port           = 80
}

resource "aws_vpc_security_group_egress_rule" "allow_all_traffic_ipv4" {
  security_group_id = aws_security_group.allow_tls.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1" 
}