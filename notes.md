# Requirements:
1. Deploy an ELK stack in a Linux system
2. A reasonable volume of logs appear on Kibana

## Notes:
I'm not comfortable with ELK but the task is to **deploy** it. I don't need to know everything just basic knowledge of what it does and what pre-requisites it needs to run. It is very user friendly, so can use the UI for a lot of things, e.g dashboards. 


- create python script that produces some kind of logs (done)
    - [This tutorial](https://www.freecodecamp.org/news/how-to-use-elasticsearch-logstash-and-kibana-to-visualise-logs-in-python-in-realtime-acaab281c9de/) has a good example of a python script to generate random logs. Although the creator had to run it multiple times to generate enough logs, so maybe create a hanging script. e.g create a log every 2 mins. 
    - achieved this by adding a `while` loop with `time.sleep(120`))
    - started the script to build up some logs while i continue working. 
    - using `&` at the end of the command will run it in the background, eliminating the need for multiple terminal instances. 
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
