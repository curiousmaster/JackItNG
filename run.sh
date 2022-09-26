#!  /usr/bin/sh

PAYLOAD=pay.pay
ADDRESS=93:99:93:F5:0D
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
