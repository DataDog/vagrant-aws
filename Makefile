all:
	bundle
	gem build vagrant-aws.gemspec
	vagrant plugin install vagrant-aws-0.7.2.gem
	vagrant box add dummy https://github.com/mitchellh/vagrant-aws/raw/master/dummy.box
	
