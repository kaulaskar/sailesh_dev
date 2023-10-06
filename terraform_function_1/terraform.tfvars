vpc_cidr      = "10.0.0.0/16"
# ami           = "ami-0f5ee92e2d63afc18"
instance_type = "t2.micro"
key_name      = "desktop-key"
subnet_cidr_public   = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24", "10.0.4.0/24", "10.0.5.0/24" ]
subnet_cidr_private  = ["10.0.10.0/24", "10.0.20.0/24", "10.0.30.0/24"]
allow_all     = "0.0.0.0/0"
rt_cidr       = "0.0.0.0/0"
az            = ["ap-south-1a", "ap-south-1b", "ap-south-1c"]
server_name   = "server"
egress        = [22, 80]
ingress       = [22, 8080, 80, 443, 555]
region        = "ap-south-1"

ami = {
   ap-south-1 = "ami-0f5ee92e2d63afc18"
   us-east-1  = "ami-053b0d53c279acc90"
    }
env = "prod"