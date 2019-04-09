E2iPlayer Filmezz HU host

Install:

~~~
wget --no-check-certificate https://github.com/e2iplayerhosts/filmezz/archive/master.zip -q -O /tmp/filmezz.zip
unzip -q -o /tmp/filmezz.zip -d /tmp
cp -r -f /tmp/filmezz-master/IPTVPlayer/* /usr/lib/enigma2/python/Plugins/Extensions/IPTVPlayer
rm -r -f /tmp/filmezz*
~~~

restart enigma2 GUI