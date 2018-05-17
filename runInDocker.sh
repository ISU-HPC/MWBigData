#!/bin/bash

#pick username available on your computer
username=audris

echo "#!/bin/bash" > tmp.sh 
grep ^$username /etc/passwd | awk '{print "echo " $0 ">>/etc/passwd"}' >> tmp.sh
grep ^$username /etc/group | awk '{print "echo " $0 ">>/etc/group"}' >> tmp.sh
echo "echo $username' ALL=(ALL) NOPASSWD: ALL' > /etc/sudoers.d/$username" >> tmp.sh
echo "chmod 0440 /etc/sudoers.d/$username" >> tmp.sh

DC=${2:-audris/jupyter-r}
cmd=${1:-R}
echo "sudo -H -u $username $cmd" >> tmp.sh
chmod +x tmp.sh
docker run -it --rm -e DISPLAY=$DISPLAY -p 8898:8888 -v /home/$username:/home/$username -v /tmp/.X11-unix:/tmp/.X11-unix -v $(pwd):/data -w /data $DC /data/tmp.sh 

