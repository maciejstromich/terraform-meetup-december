provider "aws" {
  region     = "${var.region}"
  profile    = "${var.aws_profile}" 
}

resource "aws_vpc" "main" {
  cidr_block = "${var.vpc_cidr}"
  tags {
    Name       = "${var.shortname}-vpc"
    created_by = "terraform"
  }
}

resource "aws_internet_gateway" "igw" {
  vpc_id = "${aws_vpc.main.id}"
  tags {
    Name       = "${var.shortname}-igw"
    created_by = "terraform"
  }
}

resource "aws_subnet" "main" {
  vpc_id     = "${aws_vpc.main.id}"
  cidr_block = "${var.subnet_cidr}"

  tags {
    Name       = "${var.shortname}-subnet"
    created_by = "terraform"
  }
  map_public_ip_on_launch = true
}

resource "aws_route_table" "default_gw" {
  vpc_id = "${aws_vpc.main.id}"
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.igw.id}"
  }

  tags {
    Name       = "${var.shortname}-Default-Table"
    created_by = "terraform"
  }
}

resource "aws_main_route_table_association" "a" {
  vpc_id         = "${aws_vpc.main.id}"
  route_table_id = "${aws_route_table.default_gw.id}"
}
