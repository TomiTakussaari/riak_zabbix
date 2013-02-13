riak_zabbix
===========

Puppet module for configuring zabbix agent for monitoring Riak.
Uses "/stats" resource documented in http://docs.basho.com/riak/1.2.0/references/apis/http/HTTP-Status/

Currently supported Zabbix keys:

    riak.ring_num_partitions
    riak.memory_total
    riak.memory_processes_used
    riak.pbc_active
    
Zabbix keys are riak.{key name}

Expects that "riak_kv_stat" is enabled on your Riak instance! 


