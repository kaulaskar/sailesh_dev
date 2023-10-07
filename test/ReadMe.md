terraform funcion
===============
count >>> "count = 3" used for number of count 
element  >> element(list, index.count)
splat syntex >>> (resource.name.*.id) used to list the dynamic value eg- ides .*.
length >> length(var.resource or resource.id)when we use lendg no need to activaly add count value 
dynamic ingress >> first need to define local variable 
used for running loop for resource objecs eg- security group