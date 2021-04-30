
## Nagios-ElasticSearch

`check_elasticsearch.sh` : Nagios check script.

1) Copy the script under **/usr/local/nagios/libexec/** directory.
2) Modify the commands.cfg

```
define command {
     command_name    check_elasticsearch
     command_line    $USER1$/check_elasticsearch.sh $ARG1$ $ARG2$
}
```
3) Modify the localhost.cfg file

```
#Check for a pattern in elasticsearch cluster

define service {

  use                      local-service
  host_name                 localhost
  service_description      ELASTICSEARCH
  check_command            check_elasticsearch!"Handbill not printed"!192.168.94.104

}
```
Replace 192.168.94.104 with your ElasticSearch IP.


