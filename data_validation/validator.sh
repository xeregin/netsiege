#!/bin/bash

echo "#!/bin/bash" > senddata.sh
echo "" >> senddata.sh

for i in `nova list | grep $1 | awk '{print $12}' | sed 's/.*=//'`; do
  echo "scp \`hostname\`.0 ubuntu@$i:~/ &" >> senddata.sh
  echo "scp \`hostname\`.1 ubuntu@$i:~/ &" >> senddata.sh
  echo "scp \`hostname\`.2 ubuntu@$i:~/ &" >> senddata.sh
  echo "scp \`hostname\`.3 ubuntu@$i:~/ &" >> senddata.sh
  echo "scp \`hostname\`.4 ubuntu@$i:~/ &" >> senddata.sh
  echo "scp \`hostname\`.5 ubuntu@$i:~/ &" >> senddata.sh
  echo "scp \`hostname\`.6 ubuntu@$i:~/ &" >> senddata.sh
  echo "scp \`hostname\`.7 ubuntu@$i:~/ &" >> senddata.sh
  echo "scp \`hostname\`.8 ubuntu@$i:~/ &" >> senddata.sh
  echo "scp \`hostname\`.9 ubuntu@$i:~/ &" >> senddata.sh
done

chmod u+x senddata.sh

for i in `nova list | grep $1 | awk '{print $12}' | sed 's/.*=//'`; do
  scp ./datagen.sh ubuntu@$i:~/
  scp ./senddata.sh ubuntu@$i:~/
  ssh -o StrictHostKeyChecking=no ubuntu@$i 'echo "$(expr $(date +%M) + 1) $(date +%H) * * * /home/ubuntu/datagen.sh" > mycron; crontab mycron';
  ssh -o StrictHostKeyChecking=no ubuntu@$i 'echo "$(expr $(date +%M) + 3) $(date +%H) * * * /home/ubuntu/senddata.sh" >> mycron; crontab mycron';
done

for i in `nova list | grep $1 | awk '{print $12}' | sed 's/.*=//'`; do
  COMPLETED=$( ssh -o StrictHostKeyChecking=no ubuntu@$i 'ls -la | grep 101562500 | wc -l' )
  #while [[ COMPLETED=`ssh -o StrictHostKeyChecking=no ubuntu@$i 'ls -la | grep 1015625000 | wc -l'` != 10 ]]; do
  while [[ $COMPLETED != 10 ]]; do
    echo "Waiting for binaries to be generated on VM `ssh ubuntu@$i 'hostname'`: $COMPLETED of 10" 
    COMPLETED=$( ssh -o StrictHostKeyChecking=no ubuntu@$i 'ls -la | grep 101562500 | wc -l' )
  done
  echo "Binaries generated on `ssh ubuntu@$i 'hostname'`."
done

echo "SEND DATA Script:"
cat senddata.sh
rm senddata.sh
