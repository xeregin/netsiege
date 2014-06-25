#for i in `nova list | grep $1 | awk '{print $12}' | sed 's/.*=//'`; do
for i in `neutron floatingip-list | grep 10 | awk '{print $6}'`; do
  ssh ubuntu@$i 'rm *.0'
  ssh ubuntu@$i 'rm *.1'
  ssh ubuntu@$i 'rm *.2'
  ssh ubuntu@$i 'rm *.3'
  ssh ubuntu@$i 'rm *.4'
  ssh ubuntu@$i 'rm *.5'
  ssh ubuntu@$i 'rm *.6'
  ssh ubuntu@$i 'rm *.7'
  ssh ubuntu@$i 'rm *.8'
  ssh ubuntu@$i 'rm *.9'
done
