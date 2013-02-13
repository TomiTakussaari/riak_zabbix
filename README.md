riak_zabbix
===========

Puppet module for configuring zabbix agent for monitoring Riak.
Uses "/stats" resource documented in http://docs.basho.com/riak/1.2.0/references/apis/http/HTTP-Status/

Expects that "riak_kv_stat" is enabled on your Riak instance! 


Currently supported Zabbix keys:

    riak.ring_num_partitions
    riak.memory_total
    riak.memory_processes_used
    riak.pbc_active
    
Zabbix keys are in format "riak.{key name}"

Usage:

    $listen_ip = $::ipaddress_eth0
    riak_zabbix::zabbix { "zabbix-riak":
       riak_listen_ip => $listen_ip
    }

Currently works only on RHEL6.

Project in Puppet forge: http://forge.puppetlabs.com/tomitakussaari/riak_zabbix




