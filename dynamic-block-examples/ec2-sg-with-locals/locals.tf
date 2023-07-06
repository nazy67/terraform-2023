locals {
  common_tags = {
    Owner     = "nazy"
    ManagedBy = "Terraform"
    GitUrl    = "https://github.com/nazy67/terraform-2023/tree/main/ec2"
  }
}

locals {
  ingress_rules = [{
    description = "this sg rule allows port 22",
    port        = 22,
    protocol    = "tcp",
    cidr_blocks = ["0.0.0.0/0"],
    }, 
    {
    description = "this sg rule allows port 80",
    port        = 80,
    protocol    = "tcp",
    cidr_blocks = ["0.0.0.0/0"],
  },
  {
    description = "this sg rule allows port 80",
    port        = 443,
    protocol    = "tcp",
    cidr_blocks = ["0.0.0.0/0"],
  }]
}

locals {
  egress_rules = [
    {
    description = "this sg rule allows outbound to all",
    port        = 0,
    protocol    = "-1",
    cidr_blocks = ["0.0.0.0/0"],
    },
    {
    description = "this sg rule allows port oubound 443",
    port        = 443,
    protocol    = "-1",
    cidr_blocks = ["0.0.0.0/0"],
    }
  ]
}