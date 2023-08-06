ami_id         = "ami-0c768662cc797cd75"
instance_type  = "t2.micro"
key_name       = "blogging-key"
app_name       = "blog-website"
env_name       = "test"
vpc_id         = "vpc-0b4dc16bba90fcd81"
security_group = ["sg-0f0d281961a7d1f78"]

#------------------------------------------------------------------------------
# Provider config

profile_name = "user1"
region       = "ap-south-1"