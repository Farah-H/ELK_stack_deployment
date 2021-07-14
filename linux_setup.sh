# install elasticsearch on ec2
wget -qO - https://artifacts.elastic.co/GPG-KEY-elasticsearch | sudo apt-key add -
sudo apt-get install apt-transport-https
echo "deb https://artifacts.elastic.co/packages/7.x/apt stable main" | sudo tee /etc/apt/sources.list.d/elastic-7.x.list
sudo apt-get update && sudo apt-get install elasticsearch

# start the service 
sudo service elasticsearch start 
# check if setup was successful => json-like description of the cluster
curl http://localhost:9200/

# install kibana on ec2 
sudo apt-get update && sudo apt-get install kibana

# start the service 
sudo serive kibana start 