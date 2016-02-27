#!/bin/sh
ac=(101 102 103 104 105)
ob_ip1=(151 152 153 154 155)
ob_ip2=(156 157 158 159 160)
zone=(1 2 3 4 5 )
echo "#!/bin/sh">ring_generate
for ((i=0; i<5; i++))
do
echo '#******Zone '"${zone[i]}"' Start************'>>ring_generate 
for (( d=1; d<=5; d++ ))
do
echo 'swift-ring-builder account.builder add r1z'"${zone[i]}"'-172.16.100.'"${ac[i]}"':6002/disk'"${d}" '100'
echo 'swift-ring-builder container.builder add r1z'"${zone[i]}"'-172.16.100.'"${ac[i]}"':6001/disk'"${d}"' 100'
echo 'swift-ring-builder object.builder add r1z'"${zone[i]}"'-172.16.100.'"${ob_ip1[i]}"':6000/disk'"${d}"' 100'
echo 'swift-ring-builder object.builder add r1z'"${zone[i]}"'-172.16.100.'"${ob_ip2[i]}"':6000/disk'"${d}"' 100'
done >>ring_generate
echo '#******Zone '"${zone[i]}"' End************'>>ring_generate	
done 


