# Requirements:
1. Deploy an ELK stack in a Linux system
2. A reasonable volume of logs appear on Kibana

## Notes:
I'm not comfortable with ELK but the task is to **deploy** it. I don't need to know everything just basic knowledge of what it does and what pre-requisites it needs to run. It is very user friendly, so can use the UI for a lot of things, e.g dashboards. 

Plan:
- create python script that produces some kind of logs 
- run elk locally and document steps for setup
    - use commands.sh file to note and potentially automate any terminal commands
- configure elasticsearch yaml config to have multiple nodes running off the same host 
- deploy on ec2 t2.micro as a test and document steps needed for setup
- create terraform infrastructure to host the elk stack and deploy to an instance there

# Increments:
3. Prepare some dashboards in Kibana
4. Set up some filters in Logstash to blacklist/transform logs
5. Replace Kibana with Greylog

## Notes

# Additional: 
- Research Puppet and how they could fit in here
- Research Prometheus ~
- Research scaling, particularly 'sharding' 
- Consider other deployment methods:
    - kube
    - docker
    - azure
    - gcp 
