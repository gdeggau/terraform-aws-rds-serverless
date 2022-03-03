resource "aws_vpc" "vpc_database" {
  cidr_block = "192.168.0.0/16"
  tags       = merge(local.tags, { type = "database" })
}

resource "aws_subnet" "subnet_database" {
  vpc_id            = aws_vpc.vpc_database.id
  cidr_block        = "192.168.1.0/24"
  availability_zone = "${var.region}a"
  tags              = merge(local.tags, { type = "database" })
}
resource "aws_subnet" "subnet_database1" {
  vpc_id            = aws_vpc.vpc_database.id
  cidr_block        = "192.168.2.0/24"
  availability_zone = "${var.region}b"
  tags              = merge(local.tags, { type = "database" })
}

resource "aws_db_subnet_group" "default" {
  name       = "${var.product}-${var.project}-${var.env}-${var.envVersion}-sg"
  subnet_ids = [aws_subnet.subnet_database.id, aws_subnet.subnet_database1.id]
  tags       = local.tags
}