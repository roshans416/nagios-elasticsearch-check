#!/bin/bash

#Setting colour code

RED='\033[0;31m'
NC='\033[0m'

#Checking the parameters. Exit if the parameters are missing.

if [[ -z "$1" ]] || [[ -z "$2" ]]; then
 echo -e "${RED}Missing parameters!${NC}"
 echo -e "Usage: ./check_elasticsearch.sh ${RED}\"search_string_in_quotes\" \"elasticsearch_hostname_or_ip_address\"${NC}" 
exit 2

else

#Setting variables

  search_string=$1
  host=$2

# Generating JSON  data for Elasticsearch GET query
 
  generate_post_data()
    {
      cat <<EOF
     {
       "query": 
       { 
          "match": 
            { 
                "title": "$search_string" 
            } 
       } 
   }
EOF
    }


#Searching the string and getting the count

hit_count=`curl -s -X GET "$host:9200/_all/_search" -H 'Content-Type: application/json' -d "$(generate_post_data)" | jq -r '.hits.total'`

#If count is greater than or equal to 3, mark it as "CRITICAL"

if [ $hit_count -ge 3 ]
then
     echo "CRTICAL! Total number of hits so far is $hit_count"
     exit 2
else
     echo "OK! Total number of hits so far is $hit_count"
     exit 0
fi    
fi
