#!/bin/sh
echo "filmezz.sh: start"
cp $1/iptvupdate/custom/filmezz.sh $2/iptvupdate/custom/filmezz.sh
status=$?
if [ $status -ne 0 ]; then
	echo "filmezz.sh: Critical error. The $0 file can not be copied, error[$status]."
	exit 1
fi
cp $1/hosts/hostfilmezz.py $2/hosts/
hosterr=$?
cp $1/icons/logos/filmezzlogo.png $2/icons/logos/
logoerr=$?
cp $1/icons/PlayerSelector/filmezz*.png $2/icons/PlayerSelector/
iconerr=$?
if [ $hosterr -ne 0 ] || [ $logoerr -ne 0 ] || [ $iconerr -ne 0 ]; then
	echo "filmezz.sh: copy error from source hosterr[$hosterr], logoerr[$logoerr, iconerr[$iconerr]"
fi
wget --no-check-certificate https://github.com/e2iplayerhosts/filmezz/archive/master.zip -q -O /tmp/filmezz.zip
if [ -s /tmp/filmezz.zip ] ; then
	unzip -q -o /tmp/filmezz.zip -d /tmp
	cp -r -f /tmp/filmezz-master/IPTVPlayer/hosts/hostfilmezz.py $2/hosts/
	hosterr=$?
	cp -r -f /tmp/filmezz-master/IPTVPlayer/icons/* $2/icons/
	iconerr=$?
	if [ $hosterr -ne 0 ] || [ $iconerr -ne 0 ]; then
		echo "filmezz.sh: copy error from filmezz-master hosterr[$hosterr], iconerr[$iconerr]"
	fi
else
	echo "filmezz.sh: filmezz.zip could not be downloaded."
fi
rm -r -f /tmp/filmezz*
echo "filmezz.sh: exit 0"
exit 0