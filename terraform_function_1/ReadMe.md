terraform funcion
===============
count >>> "count = 3" used for number of count 
element  >> element(list, index.count)
splat syntex >>> (resource.name.*.id) used to list the dynamic value eg- ides .*.
length >> length(var.resource or resource.id)when we use lendg no need to activaly add count value 
dynamic ingress >> first need to define local variable 
used for running loop for resource objecs eg- security group

=============

if else function 
===================
lookup function >> uses map variable >> lookup(key, value,  default)
 
.tfvars

region = "ap-south-1"
region =  "us-east-1"

ami = {
ap-south-1 = "ami-56564654"
us-east-1 = "ami-46544541"
}

region = lookup(var.region, var.ami)   

conditional functions 
======================
condition function >>> 
count = ( var.env == "prod" ? 3 : 1 )
if envroment envorment is prod then it willl deploy 3 instance or else it will deploy 1 instance 
