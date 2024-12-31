#!/bin/bash

for domain in $(cat $1 | jq -r ".[] | .entries[] | .request | select(.method==\"GET\") | .headers[] | select(.name==\"Host\") | .value" | sort | uniq); do
	if (curl -X GET -k -s https://$domain | grep -q 'ListBucketResult'); then
		echo $domain
	fi
done

