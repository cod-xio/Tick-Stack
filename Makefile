init-host:
    # Configure Host for Stack Monitoring
	sudo chown -R 472:472 /data/Monitoring/Grafana/
	sudo mkdir -p /data/Monitoring/InfluxDB_1
	
init-docker:
    # Pull Docker Images
	sudo docker pull cedalo/management-center:2.0.0-arm32v7
	sudo docker pull eclipse-mosquitto:2.0.13
	sudo docker pull telegraf:1.20.3
	sudo docker pull influxdb:1.8.4
	sudo docker pull influxdb:2.1.1
	sudo docker pull prom/prometheus:v2.31.1
	sudo docker pull grafana/grafana:8.2.4
	
run-docker:
	sudo docker-compose up -d
	
stop-docker:
	sudo docker-compose stop
	
cleanup-docker:
	sudo docker-compose rm

cleanup-influx:
	curl -i -XPOST http://localhost:8086/query --data-urlencode "q=DROP database tasmotaToInflux"
	curl -i -XPOST http://localhost:8086/query --data-urlencode "q=CREATE database tasmotaToInflux"