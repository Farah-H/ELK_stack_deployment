provider "aws" {
    region = var.region
}

resource "aws_vpc" "elk_vpc" {
    cidr_block = "10.0.0.0/16"

    tags = {
        Name = "ekl_vpc_test2"
    }
}

resource "aws_internet_gateway" "elk_igw" {
    vpc_id = aws_vpc.elk_vpc.id

    tags = {
        Name = "elk_igw"
    }
}

resource "aws_subnet" "public_subnet" {
    vpc_id = aws_vpc.elk_vpc.id
    cidr_block = "10.0.2.0/24"
    map_public_ip_on_launch = true 

    tags = {
        Name = "elk_public_subnet"
    }
}

resource "aws_route_table" "route_table" {
    vpc_id = aws_vpc.elk_vpc.id

    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.elk_igw.id
    }

    tags = {
        Name = "elk_public_rt"
    }
}

resource "aws_route_table_association" "public_subnet_association" {
    subnet_id= aws_subnet.public_subnet.id
    route_table_id = aws_route_table.route_table.id
}

resource "aws_network_acl" "public_nacl" {
    vpc_id = aws_vpc.elk_vpc.id
    subnet_ids = [aws_subnet.public_subnet.id]

    tags = {
        Name = "elk_public_nacl"
    }

    ingress {
        # description = "Allow HTTP"
        rule_no = 100
        action = "allow"
        from_port = 80
        to_port = 80
        cidr_block = "0.0.0.0/0"
        protocol = "tcp"
    }

    ingress {
        # description = "Allow HTTPS"
        rule_no = 200
        action = "allow"
        from_port = 443
        to_port = 443
        cidr_block = "0.0.0.0/0"
        protocol = "tcp"
    }

    ingress {
        # description = "Allow ethereal ports"
        rule_no = 300
        action = "allow"
        from_port = 1024
        to_port = 65535
        cidr_block = "0.0.0.0/0"
        protocol = "tcp"
    }

    ingress {
        # allowing SSH from all because I have to access using another laptop
        # need to close this up later. 
        # description = "Allow SSH from all"
        rule_no = 400
        action = "allow"
        from_port = 22
        to_port = 22
        cidr_block = "0.0.0.0/0"
        protocol = "tcp"
    }

    # could allow all out, but better to define explicitly at NACL level

    egress {
        # description = "Allow HTTP"
        rule_no = 100
        action = "allow"
        from_port = 80
        to_port = 80
        cidr_block = "0.0.0.0/0"
        protocol = "tcp"
    }

    egress {
        # description = "Allow HTTPS"
        rule_no = 200
        action = "allow"
        from_port = 443
        to_port = 443
        cidr_block = "0.0.0.0/0"
        protocol = "tcp"
    }

    egress {
        # description = "Allow ethereal ports"
        rule_no = 300
        action = "allow"
        from_port = 1024
        to_port = 65535
        cidr_block = "0.0.0.0/0"
        protocol = "tcp"
    }

    egress {
        # description = "Allow SSH from All"
        rule_no = 400
        action = "allow"
        from_port = 22
        to_port = 22
        cidr_block = "0.0.0.0/0"
        protocol = "tcp"
    }
} 