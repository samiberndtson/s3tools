#!/bin/bash

TARGETS=(
	$1{,{,user{,s},customer{,s}}{,-}{files,{data,}storage,upload{,s},download{,s},dl{,s},content,archive{,s},media,audio,images,img{,s},video{,s},log{,s},backup{,s},export{,s},assets,data},cms,{s3,}bucket,public,web,website,docs,documents,wp,wordpress,cdn,{,old,new}site,store,ecommerce}{,{,-}{temp,prod,production,dev,test,main,live,demo}}
)

for bucket in ${TARGETS[*]}; do

	http_code=$(curl -X GET -o /dev/null -s -w '%{http_code}' -k "https://$bucket.s3.amazonaws.com/")
	if [ ${http_code} -ne 404 ]; then
		echo $bucket.s3.amazonaws.com - $http_code
	fi
	
done
