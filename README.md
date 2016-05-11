# Dokku demo
* Create terraform.tfvars with:
  * DO_TOKEN="your token"
  * PUBLIC_SSH_KEY="path to public ssh key"
  * PRIVATE_SSH_KEY="path to private ssh key"
* Use ```terraform apply```
* go into the app folder
* git init
* git remote add dokku dokku@do-ip:dokku-demo
* git add .
* git commit -am "app"
* git push dokku master
