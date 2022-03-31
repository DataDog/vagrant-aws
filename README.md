## Readme

This is a modified version of [vagrant-aws](https://github.com/mitchellh/vagrant-aws) for a homework assignment. It is an attempt to fix the installation errors that come with the original provider since it is out-of date. 

Note: The only functionalities tested are `vagrant up`, `vagrant ssh` and `vagrant destroy` for the purpose of the assignment.

# Quick install for M1
If you have an M1, the following should work:
1.  Fork this repo and clone it to your local.
2.  Run `vagrant plugin install <PATH_TO_CURRENT_DIR>/vagrant-aws-0.7.2.gem`. The gem file is already in the repository.

## To add this as a plugin for vagrant manually, do the following:
1. Fork this repo and clone it to your local.
2. `cd` into this repository

You can either run the following steps or you can use the Makefile in this repository and run `make` in your command line. It should perform the following steps automatically, provided you have Xcode installed. 

3. Run `bundle` to install dependencies. If you dont have bundle, make sure you have Xcode installed.
4. Run `gem build vagrant-aws.gemspec` to create a gem file
4. Install the gem file to your vagrant plugins as `vagrant plugin install <PATH_TO_CURRENT_DIR>/vagrant-aws-0.7.2.gem`
5. Ensure your aws credentials are written using aws configure. If you do not want to use this, you can pass your aws credentials in the vagrantfile as well.
6. Install a dummy box using `vagrant box add dummy https://github.com/mitchellh/vagrant-aws/raw/master/dummy.box`
7. Create an EC2 instance with `vagrant up --provider=aws`.
Note: Ensure your default security group/ security group that you mention in your Vagrantfile allows SSH access.



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
      aws.user_data = File.read("user_data.sh") # pass setup script 
      override.ssh.private_key_path = "<PATH TO PEM FILE IN YOUR LOCAL" # example: ~/test.pem
    end
  end
```
To use a list of configuration parameters for your Vagrantfile, see: https://github.com/mitchellh/vagrant-aws#configuration
