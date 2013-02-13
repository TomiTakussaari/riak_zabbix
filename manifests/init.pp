define zabbix_riak::zabbix_riak($riak_listen_ip){
  	File {
		owner => root,
		group => root,
	}

	package { "zabbix-agent":
		ensure => installed,
		require => Yumrepo["epel"],
	}
	
	yumrepo { "epel":
    	baseurl => "http://download.fedoraproject.org/pub/epel/6/\$basearch",
    	descr => "EPEL repo",
    	enabled => 1,
    	gpgcheck => 0,
  	}

	file { "/etc/zabbix/zabbix_agentd.conf":
		content => template("zabbix/etc/zabbix/zabbix_agentd.conf.erb"),
		ensure => present,
	}

	service { "zabbix-agent":
		ensure => "running",
		hasstatus => true,
		enable => true,
		subscribe  => [ File["/etc/zabbix/zabbix_agentd.conf"] ],
	}

	Package["zabbix-agent"] -> File["/etc/zabbix/zabbix_agentd.conf"] -> Service["zabbix-agent"]
}
