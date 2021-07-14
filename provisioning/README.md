# Provisioning

The purpose of this file is that it contains all the configuration necessary to run elk on an ec2 machine. The idea is that after carrying out 

```bash
scp -i "key_location/key.pem" provisioning/ ubuntu@public_ip_of_instance:
```
The ec2 instance will contain all the files necessary for configuration. Ideally the `linux_setup.sh` script will be run using terraform commands or using Ansible / packer syntax to provision the instance, which will contain 