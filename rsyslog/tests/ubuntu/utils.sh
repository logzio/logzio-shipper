#!/bin/bash


source ../tests.sh
source ../utils.sh

function install_apache {
	execute_cmd vagrant ssh -c "sudo apt-get update"
	execute_cmd vagrant ssh -c "sudo apt-get -y install apache2"

	if [[ $1 == "create_traffic" ]]; then
		execute_cmd vagrant ssh -c "curl -H "Host:sub.domain.com" 127.0.0.1 > /dev/null"
	fi
}

function install_nginx {
	execute_cmd vagrant ssh -c "sudo apt-get update"
	execute_cmd vagrant ssh -c "sudo apt-get -y install nginx"

	if [[ $1 == "create_traffic" ]]; then
		execute_cmd vagrant ssh -c "curl -H "Host:sub.domain.com" 127.0.0.1 > /dev/null"
	fi
}

function uninstall_rsyslog {
	execute_cmd vagrant ssh -c "sudo apt-get -y remove rsyslog"
	execute_cmd vagrant ssh -c "sudo apt-get -y purge rsyslog"
}

function remvoe_rsyslog_service {
	execute_cmd vagrant ssh -c "sudo rm -f /etc/init.d/rsyslog"
}

function disable_traffic {
	execute_cmd vagrant ssh -c "sudo iptables -A OUTPUT -p tcp --dport 5000 -j DROP"
}

function remvoe_apache_service {
	execute_cmd vagrant ssh -c "sudo rm -f /etc/init.d/apache2"
}

function remvoe_nginx_service {
	execute_cmd vagrant ssh -c "sudo rm -f /etc/init.d/nginx"
}

function delete_apache_logs {
	execute_cmd vagrant ssh -c "sudo rm -fr /var/log/apache2"
}

function delete_nginx_logs {
	execute_cmd vagrant ssh -c "sudo rm -fr /var/log/nginx"
}