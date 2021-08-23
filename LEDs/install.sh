#! /bin/sh

/usr/bin/install ope_LED123.sh  /usr/local/bin
/bin/cp ope_LED123.service /etc/systemd/system
/usr/bin/systemctl daemon-reload
/usr/bin/systemctl enable ope_LED123
/usr/bin/systemctl restart ope_LED123
