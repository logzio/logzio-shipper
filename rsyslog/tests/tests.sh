#!/bin/bash

# -----------------------
# Tests - rsyslog
# -----------------------


function test_configure_rsyslog {
	# start fresh machine
	fresh_vagrent
	# run rsyslog linux install
	run_logz "linux"
}

function test_configure_rsyslog_uninstalled {
	# start fresh machine
	fresh_vagrent
	# delete rsyslog
	uninstall_rsyslog
	# run rsyslog linux install
	run_logz "linux"
}


function test_configure_rsyslog_not_a_service {
	# start fresh machine
	fresh_vagrent
	# remove service
	remvoe_rsyslog_service
	# run rsyslog linux install
	run_logz "linux"
}

function test_configure_rsyslog_on_network {
	# start fresh machine
	fresh_vagrent
	# prevent outgoing connection to destination on port 5000
	disable_traffic
	# run rsyslog linux install
	run_logz "linux"
}


# -----------------------
# Tests - apache
# -----------------------

function test_configure_apache {
	# start fresh machine
	fresh_vagrent
	#install apache and make some network traffic
	install_apache "create_traffic"
	# run rsyslog apache install
	run_logz "apache"
}

function test_configure_apache_uninstalled {
	# start fresh machine
	fresh_vagrent
	# run rsyslog apache install
	run_logz "apache"

	#should fail: apache hasn't been installed
}

function test_configure_apache_not_a_service {
	# start fresh machine
	fresh_vagrent
	#install apache and make some network traffic
	install_apache "create_traffic"
	# remove apache service
	remvoe_apache_service
	# run rsyslog apache install
	run_logz "apache"
}

function test_configure_apache_missing_logs {
	# start fresh machine
	fresh_vagrent
	#install apache and make some network traffic
	install_apache "create_traffic"
	#delete logs ...
	delete_apache_logs
	# run rsyslog apache install
	run_logz "apache"
}

function test_configure_apache_logs_empty {
	# start fresh machine
	fresh_vagrent
	#install apache without network traffic
	install_apache
	# run rsyslog apache install
	run_logz "apache"

	# no traffic ...  
}


# -----------------------
# Tests - ngnix
# -----------------------


function test_configure_nginx {
	# start fresh machine
	fresh_vagrent
	#install nginx and make some network traffic
	install_nginx "create_traffic"
	# run rsyslog nginx install
	run_logz "nginx"
}

function test_configure_nginx_uninstalled {
	# start fresh machine
	fresh_vagrent
	# run rsyslog nginx install
	run_logz "nginx"

	#should fail: nginx hasn't been installed
}

function test_configure_nginx_not_a_service {
	# start fresh machine
	fresh_vagrent
	#install nginx and make some network traffic
	install_nginx "create_traffic"
	# remove nginx service
	remvoe_nginx_service
	# run rsyslog nginx install
	run_logz "nginx"
}

function test_configure_nginx_missing_logs {
	# start fresh machine
	fresh_vagrent
	#install nginx and make some network traffic
	install_nginx "create_traffic"
	#delete logs ...
	delete_nginx_logs
	# run rsyslog nginx install
	run_logz "nginx"
}

function test_configure_nginx_logs_empty {
	# start fresh machine
	fresh_vagrent
	#install nginx without network traffic
	install_nginx
	# run rsyslog nginx install
	run_logz "nginx"

	# no traffic ...  
}