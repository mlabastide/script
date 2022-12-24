## Check Root
if [[ "${UID}" -ne 0 ]]
then
 echo 'Please run this script as "root"' >&2
 exit 1
fi

echo "deb http://download.webmin.com/download/repository sarge contrib" | sudo tee /etc/apt/sources.list.d/webmin.list
cd ~/ || exit
wget http://www.webmin.com/jcameron-key.asc
apt-key add jcameron-key.asc
rm jcameron-key.asc
apt-get update -y
apt-get install libapt-pkg-perl libnet-ssleay-perl libauthen-pam-perl libio-pty-perl apt-show-versions -y
apt-get install webmin -y
ufw allow 10000
echo 'USE HTTPS on port 10000'
