module "amazon_linux" {
  source        = "../child-modules"
  env           = "prod"
  instance_type = "t2.micro"
  key_name      = "nazy-local-key"
}