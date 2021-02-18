# Install ELK stack on UBUNTU

## 1. Install Elasticsearch:
```
sudo apt-get install openjdk-11-jdk -y

sudo apt-get install nginx -y

wget –qO – https://artifacts.elastic.co/GPG-KEY-elasticsearch | sudo apt-key add –

sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys D27D666CD88E42B4

echo "deb https://artifacts.elastic.co/packages/7.x/apt stable main" | sudo tee –a /etc/apt/sources.list.d/elastic-7.x.list

sudo apt-get install apt-transport-https -y

sudo apt-get update
sudo apt-get install elasticsearch -y

sudo vim /etc/elasticsearch/elasticsearch.yml

network.host: your_host_ip 
http.port: 9200  
discovery.type: single-node

sudo tee -a /etc/elasticsearch/elasticsearch.yml

sudo systemctl start elasticsearch.service
sudo systemctl enable elasticsearch.service
```

## 2. Install Kibana:
```
sudo apt-get install kibana -y

sudo vim /etc/kibana/kibana.yml

server.port: 5601  /etc/kibana/kibana.yml
server.host: your_host_ip 
elasticsearch.hosts:
your_host_ip:

sudo systemctl start kibana
sudo systemctl enable kibana
```

## 3. Install Logstash
```
sudo apt-get install logstash -y

sudo systemctl start logstash
sudo systemctl enable logstash
```

## 4. Install Filebeat
```
curl -L -O https://artifacts.elastic.co/downloads/beats/filebeat/filebeat-7.11.0-amd64.deb
sudo dpkg -i filebeat-7.11.0-amd64.deb

sudo vim /etc/filebeat/filebeat.yml
/host: your_host_ip:5601 
#output.elasticsearch:
output.logstash:
hosts: ["your_host_ip:5044"]

sudo filebeat modules enable system
sudo /usr/share/logstash/bin/./logstash-plugin install logstash-input-beats
sudo filebeat setup --pipelines --modules system
sudo filebeat setup --index-management -E output.logstash.enabled=false -E 'output.elasticsearch.hosts=["your_host_ip:9200"]'
sudo filebeat setup -E output.logstash.enabled=false -E output.elasticsearch.hosts=['your_host_ip:9200'] -E setup.kibana.host=your_host_ip:5601

sudo systemctl start filebeat
sudo systemctl enable filebeat

```

## 5. Install Metricbeat
```
curl -L -O https://artifacts.elastic.co/downloads/beats/metricbeat/metricbeat-7.11.0-amd64.deb
sudo dpkg -i metricbeat-7.11.0-amd64.deb

sudo vim /etc/metricbeat/metricbeat.yml

host: "your_host_ip:5601"/'  

sudo metricbeat modules enable docker

sudo metricbeat setup

sudo systemctl start metricbeat
sudo systemctl enable metricbeat

```



