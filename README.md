## 00-vpc
 create vpc

## 10-sg
creating SG

* If some asked you waht is this numer 00, 10 you can say by seeing this you clearly say sg is dependent on vpc based on numbering
* why you kept 10 numbers gap in between sg and vpc you can answr like thiswe dont something will come in future thats why i kept 10 gap

## Infra build(step by step) 
* store everything in central location (ssm parameter)ex: 
-  first you create vpc and subnet ids  we'll store vpc_id & subnet_ids in ssm parameter store then in sg you need "vpc_id" right so we will download from ssm parameter ad once we create sg again store sg in parameter store so onn...

* 1. module developers should output the required info to module users
* 2. users should catch that info and store in ssm parametr store