## Readme

This is a modified version of [vagrant-aws](https://github.com/mitchellh/vagrant-aws) for a homework assignment. It is an attempt to fix the installation errors that come with the original provider since it is out-of date. 

Note: The only functionalities tested are `vagrant up` and `vagrant destroy` for the purpose of the assignment.
## To add this as a plugin for vagrant, do the following:
1. Fork this repo and clone it to your local.
2. `cd` into this repository
3. Run `bundle` to install dependencies. If you dont have bundle, make sure you have Xcode installed.
4. Run `gem build vagrant-aws.gemspec` to create a gem file
4. Install the gem file to your vagrant plugins as `vagrant plugin install <PATH_TO_CURRENT_DIR>/vagrant-aws-0.7.2.gem`
5. Ensure your aws credentials are written using aws configure. If you do not want to use this, you can pass your aws credentials in the vagrantfile as well.
5. Create an EC2 instance with `vagrant up --provider=aws`.


# Quick install for M1
If you have an M1, the following should work:
1.  Fork this repo and clone it to your local.
2.  Run `vagrant plugin install <PATH_TO_CURRENT_DIR>/vagrant-aws-0.7.2.gem`. The gem file is already in the repository.


To create an ec2 instance use the following sample:
```
Vagrant.configure("2") do |config|
    config.vm.box = "dummy"
  
    config.vm.provider :aws do |aws, override|
      # if you have not configured using aws configure
      # aws.access_key_id = ""
      # aws.secret_access_key = ""

      aws.keypair_name = "<YOURKEYNAME>" # example: hw1-key (do not add .pem)
      aws.ami = "ami-0c02fb55956c7d316"
      aws.instance_type= "t2.micro"
      override.ssh.username = "ec2-user"
      override.ssh.private_key_path = "<PATH TO PEM FILE IN YOUR LOCAL" # example: ~/test.pem
    end
  end
```
To use a list of configuration parameters for your Vagrantfile, see: https://github.com/mitchellh/vagrant-aws#configuration
