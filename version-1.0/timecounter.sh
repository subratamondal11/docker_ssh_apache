#####################################################
# Name : TIME Count Script                          #
# Author: Subrata Mondal                            #
#                                                   #
#####################################################

#!/bin/bash

service apache2 start
service ssh start

while true
do
sleep 1

echo "<br /><center><h1>Welcome to modified apache2 docker container with ssh</h1><br />" > /var/www/html/index.html
echo -n "<h3>The Container Started "  >> /var/www/html/index.html

SEC=$[$SEC+1]
MIN=`expr $SEC / 60`
HOUR=`expr $MIN / 60`

# Hour Counter
if [ $HOUR -ge 1 ]; then
echo -n "$HOUR HOUR " >> /var/www/html/index.html

     if [ $MIN -ge 60 ]; then
          MIN1=`expr $MIN % 60`
          echo -n "$MIN1 Minutes " >> /var/www/html/index.html

                if [ $SEC -ge 60 ]; then
                     SEC1=`expr $SEC % 60`
                     echo -n "$SEC1 Seconds" >> /var/www/html/index.html
                fi
     fi

# Minutes Counter
elif [ $MIN -ge 1 ]; then
echo -n "$MIN Minutes " >> /var/www/html/index.html
    if [ $SEC -ge 60 ]; then
         SEC1=`expr $SEC % 60`
         echo -n "$SEC1 Seconds" >> /var/www/html/index.html
    fi

# Seconds Counter
elif [ $SEC -ge 1 ]; then
echo -n "$SEC Seconds" >> /var/www/html/index.html

# Nothing
else
echo 0 Second
fi

echo " ago </h3> </center>" >> /var/www/html/index.html

done
